---
layout: post
author: Sofía Celi
title:  "Understanding Modern Number Theory: Divisibility"
---
*God may not play dice with the universe, but something strange is going on with
the prime numbers.*
--- Paul Erdos

I always liked mathematics and logic. During my undergrad degree I spent hours
devouring anything written by Wittgenstein, and finding about Cantor and
Gödel (in contrast to my high school years in which I obsessed with Nietzsche and
Camus, and even read the whole 'Phenomenology of the Spirit' by Hegel to see
where Nietzsche was coming from)<sup><a href="#foot1">[1]</a></sup>.
I also read anything from Jorge Luis Borges as his literature writing touch
upon some mathematical concepts, while also deeply loving the way Borges writes.
At the end, I studied them from a more philosophical perspective, as my degree was
touching upon that, but I always dreamt on studying mathematics.

Getting access to these books and articles from these authors and more was always
difficult as I didn't have any money to buy them, so I spent hours in public libraries
reading them. Some books also never reached my country, Ecuador, so sometimes
I had to find the only copy in the country that some professor had and ask them
to lend them to me for a time. I remember that once I wanted to read an specific
book by Derrida and I found that one professor had it but in it's original french.
My french is not the best but I succeeded in reading it, even when Derrida
plays with the french language and basically deconstructs it. I'm also a woman,
so sometimes I had to hide that I was reading something as 'women are not
supposed to read that'.

Some weeks ago, I had a very nice call with Steven Galbraith, and my interest
for mathematics got renewed. So I decided to do what I do best: find books
and read them.

The subsequent posts I will writing are the results of me reading
**'A Classical Introduction to Modern Number Theory'** by Kenneth Ireland and
Michael Rosen, **'An Introduction to the Theory of Numbers'** by Ivan Nevin, Herbert
S. Zuckerman and Hugh L. Montgomery, and **'Introduction to Automata Theory,
Languages and Computation'** by John E. Hopcroft, Rajeev Motwani and
Jeffrey D. Ullman. In the future, I'll be also reading **'Logical Foundations of
Proof Complexity'** by Stephen Cook, **'Solved and Unsolved Problems in Number
Theory'** by Daniel Shanks, **'The Arithmetic of Elliptic Curves'** and **'Advanced
Topics in the Arithmetic of Elliptic Curves'** by Joseph H. Silverman.

As the book **'A Classical Introduction to Modern Number Theory'** states,
"L. Kronecker once remarked (speaking of mathematics generally) that God made
the natural numbers and all the rest is the work of man". Number Theory is
precisely the study of natural numbers, also called the positive integers
(although, some definitions begin the natural numbers with the '0'). Properties
of these numbers have been studied for a very long time, and today we will be
looking at divisibility.

A number `a`, not zero, is said to divide another `b` if there is a
number `c` such that `b = ac`. We write this: `a|b`.
<br>
For example, `a = 3`, `b = 6`: `6 = 3 * 2`.

This simple definition of division can be further examined by listing it's
properties:

1. `a|b` implies `a|bc` for any integer `c`,
2. `a|b` and `b|c` imply `a|c`,
3. `a|b` and `a|c` imply `a|(bx + cy)` for any integers `x` and `y`,
4. `a|b` and `b|a` imply `a = ±b`,
5. `a|b`, `a > 0`, `b > 0`, imply `a ≤ b`,
6. if `m ≠ 0`, `a|b` implies and is implied by `ma|mb`.

<br>

All of these properties are a theorem and should be proven, as they have already
in the past. Why is a proof important? A proof is a inferential argument<sup><a href="#foot2">[2]</a></sup>
showing that an assumption logically guarantees a conclusion. Sometimes just
finding an example is enough to provide a proof of a theorem, for example: "there
is a positive number that is not the sum of three squares" can be proven by
noting that 7 is such a number. But other statements are harder to proof.

In software programming, one might say that is enough to run a program to
see that it works: but, most of the times, you cannot run a program on
every possible input that will be given. That is why proofs are needed.

There are many methods for providing a proof: direct proof, proof by
contradiction, proof by contraposition, proof by construction, inductive proofs
and more.

Returning to the idea of divisibility: If we are given a number, it is tempting
to factor it again until further factorization is impossible. Numbers that
cannot be factored any further are called primes. An integer `p > 1` is a prime
number in case there is no divisor `d` of `p` satisfying `1 < d < p`. If an
integer `a > 1` is not a prime, it is called a composite.

When one looks at primes one can ask: can every even number greater than 2 be
written as the sum of two primes? This is known as the Goldbach conjecture,
which has not yet been proven. This problem belongs to the 'additive' problems
around primes, but we must look at another problem in the 'multiplicative'
ones that has been proven:

<h2>Theorem</h2>
Every integer greater than 1 can be expressed as a product of primes.

<h2>Proof</h2>

If the given integer `n` is a prime, then the integer itself stands as a product
with a single factor.

If the given integer `n` is not a prime, then it can be factored into `n_1 * n_2`.
If `n_1` is not a prime, then it can be factored into `n_3 * n_4`. The same for
`n_2`. This process of writing each composite as a product of factors will
end at some point when the factors are smaller than the composite itself, and
each factor is an integer greater than 1.

We can provide a proof by contradiction for this as well:

* We rewrite the statement as 'If an integer is greater than 1 then it can
  be expressed as a product of primes'.
* We construct the contradiction ("H and not C implies falsehood"):
  'If an integer is greater than 1 then it cannot be expressed as a product of
  primes'.
* Define `N = an integer greater than 1 that cannot be expressed as product of
  primes`. `N` cannot be a prime, as it will stand as a product with a single
  factor. Therefore `N = n*m`, where `n` and `m` are positive and smaller than
  `N`. As either `n` and `m` is bigger than 1, then it should be expressed as
  a product. This arrives to a contradiction.

<br>
Canonically, this can be worded as:

<center>
Every positive integer n > 1 can be represented in exactly one way as a product
of prime powers:
</center>

<img src="https://wikimedia.org/api/rest_v1/media/math/render/svg/22f8cf10ecd16a6f7dc6d97338d84be9c369a3f7">

The representation of `n` as a product of primes is called the canonical
factoring of `n` into prime powers. Gauss was the first to provide a proof
for this, and it is defined as the fundamental theorem of arithmetic. Notably
in algebraic number theory, unique factorization fails to hold. An example of
this can be easily seen in this example:

Let's consider `S` the class of positive integers (2, 4, 6, 8, 10...) and only
those. `S` is a multiplicative system in that the product of any two
elements on it is found on `S` as well. Then `8 = 4 * 2` is a "composite", as
the factors exist in the group; on the contrary, `10` is a "prime" as there are
no factors on `S` that factor it. The number 60 has two factorings into "primes":
`60 = 2 * 30` and `60 = 6 * 10`. Factorization is, therefore, not unique in this
case. This can be extended to other classes as well.

This is an small summary of reading the first chapters of the listed books.
Up next, we will look more at unique factorization, the binomial theorem.
We will also look at Finite Automata on a different post.

## Fascinating things I learned

<br>
If `g` is the greatest common divisor of `b` and `c`, then there exists
integers `x_0` and `y_0` such that `g = (b, c) = bx_0 + cy_0`, which
means that the g.c.d of two integers `b` and `c` is expressible as a linear
combination of `b` and `c` with integral multipliers `x_0` and `y_0`.
This is simply beautiful.

<hr>
<p id="foot1" style="font-size: 16px;">[1] My high school was a really
catholic opus-dei one, and we were forbidden of reading anything Nietzsche-Sartre-Camus-Marx-like.
As a rebel I was, I read them all.</p>
<p id="foot2" style="font-size: 16px;">[2] As defined by Aristotle by either
using induction or deduction. Pierce provided a third type of inference 'abduction'.</p>
