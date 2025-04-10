#import "../../../src/article.typ": *
#show: article.with(
	title: [ פתרון תרגיל בונוס לפסח --- תורת הקבוצות, 80200 ],
	author: [  ],
	signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]]
)

#show regex("\p{Hebrew}.+"): it => text(dir: rtl, font: "Libertinus Serif", lang: "he")[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)
#let rng = math.op("Range")

#question()
נוכיח שלא קיימת קבוצה $A$ המקיימת $abs(cal(P)(A)) = alef_0$.
#proof[
נניח בשלילה שקיימת קבוצה $A$ כך ש־$abs(cal(P)(A)) = alef_0$. \
במקרה הראשון, אם קיים $n in NN$ כך שמתקיים $abs(A)=n$, לפי מטלה 3 אנחנו יודעים שמתקיים $abs(cal(P)(A)) = 2^abs(A) = 2^n$ ולכן בפרט לא ייתכן כי מספר סופי יסמן שהקבוצה היא בת־מנייה ולכן קיבלנו סתירה. \
במקרה השני, אם $A$ קבוצה אינסופית ובת־מנייה, ממשפט קנטור על קבוצת החזקה שראינו בתרגול נובע כי $abs(A) = alef_0 < abs(cal(P)(A))$ וזאת סתירה. \
המקרה האחרון הוא ש־$A$ אינסופית אך אינה בת־מנייה ושוב ממשפט קנטור נקבל כי $abs(A)<abs(cal(P)(A))$. \
לכן לא קיימת קבוצה $A$ המקיימת $abs(cal(P)(A)) = alef_0$. \
הערה: בתרגול הגדרנו $abs(X) < abs(Y)$ אם $abs(X)<=abs(Y)$ וגם $abs(X)!=abs(Y)$.
]

#question()
נראה שלא ניתן לשכן קבוצה מת מנייה 
#proof[]

#question()
נשתמש בטיעון האלכסון של קנטור כדי להראות שקבוצת הפונקציות $A = {sigma : NN arrow.r NN bar sigma "חד־חד ערכית ועל"}$ אינה בת־מנייה.
#proof[
נניח בשלילה כי $A$ היא בת־מנייה ולכן קיימת פונקציה חד־חד ערכית ועל $f : B arrow.r NN$
]