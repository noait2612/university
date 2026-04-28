// Import theorems package
#import "@preview/thmbox:0.3.0": *

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
  "80": "פ",
  "90": "צ",
  "100": "ק",
  "200": "ר",
  "300": "ש",
  "400": "ת",
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



#let counter-id(counter) = {
  let counter-repr = repr(counter)
  return "thmbox-counter-level" + counter-repr.slice("counter(".len(), counter-repr.len() - 1)
}

/// Initializes a custom counter to work with thmbox.
/// It has a level, which means how many numbers it uses. The last one will increase per usage
/// of the counter (in thmboxes for example) while the previous ones will reflect the headings
///
/// For example, with level 2, the counter uses the format X.Y where X is the chapter the counter
/// is used and Y increases in this chapter.
///
/// - counter (counter): The counter to use
/// - level (int): How many numbers the counter should have. 2 makes the numbers have the format X.X, for example.
#let sectioned-counter(counter, level: 2) = doc => {
  // Metadata
  [
    #metadata(level) #label(counter-id(counter))
  ]

  show heading: it => {
    if it.level < level {
      context counter.update(
        (..std.counter(heading).get(), 0),
      )
    }
    it
  }

  context {
    let current-heading = std.counter(heading).get()
    let slice = current-heading.slice(
      0,
      calc.min(level, current-heading.len()) - 1,
    )
    counter.update((..slice, 0))
  }

  doc
}

#let thm_counter = counter("my_thmbox")

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
    it // Render the heading FIRST so the chapter number increments to 1
    counter(figure.where(kind: "thmbox")).update(0) // Then reset the box counter
  }

  // show: thmrules.with(qed-symbol: $square$)

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

  // ADD THIS: Apply your sectioned counter so it tracks the document's headings
  show: sectioned-counter(thm_counter, level: 2)

  show figure.where(kind: "thmbox"): it => {
    show figure.caption: none
    it
  }

  // 3. REVERT THIS: You don't need custom reference logic for thmboxes anymore!
  // Typst will handle it natively. Just keep the equation logic.
  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(
        el.location(),
        numbering("(1)", counter(math.equation).at(el.location()).at(0) + 1),
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
    "en": "Definition",
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
// 1. Wrap the entire function in context so all variables evaluate safely
// The outer function is ALREADY a context block
#let my_thmbox(
  color: colors.dark-gray,
  variant: "Thmbox",
  title: none,
  numbering: "1.1",
  sans: true,
  fill: none,
  body: [],
  bar-thickness: 3pt,
  bar-color: none,
  title-separator: h(1fr),
  ..args,
) = {
  let pa = args.pos()
  let num-pas = pa.len()

  let final_variant = if num-pas == 3 { pa.at(0) } else { variant }
  let final_title = if num-pas == 2 or num-pas == 3 { pa.at(num-pas - 2) } else { title }
  let final_body = if num-pas > 0 and num-pas <= 3 { pa.at(num-pas - 1) } else { body }

  // Define a native numbering function so `@references` automatically format correctly
  let fig_num = if numbering != none {
    n => context {
      let h_arr = std.counter(heading).get()
      let h = if h_arr.len() > 0 { h_arr.first() } else { 0 }
      std.numbering(numbering, h, n)
    }
  } else { none }

  // NO CONTEXT WRAPPER HERE! The figure is on the outside to catch the <labels>
  figure(
    caption: [], // Empty caption makes it natively referenceable
    gap: 0em,
    kind: "thmbox",
    supplement: final_variant,
    numbering: fig_num,
    outlined: false,
  )[
    // Push context to the inside where it belongs for language/visual styling
    #context {
      let is_he = text.lang == "he"
      if is_he [ #set text(dir: rtl) ]
      set align(start)

      let actual_bar_color = if bar-color == none { color } else { bar-color }
      let bar = stroke(paint: actual_bar_color, thickness: bar-thickness)
      let opposite-inset = if fill != none { 1em - bar-thickness } else { 0em }

      block(
        stroke: (
          left: if is_he { none } else { bar },
          right: if is_he { bar } else { none },
        ),
        inset: (
          left: if is_he { opposite-inset } else { 1em },
          right: if is_he { 1em } else { opposite-inset },
          top: 0.6em,
          bottom: 0.6em,
        ),
        fill: fill,
        width: 100%,
      )[
        // --- TITLE SECTION ---
        #if final_variant != none or final_title != none {
          block(
            above: 0em,
            below: 1.2em,
            sticky: true,
          )[
            #set text(color, weight: "bold")

            #let counter-display = if numbering != none {
              " "
              let h_arr = std.counter(heading).get()
              let h = if h_arr.len() > 0 { h_arr.first() } else { 0 }
              let f = std.counter(figure.where(kind: "thmbox")).get().first()
              std.numbering(numbering, h, f)
            } else { none }

            #let display_title = if final_title != none [ (#final_title)] else []

            #final_variant#counter-display#title-separator#display_title
          ]
        }

        // --- BODY SECTION ---
        #block(width: 100%, spacing: 0em)[#final_body]
      ]
    }
  ]
}

#let deep-steel-blue = rgb("#2F4F6F")
#let muted-rust = rgb("#7A3E2B")
#let muted-olive = rgb("#556B2F")
#let muted-pink = rgb("#c91753")
#let natural-grey = rgb("#4A4A4A")

// 3. Define environments cleanly using .with() and just passing the dictionary key
#let theorem = my_thmbox.with(
  color: muted-pink,
  variant: context theorem_titles.at("theorem").at(text.lang),
)

/// Used for propositions, uses a light blue color by default.
#let proposition = my_thmbox.with(
  color: muted-pink,
  variant: context theorem_titles.at("proposition").at(text.lang),
)

/// Used for lemmas, uses a light turquoise color by default.
#let lemma = my_thmbox.with(
  color: muted-pink,
  variant: context theorem_titles.at("lemma").at(text.lang),
)

/// Used for corollaries, uses a pink color by default.
#let corollary = my_thmbox.with(
  color: muted-pink,
  variant: context theorem_titles.at("corollary").at(text.lang),
)

/// Used for definitions, uses an orange color by default.
#let definition = my_thmbox.with(
  color: deep-steel-blue,
  variant: context theorem_titles.at("definition").at(text.lang),
)

/// Used for examples, uses a lime color and is not numbered by default.
#let example = my_thmbox.with(
  color: natural-grey,
  variant: context theorem_titles.at("example").at(text.lang),
  numbering: none,
  sans: false,
)

#let counterexample = my_thmbox.with(
  color: natural-grey,
  variant: context theorem_titles.at("counterexample").at(text.lang),
  numbering: none,
  sans: false,
)

/// Used for remarks, uses a gray color and is not numbered by default.
#let remark = my_thmbox.with(
  color: natural-grey,
  variant: context theorem_titles.at("remark").at(text.lang),
  numbering: none,
  sans: false,
)

/// Used for exercises, uses a blue color by default.
#let exercise = my_thmbox.with(
  color: muted-olive,
  variant: context theorem_titles.at("exercise").at(text.lang),
  sans: false,
)

/// Used for algorithms, uses a purple color by default.
#let notation = my_thmbox.with(
  color: natural-grey,
  variant: context theorem_titles.at("notation").at(text.lang),
  numbering: none,
  stroke: none,
)

/// Used for claims, uses a green color and is not numbered by default.
#let claim = my_thmbox.with(
  color: natural-grey,
  variant: context theorem_titles.at("claim").at(text.lang),
  numbering: none,
)


#let proof(
  title: translations.variant("proof"),
  separator: ":",
  body: [],
  ..args,
) = {
  // set values
  let pa = args.pos()
  let num-pas = pa.len()
  let title = if num-pas == 2 [#translations.variant("proof-of") #pa.at(0)] else { title }
  let body = if num-pas > 0 and num-pas <= 3 { pa.at(num-pas - 1) } else { body }

  [
    #set text(style: "oblique")
    #title;#separator
  ]
  [#body #qed()]
}

#let proof(
  title: context theorem_titles.at("proof").at(text.lang),
  separator: ":",
  body: [],
  ..args,
) = {
  // set values
  let pa = args.pos()
  let num-pas = pa.len()
  let title = if num-pas == 2 [#translations.variant("proof-of") #pa.at(0)] else { title }
  let body = if num-pas > 0 and num-pas <= 3 { pa.at(num-pas - 1) } else { body }

  [
    #set text(style: "oblique")
    #title;#separator
  ]
  [#body #qed()]
}
#let solution(
  title: context theorem_titles.at("solution").at(text.lang),
  separator: ":",
  body: [],
  ..args,
) = {
  // set values
  let pa = args.pos()
  let num-pas = pa.len()
  let title = if num-pas == 2 [#translations.variant("proof-of") #pa.at(0)] else { title }
  let body = if num-pas > 0 and num-pas <= 3 { pa.at(num-pas - 1) } else { body }

  [
    #set text(style: "oblique")
    #title;#separator
  ]
  [#body #qed()]
}

// #let solution = thmproof(
//   "solution",
//   { context theorem_titles.at("solution").at(text.lang) },
//   inset: inset,
// )

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
#let Harm = math.op("Harm")
#let im = math.italic(math.op("Im"))
#let re = math.italic(math.op("Re"))
#let Log = math.italic(math.op("Log"))
#let Length = math.op("Length")
#let Area = math.op("Area")
#let res = math.op("res")
#let Mer = math.op("Mer")
#let ind = math.op("ind")

// General Calculus
#let supp = math.op("supp")
#let Span = math.op("Span")
#let dist = math.op("dist")
#let Hom = math.op("Hom")
#let normop(x) = $norm(#x)_italic("op")$
#let sign = math.op("sgn")
#let closure(X) = $overline(#X)$
#let interior(X) = $#X^(circle.small)$
#let boundary(X) = $partial #X$
#let Lip = math.op("Lip")
#let Id = math.op("Id")
// #let no-conv = math(arrow.double)_(math.display(math.arrow.double.l.not))

// Probability
#let Unif = math.italic(math.op("Unif"))
#let Ber = math.italic(math.op("Ber"))
#let Bin = math.italic(math.op("Bin"))
#let Geo = math.italic(math.op("Geo"))
#let Poi = math.italic(math.op("Poi"))
#let Exp = math.italic(math.op("Exp"))
#let Var = math.op("Var")
#let Cov = math.op("Cov")
#let Proj = math.op("Proj")

// Measure
#let esssup = math.op("ess sup")
#let essinf = math.op("ess inf")

// Algebraic Structures
#let Aut = math.op("Aut")

// Mainfolds
#let Mesh = math.op("Mash")
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
