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
	     (commit "fcc931f7718b25b961183cfd3d6048f1f3d2997d")))
    (build-system asdf-build-system/sbcl)
   (arguments
    '(#:asd-systems '("bug-sbcl-guix")))
    (synopsis "A bug on SBCL with guix.")
    (description "A bug on SBCL with guix.")
    (license "none")
    (home-page "")))
