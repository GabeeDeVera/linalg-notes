#import "notes.typ": notes
#import "lib.typ": problem, aligned_block, numbered_eq, under_construction, table_of_vals, clip_graph, plot_graph, rangef
#import "@preview/curryst:0.5.1": rule, prooftree
#import "@preview/frame-it:1.2.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/commute:0.3.0": node, arr, commutative-diagram

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
        2025-09-15 Lecture
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

= Elementary Matrix

#definition_box[Definition][Elementary Matrix][
  A *square* matrix $E$ is elementary iff we can obtain $E$ using exactly one elementary row operation on $I$.
]

Note that $I$ itself is elementary since multiplying a row by $1$ is an elementary row operation.

The main reason why elementary matrices are useful is because they *perform elementary row operations for you.*

== The Fundamental Fact of Elementary Matrices

Let $R(A)$ be the result of an elementary row operation on $A$. Then, there exists an elementary matrix $E$ such that:

$ E A = R(A) $

Note:
Elementary matrices are *always* square. This is because they must preserve the dimensions of the input matrix.

== Diagram

#align(center)[
  #commutative-diagram(
    node((0, 0), $I A$),
    node((0, 3), $R(A)$),
    node((3, 0), $R(I) A$),
    node((3, 3), $E A$),
    arr($I A$, $R(A)$, "Elementary Row Operation on A"),
    arr($I A$, $R(I) A$, "E.R. Operation on I"),
    arr($R(I) A$, $E A$, "Converting to Elementary Matrix"),
    arr($E A$, $R(A)$, "Fundamental Fact"),
  )
]

Left multiplication by an elementary matrix represents the group action of performing a row operation.

== Example

Consider:

$ E_1 E_2 A $

With:

$ E_2 = mat(1, 0, 0, 0, 0; 0, 1, 0, 1, 0; 0, 0, 1, 0, 0; 0, 0, 0, 1, 0; 0, 0, 0, 0, 1) $

$ E_1 = mat(1, 0, 0, 0, 0; 0, 0, 0, 1, 0; 0, 0, 1, 0, 0; 0, 1, 0, 0, 0; 0, 0, 0, 0, 1) $

Notice that $E_2$ corresponds to $R_2 arrow.l R_2 + R_4$, while $E_1$ corresponds to $R_2 arrow.l.r R_4$.

Therefore, $E_1 E_2 A$ is the result of doing the following to $A$, in order:
+ $R_2 arrow.l R_2 + R_4$
+ $R_2 arrow.l.r R_4$

== Another Consequence of the Fundamental Fact

#example_box[Example][Composition of Elementary Row Operations][
  Consider a list of $k$ elementary row operations:
  - Row operation 1, with corresponding elementary matrix $E_1$,
  $ dots.v $
  - Row operation $k$, with corresponding elementary matrix $E_k$.

  Suppose we perform these elementary row operations, in order, to $A$. Express the resulting matrix as a matrix product.
]

#solution_box[Solution][Composition of Elementary Row Operations][
  #aligned_block(
    columns: 1,
    [$ A $],
    [$ arrow.b $],
    [$ E_1 A $],
    [$ arrow.b $],
    [$ E_2 (E_1 A) $],
    [$ arrow.b $],
    [$ E_3 (E_2 (E_1 A)) $],
    [$ arrow.b $],
    [$ dots.v $],
    [$ arrow.b $],
    [$ E_k E_(k - 1) E_(k - 2) dots.c E_1 A $]
  )
]

== Usage of $Pi$ in Matrix Products

Avoid using $Pi$ for matrix products. Recall that matrix multiplication is not commutative.

== Why is the Fundamental Fact True?

#lemma_box[Lemma][Row Operations Respect Matrix Multiplication][
  Let $R(A)$ denote the result of applying some chosen row opeartion $R$ to some matrix. Then: $R(A B) = R(A) B$
]

Note: A lemma is a "less important" theorem that's mostly used to prove a bigger theorem.

#align(center)[
  #commutative-diagram(
    node((0, 0), $A B$),
    node((0, 3), $R(A B)$),
    node((3, 0), $R(A) B$),
    node((3, 3), $E A B$),
    arr($A B$, $R(A B)$, "Row Operation on Product"),
    arr($A B$, $R(A) B$, "Row Operation on A"),
    arr($R(A) B$, $E A B$, "Fundamental Fact"),
    arr($R(A B)$, $E A B$, "Fundamental Fact"),
  )
]

#proof_box[Proof][Row Operations Respect Matrix Multiplication][
  To prove this, we will do casework on all possible row operations.

  *Row Operation 1:* $R_x arrow c R_x$

  Notice that:

  #aligned_block(
    [$ (R(A) B)_(i j) $],
    [$ = $],
    [$ sum_(p = 1)^(n) R(A)_(i p) B_(p j)$],

    [],
    [$ = $],
    [$ cases(sum_(p = 1)^(n) A_(i p) B_(p j) "if" i eq.not x, sum_(p = 1)^(n) (c A_(i p)) B_(p j) "if" i eq x)$],

    [],
    [$ = $],
    [$ cases(sum_(p = 1)^(n) A_(i p) B_(p j) "if" i eq.not x, c sum_(p = 1)^(n) A_(i p) B_(p j) "if" i eq x)$],

    [],
    [$ = $],
    [$ cases((A B)_(i j) "if" i eq.not x, c (A B)_(i j) "if" i eq x)$],

    [],
    [$ = $],
    [$ R(A B)_(i j)$],
  )
]
#proof_box[
  *Row Operation 2:* $R_x arrow R_x + c R_y$
  
  Notice that:

  #aligned_block(
    [$ (R(A) B)_(i j) $],
    [$ = $],
    [$ sum_(p = 1)^(n) R(A)_(i p) B_(p j)$],

    [],
    [$ = $],
    [$ cases(sum_(p = 1)^(n) A_(i p) B_(p j) "if" i eq.not x, sum_(p = 1)^(n) (A_(i p) + c A_(y p)) B_(p j) "if" i eq x)$],

    [],
    [$ = $],
    [$ cases(sum_(p = 1)^(n) A_(i p) B_(p j) "if" i eq.not x, sum_(p = 1)^(n) A_(i p) B_(p j) + c A_(y p) B_(p j) "if" i eq x)$],

    [],
    [$ = $],
    [$ cases((A B)_(i j) "if" i eq.not x, (A B)_(i j) + c (A B)_(y j) "if" i eq x)$],

    [],
    [$ = $],
    [$ R(A B)_(i j)$],
  )

  *Row Operation 3:* $R_x arrow.l.r R_y$
  
  Notice that:

  #aligned_block(
    [$ (R(A) B)_(i j) $],
    [$ = $],
    [$ sum_(p = 1)^(n) R(A)_(i p) B_(p j)$],

    [],
    [$ = $],
    [$ cases(sum_(p = 1)^(n) A_(i p) B_(p j) "if" i eq.not x\, y, sum_(p = 1)^(n) (A_(y p)) B_(p j) "if" i eq x, sum_(p = 1)^(n) (A_(x p)) B_(p j) "if" i eq y)$],

    [],
    [$ = $],
    [$ cases(sum_(p = 1)^(n) A_(i p) B_(p j) "if" i eq.not x\, y, sum_(p = 1)^(n) A_(y p) B_(p j) "if" i eq x, sum_(p = 1)^(n) A_(x p) B_(p j) "if" i eq y)$],

    [],
    [$ = $],
    [$ cases((A B)_(i j) "if" i eq.not x\, y, (A B)_(y j) "if" i eq x, (A B)_(x j) "if" i eq y)$],

    [],
    [$ = $],
    [$ R(A B)_(i j)$],
  )

  Since we have exhausted all cases, we have:

  $ (R(A) B)_(i j) = R(A B)_(i j) $

  Thus,

  $ R(A) B = R(A B) $

  As needed. $qed$
]

#corollary_box[Corollary][Multiplication by Elementary Matrices Corresponds to Row Operations][
  The result of an elementary row operation is the same as multiplying by the corresponding elementary matrix. That is:

  $ R(A) = E A $
]

#proof_box[Proof][Multiplication by Elementary Matrices Corresponds to Row Operations][
  #aligned_block(
    [$ R(A) $],
    [$ = $],
    [$R(I A) $],

    [],
    [$ = $],
    [$R(I) A $],

    [],
    [$ = $],
    [$E A $],
  )
]

== Invertibility of Elementary Matrices

#theorem_box[Theorem][Invertibility of Elementary Matrices][
  All elementary matrices $E$ are invertible.
]

#proof_box[Proof][Invertibility of Elementary Matrices][
  Let $E$ be an elementary matrix. Then, there is some row operation so that:

  $ E = R(I) $

  Let us do casework on the elementary row operations:

  Case 1: $R_x arrow c R_x $

  Notice that $R_x arrow 1 / c R_x$ undoes this operation. Let $R_2 (A)$ represent applying this row operation on a matrix $A$, and let $E'$ be the corresponding elementary matrix.

  Then:

  #aligned_block(
    [$I $],
    [$=$],
    [$R_2 (R(I))$],

    [],
    [$=$],
    [$R_2 (E I)$],

    [],
    [$=$],
    [$E' E I$],

    [],
    [$=$],
    [$E' E$],
  )

  So, $E'$ is the left inverse of $E$, and is thus the inverse of $E$.

  Note: We must also show that $I = E E'$, but this is also simple. The key identity here is $R(R_2(I))$. The idea is similar and will thus be skipped for now. Note that you can also prove that left inverses are also right inverses.
]

#proof_box[
  Case 2: $R_x arrow R_x + c R_y $

  Notice that $R_x arrow R_x - c R_y$ undoes this operation. The proof in this case is similar to case 1.

  Case 3: $R_x arrow.l.r R_y$

  Notice that $R_x arrow.l.r R_y$ undoes this operation. The proof is similar to case 1.

  Since we have exhausted all cases, $E$ is invertible, as needed. $qed$
]

#corollary_box[Corollary][Inverses of Elementary Matrices are Elementary][
  The inverse $E^(-1)$ of an elementary matrix $E$ is elementary.
]

#proof_box[Proof][Inverses of Elementary Matrices are Elementary][
  Notice in the proof above that the operation used to undo every elementary row operation is also an elementary row operation. Therefore, the corresponding inverse is also an elementary matrix. 
]