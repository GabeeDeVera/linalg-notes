#import "notes.typ": notes
#import "lib.typ": problem, aligned_block, numbered_eq, under_construction, table_of_vals, clip_graph, plot_graph, rangef
#import "@preview/frame-it:1.2.0": *
#import "@preview/cetz:0.4.2"

#let (example_box, definition_box, theorem_box, lemma_box, corollary_box, solution_box, proof_box) = frames(
  definition_box: ("Definition", aqua),
  // For each frame kind, you have to provide its supplement title to be displayed
  theorem_box: ("Theorem",),
  lemma_box: ("Lemma",),
  corollary_box: ("Corollary",),
  // You can provide a color or leave it out and it will be generated
  example_box: ("Example"),
  solution_box: ("Solution"),
  // You can add as many as you want
  proof_box: ("Proof",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)

#show: notes.with(
    title: [
        2025-09-15 Lecture
    ],
    authors: (
        (
            name: "Hans Gabriel D. De Vera",
            affiliation: "Nanyang Technological University",
            email: "hansgabr001@e.ntu.edu.sg"
        ),
    ),
    course: "mh1300"
)

= Definition of Invertibility

#definition_box[Definition][Invertible Matrix][
  A matrix $M in bb(M)_(m times n)(bb(R))$ is invertible iff:
  + $M$ is a square matrix --- i.e., $m = n$
  + There exists another matrix $M^(-1) in bb(M)_(n times m)(bb(R))$ such that $M^(-1) M = M M^(-1) = I_m$
]

There are other *characterizations* of invertibility, but the definition above is the fundamental definition. All other characterizations are simply consequences of this definition.

= Exercises on Transpose
#example_box[Example][Transpose Exercise][
  Let $A$ be an $n times n$ square matrix. Let $B$ be another $n times n$ matrix whose $(k, l)$-entry is:

  $ sum_(p = 1)^n (A_(p l) A_(p k) - A_(l p) A_(k p)) $

  Which of the following is a general expression for $B$?
  $ B = A A^(T) - A^(T) A $
  $ B = A A - A^(T) A^(T) $
  $ B = A^(T) A^(T) - A A $
  $ B = A^(T) A - A A^(T) $
]

#solution_box[Solution][Transpose Exercise][
  Notice that:

  #aligned_block(
    [$ sum_(p = 1)^n (A_(p l) A_(p k) - A_(l p) A_(k p)) $],
    [$ = $],
    [$ sum_(p = 1)^n (A_(p l) (A^(T))_(k p) - (A^(T))_(p l) A_(k p)) $],

    [],
    [$ = $],
    [$ sum_(p = 1)^n ((A^(T))_(k p) A_(p l) - A_(k p) (A^(T))_(p l)) $],

    [],
    [$ = $],
    [$ sum_(p = 1)^n ((A^(T))_(k p) A_(p l)) - sum_(p = 1)^n (A_(k p) (A^(T))_(p l)) $],
  )

  Therefore, we find that: $ B = A^(T) A - A A^(T) $
]

= An Interesting Question
#example_box[Example][Product of Invertible Matrices][
  Suppose $A, B, C, D, E$ are matrices with inverses $A^(-1), B^(-1), C^(-1), D^(-1), E^(-1)$, respectively.

  What is the inverse of $A B C D E$?
]

#solution_box[Solution][Product of Invertible Matrices][
  BE CAREFUL! It is not $A^(-1) B^(-1) C^(-1) D^(-1) E^(-1)$.

  The answer is:

  $ E^(-1) D^(-1) C^(-1) B^(-1) A^(-1) $

  We can show this using the associativity of matrix multiplication:

  #aligned_block(
    [$ (E^(-1) D^(-1) C^(-1) B^(-1) A^(-1)) (A B C D E) $],
    [$ = $],
    [$ (E^(-1) (D^(-1) (C^(-1) (B^(-1) (A^(-1) A) B) C) D) E) $],

    [],
    [$ = $],
    [$ (E^(-1) (D^(-1) (C^(-1) (B^(-1) (I) B) C) D) E) $],

    [],
    [$ = $],
    [$ (E^(-1) (D^(-1) (C^(-1) (B^(-1) B) C) D) E) $],

    [],
    [$ = $],
    [$ (E^(-1) (D^(-1) (C^(-1) (I) C) D) E) $],

    [],
    [$ = $],
    [$ dots.c $],

    [],
    [$ = $],
    [$ I $],
  )

  Showing that it is a right-inverse is similar, and will not be shown here.

  Thus, $E^(-1) D^(-1) C^(-1) B^(-1) A^(-1)$ is the inverse of $A B C D E$.
]

= An Application of Inverse Matrices to Solving Systems of Equations

#theorem_box[Theorem][Solutions to Systems with Exactly One Solution][
  We can express a system of equations as one matrix-vector multiplication:

  $ A arrow(x) = arrow(b) $

  Suppose $A$ were invertible. Then,

  $ arrow(x) = A^(-1) arrow(b) $
]

= Organizing Matrices into Blocks

When performing matrix multiplication, you can subdivide matrices into blocks.

For instance:

$ mat(1, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12; 13, 14, 15, 16) arrow mat(mat(1, 2; 5, 6), mat(3, 4; 7, 8); mat(9, 10; 13, 14), mat(11, 12; 15, 16)) $

Thus, we can express a matrix $bold(A)$ with sub-blocks:

$ bold(A) = mat(bold(A_(00)), bold(A_(01)); bold(A_(10)), bold(A_(11))) $

Multiplication of sub-blocks works similar to regular matrix multiplication. For instance:

$ mat(bold(A_(00)), bold(A_(01)); bold(A_(10)), bold(A_(11))) mat(bold(B_(00)), bold(B_(01)); bold(B_(10)), bold(B_(11))) = mat(bold(A_(00)) bold(B_(00)) + bold(A_(01)) bold(B_(10)), bold(A_(00)) bold(B_(01)) + bold(A_(01)) bold(B_(11)); bold(A_(10)) bold(B_(00)) + bold(A_(11)) bold(B_(10)), bold(A_(10)) bold(B_(01)) + bold(A_(11)) bold(B_(11))) $

However, *be careful*. Ensure that all multiplications between the sub-blocks are defined. That is, suppose you're multiplying two sub-blocks $L$ and $R$:
$ L R $

Make sure that the number of columns of $L$ is equal to the number of rows of $R$.

= A Theorem About the Solutions of a Linear System

#theorem_box[Theorem][Two Solutions Implies Infinite Solutions][
  Suppose you have the following system:

  #aligned_block(
    columns: 5,

    [$ a_(11) x_1 + $],
    [$ dots.c $],
    [$ + a_(1 n) x_n $],
    [$ = $], 
    [$ b_1 $],
    
    [$  $],
    [$ dots.v $],
    [$  $],
    [$ dots.v $], 
    [$  $],

    [$ a_(m 1) x_1 + $],
    [$ dots.c $],
    [$ + a_(m n) x_n $],
    [$ = $], 
    [$ b_m $],
  )

  If the system has at least two distinct solutions, then it has infinitely many.
]

#proof_box[Proof][Two Solutions Implies Infinite Solutions][
  Let $A = (a_(i j))_(m times n)$, $arrow(x) = (x_(i))_(n times 1)$, and $arrow(b) = (b_i)_(m times 1)$. Then, the system is equivalent to the single matrix equation:

  $ A arrow(x) = arrow(b) $

  Suppose $arrow(x_1)$ and $arrow(x_2)$ are two distinct solutions of the equation above.

  Then,
  $ A arrow(x_1) = arrow(b) $

  and
  
  $ A arrow(x_2) = arrow(b) $

  Suppose $lambda in bb(R)$.

  Then, I claim that $arrow(x) = lambda arrow(x_1) + (1 - lambda) arrow(x_2)$ are also solutions. 

  Notice that:

  #aligned_block(
    [$ lambda A arrow(x_1) + (1 - lambda) A arrow(x_2) = lambda arrow(b) + (1 - lambda) arrow(b) $],
    [$ space arrow space $],
    [$ A lambda arrow(x_1) + A (1 - lambda) arrow(x_2) = arrow(b) $],

    [],
    [$ space arrow space $],
    [$ A (lambda arrow(x_1) + (1 - lambda) arrow(x_2)) = arrow(b) $],
  )

  Therefore, $lambda arrow(x_1) + (1 - lambda) arrow(x_2)$ is a solution of $A arrow(x) = arrow(b)$. Since every choice of $lambda in bb(R)$ corresponds to some unique solution of $A arrow(x) = arrow(b)$, there are infinite solutions. Therefore, the existence of at least two solutions implies the existence of infinitely many, as needed. $qed$
]

Note: The expression $lambda arrow(x_1) + (1 - lambda) arrow(x_2)$ is similar to *linear interpolation.* Geometrically, you can think of it as drawing a line between the two vectors.