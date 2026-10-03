#import "notes.typ": notes
#import "lib.typ": problem, aligned_block, numbered_eq, under_construction, table_of_vals, clip_graph, plot_graph, rangef
#import "@preview/curryst:0.5.1": rule, prooftree
#import "@preview/frame-it:1.2.0": *
#import "@preview/cetz:0.4.2"

#show math.equation.where(block: false): it => math.display(it)

#let (example_box, definition_box, theorem_box, lemma_box, corollary_box, problem_box, solution_box, proof_box) = frames(
  definition_box: ("Definition", aqua),
  // For each frame kind, you have to provide its supplement title to be displayed
  theorem_box: ("Theorem",),
  lemma_box: ("Lemma",),
  corollary_box: ("Corollary",),
  // You can provide a color or leave it out and it will be generated
  example_box: ("Example"),
  problem_box: ("Problem"),
  solution_box: ("Solution"),
  // You can add as many as you want
  proof_box: ("Proof",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)

#show: notes.with(
    title: [
      2025-10-13 Lecture
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

= Two Big Theorems About Determinants

#theorem_box[Theorem][$det(A)$ is an Indicator of Invertibility][
  A square matrix $A$ is invertible iff $det(A) eq.not 0$.
]

#theorem_box[Theorem][Determinant Respects Multiplication][
  $ det(A B) = det(A) det(B) $
]

= Proving the Two Big Theorems

#lemma_box[Lemma][Determinant Respects Left Multiplication by Elementary Matrices][
  Suppose $E$ is an $n times n$ elementary matrix and $A$ is an $n times n$ matrix.

  Then:

  $ det(E A) = det(E) det(A) $
]

#proof_box[Proof][Determinant Respects Left Multiplication by Elementary Matrices][
  Recall that left-multiplication by elementary matrices is equivalent to performing the corresponding elementary row operation on the right matrix. Let us consider the cases:

  (i) Multiplying a row by a nonzero constant.

  $E$ looks almost like the identity matrix, but with one number in the diagonal replaced by the constant $c$. Thus, $det(E) = c$.

  Further, applying this elementary row operation on an arbitrary matrix $A$ multiplies the determinant by $c$ (recall that determinants are linear with respect to individual rows, so multiplying a row by $c$ multiplies the determinant by $c$).

  Thus, $det(E A) = c det(A) = det(E) det(A)$, as needed.

  (ii) Swapping two rows.

  $E$ looks almost like the identity matrix, but with two rows swapped. Thus, $det(E) = -1$ (swapping two rows negates the determinant).

  Further, $E A$ is just $A$ but with two rows swapped. Thus, $det(E A) = -det(A) = det(E) det(A)$, as needed.

  (iii) Adding a multiple of a row onto another row.

  $E$ looks almost like the identity matrix, but with an extra $c$ somewhere off the diagonal. Note that $E$ is either upper- or lower-triangular. Therefore, the determinant is just the product of the entries on the diagonal, which is $1$. Thus, $det(E) = 1$.

  Now notice that $E A$ looks like:

  $ mat(, dots.v, ; arrow.l, R_i, arrow.r; , dots.v, ; arrow.l, R_j + c R_i, arrow.r; , dots.v, ) $

  And thus, its determinant is:

  $ det(mat(, dots.v, ; arrow.l, R_i, arrow.r; , dots.v, ; arrow.l, R_j, arrow.r; , dots.v, )) + c det(mat(, dots.v, ; arrow.l, R_i, arrow.r; , dots.v, ; arrow.l, R_i, arrow.r; , dots.v, )) $

  Since the right matrix has a repeated row, its determinant is zero, so the determinant is just:

  $ det(mat(, dots.v, ; arrow.l, R_i, arrow.r; , dots.v, ; arrow.l, R_j, arrow.r; , dots.v, )) $

  Which is just $A$, so $det(E A) = det(A) = det(E) det(A)$.
]

#proof_box[
  Since we have exhausted all cases, $det(E A) = det(E) det(A)$, as needed. $qed$
]

#proof_box[Proof][$det(A)$ is an Indicator of Invertibility][
  We want to prove two directions. The first direction is: if $A$ is invertible, then $det(A) eq.not 0$.

  Suppose $A$ were invertible. Then, it is the product of elementary matrices. Thus, the determinant of $A$ is the product of the determinants of the elementary matrices. None of the determinants of these elementary matrices are 0. We can see this by casework.

  (i) If the elementary matrix is a row multiplication, then the row multiplication must be done with a nonzero constant, so the determinant is also nonzero.

  (ii) If the elementary matrix is a row swap, the determinant is $-1 eq.not 0$.

  (iii) If the elementary matrix is an addition by a multiple of another row, the determinant is $1 eq.not 0$.

  By the zero-product property, the determinant of $A$ is not zero since the determinants of all the elementary matrices are nonzero, as needed.

  Now, we want to prove that, if $A$ were not invertible, then its determinant is zero.

  We note that there exist elementary matrices $E_i$ such that:

  $ A = E_k dots.c E_3 E_2 E_1 "RREF"(A) $

  So:

  $ det(A) = det(E_k) dots.c det(E_3) det(E_2) det(E_1) det("RREF"(A)) $

  However, the RREF of $A$ must not be the identity matrix since $A$ is not invertible. Thus, $"RREF"(A)$ has at least one column without a leading entry. Therefore, $"RREF"(A)$ must have at least one row of zeroes. Thus, $det("RREF"(A)) = 0$.

  Therefore:

  $ det(A) = det(E_k) dots.c det(E_3) det(E_2) det(E_1) dot 0 = 0 $

  Therefore, $det(A) eq.not 0$ iff $A$ is invertible, as needed. $qed$
]