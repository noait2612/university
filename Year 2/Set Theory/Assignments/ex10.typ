#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 10 --- תורת הקבוצות, 80200 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)
#show sym.lt.eq: math.scripts

#question()
תהיי $X$ קבוצה.

#subquestion()
נוכיח ש־$X$ טרנזיטיבית אם ורק אם $X subset.eq cal(P)(X)$.

#proof[
  $<==$ נניח כי $X$ טרנזטיבית ונרצה להראות ש־$X subset.eq cal(P)(X)$.\
  יהי $x in X$. מהגדרת הטרנזטיביות, מתקיים $x subset.eq X$ ולכן מהגדרת קבוצת החזקה $x in cal(P)(X)$ ובפרט מהגדרת תת־קבוצה מתקיים $x subset.eq cal(P)(X)$.\
  $==>$ נניח שמתקיים $X subset.eq cal(P)(X)$ ונראה ש־$X$ טרנזטיבית.\
  יהי $X subset.eq cal(P)(A)$ ויהי $x in X$. מהגדרת תת־הקבוצה מתקיים $x in cal(P)(X)$ ומהגדרת קבוצת החזקה מתקיים $x subset.eq X$ וזה נכון לכל $x in X$, וזו בידיוק ההגדרה של טרנזטיביות (קבוצה $x$ תקרא טרנזטיבית אם לכל $y in x$ ולכן $z in y$ מתקיים $z in x$).
]

#subquestion()
נוכיח שאם $X$ טרנזטיבית אז $cal(P)(X)$ טרנזטיבית.

#proof[
  יהי $Y in cal(P)(X)$ ולכן $Y subset.eq X$.\
  אז לכל $x in Y$ מתקיים $x in X$ ולכן $x subset.eq X$ – משמע $x in cal(P)(X)$ כי $X$ טרנזטיבית.\
  זה נכון לכל $x in Y$ ולכן $Y subset.eq cal(P)(X)$, וזו בידיוק הגדרת הטרנזטיביות ולכן $cal(P)(X)$ טרנזטיבית.
]

#subquestion()
נמצא את כל הקבוצות $X$ כך ש־$cal(P)(X)$ סודר.

#proof[
  ראשית, ברור כי עבור $X = emptyset, cal(P)(X) = {emptyset}$ וראינו בהרצאה שהקבוצה הריקה היא סודר, וראינו גם כי כל $n in omega$ הוא סודר (כי $omega$ הוא סודר וכל איבריו הם סודרים).\
  כעת, ניזכר שקבוצה $X$ תיקרא סודר אם
  + הקבוצה טרנזטיבית
  + $angle.l X, in angle.r$ הוא סדר טוב

  #todo
]

#question()
תהיי $X$ קבוצה שאיבריה הם קבוצות טרנזטיביות.

#subquestion()
נוכיח ש־$union.big X$ קבוצה טרנזטיבית.

#proof[
  נניח כי $X != emptyset$.\
  נתחיל מלהוכיח טענה: תהיי $A in X$, זוהי קבוצה טרנזטיבית מהנתון ונראה כי $union.big A subset.eq A$.\
  בשאלה הקודמת ראינו ש־$x subset.eq A <==> x in cal(P)(A)$ ולכן $forall x in A => x in cal(P)(A)$ ולכן $forall x in A => x subset.eq A$.\
  זה אומר שמתקיים $union.big x in A = A$ מהגדרה ולכן $union.big A subset.eq A$.\
  נשים לב שזה גורר גם ש־$A$ טרנזטיבית (זה בעצם אם ורק אם): יהי $x in A$ אז $x subset.eq union.big A subset.eq A$ ומהגדרת האיחוד קיבלנו ש־$forall x, x in A => x subset.eq A$ וזו הגדרת הטרנזטיביות.\
  כעת, תהיי $x in X$, היא טרנזטיבית ולכן מהטענה לעיל נקבל $union.big x subset.eq x$, נפעיל את פעולת האיחוד על שני־האגפים ונקבל $union.big union.big X subset.eq union.big X$ ומהטענה שראינו לעיל (מהכיוון השני) נקבל ש־$union.big X$ גם טרנזטיבית.
]

#subquestion()
נוכיח ש־$inter.big X$ קבוצה טרנזטיבית.

#proof[
  יהי $y in inter.big X$ משמע $forall x in X, y in x$.\
  מתקיים גם $forall x in X, y in x => y subset.eq x => y subset.eq inter.big X$ משמע קיבלנו שהחיתוך הוא טרנזטיבי.
]

#question()
תהיי $X$ קבוצה ונניח ש-$R_1, R_2 subset.eq X times X$ יחסים על $X$ כך ש־$R_2$ יחס אנטי־רפלקסיבי וטרנזטיבי ו־$R_1$ מקיים שלכל $x,y in X$ שונים מתקיים $(x,y) in R_1$ או $(y,x) in R_1$.\
נוכיח שאם $R_1 subset.eq R_2$ אז מתקיים $R_1=R_2$.

#proof[
  היות ו־$R_2$ הוא אנטי־רפלקסיבי זה גם אומר שכל $(x,y) in R_2$ בהגדרה מתקיים $x!=y$.\
  יהי $(x,y) in R_2$ כך ש־$x!=y$ ונרצה להראות ש־$(x,y) in R_1$.\
  מהגדרת $R_1$ נובע כי אחד מהבאים מתקיים
  + $(x,y) in R_1$ – אם זה המקרה, סיימנו
  + $(y,x) in R_1$ – אם זה המקרה, נראה שנגיע לסתירה:
    נניח כי $(y,x) in R_1$, מכך שמתקיים $R_1 subset.eq R_2$ נובע כי $(y,x) in R_2$, ומהנתון $R_2$ טרנזטיבי ולכן $(x,x) in R_2$ אבל $R_2$ הוא אנטי־רפלקסיבי ולכן $(x,x) in.not R_2$ וזאת סתירה.\
    לכן האפשרות היחידה היא ש־$(x,y) in R_1$.\
  הראינו שלכל $(x,y) in R_2$ מתקיים $(x,y) in R_1$ ולכן $R_2 subset.eq R_1$ ומהכלה דו־כיוונית נקבל $R_2=R_1$.

]
