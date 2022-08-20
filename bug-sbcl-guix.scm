(define-module (bug-sbcl-guix)
  #:use-module (guix profiles)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (guix build-system asdf))



(define %source-dir (dirname (current-filename)))



(define-public bug-sbcl-guix
  (package
    (name "bug-sbcl-guix")
    (version "1.0.0")
    (source
    (local-file %source-dir
                #:recursive? #t))
    (build-system asdf-build-system/sbcl)
    (arguments
     '(#:asd-systems '("bug-sbcl-guix")))
    (inputs `(("sbcl-dbi" ,sbcl-dbi)))
    (synopsis "A bug on SBCL with guix.")
    (description "A bug on SBCL with guix.")
    (license "none")
    (home-page "")))



bug-sbcl-guix
