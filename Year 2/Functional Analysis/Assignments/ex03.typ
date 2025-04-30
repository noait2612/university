#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 03 --- אנליזה פונקציוונלית, 80417 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהיו $a<b, c<d in RR$, $F : [a,b] times [c,d] arrow.r RR$ ליפשיצית עם קבוע $K$ ו־$(x_0, y_0) in (a,b) times (c,d)$.\
נוכיח שקיים $h>0$ ופונקציה גזירה $f: [x_0 -h, x_0 + h] arrow.r [c,d]$ כך ש־$f(x_0)=y_0$ וכן
$forall x in [x_0 -h, x_0+h] : f'(x) = F(x, f(x))$

#subquestion()
נגדיר סדרת פונקציות על־ידי $f_0(x) = y_0$ ו־$f_(n+1) (x) = y_0 + integral_(x_0)^(x) F(t, f_n (t)) d t$.
נוכיח שקיים $h>0$ כך ש־$f_n : [x_0 - h, x_0 + h] arrow.r [c,d]$ מוגדרת היטב ורציפה לכל $n$.
#proof[
  נוכיח באינדוקציה: יהי $epsilon > 0$, עבור $n=1$ נשים לב שמתקיים
  $
    f_1 (x) = y_0 + integral_(x_0)^x F(t, f_0 (t) ) d t =_((f_0 (x) = y_0)) y_0 + integral_(x_0)^x F(t, y_0 ) d t
  $
  $F$ היא $K$־ליפשיצית ולכן היא רציפה ולכן גם אינטגרבילית (ובפרט חסומה) ולכן $f_2 (x)$ לעיל מוגדרת היטב.\
  נראה שהיא גם רציפה, עבור כל $x in [x_0-h, x_0 + h]$, מתקיים
  $ abs(f_1 (x) - y_0 ) = abs(integral_(x_0)^x F(t, y_0) d t) <= M abs(x-x_0)<= M h $
  כאשר $M = sup_(t in [a,b]) abs(F(t, y_0))$ שקיים מהיות $F$ רציפה בקטע קומפקטי.\
  נבחר $h > 0$ קטן דיו כך שמתקיים
  $ M h <= epsilon = min(y_0 - c, d-y_0) $
  ולכן $f_1 (x)$ רציפה, מוגדרת היטב ותמונתה נמצאת ב־$[c,d]$ עבור $h$ קטן דיו.\
  כעת, נניח כי הטענה נכונה עבור $n>=1$ כלשהו, ונראה שנכון עבור $n+1$
  $ f_(n+1) (x) = y_0 + integral_(x_0)^x F(t, f_n (t)) d t $
  $f_n$ רציפה בקטע סגור ו־$F$ ולכן גם ההרכבה $t mapsto F(t, f_n (t))$ גם רציצפה על $[x_0-h, x_0+h]$.\
  כעת, $F$ רציפה וחסומה על הקבוצה הקומפקטית $[a,b] times [c,d]$ ומהרציפות נובע שקיים $ M> 0$ כך שמתקיים
  $ abs(F(t,y)) <= M forall (t,y) in [a,b] times [c,d] $
  ולכן גם עבור $x in [x_0-h, x_0 +h]$ ואז
  $ abs(f_(n+1) (x) - y_0) = abs(integral_(x_0)^x F(t, f_n (t)) d t) <= M abs(x-x_0) <= M h $
  היות ו־$y_0 in (c,d)$ קיים $epsilon > 0$ כך ש־$[y_0 - epsilon, y_0 + epsilon] subset [c,d]$ ולכן בבחירה של $h = epsilon/M$ נקבל
  $ abs(f_(n+1) (x) - y_0 )<= M h = epsilon $
  ולכן $f_(n+1) (x) in [c,d]$, וקיבלנו מעיקרון האינדוקציה שהטענה נכונה לכל $n in NN$.
]

#pagebreak()

#subquestion()
נוכיח שהסדרה ${f_n}_(n=1)^infinity$ חסומה במידה אחידה ורציפה במידה אחידה ולכן ממשפט ארצלה יש לה תת־סדרה ${f_n_k}_(k=1)^infinity$ מתכנסת במידה שווה.
#proof[
  בסעיף א' ראינו שכל פונקציה בסדרה חסומה על־ידי $h$ ולכן נשאר רק להראות רציפות במידה אחידה: \
  לכל $x,y in [x_0-h,x_0+h], n in NN$ מתקיים
  $
    abs(f_n (x) - f_n (y)) = abs(integral_(x_0)^(x) F(t, f_(n-1) (t)) d t - integral_(x_0)^y F(t, f_(n-1) (t)) d t) \
    = abs(integral_x^y F(t, f_(n-1) (t)) d t ) <= integral_x^y abs(F(t, f_(n-1) (t))) d t <= abs(x-y)
  $
  לכן עבור $epsilon > 0$ נוכל לבחור $delta = epsilon$ ונקבל $abs(f_n (x) - f_n (y)) < epsilon$ לכל $abs(x-y)<delta$ וקיבלנו רציפות במידה אחידה.\
  ממשפט ארצלה נובע שלכל סדרה בקבוצה ${f_n}$ יש תת־סדרה קושי, בפרט ${f_n_k}_(k=1)^infinity subset.eq {f_n}_(n=1)^infinity$ תת־סדרה קושי ומתכנסת במידה שווה.
]

#subquestion()
נוכיח שהסדרה ${F(x, f_n_k (x))}_(k=1)^infinity$ מתכנסת במידה שווה ונסיק ש־$f = lim_k f_n_k$ היא הפונקציה המבוקשת.
#proof[
  נניח ש־$f_n_k arrows.rr f$ עבור $f:[a,b] arrow.r [c,d]$ רציפה ונראה שהסדרה היא סדרת קושי
  $
    abs(F(x, f_n_k (x) - F(y, f_n_k (y)))) <= K sqrt((x-y)^2+(f_n_k (x) - f_n_k (y))^2) <= K abs(x-y)(1+1) = 2K abs(x-y)
  $
  ולכן לכל $epsilon > 0$ נבחר $delta = epsilon/(2K)$ וזו סדרת קושי. \
  נשים לב שגם מתקיים $f_n_k arrows.rr f$ ולכן נובע ש־$f'_n_k arrows.rr f'$ ולכן $f$ רציפה וגזירה ומקיימת $f(x_0) = y_0$ מתכנסת נקודתית של הסדרה הקבועה $f_n (x_0) = y_0$.\
  כמו כן, $F$ רציפה ולכן $f_n_k arrows.rr F(x, f(x))$ וקיבלנו ש־$f$ מקיימת את כל התנאים למשפט הקיום של פאנו.
]

#question()
תהיי ${f_n}_(n=1)^infinity subset.eq C^1[0,1]$ סדרת פונקציות ונניח שקיים קטע $[a,b] subset.eq [0,1]$ ושקיימת סדרה ${M_n}_(n=1)^infinity$ ששואפת לאינסוף, כך שלכל $n$ ולכן $x in [a,b]$ מתקיים $f'_n (x) >= M_n$.\
נוכיח שהסדרה ${f_n}_(n=1)^infinity$ לא רציפה במידה אחידה.
#proof[
  אם הסדרה ${f_n}_(n=1)^infinity$ לא רציפה במידה אחידה, זה אומר
  $
    exists epsilon_0 > 0 space forall delta > 0 space exists x, x_0 in [0,1], space abs(x_0-x) < delta space abs(f(x_0)-f(x))>= epsilon_0
  $
  יהי $epsilon_ 0 =1/2$ ותהיי $delta > 0$.\
  מהיות $M_n stretch(arrow.r)_(n arrow.r infinity) infinity$, נובע שקיים $n in NN$ כך שמתקיים
  $ M_n > 1 / delta <==> delta > 1 / M_n $
  נקבע $n in NN$ כנ"ל, ויהיו $x, y in [a,b]$ כך שמתקיים $abs(x-y) = 1/M_n < delta$.\
  מהיות ${f_n}_(n=1)^infinity in C^1[0,1]$ ולכן נוכל להשתמש במשפט ערך הממוצע של לגראנז', ולקבל $ f_n (x) - f_n (y)= f'_n (z) (x-y) $
  עבור $z in (x,y)$.\
  מהנתון, $f'_n (x) >= M_n$ לכל $n$ ולכל $x in [a,b]$ ולכן בפרט מתקיים
  $ abs(f_n (x) - f_n (y)) = abs(f'_n (z)) abs(x-y) >= M_n abs(x-y) = M_n dot.op 1 / M_n = 1 $
  ובפרט מתקיים
  $ abs(f_n (x) - f_n (y)) >= 1 >=1 / 2 = epsilon_0 $
  נבין איך זה מסתדר עם מה שראינו בתרגול 3 דוגמה 1. ניזכר בסדרת הפונקציות הנגזרת המדוברת (נסמן ב־$g'_n$ כדי להבדיל)
  $ g'_n (x)= mycases(0, x<=1-1/n, n^(3/2)(x-1+1/n), x>1-1/n) $
  נשים לב שבמקרה שלנו $f'_n (x)$ מתבדרת בתחום סופי, בעוד $g'_n (x)$ מתבדרת לאינסוף בקטע שהולך וקטן ולכן גם לא קיימת לה סדרה ${K_n}_(n=1)^infinity$ מתאימה המתבדרת לאינסוף, ובפרט לא נוכל להגדיר $delta$ כפי שהגדרנו, משמע הטענה לא נכונה עבור $g'_n (x)$ מהתרגול.
]

#question()
תהיי ${f_n}_(n=1)^infinity subset.eq C(RR)$ סדרה המוגדרת על־ידי
$f_n (x) = 1 / ((x-n)^2+1)$

#subquestion()
נוכיח שהסדרה חסומה במידה אחידה, רציפה במידה אחידה ומתכנסת נקודתית לפונקצית האפס.
#proof[
  נשים לב שמתקיים לכל $n in NN, x in RR$ מתקיים $(x-n)^2+1>=1$ ולכן ${f_n}_(n=1)^infinity <=1$ משמע חסומה במידה אחידה.\
  עבור רציפות במידה אחידה, נשים לב שמתקיים $ f'_n (x) = (-2(x-n))/((x-n)^2+1)^2 $
  נסמן $y = x-n$ ולכן $f'_n (x) = g(y) = (-2y)/(y^2+1)^2$ זה פולינום ולכן חלק, אז מכלל השרשרת $g'(y)=(-2(-3y^2+1))/(y^2+1)^3$.\
  נבחן מתי הנגזרת מתאפסת: המכנה לא מתאפס לאף $y in RR$ ולכן מתאפס רק כאשר
  $ 6y^2-2 = 0 <==> y^2 = 1 / 3 <==> y = plus.minus 1 / sqrt(3) $
  ומתקיים
  $
    g(1 / sqrt(3)) = (-2 / sqrt(3)) / (1 / sqrt(3)^2+1)^2 = (-2 / sqrt(3)) / (16 / 9) = -18 / (16 sqrt(3)) = -9 / (8 sqrt(3)) = -(sqrt(3) / 2)^3 \
    g(-1 / sqrt(3)) = (sqrt(3) / 2)^3
  $
  זו נקודה מסוג מקסימום, כי $g'(-1/sqrt(3))>0 $ שכן כל המחוברים חיוביים.\
  אז נקבל $abs(g(y))<=(sqrt(3) / 2)^3$ ובפרט $display(lim_(y arrow.r plus.minus infinity) g(y) = 0)$ משמע מצאנו $abs(f'_n (x))<=(sqrt(3) / 2)^3$.\
  לפי טענה שראינו בהרצאה נובע ש־${f_n}_(n=1)^infinity$ חסומה במידה אחידה וגם רציפה במידה אחידה.\
  עבור התכנסות נקודתית, נקבע $x in RR$ ונשים לב שמתקיים $(x-n)^2 stretch(arrow.r)_(n arrow.r infinity) infinity$ ולכן $f_n (x) stretch(arrow.r)_(n arrow.r infinity) 0$ משמע ${f_n}_(n=1)^infinity$ מתכנסת נקודתית ל־0.
]

#subquestion()
נראה שהסדרה לא מתכנסת במידה שווה לפונקציית האפס.
#proof[
  לו הייתה ${f_n}_(n=1)^infinity$ הייתה מתכנסת במידה שווה לפונקציית האפס, היה מתקיים מההגדרה האלטרנטיבית להתכנסות במידה שווה
  $ lim_(n arrow.r infinity) sup_(x in RR) abs(f_n (x) - 0) = 0 $
  ונשים לב;
  $
    sup_(x in RR) f_n (x) = sup_(x in RR) 1 / ((x-n)^2+1)
  $
  והסופרמום מתקבל כאשר המכנה מקסימלי, משמע כאשר $x=n$ ואז מתקיים $ sup_(x in RR) f_n (x) = 1 $
  וזו כמובן סתירה.
]

#question()
יהי $P subset.eq C[0,1]$ מרחב הפולינומים המוגדרים על הקטע $[0,1]$ עם הנורמה $norm(dot.op)_infinity$, זהו מרחב נורמי.\
נוכיח ש־$P$ אינו מרחב שלם ולכן אינו מרחב בנך.
#proof[
  נוכיח שקיימת סדרת פולינומים ${p_n}_(n=1)^infinity in P$ כך ש־${p_n}_(n=1)^infinity$ מתכנסת במידה שווה לפונקציה $f in C[0,1]$ אבל $f$ אינה פולינום.\
  נגדיר
  $ p_n (x) = sum_(i=0)^n x^i / i! $
  נשים לב שזהו פיתוח טיילור של $exp$ וכן $p_n arrow.r exp$ בהתכנסות נקודתית, ולכן לפי טענה מהתרגול נובע גם $p_n arrows.rr exp$, אבל $exp in.not P$ שכן לכל $p in P$ מתקיים $display(lim_(x arrow.r infinity) e^x/(p(x)) = infinity)$
]

