#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 09 --- אנליזה פונקציונלית, 80417 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#let span = math.op("Span")

#question()
יהי $x_0 in [-pi, pi]$ ותהיינה $f, g : RR arrow.r RR$ פונקציות אינטגרביליות רימן בקטע $[-pi, pi]$, מחזוריות עם מחזור $2pi$ כך ש־$f eq.triple g$ בסביבה של $x_0$.\
נסמן ב־$S_N^f, S_N^g$ את סכום פוריה ה־$N$ של $f,g$ בהתאמה.\
נוכיח ש־$lim_N S_N^f (x_0)$ קיים אם ורק אם $lim_N S_N^g (x_0)$ קיים ושאם הם קיימים אז הם שווים.

#proof[
  בלי הגבלת הכלליות נניח ש־$lim_(N arrow.r infinity) S_N^f = L_f$ (נשים לב כי המקרים סימטריים ולכן מספיק להסתכל על המקרה הזה).\
  נגדיר $h = f-g$ ונשים לב ש־$h eq.triple 0$ בסביבת $x_0$ מהנתון וכן $lim_(x arrow.r x_0) = 0$.\
  נשים לב שגם עבור $u in (0, delta)$ עבור $delta>0$
  $ abs(h(x_0+u)-h(x_0)) = 0 <=u $
  ולכן תנאי ליפשיץ מתקיים וממשפט התכנסות נקודתית של טורי פורייה מתקיים
  $ lim_(N arrow.r infinity) S_N^f (x_0) = 1 / 2(f(x_0+0)+f(x_0-0)) = h(x_0) = 0 $
  ממה שראינו בהרצאה מתקיים גם $S_N^h = S_N^(f-g) = S_N^f-S_N^g$ ולכן מתקיים
  $ lim_(N arrow.r infinity) S_N^(f-g) (x_0) = lim_(N arrow.r infinity) S_N^f (x_0)-S_N^g (x_0) = 0 $
  ומההנחה $lim_(N arrow.r infinity) S_N^f = L_f$ נובע שמתקיים $lim_(N arrow.r infinity) S_N^g = L_f$.
]

#question()
נגדיר את גרעין דירכלה $D_N (u) = (sin((N+1 / 2)u)) / (2sin(u / 2))$ ונוכיח שקיים קבוע $C>0$ כך שלכל $N>1$ מתקיים
$ integral_(-pi)^pi abs(D_N (u)) d u >= C ln(N-1) $

#proof[
  ראשית, בהרצאה ראינו שמתקיים $D_N (-x) = D_N (x)$ ולכן אינטגרל על קטע סימטרי של פונקציה זוגית מקיים
  $
    integral_(-pi)^pi abs(D_N (u)) d u = 2 integral_(0)^pi abs(D_N (u)) d u = 2 integral_0^pi abs((sin((N+1 / 2)u)) / (2sin(u / 2))) d u = integral_0^pi abs((sin((N+1 / 2)u)) / (sin(u / 2))) d u \
    >=_(forall x >=0, sin(x) <=x) integral_0^pi abs(sin((N+1 / 2)u)) / (u / 2) d u = 2 integral_0^pi abs(sin((N+1 / 2)u)) / (u) d u
    \ =_( u-> s = (N+1 / 2)u) 2 integral_0^((N+1 / 2)pi) abs(sin(s)) / s d s >= 2 integral_0^(N pi) abs(sin(s)) / s d s = 2 sum_(j=0)^(N-1) integral_(j pi)^((j+1)pi) abs(sin(s)) / s d s \
    >= 2 / pi sum_(j=0)^(N-1) 1 / (j+1) integral_(j pi)^((j+1)pi) abs(sin(s)) d s >= 2 / pi sum_(j=0)^(N-1) 1 / (j+1) abs(integral_(j pi)^((j+1)pi) sin(s) d s) = 4 / pi sum_(j=1)^n 1 / j >= 4 / pi ln(n)
  $
  כאשר המעברים נובעים מהרמז, אינטגרציה בחלקים וחסימה של האינטגרל $abs(sin(x)) / x$.
]

#question()
עבור $x in RR$ נסמן $e^(i x) = cos(x)+i sin(x)$ כאשר $i = sqrt(-1)$.

#subquestion()
נוכיח ש־$cal(A) = span {e^(i n x)}_(n in ZZ)$ היא אלגברה ב־$C([-pi, pi], CC)$ שלא מתאפסת, מפרידה נקודות (פרט ל־$plus.minus pi$) וסגורה להצמדה.\
נסיק בעזרת הגרסה המרוכבת של משפט סטון־ויירשטראס ש־$cal(A)$ צפופה ב־$accent(C, tilde)([-pi,pi], CC)$ בנורמה $norm(dot.op)_infinity$.

#proof[
  עלינו להראות כמה דברים:
  + $cal(A)$ היא אלגברה ב־$C([-pi, pi], CC)$, עלינו להראות שלושה דברים: סגירות לחיבור, כפל וסקלר.\
    + עבור חיבור מתקיים (באופן די טריוויאלי)
      $ e^(i n x) + e^(i m x) in span {e^(i n x)}_(n in ZZ) $
    + עבור כפל מתקיים מחוקי חזקות
      $ e^(i n x) dot.op e^(i m x)=e^(i(n+m)x) =_(ZZ in.rev k=n+m) e^(i k x) in span {e^(i n x)}_(n in ZZ) $
    + עבור כפל בסקלר זה נובע ישירות מהגדרת $span$, בדומה לחיבור
  + לא מתאפסת: נבחר $f(x)=1$ עבור $n=0$.\
  + מפרידה נקודות: נסתכל על $f(x)=e^(i x)$ עבור $n=1$ ונטען שהיא מפרידה נקודות: $f$ היא על והיא גם חד־חד ערכית לכל $x!=plus.minus pi$ כי $f(pi)=f(-pi)=-1$ ולכן עומדת בהגדרה.\
  + סגירות להצמדה
  $
    overline(e^(i n x)) = cos(n x) + overline(i sin(n x)) = cos(n x) - i sin (n x) =_(sin(-x)=-sin(x) \
    cos(-x)=cos(x)) cos(-n x) + i sin(-n x) = e^(-i n x) in span {e^(i n x)}_(n in ZZ)
  $
  נסמן $K=[-pi,pi]$ וכמובן ש־$K$ קומפקטי כקטע חסום וסגור ב־$RR$ ולכן כל תנאי משפט סטון־ויירשטראס המרוכב שראינו בתרגול מתקיימים ולכן $cal(A)$ צפופה ב־$accent(C, tilde)([-pi, pi], CC)$.
]

#subquestion()
נסיק שהקבוצה ${e^(i n x)}_(n in ZZ)$ היא מערכת אורתוגונלית שלמה ב־$accent(C, tilde)([-pi, pi], CC)$ ביחס למכפלה הפנימית $angle.l f,g angle.r = integral_(-pi)^pi overline(f)(x)g(x) d x$.

#proof[
  נשים לב שלכל $n,m$ מתקיים
  $
    angle.l e^(i n x), e^(i m x) angle.r =integral_(-pi)^pi overline(e^(i n x)) e^(i m x) d x = integral_(-pi)^pi e^(-i n x) e^(i m x) d x = integral_(-pi)^pi e^(i (m-n) x) d x \
    = integral_(-pi)^pi cos((m-n)x) + i sin((m-n)x)d x = integral_(-pi)^pi cos((m-n)x) d x + integral_(-pi)^pi i sin((m-n)x)d x =_(cos(pi)=cos(-pi) \
    sin(pi)=sin(-pi)) 0+0=0
  $
  לכן זו מערכת אורתוגונלית (ובפרט אורתונורמלית כי $abs(e^(i n x)^2)=1$ לכל $n in NN$ כי $abs(e^(i theta))=sqrt(cos^2(theta)+sin^2(theta)))$), ונטען שהיא גם מערכת שלמה לפי התנאים השקולים לשלמות שראינו בהרצאה.
]

#subquestion()
עבור $f in C([-pi, pi], CC)$ נגדיר לכל $n in ZZ$ את מקדם פוריה של $f$ ביחס למערכת ${e^(i n x)}_(n in ZZ)$ על־ידי $c_n = 1 / (2pi) integral_(-pi)^pi f(x)e^(-i n x)d x$ ונסיק שאם $f$ ממשית אז מתקיים
$
  a_0 / 2 = c_0 \
  forall n > 0 : a_n = c_n + c_(-n) \
  forall n> 0: b_n = i(c_n - c_(-n))
$
כאשר ${a_n}_(n=1)^infinity, {b_n}_(n=1)^infinity$ מקדמי טור פורייה הרגילים של $f$.

#proof[
  ראשית, מהנתון נבנה גם את $c_(-n)$
  $ c_(-n) = 1 / (2pi) integral_(-pi)^pi f(x)e^(-i (-n) x)d x = 1 / (2pi) integral_(-pi)^pi f(x)e^(i n x)d x $
  נחשב מהגדרה ועם היות הפונקציות $sin(x), cos(x)$ אי־זוגית וזוגית בהתאמה
  $
    a_n &= 1 / pi integral_(-pi)^pi f(x)cos(n x) d x \
    &= 1 / (2pi) integral_(-pi)^pi 2f(x)cos(n x) d x \
    &= 1 / (2pi) integral_(-pi)^pi f(x)cos(n x)+i f(x) sin(n x) - i f(x) sin(n x)+f(x)cos(n x) d x \
    &= 1 / (2pi) integral_(-pi)^pi f(x)cos(n x)+i f(x) sin(n x) + i f(x) sin(-n x)+f(x)cos(-n x) d x \
    &= 1 / (2pi)( integral_(-pi)^pi f(x)cos(n x)+i f(x) sin(n x) d x + integral_(-pi)^pi i f(x) sin(-n x)+f(x)cos(-n x) d x) \
    &= c_(-n) + c_n = c_n + c_(-n)
  $
  ונשים לב
  $ a_0 = c_0 + c_0 => a_0 / 2 = c_0 $
  באותו אופן נחשב גם
  $
    b_n &= 1 / pi integral_(-pi)^pi f(x)sin(n x) d x \
    &= 1 / (2pi) integral_(-pi)^pi 2f(x)sin(n x) d x\
    &= 1 / (2pi) i integral_(-pi)^pi i 2f(x)sin(-n x) + f(x)cos(n x) - f(x) cos(n x) d x \
    &= 1 / 2pi i integral_(-pi)^pi i f(x)sin(n x)+ f(x)cos(n x) - i f(x)sin(-n x) - f(x)cos(-n x) d x \
    &= i(c_n - c_(-n))
  $
]
