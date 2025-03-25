// Import theorems package
#import "@preview/ctheorems:1.1.3": *

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
	set page(numbering: "1")

	// Spacing after titles
	show heading: set block(below: 1.2em)

	// These will set the numbering to imitate latex as well
	set heading(numbering: "1.1")
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
		== סעיף #context subquestion_counter.display()
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