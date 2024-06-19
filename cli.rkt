#lang racket

(require racket/cmdline)

(command-line
  #:program "bossa"
  ; #:once-each
  ; [("-n" "--name") name "Who to say hello to" (set-box! who name)]
  #:args ()
  (printf "hello ~a~n" "world"))
