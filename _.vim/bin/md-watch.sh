#!/bin/zsh

onmodify() {
      TARGET=${1:-.}; shift
      IN=${1:-.}; shift
      OUT=${1:-.}; shift

      waitfunc() {
        inotifywait --exclude '.git' -qq -r -e close_write,moved_to,move_self $TARGET &
        waitpid=$!
        exit_() {
          kill $waitpid
        }
        trap exit_ SIGINT SIGTERM
        echo $waitpid
        wait $waitpid
      }

      while waitfunc; do
          sleep 0.2
          #bash -c "$CMD"
          pandoc "$IN" -t latex -o "$OUT" --pdf-engine xelatex
          echo
      done
      }

tfile=$(mktemp /tmp/mdwatch.XXXX.pdf)

#pandoc "$1" -t latex -o $tfile

#onmodify /tmp/BufWrite pandoc "$1" -t latex -o $tfile &

pandoc "$1" -t latex -o $tfile --pdf-engine xelatex

onmodify /tmp/BufWrite "$1" "$tfile" &

watchpid=$!
echo $watchpid

pdftk $tfile dump_data >/dev/null || pandoc -t latex -o $tfile <<EOF
# Falló la Compilación inicial.
EOF

zathura $tfile

kill $watchpid

rm $tfile
