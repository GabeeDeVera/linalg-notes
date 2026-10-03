#let paper(
  title: none,
  authors: (),
  abstract: [],
  doc,
) = {
  set page(
    paper: "a4",
    margin: (x: 1in, y: 1in),
    numbering: "1",
    header: context {
      if counter(page).get().first() > 1 [
        #align(right)[#title]
      ]
    }
)

  set text(
      font: "New Computer Modern Math"
  )

  set par(
      justify: true,
      leading: 0.52em
  )

  set heading(numbering: "1.")

  align(center, text(17pt)[*#title*])

  let num_authors = authors.len()
  let cols = calc.min(num_authors, 3)

  grid(
    align: center,
    columns: (1fr, ) * cols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #author.name \
      #author.affiliation \
      #link("mailto:" + author.email)
    ]),
  )

  v(20pt)

  align(center)[
    #set par(justify: false)
    *Abstract* \ 
    #abstract
  ]

  doc
}