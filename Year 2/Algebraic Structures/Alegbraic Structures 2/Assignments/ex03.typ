#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 03 --- מבנים אלגבריים 2, 80446 ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)

#let char = math.op("char")
#let im = math.op("Im")
#let ker = math.op("Ker")
#let deg = math.op("deg")

#question()
יהי $p in NN$ ראשוני ו־$n in NN$. הפולינומים הציקלוטומי מסדר $p^n$ הוא $(x^p^n-1)/(x^p^(n-1)-1) in QQ[x]$.

#subquestion()
נראה שזה אכן פולינום, כלומר $x^p^(n-1) - 1 divides x^p^n-1$.
#proof[ ]

#subquestion()
נוכיח שהפולינום לעיל הוא אי־פריק בעזרת קריטריון אייזנשטיין.
#proof[]

#question()
נפרק את $f(x) = x^4+4 in QQ[x]$ לפולינומים אי־פריקים מעל $QQ$.
#solution[
  נשים לב שעבור $f in CC$ מתקיים
  $
    x^4+4 = (x^2+2i)(x^2-2i) = (x-(1-i)) dot.op (x+(1-i)) dot.op (x-(1+i))dot.op(x+(1+i)) \
    = ((x-1)+i) dot.op ((x+1)-i) dot.op ((x-1)-i) dot.op ((x+1)+i) = ((x-1)^2+1) dot.op ((x+1)^2+1)
  $
  נשים לב
  $
    (x-1)^2+1 = x^2-2x+2\
    (x+1)^2+1 = x^2+2x+2
  $
  אלו שני פולינומים ממעלה 2, ולכן לפי מטלה 2 מספיק שנשים לב שאין להם שורשים ב־$QQ$ (ואכן אין להם, שכן כל הפיתרונות של הפולינומים הללו הם ב־$CC$) ולכן אין להם שורש ב־$QQ$ ועל־כן הם אי־פריקים.
]

#question()
יהיו $p_1, ..., p_n in NN$ ראשוניים שונים זה מזה. נראה ש־$[QQ(sqrt(p_1), ..., sqrt(p_n)) : QQ] = 2^n$ ושבסיס ל־$QQ(sqrt(p_1), ..., sqrt(p_n))$ מעל $QQ$ נתון על־ידי $ cal(B) = { sqrt(product_(i in S) p_i) bar S subset.eq {1, ..., n}} $
#proof[]

#question()
#subquestion()
נתון $alpha = sqrt(13+6sqrt(2))$ ונחשב את $[QQ(alpha) : QQ]$.
#solution[]

#subquestion()
נתון $alpha = sqrt(11+6sqrt(2))$ ונחשב את $[QQ(alpha) : QQ]$.
#solution[]

#question()
נוכיח ש־$f(x) = x^2 +4 in QQ[x]$ הוא אי־פריק אבל ש־$f(x+a)$ לא מקיים את קריטריון אייזנשטיין לאף $a in ZZ$ ולאף $p in NN$ ראשוני.
#proof[]
