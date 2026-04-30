#import "article.typ": *
#import "@preview/thmbox:0.3.0": *


#let article_he = article.with(
  language: "he",
)

#let proof(
  title: "הוכחה",
  separator: ":",
  body: [],
  ..args,
) = {
  // set values
  let pa = args.pos()
  let num-pas = pa.len()
  let title = if num-pas == 2 [הוכחה של #pa.at(0)] else { title }
  let body = if num-pas > 0 and num-pas <= 3 { pa.at(num-pas - 1) } else { body }

  [
    #set text(style: "oblique")
    #title;#separator
  ]
  [#body #qed() \ ]
}
#let solution(
  title: "פתרון",
  separator: ":",
  body: [],
  ..args,
) = {
  // set values
  let pa = args.pos()
  let num-pas = pa.len()
  let title = if num-pas == 2 [פתרון של #pa.at(0)] else { title }
  let body = if num-pas > 0 and num-pas <= 3 { pa.at(num-pas - 1) } else { body }

  [
    #set text(style: "oblique")
    #title;#separator
  ]
  [#body #qed() \ ]
}

#let theorem = thmbox.with(
  color: muted-pink,
  variant: "משפט",
  rtl: true,
)

#let proposition = thmbox.with(
  color: muted-pink,
  variant: "טענה",
  rtl: true,
)

#let lemma = thmbox.with(
  color: muted-pink,
  variant: "למה",
  rtl: true,
)

#let corollary = thmbox.with(
  color: muted-pink,
  variant: "מסקנה",
  rtl: true,
)

#let definition = thmbox.with(
  color: deep-steel-blue,
  variant: "הגדרה",
  rtl: true,
)

#let example = thmbox.with(
  color: natural-grey,
  variant: "דוגמה",
  numbering: none,
  rtl: true,
)

#let remark = thmbox.with(
  color: natural-grey,
  variant: "הערה",
  numbering: none,
  rtl: true,
)

#let exercise = thmbox.with(
  color: natural-grey,
  variant: "תרגיל",
  rtl: true,
)

#let notation = thmbox.with(
  color: natural-grey,
  variant: "סימון",
  numbering: none,
  rtl: true,
)

#let claim = thmbox.with(
  color: natural-grey,
  variant: "עובדה",
  numbering: none,
  rtl: true,
)


#let end_of_lecture(n) = {
  block(
    width: 100%,
    align(left)[
      #text(fill: luma(160), size: 9pt)[סוף הרצאה #n]
    ],
  )
}
