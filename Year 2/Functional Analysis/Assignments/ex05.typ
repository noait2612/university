#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 05 --- אנליזה פונקציונלית, 80417 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695

#let span = math.op("Span")
#let lip = math.op("Lip")

#question()
יהי $T : C[0,1] arrow.r RR$ פונקציונל לינארי רציף ונניח שלכל $k in NN union {0}$ מתקיים $T(x^k)=1 / (k+1)$.\
נוכיח שלכל $f in C[0,1]$ מתקיים
$ T(f) = integral_0^1 f(x)d x $
#proof[
  נוכיח בהתחלה את הטענה עבור פולינומים ולאחר מכן נוכיח אותה עבור פונקציה $f in C[0,1]$ באמצעות משפט הקירוב של ויירשטראס.\
  יהי $p in C[0,1]$ פולינום ולכן הוא מהצורה $p = sum_(i=0)^n a_i x^i$ מתקיים:
  $ T(p) = T(sum_(i=0)^n a_i x^i) =_("פונקציונל לינארי" T) = sum_(i=0)^n a_i T(a^i)= sum_(i=0)^n = a_i / (i+1) $
  מצד שני, מתקיים
  $
    T(p) = integral_0^1 sum_(i=0)^n a_i x^i = sum_(i=0)^n a_i integral_0^1 x^i = sum_(i=0)^n a_i dot.op [(x^(i+1)) / (i+1)]_0^1= sum_(i=0)^n a_i / (i+1) = T(p)
  $
  אז הטענה נכונה עבור פולינומים. יהי $f in C[0,1]$, ממשפט הקירוב של ויירשטראס לכל $epsilon > 0$ קיימת סדרת פולינומים ${p_n}_(n=1)^infinity$ קיים $N in NN$ כך שלכל $N < n in NN$ ולכל $x in [0,1]$ מתקיים
  $ abs(f(x)-p_n (x)) < epsilon / 2 $
  כעת, $T$ פונקציונל לינארי ולכן הוא חסום, משמע לכל $g in C[0,1]$ קיים $M > 0$ כך שיתקיים
  $ abs(T(g))<= M norm(g)_infinity =>_("רציפה" (f - p_n)) abs(T-p_n) <= M norm(f - p_n)_infinity $
  אבל קיים $N' in NN$ כך שלכל $N' < n in NN$ מתקיים
  $ norm(f-p_n)_infinity < epsilon / (2M) => abs(T - p_n) <= M epsilon / (2M) = epsilon / 2 $
  נבחר $N_max = max {N, N'}$ ולכל $N_max < n in NN$ מתקיים
  $ abs(f(x)-p_n (x)) < epsilon, space abs(T(f-p_n)) < epsilon $
  ולכן מתקיים
  $
    abs(T(f) - integral_0^1 f(x) d x) = abs(T(f) - T(p_n) + T(p_n) - integral_0^1 f(x) d x) = abs(T(f) - T(p_n) - integral_0^1 p_n (x) d x - integral_0^1 f(x) d x) \
    = abs(T(f) - T(p_n) + integral_0^1 (p_n (x) - f(x)) d x)<= abs(T(f) - T(p_n)) + integral_0^1 abs(p_n (x) - f(x)) d x
    \ =_("פונקציונל לינארי" T) abs(T(f-p_n)) + integral_0^1 abs(p_n (x) - f(x)) d x < epsilon / 2 + integral_0^1 epsilon / 2 d x = epsilon / 2 + epsilon / 2 = epsilon
  $
  אז בסך־הכל
  $
    0 <= abs(T(f) - integral_0^1 f(x) d x) < epsilon => 0 <= abs(T(f) - integral_0^1 f(x) d x) <= 0 => abs(T(f) - integral_0^1 f(x) d x) = 0
  $
  זאת־אומרת
  $ T(f) = integral_0^1 f(x) d x $

]

#question()
נוכיח שאוסף הפולינומים צפוף במרחב $C^k[0,1]$ בנורמה $C^k$. כלומר, שלכל $f in C^k[0,1]$ קיימת סדרת פולינומים ${p_n}_(n=1)^infinity$ כך שמתקיים
$ lim_(n arrow.r infinity) sum_(j=0)^k norm(f^((j)) - p_n^((j)))_infinity = 0 $
#proof[
  באינדוקציה על $k$.\
  נשים לב שעבור $k=0$, זה בעצם משפט הקירוב של ויירשטראס וזה מכסה את בסיס האינדוקציה.\
  נניח שהטענה נכונה עבור $k-1$ ונרצה להראות נכונות עבור $k$.\
  יהי $epsilon > 0$ ותהיי $f in C^k[0,1]$ ואז $f' in C^(k-1)[0,1]$ ומהנחת האינדוקציה קיימת סדרת פולינומים ${q_n}_(n=1)^infinity$ כך שמתקיים
  $
    lim_(n arrow.r infinity) sum_(j=0)^(k-1) norm(f^((j)) - q_n^((j)))_infinity = 0 <==> lim_(n arrow.r infinity) sum_(j=1)^k norm(f^((j-1)) - q_n^((j-1)))_infinity
  $
  אז נגדיר לכל $n in NN$ ו־$x in [0,1]$
  $ p_n (x) colon.eq f(0) + integral_0^x q_n (t) d t $
  כמובן ש־$p_n$ הוא פולינום כסכום פולינומים (אינטגרל של פולינום הוא פולינום), ומתקיים $p_n (x)' = q_n (x)$. בפרט, לכל $1<= j<=k$ מתקיים
  $ p_n^((j))(x) = q_n^((j-1))(x)<epsilon / 2 $
  וזה גורר שמתקיים
  $ sum_(j=1)^k norm(f^((j)) - q_n^((j-1)))_infinity=sum_(j=1)^k norm(f^((j)) - p_n^((j)))_infinity<epsilon / 2 $
  נשים לב שמתקיים
  $ f(x) = f(0) + integral_0^x f'(t) d t = f(0) + f(x) - f(0) = f(x) $
  ואז מתקיים
  $
    abs(f(x) - p_n (x)) = abs(cancel(f(0)) + integral_0^x f'(t) d t - (cancel(f(0))+integral_0^x q_n (t) d t))
    \ = abs(integral_0^x (f'(t)- q_n (t)) d t)<= integral_0^x abs(f'(t)-q_n (t)) d t<=_("הנחת האינדוקציה") integral_0^x sum_(j=1)^k norm(f^((j)) - q_n^((j-1)))_infinity d t <= integral_0^x epsilon / 2 d t = epsilon / 2
  $
  ולכן גם מתקיים $norm(f-p_n)_infinity < epsilon / 2$, ולכן לכל $N < n in NN$ מתקיים
  $
    sum_(j=0)^k norm(f^((j))- p_n^((j)))_infinity = sum_(j=1)^k norm(f^((j))-p_n^((j))) + norm(f-p_n)_infinity < epsilon / 2 + epsilon / 2 = epsilon
  $
  משמע מתקיים
  $ lim_(n arrow.r infinity) sum_(j=0)^k norm(f^((j)) - p_n^((j)))_infinity = 0 $
  אז קיבלנו שאוסף הפולינומים צפוף במרחב $C^k[0,1]$ בנורמה $C^k$.
]

#question()
נתבונן במרחב $C[0,1]$ עם נורמת $sup$ ונסמן $W = span { x, x^2, x^3, ...}$. נוכיח
$ overline(W) = { f in C[0,1] bar f(0) = 0} $
כלומר, שאם $f:[0,1] arrow.r RR$ רציפה ומתאפסת בנקודה $0$ אז היא גבול במידה שווה של פולינומים עם מקדם חופשי אפס.
#proof[
  בכיוון הראשון, תהיי $f in C[0,1]$ ותהיי ${p_n}_(n=1)^infinity subset.eq W$ סדרת פולינומים המתכנסת במידה שווה ל־$f$ משמע $p_n arrows f$ ומתקיים $lim_(n arrow.r infinity) p_n (0) = 0$.\
  אבל $x divides p_n$ לכל $n in NN$ (כי $W = span {x, x^2, ...}$) ולכן $p_n (0) = 0$, משמע $f(0) = 0$ (כי מהגדרת ההתכנסות במידה שווה, מכך ש־$p_n (0) = 0)$ נקבל $abs(f(0)) < epsilon$ עבור $epsilon > 0$ ולכן בהכרח $f(0)=0$), ולכן $f in overbrace(W)$ ומתקבלת ההכלה $overline(W) subset.eq {f in C[0,1] bar f(0)=0}$.\
  עבור ההכלה בכיוון השני, יהי $epsilon > 0$ ותהיי $f in C[0,1]$ כך ש־$f(0) = 0$. נרצה להראות ש־$f in overline(W)$.\
  ממשפט הקירוב של ויירשטראס קיימת סדרת פולינומים ${p_n}_(n=1)^infinity$ כך ש־$p_n arrows f$, משמע קיים $N in NN$ כך שלכל $N < n in NN$ מתקיים
  $ norm(f(x) - p_n (x))_infinity < epsilon / 2 $
  נגדיר ${q_n}_(n=1)^infinity subset.eq C[0,1]$ על־ידי $q_n (x) = p_n (x) - p_n (0)$ זה הפרש פולינומים ולכן פולינום ומתקיים $q_n (0) = p_n (0) - p_n (0) = 0$ ולכן $q_n in W$.\
  נרצה להראות ש־$f in overline(W)$, ונשים לב שלכל $x in [0,1]$ מתקיים
  $
    abs(q_n (x) - f(x))= abs(p_n (x) - p_n (0) - f(x)) = abs(p_n (x) - f(x) - (p_n (0) - 0)) = abs(p_n (x) - f(x) - (p_n (0) - f(0)))
    \ <= abs(p_n (x) - f(x)) + abs(p_n (0) - f(0))<= norm(p_n (x) - f(x))_infinity + norm(p_n (0) - f(0))_infinity < epsilon / 2 + epsilon / 2 = epsilon
  $
  זאת־אומרת, קיים פולינומים $q_n in W$ כך שמתקיים $q_n arrows f$ ולכן $f in overline(W)$.\
  הראינו הכלה דו־כיוונית ולכן $overline(W) = { f in C[0,1] bar f(0)=0}$.
]

#question()
יהי $(K,rho)$ מרחב מטרי קומפקטי. נראה כ־$lip(K)$ צפופה ב־$C(K)$.\
#proof[
  ראינו שזו אלגברה של פונקציות רציפות ולכן נותר רק להראות שהיא מפרידה נקודות ולא מתאפסת ב־$K$.\
  לפי הגדרה, מתקיים
  $ lip(K) = { f in C[K, RR] bar exists L >= 0 space forall x,y, in K, space abs(f(x)-f(y))<= L dot.op rho(x, y)} $
  יהיו $x,y in K$ כך ש־$x!=y$ ונראה שקיימת $f in lip(K)$ כך ש־$f(x)!=f(y)$. \
  נגדיר $f: K arrow.r RR$ על־ידי $f(t) = rho(t, x)$. מטריקה היא פונקציה רציפה ובמקרה זה היא $1$־ליפשיצית מאי־שיוויון המשולש, ולכן $f in lip(K)$.\
  מהגדרת המטריקה נובע ש־$f(t) = rho(t, x) = 0 <==> t=x$, אבל הנחנו ש־$x!=y$ ולכן בהכרח $rho(x, y) != 0$ ולכן $f(y)!=0$ ו־$f$ מפרידה בין $x,y$.\
  נשאר להראות ש־$lip(K)$ לא מתאפסת ב־$K$. נגדיר $f : K arrow.r RR$ על־ידי $f(x)=1$, זוהי פונקציה קבועה וכל פונקציה קבועה היא $0$־ליפשיצית ולכן $f in lip(K)$ ולכל $x in K$ מתקיים $f(x)!=0$ ולכן $f$ אינה מתאפסת ב־$K$.\
  אז $(K, rho)$ מרחב מטרי קומפקטי, $lip(K)$ אלגברה, מפרידה נקודות ואינה מתאפסת באף נקודה ולכן ממשפט סטון־ויירטשראס נקבל שמתקיים $overline(lip(K)) = C(K)$, ולכן $lip(K)$ צפופה ב־$C(K)$.
]
