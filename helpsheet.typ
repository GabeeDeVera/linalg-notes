#let helpsheet(
  title: none,
  num_columns: 2,
  font_size: 8pt,
  doc,
) = {
  set page(
    paper: "a4",
    margin: (x: 0.5in, y: 0.5in),
    numbering: "1",
    header: context {
      [
        #align(right)[#title]
      ]
    },
    columns: num_columns
)

  set text(
      font: "New Computer Modern Math",
      size: font_size
  )

  set par(
      justify: false,
  )

  set heading(numbering: "1.")

  doc
}