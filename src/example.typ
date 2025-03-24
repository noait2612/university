// Import theorems package
#import "@preview/ctheorems:1.1.3": *

// Set the text design to imitate my latex setup
#set text(
	size: 10pt,
	lang: "en",
	font: "Libertinus Serif"
)

// Set page numbering
#set page(numbering: "1")

// These will set the numbering to imitate latex as well
#set heading(numbering: "1.1")
#show heading.where(level: 3): it => [
	#block(it.body)
]
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  it
}

// Reimplementation of my question macros
#let question_counter = counter("question_counter")
#let question(number: -1) = {
	if number == -1 {
		question_counter.step()
	} else {
		question_counter.update(number)
	}

	context if text.lang == "he" [
		== שאלה #context question_counter.display()
	] else [
		== Question #context question_counter.display()
	]
}

// Configuring theorem environments, this is necessary in contrast to latex
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Theorem", inset: 0cm)
#let proof = thmproof("proof", "Proof", inset: 0cm)

#context outline()
= English document example
== Plain text
=== A sub subsection
#lorem(40)

Another paragraph, using inline math $f(x) = x^2$,
as well some display math,
$
	integral_0^t f(x) diff x
	= 1 / 3 x^3 + C
$
This is the last line of this paragraph.

Paragraph containing lists,
+ Item 1
	+ Subitem 1
	+ Subitem 2
+ Item 2
As for non-numbered list,
- Item 1
- Item 2

=== Another sub subsection
This is another part of plain text

=== Theorem environments
Notice, "environments" of Latex are called here "Blocks".
#theorem[
	Unnamed theorem.
]
#theorem("Some theorems name")[
	Named theorem.
]
#proof[
	This is a proof of the stated above theorem.
]

#question()
#question()

#set text(lang: "he")
= מסמכים בעברית
== טקסט כללי
=== כותרת משנה לדוגמה
נבחין כי הפעם הטקסט הוא בעברית ופשוט מאוד לשימוש, למעשה לא הוגדרו כמעט הגדרות חדשות.
גם הפעם נבחין בסביבה מתמטית פנימית, $g(x) = ln x$ וכן בסביבה מתמטית לתצוגה,
$
	g'(x) = 1 / x
$
ולבסוף טקסט שסוגר את הנושא.

דוגמה להגדרת טקסט עם כותרת מסוג אלגנטי,
#underline(stroke: rgb(246, 196, 187) + 3pt, offset: -1pt, evade: false, background: true)[שם הכותרת]

#question(number: 1)
#question()

== סביבות משפטים והוכחות
#let theorem = thmbox("theorem", "משפט", inset: 0cm)
#let proof = thmproof("proof", "הוכחה", inset: 0cm)
#theorem[
	משפט בעברית
]
#theorem("משפט עם שם")[
	משפט שגם יש לו שם
]
#proof[
	הוכחת המשפט שהוצג לעיל
]

== רפרנס לסימנים מתמטיים
שוויונות,
$
	= != eq := < lt.eq lt.eq.not lt.not <= > gt equiv tilde.equiv tilde.eq prec.eq
$
חצים,
$
	f : RR arrow.r [0, 1], harpoon.tr arrow.l -> <-> => <=> ==> <==>
$
אפשרי גם להגדיר מקרו מיוחד לזה
#let iff = $<==>$
$ x = 1 iff 1 = x $
קבוצות,
$ forall exists in subset subset.eq supset and or not nothing union inter union.big aleph union.big.plus union.big.dot $
כמתים,
$ sum_(i = 1)^infinity 1 / n^2 product_1^2 $
אינפי,
$ integral_0^1 x dif x integral.double integral.triple (diff f) / (diff x) $
אותיות מגניבות,
$ FF RR CC cal(F) $
יוונית,
$ gamma Gamma pi phi phi.alt epsilon epsilon.alt $
פעולות,
$ + - dot compose times $
סוגריים,
$ ( integral ) [ integral ] abs(a + b) norm(a + b) floor(a + b) ceil(a + b) round(a + b) lr(angle.l integral angle.r) $
מטריצות,
$ mat(
	1, 2, ..., 10;
	2, 2, ..., 10;
	dots.v, dots.v, dots.down, dots.v;
	10, 10, ..., 10;
) $

#let dict = (
	"1": "ינואר",
	"2": "פברואר",
	"3": "מרץ",
	"4": "ינואר",
	"5": "ינואר",
	"6": "ינואר",
	"7": "ינואר",
	"8": "ינואר",
	"9": "ינואר",
	"10": "ינואר",
	"11": "ינואר",
	"12": "ינואר"
)


