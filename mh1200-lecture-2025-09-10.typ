#import "notes.typ": notes
#import "lib.typ": problem, aligned_block, numbered_eq
#import "@preview/frame-it:1.2.0": *

#let (example_box, definition_box, theorem_box, proof_box) = frames(
  definition_box: ("Definition", aqua),
  // For each frame kind, you have to provide its supplement title to be displayed
  theorem_box: ("Theorem",),
  // You can provide a color or leave it out and it will be generated
  example_box: ("Example", gray),
  // You can add as many as you want
  proof_box: ("Proof",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)

#show: notes.with(
    title: [
        2025-10-09 Lecture
    ],
    authors: (
        (
            name: "Hans Gabriel D. De Vera",
            affiliation: "Nanyang Technological University",
            email: "hansgabr001@e.ntu.edu.sg"
        ),
    ),
    course: "mh1200"
)

= The First Two Fundamental Operations on Matrices
== Matrix Addition

#definition_box[Definition][Matrix Addition][
  We define the addition of two matrices $A = (a_(i, j))_(n times m)$ and $B = (b_(i, j))_(n times m)$ with the *same shape* as:

  $ A + B := (a_(i, j) + b_(i, j))_(n times m) $
]

#example_box[Example][Matrix Addition][
  $ mat(1, 2; 3, 4; 5, 6) + mat(10, 10; 9, 9; 2, 8) = mat(11, 12; 12, 13; 7, 14) $
]

== Scalar multiplication

#definition_box[Definition][Scalar Multiplication][
  We define the multiplication of a matrix $A = (a_(i, j))_(n times m)$ with a scalar $r in bb(R)$ as:

  $ r A = A r := (r a_(i, j))_(n times m) $
]

= Properties of Matrices

#theorem_box[Theorem][Properties of Matrices][
  1. $(M + N) + P = M + (N + P)$
  2. $M + N = N + M$
  3. $bold(0) + M = M + bold(0) = M$
  4. $r(s M) = (r s) M$
  5. $1 M = M$
  6. $0 M = M$
  7. $(r + s) M = r M + s M$
  8. $r (M + N) = r M + r N$
]

*Note:* These properties are almost exactly the same as the conditions for a structure to be an abstract vector space. The only difference is that condition $6$ is replaced by the following more general condition:

$ forall arrow(v) in S exists -arrow(v) in S space . space arrow(v) + (-arrow(v)) = bold(0) $

That is, that each vector has a corresponding inverse under addition.

We note that the algebra of vectors and the algebra of matrices are similar --- they both follow the rules above. When mathematicians find recurring rules in distinct mathematical structures, they may abstract these rules into a more general structure (eg., abstract vector spaces). This is especially useful when the rules turn out to say quite a lot about the structure they represent --- any property you prove about these general structures applies to any instance of that structure, similar to interfaces in OOP.

#example_box[Example][Abstract Vector Spaces][
  + $bb(R)^n$
  + $bb(M)_(p times q) (bb(R))$
  + Continuous real functions
  + Sequences of numbers
  + Polynomials with degree $<= d$
  + Linear transformations between vector spaces
]

Note: An *abstract vector space* equipped with a bilinear product is known as an *algebra over a field*. The idea of algebras is *very* ubiquitious in higher mathematics. Think about lie algebras in topology, clifford algebras in geometric algebra, etc...

In general, the product need not be associative. It may sometimes satisfy different properties such as the Jacobi identity though.

== The Last Fundamental Operation: Matrix Multiplication

#definition_box[Definition][Matrix Multiplication][
  Let $C = A B$, with $A = (a_(i, j))_(l times n)$ and $B = (b_(i, j))_(n times m)$. Then,

  $ A B = C := (c_(i, j))_(l times m) $

  With $c_(i, j) := sum_(k = 1)^(n) a_(i, k) b_(k, j)$
]

= How Matrices Differ from $bb(R)$

+ It's not always defined for two matrices
+ Matrix multiplication is non-commutative
+ Matrices don't necessarily have inverses (Given $M$, there may not be an $M^(-1)$ such that $M M^(-1) = M^(-1) M = I$)
+ Matrices may have zero divisors ($A B = bold(0)_(p times q)$ even when $A$ and $B$ are nonzero matrices)

= Properties of Matrix Multiplication

#theorem_box[Theorem][Existence of the Identity or Neutral Element][
  Let:

  $ I_m = mat(1, 0, 0, dots.c, 0; 0, 1, 0, dots.c, 0; 0, 0, 1, dots.c, 0; dots.v, dots.v, dots.v, dots.down, dots.v; 0, 0, 0, dots.c, 1)_(m times m) $

  Further, let $M in bb(M)_(n times m) (bb(R))$. Then:

  $ I_n M = M I_m = M $
]

#theorem_box[Theorem][Associativity of Matrix Multiplication][
  Let $A in bb(M)_(m_0 times m_1)$, $B in bb(M)_(m_1 times m_2)$, $C in bb(M)_(m_2 times m_3)$. Then:

  $ A (B C) = (A B) C $
]

#proof_box[Proof][Associativity of Matrix Multiplication][
  Let $f(M, i, j)$ be the $(i, j)$-th entry of $M$. Then:

  #aligned_block(
    [$f(A (B C), i, j)$],
    [$=$],
    [$sum_(k_1 = 1)^(m_1) f(A, i, k_1) f(B C, k_1, j)$],

    [],
    [$=$],
    [$sum_(k_1 = 1)^(m_1) f(A, i, k_1) sum_(k_2 = 1)^(m_2) f(B, k_1, k_2) f(C, k_2, j)$],

    [],
    [$=$],
    [$sum_(k_1 = 1)^(m_1) sum_(k_2 = 1)^(m_2) f(A, i, k_1) f(B, k_1, k_2) f(C, k_2, j)$],

    [],
    [$=$],
    [$sum_(k_2 = 1)^(m_2) sum_(k_1 = 1)^(m_1) f(A, i, k_1) f(B, k_1, k_2) f(C, k_2, j)$],

    [],
    [$=$],
    [$sum_(k_2 = 1)^(m_2) f(C, k_2, j) sum_(k_1 = 1)^(m_1) f(A, i, k_1) f(B, k_1, k_2)$],

    [],
    [$=$],
    [$sum_(k_2 = 1)^(m_2) f(C, k_2, j) f(A B, i, k_2)$],

    [],
    [$=$],
    [$sum_(k_2 = 1)^(m_2) f(A B, i, k_2) f(C, k_2, j)$],

    [],
    [$=$],
    [$f((A B) C, i, j)$],
  )

  Since all entries of $A (B C)$ and $(A B) C$ are equal,

  $ A (B C) = (A B) C $

  As needed. $qed$
]


We note that one can also view matrices as linear transformations, as there is an isomorphism between these two objects. Under this view, it is more obvious why we should expect matrices to be associative --- $A (B C)$ and $(A B) C$ represent the same action of applying the linear transformations corresponding to $C$, $B$, and $A$, in that order.

#theorem_box[Theorem][Non-commutativity of Matrix Multiplication][
  There is some $A in bb(M)_(l times m)$, $B in bb(M)_(m times n)$:

  $ A B eq.not B A $

  In fact, in general, $A B eq.not B A$.
]

#theorem_box[Theorem][Non-existence of Inverses][
  There is some $A in bb(M)_(n times n)$ such that no $B in bb(M)_(n times n)$ exists which satisfies:

  $ A B = B A = I $
]

#definition_box[Definition][Invertible Matrix][
  Consider a *square matrix* $M in bb(M)_(m times m)(bb(R))$.

  We say that $M$ is *invertible* iff there exists another matrix $M^(-1) in bb(M)_(m times m)(bb(R))$ such that:

  $ M M^(-1) = M^(-1) M = I $
]