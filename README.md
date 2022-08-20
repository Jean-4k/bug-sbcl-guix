Here is an .asd file with a basic `package.lisp`, and a file and folder with accents (letter `é`) : `éé/éé.lisp`. I've tried to construct a minimal setup which reproduces the issue on my laptop.

I have asked a friend to do the `how to reproduce` part, but it works on his machine. I do not understand why, since I thought guix produce reproductible 

# logs

```bash
user@user-pc ~/bug-sbcl-guix$ guix build -f bug-sbcl-guix.scm
/gnu/store/2ihxn6zs0bx4mj5qyxdfp01nlxdqzy8v-bug-sbcl-guix-1.0.0
user@user-pc ~/bug-sbcl-guix$ ls -al /gnu/store/2ihxn6zs0bx4mj5qyxdfp01nlxdqzy8v-bug-sbcl-guix-1.0.0/lib/common-lisp/sbcl/bug-sbcl-guix/
total 12
dr-xr-xr-x 2 root root 4096 Jan  1  1970 ./
dr-xr-xr-x 3 root root 4096 Jan  1  1970 ../
-r--r--r-- 1 root root 1296 Jan  1  1970 package.fasl
user@user-pc ~/bug-sbcl-guix$ guix build -f bug-sbcl-guix.scm --no-grafts
/gnu/store/jdvy6gk2c2rjiclgnkx09qpd60yd79dw-bug-sbcl-guix-1.0.0
user@user-pc ~/bug-sbcl-guix$ ls -al /gnu/store/jdvy6gk2c2rjiclgnkx09qpd60yd79dw-bug-sbcl-guix-1.0.0/lib/common-lisp/sbcl/bug-sbcl-guix/
total 16
dr-xr-xr-x 3 root root 4096 Jan  1  1970 ./
dr-xr-xr-x 3 root root 4096 Jan  1  1970 ../
dr-xr-xr-x 2 root root 4096 Jan  1  1970 éé/
-r--r--r-- 1 root root 1296 Jan  1  1970 package.fasl
```

# how to reproduce the bug

1. Clone this repository and `cd` within.
2. `guix shell -L . sbcl bug-sbcl-guix -- sbcl`
3. `(require 'asdf)`
4. `(asdf:load-system "bug-sbcl-guix")`

You can see the error message. On my computer :

```lisp
user@user-pc ~/bug-sbcl-guix$ guix shell -L . sbcl bug-sbcl-guix -- sbcl
2.8 MB will be downloaded
 curl-7.84.0-doc  667KiB                                                                                                                      1.6MiB/s 00:00 [##################] 100.0%
 mit-krb5-1.19.2  1.0MiB                                                                                                                      1.7MiB/s 00:01 [##################] 100.0%
 curl-7.84.0  389KiB                                                                                                                          1.7MiB/s 00:00 [##################] 100.0%
5.5 MB will be downloaded
 curl-7.79.1  377KiB                                                                                                                          1.5MiB/s 00:00 [##################] 100.0%
 git-minimal-2.37.2  4.3MiB                                                                                                                   1.6MiB/s 00:03 [##################] 100.0%
7.5 MB will be downloaded
 gnutls-3.7.2-doc  1.0MiB                                                                                                                     1.6MiB/s 00:01 [##################] 100.0%
 gnutls-3.7.2-debug  4.4MiB                                                                                                                   1.7MiB/s 00:03 [##################] 100.0%
substitute: updating substitutes from 'https://ci.guix.gnu.org'... 100.0%
3.1 MB will be downloaded
 apr-1.7.0  297KiB                                                                                                                            1.4MiB/s 00:00 [##################] 100.0%
 utf8proc-2.5.0  52KiB                                                                                                                        1.2MiB/s 00:00 [##################] 100.0%
 apr-util-1.6.1  156KiB                                                                                                                       1.6MiB/s 00:00 [##################] 100.0%
 serf-1.3.9  74KiB                                                                                                                            1.4MiB/s 00:00 [##################] 100.0%
 subversion-1.14.1  2.4MiB                                                                                                                    1.7MiB/s 00:01 [##################] 100.0%
substitute: updating substitutes from 'https://ci.guix.gnu.org'... 100.0%
The following derivation will be built:
  /gnu/store/9m367cv0mny6wxv72q24ip6hgihg90j2-bug-sbcl-guix-1.0.0.drv

20.7 MB will be downloaded
 sbcl-2.2.6-doc  1.4MiB                                                                                                                       1.7MiB/s 00:01 [##################] 100.0%
 mariadb-10.5.12-lib  4.9MiB                                                                                                                  1.7MiB/s 00:03 [##################] 100.0%
 module-import-compiled  193KiB                                                                                                               1.0MiB/s 00:00 [##################] 100.0%
 sbcl-cl-mysql-0.1-1.ab56c27  90KiB                                                                                                           665KiB/s 00:00 [##################] 100.0%
 sbcl-dbi-0.9.5-2.738a74d  142KiB                                                                                                             1.4MiB/s 00:00 [##################] 100.0%
building /gnu/store/9m367cv0mny6wxv72q24ip6hgihg90j2-bug-sbcl-guix-1.0.0.drv...
The following derivation will be built:
  /gnu/store/ygj3lr3mk5hihg9dapaxr0jr4k007ws3-profile.drv

4.7 MB will be downloaded
 module-import-compiled  99KiB                                                                                                                1.1MiB/s 00:00 [##################] 100.0%
 guile-2.0.14  3.0MiB                                                                                                                         1.7MiB/s 00:02 [##################] 100.0%
 mkfontscale-1.2.2  20KiB                                                                                                                     2.8MiB/s 00:00 [##################] 100.0%
 module-import-compiled  56KiB                                                                                                                1.3MiB/s 00:00 [##################] 100.0%
 mkfontdir-1.0.7  4KiB                                                                                                                        1.4MiB/s 00:00 [##################] 100.0%
 module-import-compiled  72KiB                                                                                                                1.4MiB/s 00:00 [##################] 100.0%
 module-import-compiled  46KiB                                                                                                                1.5MiB/s 00:00 [##################] 100.0%
 texinfo-6.7  1.2MiB                                                                                                                          1.6MiB/s 00:01 [##################] 100.0%
applying 1 graft for bug-sbcl-guix-1.0.0 ...
building CA certificate bundle...
listing Emacs sub-directories...
building fonts directory...
building directory of Info manuals...
building profile with 2 packages...
This is SBCL 2.2.6, an implementation of ANSI Common Lisp.
More information about SBCL is available at <http://www.sbcl.org/>.

SBCL is free software, provided as is, with absolutely no warranty.
It is mostly in the public domain; some portions are provided under
BSD-style licenses.  See the CREDITS and COPYING files in the
distribution for more information.
* (require 'asdf)
NIL
* (asdf:load-system "bug-sbcl-guix")

debugger invoked on a SB-INT:SIMPLE-FILE-ERROR in thread
#<THREAD "main thread" RUNNING {1001978003}>:
  Can't create directory /gnu/store/2ihxn6zs0bx4mj5qyxdfp01nlxdqzy8v-bug-sbcl-guix-1.0.0/lib/common-lisp/sbcl/bug-sbcl-guix/éé

Type HELP for debugger help, or (SB-EXT:EXIT) to exit from SBCL.

restarts (invokable by number or by possibly-abbreviated name):
  0: [RETRY                        ] Retry directory creation.
  1: [RETRY                        ] Retry
                                     compiling #<CL-SOURCE-FILE "bug-sbcl-guix" "éé" "éé">.
  2: [ACCEPT                       ] Continue, treating
                                     compiling #<CL-SOURCE-FILE "bug-sbcl-guix" "éé" "éé">
                                     as having been successful.
  3:                                 Retry ASDF operation.
  4: [CLEAR-CONFIGURATION-AND-RETRY] Retry ASDF operation after resetting the
                                     configuration.
  5:                                 Retry ASDF operation.
  6:                                 Retry ASDF operation after resetting the
                                     configuration.
  7: [ABORT                        ] Exit debugger, returning to top level.

(SB-KERNEL::%FILE-ERROR #P"/gnu/store/2ihxn6zs0bx4mj5qyxdfp01nlxdqzy8v-bug-sbcl-guix-1.0.0/lib/common-lisp/sbcl/bug-sbcl-guix/éé/éé.fasl" "Can't create directory ~A~:[~;,~%a file with ~
                          the same name already exists.~]" "/gnu/store/2ihxn6zs0bx4mj5qyxdfp01nlxdqzy8v-bug-sbcl-guix-1.0.0/lib/common-lisp/sbcl/bug-sbcl-guix/éé" NIL)
0] 7
; 
; compilation unit aborted
;   caught 1 fatal ERROR condition
```

# the problem

Because `sbcl-dbi` is an input (see `bug-sbcl-guix.scm`), a graft is applyied which cause the files with characters like `é` to not be copied.

Building with `--no-grafts` flag solves the problem, therefore the graft is the cause.

In build logs when applying the graft, it says that `find-files` cannot find the file with accents in their name, replacing `é` by `??` in output logs, but the build successes (no error message or exception) even if the files and folders with accents are not copied in `/gnu/store/.../lib/common-lisp/sbcl/bug-sbcl-guix` (see `logs`).
