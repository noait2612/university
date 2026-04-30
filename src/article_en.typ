#import "article.typ": *
#import "@preview/thmbox:0.3.0": *

#let article_en = article.with(
  language: "en",
)

#let proof(
  title: "Proof",
  separator: ":",
  body: [],
  ..args,
) = {
  // set values
  let pa = args.pos()
  let num-pas = pa.len()
  let title = if num-pas == 2 [Proof of #pa.at(0)] else { title }
  let body = if num-pas > 0 and num-pas <= 3 { pa.at(num-pas - 1) } else { body }

  [
    #set text(style: "oblique")
    #title;#separator
  ]
  [#body #qed()]
}
#let solution(
  title: "Solution",
  separator: ":",
  body: [],
  ..args,
) = {
  // set values
  let pa = args.pos()
  let num-pas = pa.len()
  let title = if num-pas == 2 [Solution of #pa.at(0)] else { title }
  let body = if num-pas > 0 and num-pas <= 3 { pa.at(num-pas - 1) } else { body }

  [
    #set text(style: "oblique")
    #title;#separator
  ]
  [#body #qed()]
}

#let theorem = thmbox.with(
  color: muted-pink,
  variant: "Theorem",
)

#let proposition = thmbox.with(
  color: muted-pink,
  variant: "Proposition",
)

/// Used for lemmas, uses a light turquoise color by default.
#let lemma = thmbox.with(
  color: muted-pink,
  variant: "Lemma",
)

#let corollary = thmbox.with(
  color: muted-pink,
  variant: "Corollary",
)

#let definition = thmbox.with(
  color: deep-steel-blue,
  variant: "Definition",
)

#let example = thmbox.with(
  color: natural-grey,
  variant: "Example",
  numbering: none,
)

#let remark = thmbox.with(
  color: natural-grey,
  variant: "Remark",
  numbering: none,
)

#let exercise = thmbox.with(
  color: natural-grey,
  variant: "Exercise",
)

#let notation = thmbox.with(
  color: natural-grey,
  variant: "Notation",
  numbering: none,
)

#let claim = thmbox.with(
  color: natural-grey,
  variant: "Claim",
  numbering: none,
)

#let end_of_lecture(n) = {
  block(
    width: 100%,
    align(right)[
      #text(fill: luma(160), size: 9pt)[End of Lecture #n]
    ],
  )
}
