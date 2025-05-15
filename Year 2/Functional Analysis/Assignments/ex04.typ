#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 04 --- אנליזה פונקציונלית, 80417 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נוכיח שהמשפחה
$ cal(F) colon.eq {g_(a_0, ..., a_n) bar n in NN, a_0, ..., a_n in QQ} $
צפופה ב־$C[0,1]$ בנורמת $sup$.
#proof[
  נגדיר $p(x) = sum_(i=0)^n a_i x^i in RR[x]$ ויהי $epsilon > 0$.\
  מצפיפות $QQ$ ב־$RR$ שנובע שלכל $a_i in RR$ קיימים $n in NN, q_i in QQ$ כך שיתקיים
  $ abs(a_i - q_i) < epsilon / (2(n+1)) $
  ונגדיר
  $ q(x) = sum_(i=0)^n q_i x^i $
  ולכן
  $
    abs(p(x)-q(x)) = abs(sum_(i=0)^n (a_i - q_i) x^i) <= sum_(i=0)^n abs(a_i - q_i) abs(x^i) <=_(x in [0,1]) sum_(i=0)^n epsilon / (2(n+1)) = epsilon / 2
  $
  ולכן $norm(p(x)-q(x))_infinity < epsilon / 2$ ו־$q in cal(F)$.\
  $f in C[0,1]$ ולכן ממשפט הקירוב של ויירשטראס קיים $p in RR[x]$ כך שמתקיים
  $ norm(f-p)_infinity < epsilon / 2 $
  אבל ראינו שאפשר לקרב את $p$ בעזרת $q$ ולכן
  $ norm(f-q)_infinity <= norm(f-p)_infinity + norm(p-q)_infinity < epsilon / 2 + epsilon / 2 = epsilon $
  מצאנו שלכל $f in C[0,1]$ ולכל $epsilon > 0$ קיימת $q in cal(F)$ כך ש־$norm(f-q)_infinity < epsilon$ ולכן $cal(F)$ צפופה ב־$C[0,1]$ עם נורמת $sup$.
]

#question()
נניח ש־$f : [a,b] arrow.r RR$ אינטגרבילית רימן. נראה כי קיימים פולינומים $p_n$ כך ש־$display(lim_(n arrow.r infinity) integral_a^b abs(f(x)-p_n (x))^2 d x = 0)$.
#proof[
  יהי $epsilon > 0$, $f$ אינטגרבילית רימן ולכן קיימת חלוקה $P = {x_0, ..., x_n}$ כך ש־$U(f,P)-L(f,P) < epsilon$ וגם
  $ s(x) = f(t_i) space x in [x_(i-1), x_i), t_i in [x_(i-1), x_i]] $
  כך ש־$s$ היא פונקציית מדרגות, מאי־רגישות האינטגרל למספר סופי של שינויים נקבל
  $
    integral_a^b abs((f(x)-s(x)))^2 d x= integral_a^b (f(x)-s(x))^2 d x= sum_(i=0)^n integral_(x_(i-1))^x_i (f(x) - f(t_i)) d x< epsilon / 2
  $
  עכשיו, $s$ רציפה למעט בשתי נקודות הקצה בכל מקטע, ואת נקודות הקצה ניתן להרחיב על־ידי ישר שיחבר בין שני מקטעים שונים ונקבל פונקציה שהיא לינארית למקוטעין $g$ ובהכרח רציפה ועל־כן ממשפט הקירוב של ויירשטראס קיימת סדרת פולינומים ${p_n}_(n=1)^infinity$ כך ש־$p_n arrows g$ בקטע, כך שמתקיים $abs(s(x)-p_n (x)) < epsilon / 4$ לכל $n in NN$ ו־$x in [a,b]$, ולכן
  $ integral_a^b abs((f(x)-p_n (x)))^2 d x < integral_a^b epsilon / 4 d x = epsilon / 4 $
  כלומר מצאנו שקיים $N in NN$ כך שלכל $n > N$ מתקיים
  $
    integral_a^b abs(f(x)-p_n (x))^2 d x \
    = integral_a^b abs(f(x)-s(x)+s(x)-g(x)+g(x)-p_n (x))^2 d x \
    <= integral_a^b abs(f(x)-s(x))^2 d x + integral_a^b abs(s(x)-g(x))^2 d x + integral_a^b abs(g(x)-p_n (x))^2 d x
    < epsilon / 2 + epsilon / 4 + epsilon / 4 = epsilon
  $
  ומהגדרה זה אומר שמתקיים
  $ lim_(n arrow.r infinity) integral_a^b abs(f(x)-p_n (x))^2 d x = 0 $
]

#question()
נוכיח שאם $f in C[a,b]$ אז מתקיים
$ lim_(x arrow.r infinity) integral_a^b f(t) sin(x t) d t = 0 $
#proof[
  ראשית, $f(t) sin(x t)$ היא פונקציה רציפה כמכפלה של פונקציות רציפות ולכן ממשפט הקירוב של ויירשטראס נובע שלכל $epsilon > 0$ קיים פולינום $p$ כך ש־$norm(f-p)_infinity < epsilon$ $(star)$.\
  נגדיר
  $
    (star star) space I(x) = integral_a^b f(t) sin(x t) d t = integral_a^b p(t) sin(x t) d t + integral_a^b (f(t) - p(t)) sin(x t) d t
  $
  נראה באינדוקציה על מעלת הפולינום שמתקיים
  $ lim_(x arrow.r infinity) integral_a^b f(t) sin(x t) d t = 0 $
  בסיס האינדוקציה: עבור פולינום $p(t)$ ממעלה $1$ (בלי הגבלת הכלליות $p(t) = t$ פולינום ממעלה $1$, הסקלר לא משנה כי הוא יוצא באינטגרל בכל מקרה והמכפלה היא פונקציה רציפה ועל־כן אינטגרבלית)
  $
    I_p (x) = integral_a^b t sin(x t) d t =_(x!=0) [sin(x t) / x^2 - (t cos(x t)) / x]_a^b = sin(x b) / x^2 - (b cos(b x)) / x - sin(x a) / x^2 + (a cos(a x)) / x
  $
  אבל $abs(sin(x t)) <=1, abs(cos(a x)) <=1$ ולכן
  $ abs(I_p (x)) <= 1 / x^2 - abs(b) / x - 1 / x^2 + abs(a) / x = (abs(a)-abs(b)) / x arrow.r_(x arrow.r infinity) 0 $
  נניח כעת שהטענה נכונה עבור פולינום מדרגה $n-1$ ונראה עבור $p(t)$ מדרגה $n$, באמצעות אינטגרציה בחלקים נסמן $u(t) = p(t), d v = sin(x t) d t$ ולכן $d u = p'(t), v = (-cos(x t)) / x$ ונקבל
  $ I(x) = integral_a^b p(t) sin(x t) d t = [(-p(t) cos(x t)) / x]_a^b +1 / x integral_a^b p'(t) cos(x t) d t $
  מהנחת האינדוקציה נובע שהאינטגרל $1 / x integral_a^b p'(t) cos(x t) d t$ קיים ומתקיים $1 / x integral_a^b p'(t) cos(x t) d t arrow.r_(x arrow.r infinity) 0$, ומתקיים גם
  $
    [abs((-p(t) cos(x t)) / x)]_a^b = abs((-p(b) cos(b t) - p(a) cos(a t)) / x) <= abs((-(p(b) + p(a))) / x) <=_("פולינומים רציפים ולכן חסומים") abs(M / x) arrow.r_(x arrow.r infinity) 0
  $
  ולכן
  $lim_(x arrow.r infinity) I_p (x) = 0$
  והטענה נכונה עבור פולינומים, נחזור ל־$(star star)$ ונקבל
  $
    abs(I(x)) <= underbrace(abs(integral_a^b p(t) sin(x t) d t), arrow.r_(x arrow.r infinity) 0) + abs(integral_a^b (f(t) - p(t)) sin(x t) d t)
  $
  עבור הביטוי השני בסכום, מהיות $abs(sin (x t)) <=1$ נקבל
  $ abs(integral_a^b (f(t) - p(t)) sin(x t) d t) <= integral_a^b abs(f(t) - p(t)) d t <_((star)) epsilon (b-a) $
  ובסך־הכל קיבלנו שמתקיים
  $ lim_(x arrow.r infinity) integral_a^b f(t) sin(x t) d t = 0 $
]

#question()
#subquestion()
נוכיח שאם $f : [a.b] arrow.r RR$ אינה פולינום ו־${p_n}_(n=1)^infinity$ סדרת פולינומים שמתכנסת ל־$f$ במידה שווה ב־$[a,b]$ אז $deg(p_n) stretch(arrow.r)_(n arrow.r infinity) infinity$.
#proof[
  נניח בשלילה ש־$deg(p_n) = M in RR$.\
  בפרט, זה אומר שנוכל לבחור תת־סדרה ${p_n_k}_(k=1)^infinity$ המקיימת לכל $k in NN$ ש־$deg(p_n_k) < M$.\
  מכך ש־${p_n}_(n=1)^infinity arrows f$ ב־$[a,b]$ נובע שלכל $epsilon > 0$ קיים $N in NN$ כך שלכל $n > N$ ולכל $x in [a,b]$ מתקיים
  $ abs(f(x) - p_n (x)) < epsilon $
  בפרט, מהיות ${p_n_k}$ תת־סדרה של סדרה מתכנסת נובע שגם לכל $k in NN$ כך ש־$n_k > N$ מתקיים
  $ abs(f(x) - p_n_k (x)) < epsilon $
  כעת, ${p_n_k}$ מגדירה מרחב נורמי ממימד סופי ולכן זה מרחב שלם אז כל סדרת קושי בו מתכנסת וגבולה בתוך המרחב בכל הנורמות – בפרט בנורמת $sup$. \
  בנוסף, כל סדרה מתכנסת היא גם סדרת קושי ולכן ${p_n_k}$ סדרת קושי שמתכנסת לגבול במרחב הפולינומים שדרגתם קטנה ממש מ־$M$, אבל ${p_n_k} arrows f$ והנחנו ש־$f$ היא לא פולינום, וזאת סתירה.
]

#subquestion()
נגדיר $f : RR arrow.r RR$ על־ידי $f(x) = 1 / (1+x^2)$.\
נשתכנע ש־$f$ היא אנליטית ונוכיח שסדרת פולינומי טיילור של $f$ לא מתכנסת במידה שווה לפונקציה $f$ בקטע $[-1,1]$ כאשר הפיתוח הוא סביב $x_0 = 0$ (ולכן זה גם נכון לכל קטע שמכיל את $[-1,1]$ וגם אם הפיתוח לא סביב $0$).
#proof[
  נגדיר $g(x) 1 / (1+x)$ המוגדרת ב־$RR without {-1}$ ואז $f(x) = g compose x^2 = g(x^2)$ ומהמשפט אודות הרכבת פונקציות ופולינומי טיילור נקבל
  $ p_(n, f, x_0) (x) = sum_(i=0)^n (-1)^i x^(2i) $
  פיתוח טיילור של $f$ לסדר $2n$, שמתכנס כטור אינסופי אם ורק אם $abs(-x^2)<1$, משמע $x in (-1,1)$ אבל זה גם מה שמעיד לנו שהפונקציה הנ"ל אנליטית.\
  נניח בשלילה שסדרת פולינומי טיילור של $f$ מתכנסות במידה שווה ל־$f$ בקטע $[-1,1]$ ולכן הסדרה מתכנסת נקודתית ולאותו גבול בקטע $[-1,1]$,
  נשים לב שבגלל החזקה מספיק שנבדוק עבור $x=1$:
  $ p_(n, f, x_0) (1) = sum_(i=0)^n (-1)^i = mycases(1, i mod 2 = 0, 0, i mod 2 = 1) $
  וגם מתקיים
  $ abs(p_(n, f, x_0) (1) - f(1)) = 1 / 2 $
  אבל בבחירה של $epsilon = 1 / 4$ נקבל שלכל $N in NN$ קיים $N<n in NN$ כך שמתקיים $abs(p_(n, f, x_0) (1) - f(1)) > epsilon$ וזו סתירה, ולכן סדרת פולינומי טיילור של $f$ לא מתכנסת במידה שווה ל־$f$ בקטע $[-1,1]$.
]
#pagebreak()

#subquestion()
נוכיח שאת הפונקציה $f(x)=e^x$ לא ניתן לקרב במידה שווה בעזרת פולינומים (לאו דווקא פולינומי טיילור) על כל הישר.
#proof[
  נניח בשלילה שאפשר לקרב את $f(x)$ במידה שווה בעזרת פולינומים ולכן קיימת סדרת פולינומים ${p_n}_(n=1)^infinity$ כך שמתקיים
  $ norm(e^x-p_n (x))_infinity arrow.r_(x arrow.r infinity) 0 $
  ולכן לכל $epsilon>0$ קיים $N in NN$ כך שלכל $n>N$ מתקיים
  $ forall x in RR, space abs(e^x-p_n (x)) < epsilon $
  ולכן נגדיר
  $ f_n (x) = e^x - p_n (x) => abs(f_n (x)) <= epsilon $
  אבל $e_x arrow.r_(x arrow.r infinity) = infinity$ ו־$e^x$ גדל מהר יותר מכל פולינום (ראינו כבר באינפי2, אפשר עם לופיטל כמה פעמים או עם אינדוקציה על מעלה שלמה ואז עם זה שלכל $b in RR$ מתקיים $b<= ceil(b)$ ואז בפרט זה נשאר בין גבולות ומהאינדוקציה על הטבעיים נקבל את הטענה).\
  ולכן בפרט יתקיים $lim_(x arrow.r infinity) f_n (x) = lim_(x arrow.r infinity) (e^x - p_n (x)) = infinity$ וזאת סתירה להנחה ולכן לא ניתן לקרב במידה שווה את $f(x)$ בעזרת פולינומים.
]

#subquestion()
נוכיח שאם $f: RR arrow.r RR$ חסומה ולא קבועה אז לא ניתן לקרב אותה במידה שווה בעזרת פולינומים על כל הישר.
#proof[
  נניח ש־$f$ היא פולינום (לא קבוע) ולכן $lim_(x arrow.r infinity) abs(f(x)) = infinity$, בסתירה לחסימות (בפרט, כל פולינום ממעלה של לפחות $1$ שאינו קבוע הוא לא חסום ב־$RR$). \
  יהי $epsilon > 0$, נניח אז ש־$p_n arrows f$ עבור ${p_n}_(n=1)^infinity$ סדרת פולינומים כך שאפשר לקרב את $f$ על כל הישר ואז
  $ norm(f(x) - p_n (x))_infinity < epsilon $
  מאי־שיוויון המשולש ההפוך נקבל
  $ abs(p_n (x)) - abs(f(x)) <= abs(f(x) - p_n (x))< epsilon $
  ולכן מהיות $f(x)$ חסומה קיים $M in RR$ כך שלכל $x in RR$ מתקיים $f(x)<=M$, ואז
  $ abs(p_n (x)) < epsilon + abs(f(x)) < epsilon + M $
  אבל מהמקרה הפרטי שראינו לעיל נובע שאם פולינום חסום הוא פולינום קבוע ומסעיף א' נקבל שגם $f$ היא פולינום קבוע, אבל $f$ לא קבועה ולכן זו סתירה.
]
