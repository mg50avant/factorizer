# The factorization program

The program prompts you for numerical array input like `[2, 4, 5, 10, 20]` and
then displays the relevant divisors and divisees. It does this in a loop,
caching previous inputs in-memory (though it would be easy to extend the
code to store the cache in, e.g., the filesystem or a database). To exit
the program, press CTRL+C.

# Running the program

```
cabal sandbox init
cabal install
dist/build/factorizer/factorizer
```

# Running the tests

```
cabal exec -- runhaskell -isrc -itest test/Spec.hs
```
