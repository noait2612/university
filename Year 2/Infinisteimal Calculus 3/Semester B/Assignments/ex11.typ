#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 11 --- חשבון אינפיניטסימלי 3, 80415 ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)
#show figure.caption: emph
#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#let vol = math.op("Vol")

#question()
תהיינה $T subset.eq S subset.eq RR^k$ קבוצות חסומות ו־$f:S arrow.r RR$ פונקציה אינטגרבילית על $S$ ו־$T$ כך ש־$f>=0$. נוכיח כי מתקיים
$ integral_T f(x) d x <= integral_S f(x) d x $

#proof[
  הרעיון: זה נובע מהאי־שליליות של $f$ ולכן אנחנו מוסיפים עוד איברים לכל הפחות אי־שליליים.\
  מכיוון ש־$f$ אינטגרבילית על $S$, קיימת תיבה $S subset.eq Q subset.eq RR^k$ עבורה האינטגרל $integral_Q f_S (x) d x$ קיים.\
  בפרט, כמובן שמתקיים $T subset.eq S subset.eq Q$.\
  נגדיר $ f_Q (x) = mycases(f(x), x in S, 0, "אחרת") $
  נסתכל על $chi_S, chi_T$ הפונקציות המציינות של $S, T$ בהתאמה על $Q$, מתקיים אם כך
  $ integral_S f(x) d x = integral_Q f(x)_(chi_S) (x) d x, integral_T f(x) d x = integral_Q f(x)_(chi_T) (x) d x $
  מכך שמתקיים $T subset.eq S$ מתקיים גם $chi_T (x) <= chi_S (x)$ לכל $x in Q$ מהגדרה, ומכך ש־$f(x) >=0$ על $S$ ו־$0$ לכל $x in Q without S$, אז מתקיים לכל $x in Q$
  $ f_Q (x)_(chi_T) (x) <= f_Q (x)_(chi_S) (x) $
  וכשניקח אינטגרל על שני האגפים נקבל
  $ integral_T f(x) d x = integral_Q f_Q (x)_(chi_T) <= integral_Q f_Q (x)_(chi_S) = integral_S f(x) d x $
]

#question()
תהיי $S subset.eq RR^k$ קבוצה בעלת נפח ו־$f:S arrow.r RR$ פונקציה חסומה.

#subquestion()
נוכיח כי אם קבוצת נקודות האי־רציפות של $f$ ממידה אפס, אז $f$ אינטגרבילית על $S$.

#proof[
  מהיות $S$ בעלת נפח נובע כי $S$ חסומה ו־$partial S$.\
  ניקח תיבה $A subset.eq RR^k$ כך שמתקיים $S subset.eq A$, ניתן לעשות זאת מהיות $S$ חסומה ונגדיר $hat(f) : A arrow.r RR$ על־ידי
  $ hat(f) = mycases(f(x), x in S, 0, x in.not S) $
  ניזכר כי $hat(f)$ אינטגרבילית על $A$ אם ורק אם קבוצת נקודות האי־רציפות של $hat(f)$ על $A$ היא ממידה אפס.\
  נבחין כי מהבנייה שלנו, נקודות האי־רציפות של $hat(f)$ על $A$ יכולות לקרות או בתוך $S$, או על $partial S$, ולכן
  $ D_hat(f) subset.eq D_f union partial S $
  כאשר $D_hat(f), D_f$ אלו נקודות האי־רציפות של $hat(f)$ ו־$f$ על $A$ ו־$S$ בהתאמה.\
  נשים לב שמההנחה כפי שצויין קודם $partial S$ ממידה אפס ומההנחה כי קבוצת נקודות האי־רציפות של $f$ על $S$ היא ממידה אפס.\
  ראינו שאיחוד בן־מנייה של קבוצות ממידה אפס הוא קבוצה ממידה אפס ולכן $D_hat(f)$ היא קבוצה ממידה אפס, ולכן $hat(f)$ אינטגרבילית על $A$ ממשפט לבג.\
  נשים לב שמכך ש־$hat(f)(x) = f(x)$ לכל $x in S$ ו־$0$ אחרת, נובע שמתקיים
  $ integral_A hat(f)(x) d x = integral_S f(x) d x $
  ו־$f$ אינטגרבילית על $S$, כנדרש.
]

#subquestion()
נוכיח כי אם $f$ רציפה אז $f$ אינטגרבילית בנוסף על $S^circle.stroked.small$ ומתקיים
$ integral_S f(x) d x = integral_(S^circle.stroked.small) f(x) d x $

#proof[
  ראשית, כמובן אם $f$ פונקציה רציפה אז קבוצת נקודות האי־רציפות שלה היא הקבוצה הריקה שממידה אפס ולכן $f$ אינטגרבילית על $S$.\
  #todo
]

#subquestion()
נוכיח כי אם $S$ ממידה אפס ו־$f$ אינטגרבילית על $S$ אז מתקיים
$ integral_S f(x) d x =0 $

#proof[
  $S$ ממידה אפס ובעלת נפח ולכן לפי טענה שראינו בתרגול נובע כי $S$ מתכולה אפס ובמקרה זה מתקיים $(star) space V(S) = integral_S 1_S (x) d x = 0$.\
  $f$ אינטגרבילית על $S$ וחסומה (מהיותה בעלת נפח) ולכן קיימת $A subset.eq RR^k$ תיבה כך ש־$S subset.eq A$ ואם נרחיב את $f$ לפונקציה על $A$
  $ f_S (x) = mycases(f(x), x in S, 0, x in.not S) $
  כך שהאינטגרל $integral_A f_S (x) d x$ קיים וראינו שמתקיים $integral_S f(x) d x = integral_A f_S (x) d x$.\
  מספיק שנסתכל על האינטגרל העליון (כי הוא שווה לאינטגרל התחתון): מכך ש־$S$ ממידה אפס, אז לכל חלוקה $P$ של $A$, התרומה של $f$ בכל תיבה $R in P$ המקיימת $R inter S !=emptyset$, התרומה של כל חלוקה כזו הוא בעצם $0$:\
  $f$ אינטגרבילית ולכן חסומה אז $M = sup_(x in R) abs(f(x))$ ולכן התרומה שלו לסכומים עליונים חסומה על־ידי
  $ M dot.op vol(S) =_((star)) M dot.op 0 = 0 $
  אבל בכל $R in P$ כך שמתקיים $R inter S = emptyset$ התרומה היא $0$ מהגדרת $f_S (x)$, ולכן בסך־הכל נקבל
  $ integral_A f_S (x) d x = 0 => integral_S f(x) d x = 0 $
]

#question()
תהיי $f:[a,b] arrow.r RR$ פונקציה רציפה כך ש־$f>=0$.\
נסמן ב־$Gamma_f = {(x,f(x)) bar x in [a,b]} subset.eq RR^2$ את הגרף של $f$.\
נוכיח כי $Gamma_f$ בעלת נפח ומתקיים
$ V(Gamma_f) = integral_a^b f(x) d x $

#proof[
  $f$ רציפה ו־$[a,b]$ קבוצה סגורה וחסומה ולכן קומפקטית ופונקציה רציפה על קבוצה קומפקטית שולחת קבוצה קומפקטית לקבוצה קומפקטית ולכן $Gamma_f$ היא קבוצה קומפקטית.
  #todo
]

#question()
#todo

#question()
תהיי $f:(0, infinity)^2 arrow.r RR$ הפונקציה הנתונה על־ידי $f(x,y)=1 / (y+1)^2$.

#subquestion()
נראה שהפונקציה $f$ אינה אינטגרבילית על הקבוצה $A = {(x,y) in RR^2 bar x>0, x<y<2x }$.

#solution[
  $A$ פתוחה ולכן עלינו להגדיר סדרת מיצוי פתוחה של $A$.\
  נגדיר
  $ A_n = {(x,y) in RR^2 bar 1 / n<x<n, x+1 / n<y<2x-1 / n} $
  זאת סדרת מיצוי פתוחה של $A$, ומטענה שראינו ניתן לחשב את האינטגרל על $C_n = overline(A_n)$
  נחשב עם משפט פוביני:
  $
    integral_(A_n) f(x,y) d x d y = integral_(1 / n)^n (integral_(x+1 / n)^(2x-1 / n) 1 / (y+1)^2 d x) d y = integral_(1 / n)^(2n) (integral_(y / 2)^(y) 1 / (y+1)^2 d x) d y = integral_(1 / n)^(2n) [x / (y+1)^2]_(y=y / 2)^(x=y) d y \
    = integral_(1 / n)^(2n) y / (2(y+1)^2) d y = 1 / 2 integral_(1 / n)^(2n) y / (y+1)^2 d y =_(u=y+1 \ d u = d y \ y = u-1) 1 / 2 [ln (abs(y+1))+1 / (y+1)]^(y=2n)_(y=1 / n) \
    = 1 / 2 (ln(2n+1)+1 / (2n+1)-ln(1 / n+1)-1 / (1 / n+1)) = 1 / 2 (ln(n(2n+1) / (1+n)) + (1-2n^2) / (2n^2+3n+1)) arrow.r_(n arrow.r infinity) infinity
  $
]

#subquestion()
נראה שהפונקציה $f$ אינטגרבילית על הקבוצה $A = {(x,y) in RR^2 bar x>0, x^2<y<2x^2}$.

#solution[
  באותו אופן לסעיף הקודם נגדיר
  $ A_n $
  ונחשב
  $ integral_(A_n) f(x,y) d x d y = integral_(1 / n)^n (integral_(x^2+1 / n)^(2x^2-1 / n) 1 / (y+1)^2 d y) d x $
]
