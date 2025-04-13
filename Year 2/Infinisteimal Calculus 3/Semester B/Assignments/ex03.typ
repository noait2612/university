#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 03 --- חשבון אינפיניטסימלי 3, 80415 ],
  author: [ ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#let hom = math.op("Hom")

#question()

#subquestion()
תהיי $f: RR^2 arrow.r RR$ הנתנוה על־ידי
$ f(x) = cases( (x^2y)/(x^4+y^2) wide & (x,y)!=(0,0), 0 wide & (x,y)=(0,0)) $
נוכיח כי לכל $v in RR^2$ הפונקציה $f_v : RR arrow.r RR$ המוגדרת על־ידי $f_v (t) = f(t v)$ היא פונקציה רציפה אבל $f$ אינה רציפה.
#proof[
  נתחיל מלהראות ש־$f$ לא רציפה. \
  $f$ רציפה בכל $(x,y)!=(0,0)$ מאריתמטיקה של פונקציות רציפות ונראה שהיא לא רציפה בראשית:\
  נניח בשלילה שהיא רציפה בראשית, ולכן לפי קריטריון הנייה לרציפות מספיק שנמצא סדרה $(x_n, y_n)$ כך ש־$(x_n, y_n) stretch(arrow.r)_(n arrow.r infinity) 0$ אבל $(x_n, y_n) stretch(arrow.r)_(n arrow.r infinity) !=0$ ובבחירה של הסדרות $(x_n) = 1/n, (y_n) = 1/n^2$ נקבל:
  $
    lim_(n arrow.r infinity) f(x_n, y_n) = lim_(n arrow.r infinity) (x_n^2 y_n) / (x_n^4 + y_n^2) = lim_(n arrow.r infinity) (1 / n^2 1 / n^2) / (1 / n^4 + 1 / n^4) = = lim_(n arrow.r infinity) (1 / n^4) / (2 / n^4) = 1 / 2 != 0 = f(0,0)
  $
  ולכן $f$ לא רציפה בראשית.\
  נראה כעת כי לכל $v in RR^2$ הפונקציה $f_v$ רציפה:
  אם $v = (0,0) in RR^2$ אז לכל $t in RR$ מתקיים $ f_v (t) = f(t v) = f(0,0) = 0 $
  וזו פונקציה רציפה לכל $t in RR$. \
  אם $v = (x,y) !=(0,0) in RR^2$ אז לכל $t in RR$ מתקיים $ f_v (t) = f(t v) = f(x t, y t) = ((x t)^2(y t))/((x t)^4+(y t)^2) = (x^2 y t^3)/(x^4 t^4 + y^2 t^2) = (x^2 y t^3)/(t^2(x^4 t^2 + y^2)) = (x^2 y t)/(x^4 t^2 + y^2) $
  וזוהי פונקציה רציפה לכל $t in RR$ מאריתמטיקה של פונקציות רציפות (המכנה לא מתאפס לאף $t in RR$).
]

#subquestion()
נראה כי הפונקציה $g: RR^2 arrow.r RR$ הנתונה על־ידי
$ g(x) = cases((x sin(y))/(sqrt(x^2+y^2)) wide & (x,y)!=(0,0), 0 wide & (x,y) = (0,0)) $
היא רציפה.
#solution[
  ראשית, $g(x)$ רציפה בכל $(x,y)!=(0,0) in RR^2$ מאריתמטיקה של פונקציות רציפות ולכן נשאר להראות שהיא רציפה גם בראשית. \
  נעבוד כמו בתרגול ונעבור לקורדינאטות קוטביות, נגדיר $x = r cos theta, y = r sin theta$ כאשר $r>=0, theta in [0, 2pi]$.
  ואכן מתקיים:
  $
    lim_((x,y) arrow.r (0,0)) (x sin(y)) / (sqrt(x^2+y^2)) &= lim_(r arrow.r 0) (r cos theta dot.op sin(r sin theta)) / sqrt(r^2 cos theta^2 + r^2 sin theta^2) \
    &= lim_(r arrow.r 0) (r cos theta dot.op sin(r sin theta)) / sqrt(r^2(cos theta^2 + sin theta^2)) \
    &=_((1)) lim_(r arrow.r 0) (r cos theta dot.op sin(r sin theta)) / sqrt(r^2) \
    &=_((2)) lim_(r arrow.r 0) (r cos theta dot.op sin(r sin theta)) / r \
    &= lim_(r arrow.r 0) cos theta dot.op sin(r sin theta)=_((3)) 0
  $
  כאשר $(1)$ נובע מהזהות הטריגונומטרית $cos theta^2 + sin theta^2 = 1$, $(2)$ נובע מהיות $r>=0$ ו־$(3)$ נובע מחסומה כפול אפסה ולכן $g$ רציפה ב־$RR^2$.
]

#question()
נוכיח כי כל מרחב מטרי $(X,d)$ הומיאומורפי למרחב מטרי חסום.
#proof[
  ניזכר כי מרחב מטרי יקרא חסום אם קיימים $x in X$ ו־$r > 0$ כך שמתקיים $X subset.eq B_r (x)$. \
  נגדיר מטריקה $d'$ על $X$ על־ידי $d'(x,y) colon.eq min {1, d(x,y,)}$ ונשים לב שמתקיים $d'(x,y)<=1$ לכל $x,y in X$.\
  נראה ש־$d'$ אכן מטריקה:
  1. אי־שליליות נובע מהיות $d$ מטריקה ואכן $d'(x,y) = 0 <==> d(x,y) = 0 <==> x=y$
  2. סימטריה – נובע מהיות $d$ מטריקה
  3. אי שיוויון המשולש – יהיו $x,y,z in X$, מתקיים מהיות $d$ מטריקה
    $ d'(x,z) = min {1, d(x,z)} <= min {1, d(x,y)+d(y,z)} <= min {1, d(x,y)}+ min {1, d(y,z)}= d'(x,y)+d'(y,z) $
  כעת, בתרגול ראינו שקבוצות פתוחות נשמרות תחת הומיאומורפיזם (זאת אומרת $U subset.eq (X,d)$ פתוחה אם ורק אם $U subset.eq (X,d')$ פתוחה).\
  נגדיר את הכדורים שלנו:
  $ B_d (x,r) = { y in X bar d(x,y)<r} $
  $ B_d' (x,r) = { y in X bar d'(x,y)<r} $
  תהיי $U subset.eq X$ פתוחה תחת המטריקה $d$.
  ניזכר כי $U$ פתוחה ב־$d$ אם ורק אם לכל $x in U$ קיים $epsilon_x > 0$ כך שמתקיים $B_d (x, epsilon_x) subset.eq U$. \
  אם $epsilon_x < 1$ אזי מהגדרת $d'$ נקבל שמתקיים $B_d' (x, epsilon_x) subset.eq U$ ולכן $U$ פתוחה ב־$d'$. \
  בכיוון השני, תהיי $V subset.eq X$ פתוחה תחת המטריקה $d'$ ולכן עבור $epsilon_y < 1$ מתקיים $B_d' (y, epsilon_y) subset.eq V$ ואז מהגדרת $d'$ נובע כי $B_d (y, epsilon_y) subset.eq V$. \
  הראינו כי קבוצה פתוחה ב־$(X,d)$ אם ורק אם היא פתוחה ב־$(X,d')$ משמע $(X,d)$ ו־$(X,d')$ הם הומיאומורפים ו־$(X,d')$ חסום, כנדרש.

]

#question()
יהי $(X, norm(dot.op))$ מרחב נורמי ממימד $n in NN$ מעל $RR$.
#subquestion()
נוכיח כי $X$ איזומטרי ל־$RR^n$ עם נורמה כלשהי ונסיק כי $A subset.eq X$ היא קומפקטית סדרתית אם ורק אם היא סגורה וחסומה. #todo #text(green)[*תתקני אינדקסים כבר*]
#proof[
  נראה כי $X$ איזומטרי ל־$RR^n$ עם נורמה כלשהי ובהרצאה ראינו שכל הנורמות על $RR^n$ הן שקולות.\
  מהיות $X$ מרחב נורמי סוף מימדי נובע כי יש לו בסיס, נסמנו
  $ {x_1, x_2, ...,x_n} subset.eq X $
  ונגדיר העתקה לינארית $T : RR^n arrow.r X$ על־ידי
  $ T(a_1, a_2, ..., a_n) = a_1 x_1 + ... + a_n x_n $
  זו כמובן העתקה לינארית והיא חד־חד ערכית ועל מכיוון שהיא מוגדרת על איברי הבסיס של $X$.\
  נראה כי $T$ חד־חד ערכית: נשים לב שמתקיים
  $
    T(a_1, a_2, ... ,a_n) = T(b_1, b_2, ... ,b_n) <==> sum a_i x_i = sum b_i x_i <==> sum (a_i - b_i) x_i = 0 <==>_((1)) forall i a_i - b_i = 0 <==> forall i a_i=b_i
  $
  כאשר $(1)$ נובע מהיות הבסיס בלתי־תלוי לינארית.\
  נראה כי $T$ על: מהגדרת הבסיס נובע כי כל $x in X$ הוא מהצורה
  $ x = a_1 x_1 + a_2 x_2 + ... + a_n x_n $
  עבור $a_1, ..., a_n$ יחידים, ולכן נוכל לבחר $a = (a_1, a_2, ... ,a_n) in RR^n$ ואז $T(a) = x$ וקיבלנו ש־$T$ על. \
  מהיות כל הנורמות שקולות נוכל להגדיר נגדיר נורמה על $RR^n$
  $ norm((a_1, a_2, ..., a_n))' colon.eq norm(T(a_1, a_2, ..., a_n))_X = norm(sum_(i=1)^n a_i x_i)_X $
  נשים לב שזו אכן נורמה מהיות $norm(dot.op)_X$ נורמה (שלוש הדרישות מתקיימות מכך ישירות מהגדרה).\
  כעת, נגדיר $f : X arrow.r RR^n$ על־ידי $f = T^(-1)$ שכמובן חד־חד ערכית ועל מהיות $T$ איזומורפיזם, ולכן נשאר רק להראות שהיא משמרת מרחקים.
  \ ואכן, לכל $x, y in X$ מתקיים
  $
    norm(x-y)_X &= norm(f(x)-f(y))' \
    &= norm((a_1,a_2, ..., a_n) - (b_1, b_2, ..., b_n))' \
    &= norm(T(a_1-b_1, a_2-b_2, ..., a_n-b_n))_X \
    &= norm(sum_(i=1)^n (a_i-b_i)x_i)_X \
    &= norm(x-y)_X
  $
  וקיבלנו ש־$f$ היא איזומטריה ולכן $X$ איזומטרי ל־$RR^n$ עם נורמה כלשהי.\
  נסיק כעת כי $A subset.eq X$ היא קומפקטית סדרתית אם ורק אם היא סגורה וחסומה: \
  $<==$ ראינו בהרצאה שמרחב קומפקטי סדרתי הוא סגור וחסום לכל מרחב מטרי, ופרט למרחב נורמי.\
  $==> $ נניח כי $A$ סגורה וחסומה ונרצה להראות שהיא קומפקטית. מההוכחה לעיל נובע שנוכל להוכיח עבור $n=2$ (לשאר, ינבע באינדוקציה). \
  תהיי $(a_n) = (x_n, y_n)_(n=1)^infinity subset.eq A subset.eq RR^2$. היות ו־$(x_n,y_n)$ חסומה, נובע שקיים $M>0$ עבורו לכל $n$ מתקיים
  $ norm((x_n, y_n))_infinity <= M $
  משמע $abs(x_n) <=M$ וגם $abs(y_n)<=M$.\
  היות ו־$(x_n) subset.eq RR$ סדרה וחסומה ב־$RR$, ממשפט בולציאנו וירשטראס נובע שיש לה תת־סדרה מתכנסת $(x_n_k)_(k=1)^infinity$ כך שמתקיים $ x_n_k stretch(arrow.r)_(k arrow.r infinity) x_0 $ \
  היות ו־$(y_n_k)$ היא תת־סדרה של $(y_n)$ שהיא סדרה חסומה ולכן $(y_n_k)$ חסומה ממשפט הירושה, וממשפט בולציאנו וירשטראס נובע שיש לה תת־סדרה מתכנסת $(y_n_k_l)_(l=1)^infinity$ כך שמתקיים
  $ y_n_k_l stretch(arrow.r)_(l arrow.r infinity) y_0 $
  וממשפט הירושה נובע גם כי $ x_n_k_l stretch(arrow.r)_(l arrow.r infinity) x_0 $
  וראינו שהתכנסות ב־$RR^2$ שקולה להתכנסות קורדינאטה־קורדינאטה, ולכן
  $ (x_n_k_l, y_n_k_l) stretch(arrow.r)_(l arrow.r infinity) (x_0, y_0) $
  אבל מההנחה $A$ סגורה וחסומה ולכן $(x_0, y_0) in A$.
  מצאנו תת־סדרה שמתכנסת לאיבר ב־$A$ ולכן נובע כי $A$ קומפקטית סדרתית.
]
#subquestion()
נוכיח כי לכל מרחב נורמי $Y$ (לאו דווקא סוף מימדי) מתקיים $B(X,Y)=hom(X,Y)$. \
במילים אחרות, נראה שלכל העתקה לינארית $T : X arrow.r Y$ מתקיים $norm(T)_op < infinity$.
#proof[
  מספיק שנראה שכל העתקה לינארית במרחב נורמי סופי היא רציפה. \
  תהיי $T : X arrow.r Y$ העתקה לינארית ותהיי $a in X$.\
  מהיות $X$ סוף מימדי נסתכל על הבסיס שלו מהסעיף הקודם, אז מתקיים
  $ T(a) = T(a_1 x_1 + a_2 x_2 + ... + a_n x_n) = sum_(i=1)^n x_i f(a_i) $
  מאי־שיוויון המשולש מתקיים
  $ norm(T(a)) = norm(sum_(i=1)^n x_i f(a_i)) <= sum_(i=1)^n abs(x_i) norm(T(a_i)) $
  נבחר
  $ M = sup_i { norm(T(a_i))} $
  שקיים מהיות הקבוצה סופית.\
  היות וכל הנורמות שקולות, נובע שקיים $0<C in RR$ כך שמתקיים $sum_(i=1)^n abs(x_i)<=C norm(x)$, משמע
  $ norm(T(a))<= (sum_(i=1)^n x_i)M <=C M norm(a) $
  ולכן $T$ היא אופרטור לינארי חסום, נראה שהיא ליפשיצית ונקבל רציפות. \
  נסמן $M = norm(T)_op$ ואז לכל $a, b in X$ מתקיים
  $ norm(T a - T b)_Y = norm(T(a-b))_Y <= abs(a-b)_X dot.op norm(T)_op = C abs(a-b)_Y $
  פונקציה ליפשיצית היא רציפה, ופונקציה רציפה היא חסומה ולכן $B(X,Y) = hom(X,Y)$.

]

#question()
יהי $(X,d)$ מרחב מטרי ו־$i: X arrow.r hat(X)$ השיכון של $X$ בהשלמה.
#subquestion()
נוכיח כי לכל מרחב מטרי שלם $(Y, rho)$ ושיכון איזומטרי צפוף $j : X arrow.r Y$ (כלומר $j : X arrow.r j(X)$ איזומטריה ו־$j(X)$ צפופה ב־$Y$),
ניתן להרחיב את $j$ באופן יחיד לאיזומטריה $hat(j) : hat(X) arrow.r Y$ המקיימת $j=hat(j) compose i$.
#proof[#todo]

#subquestion()
נוכיח כי לכל $A subset.eq X$ מתקיים $overline(i(A)) subset.eq hat(X)$ איזומטרי להשלמה של $A$.
#proof[#todo]

#question()
יהי $p in NN$ מספר ראשוני.

#subquestion()
נוכיח כי ההשלמה $(QQ_p, hat(d)_p)$ של $(QQ, d_p)$ היא שדה והמטריקה $hat(d)_p$ מקיימת את־שיוויון המשולש האולטרה־מטרי.
#proof[#todo]

#subquestion()
נוכיח כי לכל סדרה $(a_n) subset.eq QQ_p$, הטור $display(sum_(n=0)^infinity a_n)$ מתכנס אם ורק אם $a_n stretch(arrow.r)_(n arrow.r infinity) 0$.
#proof[\
  $<== $ נניח שהטור $display(sum_(n=0)^infinity a_n)$ מתכנס ונראה כי $a_n stretch(arrow.r)_(n arrow.r infinity) 0$.\
  מהיות הטור מתכנס, נובע שסדרת הסכומים החלקיים שלנו מתכנס. ולכן $display(S_k = sum_(n=0)^k a_n )$ זו סדרת קושי מתכנסת, ולכן:
  $ abs(a_(k+1))_p = abs(S_(k+1) - S_k)_p stretch(arrow.r)_(k arrow.r infinity) 0 $
  ולכן $a_n stretch(arrow.r)_(n arrow.r infinity) 0$.\
  $==>$ נניח כי $a_n stretch(arrow.r)_(n arrow.r infinity) 0$ ונראה שהטור $display(sum_(n=0)^infinity a_n)$ מתכנס.\
  ראינו ש־$QQ_p$ עם המטריקה ה־$p$־אדית הוא מרחב אולטרה־מטרי ולכן מקיים את אי־שיוויון המשולש החזק.\
  יהי $epsilon > 0$ ומהיות $(a_n)$ סדרה מתכנסת נובע שקיים $N in NN$ שלכל $N < n in NN$ מתקיים $abs(a_n)_p < epsilon$, ולכן עבור $m > n$ מתקיים
  $ abs(S_m - S_n)_p = abs(sum_(k=n+1)^m a_k)_p <=_((1)) max_(n+1<=k<=m) abs(a_k)_p < epsilon $
  כאשר $(1)$ נובע מאי־שיוויון המשולש החזק.\
  מצאנו כי $(S_k)$ זו סדרת קושי מתכנסת ולכן הטור $display(sum_(n=0)^infinity a_n)$ מתכנס ב־$QQ_p$.
]

#question()
יהי $(X,d)$ מרחב מטרי קומפקטי סדרתית ו־$f : X arrow.r X$ פונקציה כמעט מכווצת, כלומר לכל $x, y in X$ מתקיים $d(f(x), f(y)) < d(x,y)$ נוכיח כי קיימת ל־$f$ נקודת שבת יחידה.
#proof[
  נגדיר $g: X arrow.r RR$ על־ידי $g(x) = d(x, f(x))$.\
  $g$ רציפה כהרכבת פונקציות רציפות – כן הרכבת רציפות היא רציפה ו־$f$ כמעט מכווצת ולכן ליפשיצית והמטריקה רציפה.\
  $X$ מרחב קומפקטי סדרתית ו־$g$ רציפה ולכן $g$ מקבלת עליו מינימום ולכן קיים $x_0 in X$ כך ש־$g(x_0)= m in RR$ הוא מינימום של $g$. \
  נראה כי $g(x_0) = m = 0$: נניח בשלילה ש־$m!=0$ ולכן מתקיים:
  $ g(f(x_0)) = d(f(x_0), f(f(x_0))) <_((1)) d(x_0, f(x_0)) = g(x_0) = m $
  כאשר $(1)$ נובע מהיות $f$ מכווצת, אבל זו סתירה שכן הנחנו ש־$m$ הוא המינימום של $g(x)$ ולכן בהכרח מתקיים $g(x) = d(x_0, f(x_0)) = 0$ ולכן $x_0 = f(x_0)$ ומצאנו נקודת שבת.\
  נראה כי היא יחידה: נניח שקיימות $x_1, x_2 in X$ כך ש־$x_1 != x_2$ וגם $f(x_1) = x_1, f(x_2) = x_2$, ולכן:
  $ d(x_1, x_2) = d(f(x_1), f(x_2)) <_((1)) d(x_1, x_2) $
  כאשר $(1)$ נובע מהיות $f$ מכווצת וזו כמובן סתירה.
]
