// Import theorems package
#import "@preview/ctheorems:1.1.3": *

#let gim_table = (
  "1": "א",
  "2": "ב",
  "3": "ג",
  "4": "ד",
  "5": "ה",
  "6": "ו",
  "7": "ז",
  "8": "ח",
  "9": "ט",
  "10": "י",
  "20": "כ",
  "30": "ל",
  "40": "מ",
  "50": "נ",
  "60": "ס",
  "70": "ע",
)

#let locale_number_to_gim(num) = {
  let a = ()
  while num > 0 {
    let cmax = 0
    for c in gim_table.keys() {
      if num >= int(c) {
        cmax = int(c)
      }
    }

    num -= cmax
    a.push(gim_table.at(str(cmax)))
  }

  if a.len() >= 2 and a.at(-2) == "י" and a.at(-1) == "ה" {
    a.at(-2) = "ט"
    a.at(-1) = "ו"
  }

  if a.len() >= 2 and a.at(-2) == "י" and a.at(-1) == "ו" {
    a.at(-2) = "ט"
    a.at(-1) = "ז"
  }

  if a.len() == 1 {
    a.push("'")
  } else {
    a.insert(-1, "\"")
  }

  return a.join()
}

#let article(
  title: none,
  author: sys.inputs.at("author_name", default: []),
  date: none,
  language: "he",
  signature: none,
  doc,
) = {
  if date == none {
    let today = datetime.today()
    let heMapping = (
      "1": "ינואר",
      "2": "פברואר",
      "3": "מרץ",
      "4": "אפריל",
      "5": "מאי",
      "6": "יוני",
      "7": "יולי",
      "8": "אוגוסט",
      "9": "ספטמבר",
      "10": "אוקטובר",
      "11": "נובמבר",
      "12": "דצמבר",
    )
    let enMapping = (
      "1": "January",
      "2": "February",
      "3": "March",
      "4": "April",
      "5": "May",
      "6": "June",
      "7": "July",
      "8": "August",
      "9": "September",
      "10": "October",
      "11": "November",
      "12": "December",
    )
    if language == "he" {
      date = str(today.day()) + " ב" + heMapping.at(str(today.month())) + " " + str(today.year())
    } else {
      date = enMapping.at(str(today.month())) + " " + str(today.day()) + ", " + str(today.year())
    }
  }

  // Set the text design to imitate my latex setup
  set text(
    size: 10pt,
    lang: language,
    font: "Libertinus Serif",
  )

  // Size of cases
  set math.cases(gap: 1em)

  // Space between lines
  set par(leading: 0.8em)

  // Set page numbering
  set page(
    numbering: "1",
    paper: "a4",
    margin: (
      x: 1.5cm,
    ),
  )

  show math.equation.where(block: true): eq => {
    block(width: 100%, inset: 0pt, align(center, eq))
  }

  // Spacing after titles
  show heading: set block(below: 1.2em)

  // These will set the numbering to imitate latex as well
  // set heading(numbering: "1.1") // this line should be uncommented only on notes file!
  show heading.where(level: 3): it => [
    #block(it.body)
  ]
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    it
  }

  show: thmrules.with(qed-symbol: $square$)

  // To fix the bug where the letter א is being interpreted as aleph number.
  show regex("\p{Hebrew}.+"): it => text(
    dir: rtl,
    font: "Libertinus Serif",
    lang: "he",
  )[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
  set math.cases(gap: 1em)

  box(height: 60pt)
  align(center, text(17.28pt, title))
  align(center, text(author))
  align(center, text(12pt, date))
  align(center, signature)
  pagebreak()

  // Numbering equations
  show math.equation: it => {
    if it.fields().keys().contains("label") {
      math.equation(block: true, numbering: "(1)", number-align: left, it)
      // Don't forget to change your numbering style in `numbering`
      // to the one you actually want to use.
      //
      // Note that you don't need to #set the numbering now.
    } else {
      it
    }
  }
  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(
        el.location(),
        numbering(
          // don't forget to change the numbering according to the one
          // you are actually using (e.g. section numbering)
          "(1)",
          counter(math.equation).at(el.location()).at(0) + 1,
        ),
      )
    } else {
      it
    }
  }

  doc
}

// Counters for questions
#let question_counter = counter("question_counter")
#let subquestion_counter = counter("subquestion_counter")
#let sub_subquestion_counter = counter("sub_subquestion_counter")

// Reimplementation of question macros
#let question(number: -1) = {
  subquestion_counter.update(0)
  sub_subquestion_counter.update(0)
  if number == -1 {
    question_counter.step()
  } else {
    question_counter.update(number)
  }

  context if text.lang == "he" [
    = שאלה #context question_counter.display()
  ] else [
    = Question #context question_counter.display()
  ]
}

// Reimplementation of subquestion macros
#let subquestion(number: -1) = {
  sub_subquestion_counter.update(0)
  if number == -1 {
    subquestion_counter.step()
  } else {
    subquestion_counter.update(1)
  }

  context if text.lang == "he" [
    == סעיף #context subquestion_counter.display(locale_number_to_gim)
  ] else [
    == Subquestion #context subquestion_counter.display()
  ]
}

// Reimplementation of sub_subquestion macros
#let sub_subquestion(number: -1) = {
  if number == -1 {
    sub_subquestion_counter.step()
  } else {
    sub_subquestion_counter.update(1)
  }

  context if text.lang == "he" [
    === תת־סעיף #context sub_subquestion_counter.display(locale_number_to_gim)
  ] else [
    === Sub-Subquestion #context sub_subquestion_counter.display()
  ]
}

// Configuring theorem environments, this is necessary in contrast to latex
#let theorem_titles = (
  "theorem": (
    "he": "משפט",
    "en": "Theorem",
  ),
  "proof": (
    "he": "הוכחה",
    "en": "Proof",
  ),
  "solution": (
    "he": "פתרון",
    "en": "Solution",
  ),
  "lemma": (
    "he": "למה",
    "en": "Lemma",
  ),
  "proposition": (
    "he": "טענה",
    "en": "Proposition",
  ),
  "definition": (
    "he": "הגדרה",
    "en": "Defination",
  ),
  "corollary": (
    "he": "מסקנה",
    "en": "Corollary",
  ),
  "remark": (
    "he": "הערה",
    "en": "Remark",
  ),
  "example": (
    "he": "דוגמה",
    "en": "Example",
  ),
  "counterexample": (
    "he": "אלדוגמה",
    "en": "Counter Example",
  ),
  "convention": (
    "he": "מוסכמה",
    "en": "Convention",
  ),
  "notation": (
    "he": "סימון",
    "en": "Notation",
  ),
  "fact": (
    "he": "עובדה",
    "en": "Fact",
  ),
  "exercise": (
    "he": "תרגיל",
    "en": "Exercise",
  ),
  "goal": (
    "he": "מטרה",
    "en": "Goal",
  ),
)
#let inset = (x: 0em, y: -0.3em)
#let theorem = thmbox(
  "theorem",
  { context theorem_titles.at("theorem").at(text.lang) },
  inset: inset,
  base_level: 1,
)
#let lemma = thmbox(
  "lemma",
  { context theorem_titles.at("lemma").at(text.lang) },
  inset: inset,
  base_level: 1,
)
#let proposition = thmbox(
  "proposition",
  { context theorem_titles.at("proposition").at(text.lang) },
  inset: inset,
  base_level: 1,
)
#let definition = thmbox(
  "definition",
  { context theorem_titles.at("definition").at(text.lang) },
  inset: inset,
  base_level: 1,
)
#let corollary = thmbox(
  "corollary",
  { context theorem_titles.at("corollary").at(text.lang) },
  inset: inset,
  base_level: 1,
)
#let remark = thmbox("remark", { context theorem_titles.at("remark").at(text.lang) }, inset: inset).with(
  numbering: none,
)
#let fact = thmbox(
  "fact",
  { context theorem_titles.at("fact").at(text.lang) },
  inset: inset,
  base_level: 1,
)
#let exercise = thmbox(
  "exercise",
  { context theorem_titles.at("exercise").at(text.lang) },
  inset: inset,
  base_level: 1,
)
#let example = thmbox(
  "example",
  { context theorem_titles.at("example").at(text.lang) },
  inset: inset,
  base_level: 1,
)
#let counterexample = thmbox(
  "counterexample",
  { context theorem_titles.at("counterexample").at(text.lang) },
  inset: inset,
  base_level: 1,
)
#let notation = thmbox(
  "notation",
  { context theorem_titles.at("notation").at(text.lang) },
  inset: inset,
).with(numbering: none)
#let convention = thmbox(
  "convention",
  { context theorem_titles.at("convention").at(text.lang) },
  inset: inset,
).with(numbering: none)
#let goal = thmbox("goal", { context theorem_titles.at("goal").at(text.lang) }, inset: inset).with(numbering: none)
#let proof = thmproof("proof", { context theorem_titles.at("proof").at(text.lang) }, inset: inset)
#let solution = thmproof(
  "solution",
  { context theorem_titles.at("solution").at(text.lang) },
  inset: inset,
  base_level: 1,
)

#let todo = text(red)[*TODOOOOOOOOOOOOOOOOOO*]

#let group-by-pairs(elements) = {
  let lefts = elements.enumerate().filter(((index, _)) => calc.rem(index, 2) == 0).map(((_, element)) => element)
  let rights = elements.enumerate().filter(((index, _)) => calc.rem(index, 2) == 1).map(((_, element)) => element)
  lefts.zip(rights)
}

#let mycases(..cases, word: none) = {
  let cases = group-by-pairs(cases.pos()).map(((value, condition)) => {
    if word != none {
      $#value quad &#word #condition$
    } else {
      $#value quad & #condition$
    }
  })
  math.cases(..cases)
}

// Custom math functions
// Complex Analysis
#let Arg = math.italic(math.op("Arg"))
#let Hol = math.op("Hol")
#let im = math.italic(math.op("Im"))
#let re = math.italic(math.op("Re"))
#let Log = math.italic(math.op("Log"))
#let Length = math.op("Length")
#let Area = math.op("Area")

// Geneeral Calculs
#let supp = math.op("supp")

// Probability
#let Ber = math.italic(math.op("Ber"))
// headings
//#show heading: it => {
//	let c = if it.level == 1 {
//		rgb(246, 196, 187)
//	} else if it.level == 2 {
//		rgb(205, 234, 229)
//	} else if it.level == 3 {
//		rgb(217, 233, 210)
//	} else {
//		rgb(252, 241, 188)
//	}
//
//	block([
//		//#counter(heading).display(it.numbering)
//		#underline(
//			stroke: c + 3pt,
//			offset: -1pt,
//			evade: false,
//			background: true
//		)[#it.body]
//	])
//}
