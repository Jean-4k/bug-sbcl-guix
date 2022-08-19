(define-module (bug-sbcl-guix)
  #:use-module (guix profiles)
  #:use-module (guix packages)
  #:use-module (guix git)
  #:use-module (guix build-system asdf))



(define-public bug-sbcl-guix
  (package
    (name "bug-sbcl-guix")
    (version "1.0.0")
    (source (git-checkout
             (url "https://github.com/Jean-4k/bug-sbcl-guix.git")
	     (branch "main")
	     (commit "2272e5fc7f0ec4036718db8510ff8d59f29659db")))
    (build-system asdf-build-system/sbcl)
   (arguments
    '(#:asd-systems '("bug-sbcl-guix")))
    (synopsis "A bug on SBCL with guix.")
    (description "A bug on SBCL with guix.")
    (license "none")
    (home-page "")))
