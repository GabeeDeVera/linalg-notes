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
      2025-10-27 Lecture
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

=  A Geometric Picture of Subspaces
One intuitive description of a subspace of $bb(R)^n$ is as follows:

It is a $k$-dimensional hyperplane within $bb(R)^n$ that contains the origin, with $k <= n$.

Here, the definition of "dimension" will be given later as the maximal size of a basis spanning exactly this subspace.

= Proving that an Example is a Subspace Rigorously From the Axioms

#example_box[Example][
  Show that:

  $ S = {(x_1, x_2) in bb(R)^2 | a x_1 + b x_2 = 0} $

  Is a subspace of $bb(R)^2$.

  Solution: First, let us show that $S$ satisfies axiom 1 --- i.e., that it is nonempty.

  Consider $(x_1, x_2) = (0, 0)$. Notice that:

  $ a x_1 + b x_2 = a dot 0 + b dot 0 = 0 $

  Thus, by definition, $(0, 0) in S$ and thus $S$ is nonempty.

  Now, let us show that $S$ satisfies axiom 2 --- i.e., it is closed under vector addition.

  Suppose $(x_1, x_2), (y_1, y_2) in S$ are two particular but arbitrarily-chosen elements of $S$.

  By definition, we have:

  $ a x_1 + b x_2 = 0 $
  $ a y_1 + b y_2 = 0 $

  Adding both equations, we get:

  $ a (x_1 + y_1) + b (x_2 + y_2) = 0 $

  Thus, by definition, $(x_1, y_1) + (x_2, y_2) = (x_1 + y_1, x_2 + y_2) in S$.

  Thus, $S$ is closed under vector addition.

  Finally, let us show that $S$ satisfies axiom 3 --- i.e., it is closed under scalar multiplication.

  Suppose $(x_1, y_1) in S$ were some particular but arbitrarily-chosen element of $S$ and that $c in bb(R)$ were some particular but arbitrarily-chosen element of $bb(R)$.

  By definition, we have:

  $ a x_1 + b y_1 = 0 $

  Multiplying both sides by $c$, we have:

  $ a (c x_1) + b (c y_1) = 0 $

  Thus, by definition, $ c(x_1, y_1) = (c x_1, c y_1) in S $

  And therefore, $S$ is closed under scalar multiplication, as needed. $qed$
]

= An Equivalent Set of Subspace Axioms

#theorem_box[Theorem][Alternative Subspace Axioms][
  A subset $S subset.eq bb(R)^n$ is a subspace iff:

  + $arrow(0) in S$
  + $S$ is closed under vector addition
  + $S$ is closed under scalar multiplication
]

= Subspace Intersection

#theorem_box[Theorem][Subspace Intersection][
  The intersection of two subspaces $S$ and $T$ is also a subspace.
]