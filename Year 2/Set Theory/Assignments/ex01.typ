#import "../../../src/article.typ": *
#show: article.with(
	title: [ פתרון מטלה 01 --- תורת הקבוצות, 80200 ],
	author: [  ],
	language: "he",
	signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]]
)

#show heading: it => {
	let c = if it.level == 1 {
		rgb(246, 196, 187)
	} else if it.level == 2 {
		rgb(205, 234, 229)
	} else if it.level == 3 {
		rgb(217, 233, 210)
	} else {
		rgb(252, 241, 188)
	}

	block([
		//#counter(heading).display(it.numbering)
		#underline(
			stroke: c + 3pt,
			offset: -1pt,
			evade: false,
			background: true
		)[#it.body]
	])
}

#question()
$integral_0^6 6x dif x$
#proof[
	יהי waka ותהיי bla67 ftw
]
== כותרת משנה
אני צריך לכתוב כמות טקסט ובעברית ספציפית כדי לבחון את ההגדרות עיצוב של העמוד הזה, ולכן אני הולך להתחיל להקליד עוד ועוד טקסט עד שבסוף יהיה לי כמות מספקת של שורות. בהתאם אני לא הולך לרווח, להשקיע, או לעשות אף טיפה יותר מהמינימום ההכרחי, המטרה היא אך ורק, ולא מעבר לקבלת טקסט ארוך שמורכב ממספר שורות.

עכשיו אפשר לעבור לפסקה הבאה, פסקה זו צריכה להיות קצת פחות ארוכה, אבל אני עדיין צריך להשקיע בלכתוב משהו, גם אם הוא אכן פחות מושקע, מעניין, או מרגש מהפסקה הקודמת. נראה לי שכבר אפילו סיימתי.

= כותרת שנייה
== תת־כותרת שנייה
=== תת־תת־כותרת
עוד טקסט
