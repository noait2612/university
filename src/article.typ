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
	author: none,
	date: none,
	language: "he",
	signature: none,
	doc
) = {
	if date == none {
		let today = datetime.today()
		let dict = (
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
			"12": "דצמבר"
		)
		date = str(today.day()) + " ב" +  dict.at(str(today.month())) + " " + str(today.year())
	}

	// Set the text design to imitate my latex setup
	set text(
		size: 10pt,
		lang: language,
		font: "Libertinus Serif"
	)

	// Space between lines
	set par(leading: 0.8em)

	// Set page numbering
	set page(numbering: "1",
	paper: "a4",
	margin:  (
  x: 1.5cm,
))

	show math.equation.where(block: true): eq => {
	  block(width: 100%, inset: 0pt, align(center, eq))
	}

	// Spacing after titles
	show heading: set block(below: 1.2em)

	// These will set the numbering to imitate latex as well
	//set heading(numbering: "1.1")
	show heading.where(level: 3): it => [
		#block(it.body)
	]
	show heading.where(level: 1): it => {
	  pagebreak(weak: true)
	  it
	}

	show: thmrules.with(qed-symbol: $square$)

	box(height: 60pt)
	align(center, text(17.28pt, title))
	align(center, text(author))
	align(center, text(12pt, date))
	align(center, signature)
	pagebreak()

	doc
}

// Counters for questions
#let question_counter = counter("question_counter")
#let subquestion_counter = counter("subquestion_counter")

// Reimplementation of question macros
#let question(number: -1) = {
	subquestion_counter.update(0)
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

// Configuring theorem environments, this is necessary in contrast to latex
#let theorem_titles = (
	"theorem": (
		"he": "משפט",
		"en": "Theorem"
	),
	"proof": (
		"he": "הוכחה",
		"en": "Proof"
	),
	"solution": (
		"he": "פתרון",
		"en": "Solution"
	),
	"lemma": (
		"he": "למה",
		"en": "Lemma"
	),
	"proposition": (
		"he": "טענה",
		"en": "Proposition"
	),
)
#let theorem = thmbox("theorem", {context theorem_titles.at("theorem").at(text.lang)}, inset: 0cm)
#let lemma = thmbox("lemma", {context theorem_titles.at("lemma").at(text.lang)}, inset: 0cm)
#let proposition = thmbox("proposition", {context theorem_titles.at("proposition").at(text.lang)}, inset: 0cm)
#let proof = thmproof("proof", {context theorem_titles.at("proof").at(text.lang)}, inset: 0cm)
#let solution = thmproof("solution", {context theorem_titles.at("solution").at(text.lang)}, inset: 0cm)

#let todo = text(red)[*TODOOOOOOOOOOOOOOOOOO*]

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