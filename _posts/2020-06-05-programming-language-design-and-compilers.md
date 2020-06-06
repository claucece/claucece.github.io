---
layout: post
author: Sofía Celi
title:  "Programming language design and compilers: where to start?"
---
*So you want to get into design, kid?*

Over the past months, I have gotten more and more interested on how programming
languages are designed, why such decisions are made, and the compiler role into
this. I think that I started getting interested because of a current research
around Golang's compiler, and I got amazed by the amount of beauty that
designing a language can create.

Lurking into Golang's archive and talks [\[1\]](#references), I stumbled upon
two very interesting papers that influenced their design. Those papers are
"Hints on Programming Language Design" [\[2\]](#references) by C. A. R. Hoare
and "Everything You've Wanted to Know about Programming Languages but Have Been
Afraid to Ask" [\[3\]](#references) by C. A. R. Hoare, as well. Those two
papers inspired me to reach to other sources so I can learn about programming
language design, which, as Hoare says should "help the programmer in the
practice of his (probably, 'their', sic) art".

Of course, a big portion of programming languages and their use is the design
of the compiler that the programming language uses or at least an understanding
how it behaves.  So in this blogpost, we will also list resources for learning
compiler design.

The resources that are going to be listed here are the result of a tweet I sent
from my personal account [\[4\]](#references). Lots of very interesting answers
were made from people who have actually designed the programming languages
that we use everyday. So, in order to make that thread more useful, I'll list
them nicely here. Note that I have not yet read all of these books, so the
small review that accompanies the resources on the list is based on other
people's opinions or the result of me skimming over them. I'll eventually make
blogposts of the ones I read ;)

# Programming language design
<br />
### Books

* The one and only **Structure and Interpretation of Computer Programs (SICP)**
  or the Wizard Book by Harold Abelson and Gerald Jay Sussman with Julie Sussman.
  A must book that every programmer should read, as it teaches the fundamental
  principles of computer programming. A book recommended by basically everyone.
* **Programming Language Pragmatics** by Michael Lee Scott. The book I'm currently
  reading which explains why programming languages work. A book super recommended
  as well.
* **Practical Foundations for Programming Languages** (Second Edition) by Robert
  Harper [\[5\]](#references), as recommended by Eric Christopher (@echristo).
  As the author states, "a comprehensive framework for formulating and analyzing
  a broad range of ideas in programming languages". It is worth also checking
  the website which contains lots of supplementary materials.
* **Types and Programming Languages** by Benjamin C. Pierce, as recommended by
  Shriram Krishnamurthi (@ShriramKMurthi) and @1stSV_97. It is a comprehensive
  introduction both to type systems in computer science and to the basic theory
  of programming language.
* **Essentials of Programming Languages** by Daniel P. Friedman, Mitchell Wand,
  and Christopher T. Haynes , as recommended by Shriram Krishnamurthi
  (@ShriramKMurthi). A deep, working understanding of the essential concepts of
  programming languages. This will be my next book to read. People say that
  the first edition is the best one ;)
* **Programming Languages: Application and Interpretation** [\[6\]](#references)
  by Shriram Krishnamurthi himself. I'm very eager to read this book, so expect
  a review.
* **Crafting Interpreters** by Bob Nystrom (@munificentbob) [\[7\]](#references),
  as recommended by @mostlysafe. It focuses on learning everything you need
  to actually implement a scripting language.
* **The Design and Evolution of C++** by Bjarne Stroustrup (the inventor of C++),
  as recommended by Shafik Yaghmour (@shafikyaghmour). As the recommender
  refers, it gives "a solid understanding of why trade-offs are made" in the
  language. This book obviously focuses on the decisions made during the
  development of the C++ programming language; but it also gives insights
  on the object-oriented programming philosophy.
* **Implementation of Functional Programming Language** by Simon Peyton Jones [\[8\]](#references),
  as recommended by @MarisaVeryMoe. This book is out of print but you can find
  its entirety in PDF form. An excellent book for anyone interested in
  functional programming.
* **The Elements of Computing Systems: Building a Modern Computer from First
  Principles** by Noam Nisan and Shimon Schocken, as recommended by Lars Tackmann
  (@ltackmann). This book does not only focuses on programming language design
  but of all applied computer science.

<br />
### Courses

As Jeff Dean states (@JeffDean), after reading enough books, it is always
worth checking the reading list of different graduate courses. Here just
two suggested:

* 'Implementation of Programming Languages' (CSE 501) from the 'Paul G. Allen
  School of Computer Science & Engineering. It is a must to check the reading
  papers for this course.
* 'Concepts of Programming Languages' (CSE 505) from the 'Paul G. Allen
  School of Computer Science & Engineering. It is a must to check the reading
  papers for this course.

<br />
# Compiler design

### Books

* **Engineering a Compiler** by Keith Cooper and Linda Torczon, as recommended by
  John Regehr (@johnregehr). It covers the important techniques for constructing
  a modern compiler.
* **Building an Optimizing Compiler** by Bob Morga, as recommended by Eric
  Christopher (@echristo). It provides a high level design for a thorough
  optimizer, code generator, scheduler and register allocator for a generic
  modern RISC processor.
* **The GCC list of compiler books** [\[9\]](#references). The list of compiler
  books by default, with enough review for you to make a choice.
* **Modern Compiler Implement in ML** by Andrew W. Appel, as recommended by
  @xandkar. A book that describes all phases of a modern compiler.

<br />
# Conferences to attend

Something that always helped me on my cryptography journey was to attend
conferences. I'll like to start to do that as well for PL, so these are
the conferences that seem like a must to attend:

* **History of Programming Languages (HOPL)** [\[10\]](#references). It's
  fourth edition is happening on 2021, and it is must to attend.
  It is also very nice to check the papers presented over the past editions.
* **ACM SIGPLAN Symposium on Principles of Programming Languages (POPL)** [\[11\]](#references).
  A conference to discuss aspects of programming languages.
* **ACM SIGPLAN Conference on Programming Language Design and Implementation (PLDI)**
  [\[12\]](#references). A conference not only about design but also about
  implementation. I'm very excited to attend this year, so expect a blogpost
  about it.
* **ACM SIGPLAN International Conference on Functional Programming (ICFP)** [\[13\]](#references).
  For those who love functional programming.
* **ACM SIGPLAN Object-Oriented Programming, Systems, Languages & Applications
  (OOPSLA)** [\[14\]](#references). For those who love object-oriented
  programming.

<br />
# To follow

I often find useful to follow people and read their blogpost. Note that, often
times, these blogs are personal, so don't only expect 'computer science' stuff,
and treat them nicely.

* For computer science and amazing thoughts: the blog of Robert Harper [\[15\]](#references).
* For LLVM and compilers: the blog of John Regehr [\[16\]](#references).
* For C++, C#, Diversity and much more amazing content: the website of Patricia Aas.

<br />

Basically that is it. I'll like to thank to the amazing people that gave me
recommendations and whose work inspire me to continue on the journey (they are
everywhere mentioned on this blogpost). I hope it does for you, as well.

<br />
# References

1. "Go" by Rob Pike, Mar 18, 2015. Available at:
   https://inst.eecs.berkeley.edu/~cs294-101/sp15/slides/Go.pdf
2. "Hints on programming language design" by C. A. R. Hoare, Dec, 1973.
   Available at: https://www.cs.yale.edu/flint/cs428/doc/HintsPL.pdf
3. "Everything You've Wanted to Know about Programming Languages but Have Been
   Afraid to Ask" by C. A. R. Hoare, Dec, 1973.
   Available at: https://www.cs.ox.ac.uk/files/6156/H78%20-%20Everything.pdf
4. Tweet sent by Sofía Celi:
   https://twitter.com/claucece/status/1262586891775414272
5. Available at: https://www.cs.cmu.edu/~rwh/pfpl/index.html
6. The website is here: https://www.plai.org/
7. Available at: https://craftinginterpreters.com/
8. Available at: https://www.microsoft.com/en-us/research/publication/the-implementation-of-functional-programming-languages/
9. Available at: https://gcc.gnu.org/wiki/ListOfCompilerBooks
10. Read about it here: https://en.wikipedia.org/wiki/History_of_Programming_Languages
11. Its 2021 website: https://popl21.sigplan.org/
12. Its 2020 website: https://conf.researchr.org/home/pldi-2020
13. Its 2020 website: https://icfp19.sigplan.org/home/icfp-2020
14. Read about it here: https://en.wikipedia.org/wiki/OOPSLA
15. Available at: https://existentialtype.wordpress.com/
16. Available at: https://blog.regehr.org/
17. Available at: https://patricia.no/

