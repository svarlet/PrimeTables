[![Build Status](https://travis-ci.org/svarlet/PrimeTables.svg?branch=master)](https://travis-ci.org/svarlet/PrimeTables)

# PrimeTables

**Multiplication table of N prime numbers**

## Running the project

### Requirements
- Elixir 1.4.2 installed on the build machine
- A terminal

### Building the project
    git clone git@github.com:svarlet/PrimeTables.git
    cd ./PrimeTables
    mix escript.build

### Running the program
    ./prime_tables -n <number_of_primes>

    ./prime_tables -n 10
       |   2 |   3 |   5 |   7 |  11 |  13 |  17 |  19 |  23 |  29
     2 |   4 |   6 |  10 |  14 |  22 |  26 |  34 |  38 |  46 |  58
     3 |   6 |   9 |  15 |  21 |  33 |  39 |  51 |  57 |  69 |  87
     5 |  10 |  15 |  25 |  35 |  55 |  65 |  85 |  95 | 115 | 145
     7 |  14 |  21 |  35 |  49 |  77 |  91 | 119 | 133 | 161 | 203
    11 |  22 |  33 |  55 |  77 | 121 | 143 | 187 | 209 | 253 | 319
    13 |  26 |  39 |  65 |  91 | 143 | 169 | 221 | 247 | 299 | 377
    17 |  34 |  51 |  85 | 119 | 187 | 221 | 289 | 323 | 391 | 493
    19 |  38 |  57 |  95 | 133 | 209 | 247 | 323 | 361 | 437 | 551
    23 |  46 |  69 | 115 | 161 | 253 | 299 | 391 | 437 | 529 | 667
    29 |  58 |  87 | 145 | 203 | 319 | 377 | 493 | 551 | 667 | 841

## Conclusion

### I am pleased with

- The time I took beforehand to do some research before coding (read [this paper](https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf))
- Implementing a very fast prime number generator thanks to my research
- Using property based testing to have extremely high test coverage on the prime numbers generation
- Continuous integration with Travis CI (check it [there](https://travis-ci.org/svarlet/PrimeTables))
- TDD approach
- Small scoped commits

### Things I'm not happy with

- There is no test coverage for command line option parsing or pretty printing
- I would like to refactor the prime number generator to extract my Sieve datastructure to its own file
