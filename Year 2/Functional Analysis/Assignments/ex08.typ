#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 08 --- אנליזה פונקציונלית, 80417 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#let sgn = math.op("sgn")

#question()
יהי $[a,b]$ קטע. נוכיח שהמרחב $accent(C, tilde)[a,b]$ של פונקציות רציפות המקיימות $f(a)=f(b)$ צפוף בנורמה $norm(dot.op)_2$ במרחב $C[a,b]$ (ולכן גם ב־$L^2[a,b]$).

#proof[
  עלינו להראות שלכל $f in C[a,b]$ ולכל $epsilon > 0$ קיימת $g in accent(C, tilde)[a,b]$ כך שמתקיים
  $ norm(f-g)_2 < epsilon $
  וזה גורר צפיפות גם ב־$L^2[a,b]$ מכך שראינו ש־$C[a,b]$ צפופה ב־$L^2[a,b]$.\
  נגדיר את הקו הישר
  $ phi.alt(x) = f(a) + ((f(b)-f(a)) / (b-a))(x-a) $
  מתקיים $ phi.alt(a)=f(a) \
  phi.alt(b) = f(b) $
  ונגדיר
  $ h(x) = f(x) - phi.alt(x) $
  $h$ כמובן רציפה מאריתמטיקה של פונקציות רציפות ומתקיים $h(a)=0, h(b)=0$ ולכן $h in accent(C, tilde)[a,b]$.
]

#question()
נחשב את מקדמי טור פוריה של הפונקציה האינטגרבילית $f(x)=sgn(x) dot.op (pi-abs(x)) / 2$, כאשר
$ sgn(x) = mycases(-1, x<0, 0, x=0, 1, x>0) $

#proof[
  ראשית נשים לב ש־$f(x)$ היא פונקציה אי־זוגית:
  $
    f(-x) = sgn(-x) dot.op (pi - abs(x)) / 2 =_(sgn(-x)=-sgn(x) \
    abs(-x)=abs(x)) -sgn(x) dot.op (pi - abs(x)) / 2 = -f(x)
  $
  בתרגול $8$ ראינו שעבור פונקציה אי־זוגית מתקיים $a_n = 0$ לכל $n in NN union {0}$.\
  כמו־כן, מכפלה של פונקציה אי־זוגית בפונקציה אי־זוגית היא פונקציה זוגית ועבור פונקציה זוגית $g$ מתקיים
  $ integral_(-a)^a g(x) d x = 2 integral_0^a g(x) d x $
  היות ו־$sin(x)$ פונקציה אי־זוגית, אז $f(x) dot.op sin(n x)$ היא פונקציה זוגית. \
  נחשב את $b_n$ לכל $n in NN$ מתקיים
  $
    b_n &= 1 / pi integral_(-pi)^pi f(x) dot.op sin((n x)) d x \
    &= 2 / pi integral_0^pi f(x) dot.op sin(n x) d x \
    &= 2 / (2pi) integral_0^pi (sgn(x) dot.op abs(x) dot.op sin(n x)) d x \
    &= 1 / pi integral_0^pi (pi - x) sin(n x) d x \
    &= 1 / pi (pi integral_0^pi sin(n x) d x - integral_0^pi x sin(n x)) \
    &= 1 / pi ([(-pi dot.op cos(n x)) / n]^pi_0 - [(sin(n x) / n^2 - (x cos(n x)) / n]^pi_0 ) \
    &= 1 / pi ( pi / n+pi / n-pi / n ) = 1 / n
  $
  אז מצאנו שטור פורייה של $f$ הוא $sum_(n=1)^infinity 1 / n sin(n x)$.
]

#question()
נשתמש בזהות פרסבל על־מנת לחשב את סכומי הטורים בכל סעיף.

#subquestion()
הטור $sum_(n=1)^infinity 1 / n^2$ בעזרת הפונקציה $f(x)=x$ ונסיק מהו סכום הטור $sum_(n=1)^infinity 1 / (2n-1)^2$.

#proof[

]

#subquestion()
הטור $sum_(n=1)^infinity 1 / (2n-1)^4$ בעזרת הפונקציה $f(x)=abs(x)$.

#proof[

]

#question()
נוכיח את מבחן ה־$M$ של ויירשטראס: יהיו $I subset.eq RR$ קטע, $(f_n)_(n=1)^infinity$ סדרת פונקציות רציפות בקטע $I$ ו־$(M_n)_(n=1)^infinity subset.eq RR$ כך שלכל $n$ מתקיים $abs(f_n)_infinity < M_n$ בקטע $I$.\
אם הטור $sum_(n=1)^infinity M_n$ מתכנס אז $ f(x) = sum(n=1)^infinity f_n (x) $
מוגדרת היטב בקטע $I$, רציפה שם והטור מתכנס אליה במידה שווה.

#proof[

]

#question()
תהיי $f in accent(C, tilde)[-pi, pi]$ כך ש־$f' in accent(C, tilde)[-pi, pi]$ (בפרט, $f$ גזירה ברציפות). \
נסמן ב־$a_n^f,b_n^f$ את מקדמי טור פורייה של $f$ וב־$a_n^', b_n^'$ את מקדמי טור פורייה של $f'$.

#subquestion()
נוכיח שלכל $n in NN$ מתקיים $a_n = -1 / n b_n^'$ וכן $b_n = 1 / n a_n^'$.

#proof[

]

#subquestion()
ניזכר ש־$(a_n^')_(n=1)^infinity,(b_n^')_(n=1)^infinity in l^2$ ונסיק ש־$(a_n)_(n=1)^infinity, (b_n)_(n=1)^infinity in l^1$ ובפרט שטור פורייה של $f$ מתכנס במידה שווה.

#proof[

]

#subquestion()
נסיק שהטור מתכנס לפונקציה $f$ במידה שווה, כלומר בנורמת $norm(dot.op)_infinity$.

#proof[

]
