#import "@preview/cetz:0.4.2"

#let aligned_block(
  gutter: 15pt,
  columns: 3,
  box-alignment: center,
  ..content,
) = {
  align(box-alignment)[
    #grid(
      align: (alignment.right, alignment.center, alignment.left),
      columns: (auto, ) * columns,
      row-gutter: gutter,
      ..content.pos().map(x => align(horizon, x))
    )
  ]
}

#let problem(
  code: none,
  type: "Ex.",
  statement: none,
  solution: none,
  padding: 10pt,
) = {
  align(left)[*#type #code.* #statement]

  align(left)[*Sol #code.* #solution]
  
  v(padding)
}

#let numbered_eq(content) = math.equation(
  block: true,
  numbering: "(1)",
  content,
)

#let under_construction() = [
  Sorry, this section is under construction.
]

#let table_of_vals(
  start: -5,
  stop: 5,
  step: 1,
  func: x => x*x,
  xlabel: [$bold(x)$],
  ylabel: [$bold(f(x))$],
  alignment: center
) = {
  let i = start
  let x_iter = none
  if(step > 0) {
    x_iter = while i <= stop {
      (i, )
      i = i + step
    }
  } else {
    x_iter = while i >= stop {
      (i, )
      i = i + step
    }
  }

  [#align(alignment)[#table(
    columns: x_iter.len() + 1,
    [*#xlabel*],
    ..{
      for j in x_iter {([#j], )}
    },
    [*#ylabel*], 
    ..{
      for j in x_iter {([#func(j)], )}
    }
  )]]
}

#let rangef(
  start: -5.0,
  stop: 5.0,
  step: 0.1,
) = {
  let i = start
  if(step > 0.0) {
    while i < stop {
      (i,)
      i += step
    }
  } else {
    while i > stop {
      (i,)
      i += step
    }
  }
}

#let plot_graph(
  canvas_bottom_left: (-120.0pt, -120.0pt),
  canvas_top_right: (120.0pt, 120.0pt),
  coord_bottom_left: (-6.0, -6.0),
  coord_top_right: (6.0, 6.0),
  grid_step: (1.0, 1.0),
  grid_marker_sep: (1.0, 1.0),
  grid_marker_precision: 2,
  alignment: center,
  code: (x, y, xi, yi, p, pi) => none
) = [
  #align(alignment)[
    #cetz.canvas({
      import cetz.draw: *

      let x = (inx) => (inx - coord_bottom_left.at(0)) / (coord_top_right.at(0) - coord_bottom_left.at(0)) * (canvas_top_right.at(0) - canvas_bottom_left.at(0)) + canvas_bottom_left.at(0)

      let y = (iny) => (iny - coord_bottom_left.at(1)) / (coord_top_right.at(1) - coord_bottom_left.at(1)) * (canvas_top_right.at(1) - canvas_bottom_left.at(1)) + canvas_bottom_left.at(1)

      let xi = (inx) => (inx - canvas_bottom_left.at(0)) / (canvas_top_right.at(0) - canvas_bottom_left.at(0)) * (coord_top_right.at(0) - coord_bottom_left.at(0)) + coord_bottom_left.at(0)

      let yi = (iny) => (iny - canvas_bottom_left.at(1)) / (canvas_top_right.at(1) - canvas_bottom_left.at(1)) * (coord_top_right.at(1) - coord_bottom_left.at(1)) + coord_bottom_left.at(1)

      let p = (inp) => (x(inp.at(0)), y(inp.at(1)))

      let pi = (inp) => (xi(inp.at(0)), yi(inp.at(1)))

      grid(canvas_bottom_left, canvas_top_right, step: p(grid_step), stroke: gray + 0.2pt)

      code(x, y, xi, yi, p, pi)

      line((-120.0pt, 0), (120.0pt, 0), mark: (end: "stealth"))
      content((), padding: 0.1, $ x $, anchor: "north")
      line((0, -120pt), (0, 120pt), mark: (end: "stealth"))
      content((),  padding: 0.1, $ y $, anchor: "east")

      if(grid_marker_sep != none) {
        for cur_x in rangef(start: grid_marker_sep.at(0), stop: coord_top_right.at(0) - grid_marker_sep.at(0) * 0.5, step: grid_marker_sep.at(0)) {
          line((x(cur_x), -2pt), (x(cur_x), 2pt), stroke: (thickness: 1pt))
          content(
            (x(cur_x), -7.5pt),
            [#text(str(calc.round(cur_x, digits: grid_marker_precision)), size: 8pt)]
          )
        }

        for cur_x in rangef(start: -grid_marker_sep.at(0), stop: coord_bottom_left.at(0) + grid_marker_sep.at(0) * 0.5, step: -grid_marker_sep.at(0)) {
          line((x(cur_x), -2pt), (x(cur_x), 2pt), stroke: (thickness: 1pt))
          content(
            (x(cur_x), -7.5pt),
            [#text(str(calc.round(cur_x, digits: grid_marker_precision)), size: 8pt)]
          )
        }

        for cur_y in rangef(start: grid_marker_sep.at(1), stop: coord_top_right.at(1) - grid_marker_sep.at(1) * 0.5, step: grid_marker_sep.at(1)) {
          line((-2pt, y(cur_y)), (2pt, y(cur_y)), stroke: (thickness: 1pt))
          content(
            (-7.5pt, y(cur_y)),
            [#text(str(calc.round(cur_y, digits: grid_marker_precision)), size: 8pt)]
          )
        }

        for cur_y in rangef(start: -grid_marker_sep.at(1), stop: coord_bottom_left.at(1) + grid_marker_sep.at(1) * 0.5, step: -grid_marker_sep.at(1)) {
          line((-2pt, y(cur_y)), (2pt, y(cur_y)), stroke: (thickness: 1pt))
          content(
            (-7.5pt, y(cur_y)),
            [#text(str(calc.round(cur_y, digits: grid_marker_precision)), size: 8pt)]
          )
        }
      }
    })
  ]
]

#let clip_graph(
  bot_left: (-6.0, -6.0),
  top_right: (6.0, 6.0),
  pts: ()
) = {
  pts.filter(p => bot_left.at(0) <= p.at(0) and p.at(0) <= top_right.at(0) and bot_left.at(1) <= p.at(1) and p.at(1) <= top_right.at(1))
}