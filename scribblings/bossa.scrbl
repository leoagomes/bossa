#lang scribble/manual
@require[@for-label[bossa
                    racket]]

@title{bossa}
@author{leoagomes}

@define[hvm-gh "https://github.com/HigherOrderCO/hvm"]
@define[r7rs-small "https://small.r7rs.org/"]
@define[bossa-gh "https://github.com/leoagomes/bossa"]

Bossa is a Scheme-based programming language hosted on Racket that compiles to the
@hyperlink[hvm-gh]{HVM}. It is currently a @italic{very reduced} subset of
@hyperlink[r7rs-small]{R7RS-small} that aims to be compliant in the future.

Bossa uses Racket to compile Scheme code to HVM bytecode, generating expanded Racket code in the
process. We can use Racket to do the heavy lifting of reading and expanding the code, use its LSP to
provide a better developer experience and run massively parallel with the HVM.

Bossa is @bold{very} work in progress, released under an MIT license, and you can see the source code
and make contributions at @hyperlink[bossa-gh]{GitHub}.

@section{Getting Started}

Bossa is currently in early development, so no releases are available yet. To install it, you'll need
to clone the @hyperlink[bossa-gh]{repository} and build it from source.

Once you have @hyperlink["https://racket-lang.org/"]{Racket} installed, you can build bossa with:

@codeblock{
raco pkg install --auto --name bossa
raco setup --check-pkg-deps --unused-pkg-deps bossa
}

Racket should now recognize @code{#lang bossa}.

@section{Introduction}

The Bossa language is based on scheme and shares a lot of its syntax with Racket.

A Bossa file can define functions using the @code{define} form, which is similar to Racket's, but only
supports the function shorthand. Bossa also supports "anonymous" functions with the @code{lambda} form.

The language also supports your usual integer operations:
@(map (lambda (x) (code (symbol->string x))) '(+ - * /)).

@section{Language Reference}

