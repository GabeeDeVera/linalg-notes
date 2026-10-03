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
      2025-11-03 Lecture
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

= Checking if a vector $arrow(u)$ is in the span of a set of vectors $S$

This reduces to checking if the following equation is satisfiable for some choice of coefficients $c_i$:

$ sum_(i = 1)^n c_i arrow(v_i) = arrow(u) $

Which reduces to checking if the following augmented matrix is consistent:

$ mat(arrow.t, arrow.t, arrow.t, , arrow.t, arrow.t; arrow(v_1), arrow(v_2), arrow(v_3), dots.c, arrow(v_n), arrow(u); arrow.b, arrow.b, arrow.b, , arrow.b, arrow.b; augment: #5) $

$arrow(u)$ is in the span of $S$ iff the matrix above is satisfiable (i.e., consistent).

= Finding a basis that spans the set of solutions of a homogenous system

Steps:
+ Write the system as an augmented matrix.
+ Reduce into REF or RREF.
+ Find a parameterization.
+ Separate the variables in a parameterization.

= Comparing the spans of two lists of vectors

Suppose you have two sets of vectors $S$ and $T$, with $arrow(v_i) in S$ and $arrow(u_i) in T$.

Then, $"span"(S) supset.eq "span"(T)$ iff reducing the following matrix to RREF does not result in a row where everything to the left of the bar is zero and there is a number to the right of the bar that is nonzero.

$ mat(arrow.t, arrow.t, arrow.t, , arrow.t, arrow.t, arrow.t, arrow.t, , arrow.t; arrow(v_1), arrow(v_2), arrow(v_3), dots.c, arrow(v_n), arrow(u_1), arrow(u_2), arrow(u_3), dots.c, arrow(u_n); arrow.b, arrow.b, arrow.b, , arrow.b, arrow.b, arrow.b, arrow.b, , arrow.b; augment: #5) $

#theorem_box[Theorem][Spanning Sets][
  Suppose $S, S'$ are two sets of spanning vectors, with $V = "span"(S)$ and $V' = "span"(S')$.

  If $S subset.eq V'$, then $V subset.eq V'$.
]

= Notes to Self:
- For your revision (and for ICPC training ig): Derive an algorithm to find the intersection of the spans of two sets of spanning vectors. 