#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מבחני עבר --- משוואות דיפרנציאליות ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)
#set heading(numbering: "1.1")
#outline(depth: 3)
#let per = math.italic("per")

#let per = math.italic("per")
= מועד א' 2021
== שאלה 1
=== סעיף א'
נמצא את הפיתרון לבעיית תנאי ההתחלה
$ cases(x^prime (t) = A x(t), x(0) = x_0) $
כאשר $display(x_0 = vec(1, 2))$ ו־$display(A=mat(4, 4; 0, 2))$.

#proof[
  זו משוואה הומגנית אז מספיק לחשב את $x(t)=e^(t A)x_0$.\
  נמצא ערכים עצמיים
  $ P(A) = det(A-lambda I) = det mat(delim: "[", 4-lambda, 4; 0, 2-lambda) = (4-lambda)(2-lambda) $
  כלומר $lambda_1 = 2, lambda_2 = 4$ הם ערכים עצמיים של המטריצה ונמצא וקטורים עצמיים
  $ mat(4-2, 4; 0, 2-2) vec(a, b) = 0 <==> mat(2, 4; 0, 0) vec(a, b) = 0 <==> 2a+4b = 0 $
  אז וקטור עצמי לדוגמה הוא $vec(2, -1)$ בשביל הערך העצמי $lambda_1=2$.
  $ mat(4-4, 4; 0, 2-4) vec(a, b) = 0 <==> mat(0, 4; 0, -2) vec(a, b) = 0 <==> 4b-2b = 0 <==> b = 0 $
  ואז הוקטור $vec(1, 0)$ הוא וקטור עצמי שמתאים לערך העצמי $lambda_2=4$.
  $P$ תהיה המטריצה המלכסנת והמטריצה האלכסונית $D$ תהיה
  $ D = mat(4, 0; 0, 2), quad P = mat(2, 1; -1, 0), quad P^(-1) = frac(1, det(P)) mat(d, -b; -c, a) = mat(0, -1; 1, 2) $
  ונשאר לחשב את $e^(t A)$ אז
  $
    e^(t A) = P e^(t D) P^(-1) = mat(2, 1; -1, 0) mat(e^(4t), 0; 0, e^(2t)) mat(0, -1; 1, 2) = mat(e^(4t), 2e^(4t)-2e^(2t); 0, e^(2t))
  $
  ולכן
  $ x(t) = e^(t A) vec(1, 2) = mat(e^(4t), 2e^(4t)-2e^(2t); 0, e^(2t)) vec(1, 2) = vec(5e^(4t) - 4e^(2t), 2e^(2t)) $
  נשאר לבדוק
  $
    x(0) = vec(5e^(4 dot.op 0)-4e^(2 dot.op 0), 2e^(2 dot.op 0)) = vec(5-4, 2) = vec(1, 2) = x_0 \
    x^prime (t) = vec(20e^(4t)-8e^(2t), 4e^(2t))
  $
  $
    A x(t) = mat(4, 4; 0, 2) vec(5e^(4t)-4e^(2t), 2e^(2t))=vec(20e^(4t)-16e^(2t)+8e^(2t), 4e^(2t)) = vec(20e^(4t)-8e^(2t), 4e^(2t)) = x^prime (t)
  $
]

=== סעיף ב'
הדיאגרמת פאזה המתאימה היינה
#figure(
  image("../../../src/images/2021A question 1b.png", width: 100%, height: 10%, fit: "contain"),
)

== שאלה 2
נוכיח את החלק הבא ממשפט תלות רציפה בתנאי התחלה: תהיי $Omega subset.eq RR^n$ פתוחה ותהיי $F:Omega arrow RR^n$ ליפשיצית מקומית ונסמן ב־$phi_t (x)$ את הזרימה עבור המשוואה הדיפרנציאלית $x^prime (t) = F(x(t))$. תהיי $x_0 in Omega$ ונניח שעבור $t_0 > 0$ כלשהו $phi_t_0 (x)$ מוגדר.\
נוכיח כי לכל $epsilon > 0$ קיימת $delta > 0$ כך שאם $norm(y_0 - x_0) < delta$ אז $phi_t_0 (y_0)$ מוגדר ומתקיים
$ norm(phi_t_0 (x_0) - phi_t_0 (y_0)) < epsilon $
#proof[
  *מרגיש לי שזה לא הניסוח שאני יודעת לפתור אז לא.*
]

== שאלה 3
נביט במערכת המשוואות
$ vec(x^prime (t), y^prime (t)) = vec(y(t), -y(t) - sin(x(t))) $

=== סעיף א'
נמצא את כל נקודות שיווי־המשקל של המערכת.\
#solution[
  נקודת שיווי משקל מתקבלת כאשר $F(x)=0$ ולכן במקרה שלנו $y(t)=0$ מה שקורה שגם $sin(x(t))=0$ ולכן כל נקודות שיווי המשקל הן עבור $y(t)=0$ \
  ו־$x(t)= k pi$ עבור $k in ZZ$.
]

=== סעיף ב'
נראה כי $L(x,y) = -cos(x)+frac(y^2, 2)$ היא פוקנציית ליאפונוב עבור נקודת שיווי־המשקל $(0,0)$ ונסיק שנקודה זו יציבה אסימפטוטית.\
#proof[
  כדי להראות שזו פונקציית ליאפונוב עלינו להראות כי
  $ chevron.l gradient L(x), F(x ) chevron.r <= 0 $
  ואם נראה שזה ממש קטן מאפס נוכל להשתמש במשפט ליאפונוב ולקבל את היציבות האסימפטוטית. \
  אם־כך, נחשב
  $ gradient L(x) = vec(sin(x), y) $
  ולכן
  $ chevron.l gradient L(x), F(x) chevron.r = sin(x) dot.op y(t) + y(-y-sin(x)) = -y^2 $
  ואכן עבור הראשית מתקיים $chevron.l gradient L(0), F(0) chevron.r <= 0$ וזו אכן פונקציית ליאפונוב אבל ממש לא חזקה.\
  אין לנו כלים אחרים לפתור את השאלה ולכן נסיק שיש טעות במבחן והכוונה לנקודת משקל יציבה (ואז היא אכן יציבה ממשפט ליאפונוב).
]

=== סעיף ג'
יהי $(x(t), y(t))$ הפיתרון המקסימלי למערכת המתחיל בנקודה $(a,0)$ עבור $a in RR$.\
נשתמש בפונקציית ליאפונוב $L$ כדי להוכיח ש־$-2<=y(t)<=2$ לכל $t$ בתחום הגדרה של הפיתרון.\
#proof[
  לא ידעתי איך לפתור את זה.\
  אבל בגדול מהסעיף הקודם ניתן להסיק
  $ L(x(t), y(t)) <= L(x(0), y(0)) $
  כי הנגזרת מהסעיף הקודם שלילית.\
  נתון $x(0)=a$ ו־$abs(y(0))<=2$ אזי
  $ L(x,0) = -cos(a) + frac(0^2, 0) = - cos(a) $
  אז
  $ -cos(x(t))+frac(y(t)^2, 2) <= -cos(a) <==> frac(y(t)^2, 2) <= cos(x(t))-cos(a) $
  מתכונות קוסינוס
  $ cos(x(t))-cos(a) <= 1-(-1) = 2 $
  ולכן
  $ frac(y(t)^2, 2) <= 2 ==> y(t)^2 <= 4 ==> -2<=y(t)<=2 $
]

== שאלה 4
יהי $Omega subset.eq RR^n$ תחום חסום.

=== סעיף א'
נגדיר $u in C^0 (Omega)$ תת־הרמונית.\
#solution[
  נגיד ש־$u$ היא תת־הרמונית אם לכל כדור פתוח $B=B(x_0, r)$ כך ש־$closure(B) subset.eq Omega$ ולכל פונקציה $h in C(closure(B))$ שהרמונית ב־$B$ המקיימת $u|_boundary(B) <= h|_boundary(B)$ מתקיים $u|_B <= h|_B$.
]

=== סעיף ב'
תהיי $g:boundary(Omega) arrow RR$ פונקציה חסומה ונגדיר את פתרון פרון לבעיית תנאי השפה
$ mycases(Delta u =0, "on" Omega, u=g, "on" boundary(Omega)) $
#solution[
  פיתרון פרון הוא הפונקציה $ u^(per) colon.eq sup{v bar v in C(closure(Omega)) "sub-harmonic", v|_boundary(Omega)<=g } $
]

=== סעיף ג'
מבקשים שנוכיח את משפט פרון.\
אני לא זוכרת אותו בעל־פה, אז נדביק אותו מהסיכום ופשוט נזכור שצריך לעשות הרבה ההרמות וסנדוויץ ותתי־סדרות.


#proof[
  תהיי $y in Omega$ ולכן קיימת סדרה $v_n in S_g$ כך ש־$v_n (y) arrow u^per (y)$.\
  מעיקרון המקסימום מתקיים $v_n <= sup_boundary(Omega) g$ ונגדיר $tilde(v)_n colon.eq max {v_n, inf_boundary(Omega) g}$ ומתקיים
  $
    inf g <= tilde(v)_n <= sup g, quad v_n (y) <= tilde(v)_n (y) <=_(tilde(v)_n in S_g) u^per (y)
  $
  ומכלל הכריך נובע ש־$tilde(v)_n (y) arrow u^per (y)$ וזו סדרה של פונקציות חסומות ב־$S_g$.\
  יהי $B = B(y,r) subset.eq Omega$ כך ש־$closure(B) subset.eq Omega$, נשים לב שההרמה ההרמונית היא תת־הרמונית ולכן $tilde(v)_n <= V_n$ ולכן $V_n in S_g$ ונקבל את שרשרת אי־השיוויונות $tilde(v)_n <= V_n <= u^per$
  ולכן בנקודה $y$ נקבל $V_n (y) arrow u^per (y)$.\
  אז $(V_n)_(n=1)^infinity$ היא סדרה חסומה של פונקציות הרמוניות בכדור $B$ ומטענה שראינו לסדרת פונקציות הרמוניות חסומות קיימת תת־סדרה שמתכנסת לפונקציה תת־הרמונית, אז תת־סדרה $V_n_k$ שמתכנסת ב־$B$ לפונקציה הרמונית $h_v$ כך שמתקיים $V_n_k arrow h_v$ נקודתית ומיחידות הגבול $V_n_k (y) arrow u^per (y)$ וכן $V_n_k (y) arrow h_v (y)$.\
  נרצה להראות שזה מתקיים לכל נקודה ב־$B$: כבר ידוע $h_v <= u^per$ ב־$B$ ולכן נשאר להראות את האי־שיוויון השני; נניח בשלילה שקיימת $z in B$ עבורה $h_v (z) < u^per (z)$. תהיי $w_k in S_g$ כך ש־$w_k >= V_n_k$ ו־$w_k (z) arrow u^per (z)$.\
  מהגדרת $sup$ נקבל שקיימת סדרה $hat(w)_k in S_g$ המקיימת את התנאי השני ונחליף
  $w_k colon.eq max{hat(w)_k, V_n_k} in S_g$ ומתקיים $V_n_k <= w_k <= u^per$ ובפרט $w_k (z) arrow u^per (z)$ וכן $w_k (y) arrow u^per (y)$.\
  ושוב עם ההרמה ההרמונית, $W_k in S_g$ ומתקיים $V_n_k <= w_k <= W_k <= u^per$
  ונוכל למצוא תת־סדרה מתכנסת $W_k_n$ ב־$B$ לפונקציה הרמונית $h_w$ ומתקיים
  $ h_v <= h_w, quad h_v (y) = h_w (y) = u^per (y), quad h_v (z) < h_w (z) = u^per (z) $
  לכן הפונקציה $h_v - h_w <= 0$ היא פונקציה הרמונית שאינה קבועה ומקבלת מקסימום $0$ בנקודה פנימית $y$ בסתירה לעקרון המקסימום ולכן $h_v eq.triple u^per$ ב־$B$.\
  משרירותיות $B,y$ נקבל ש־$u^per$ הרמונית ב־$Omega$.
]

== שאלה 5
לא למדנו.

= מועד א' 2022
== שאלה 1
=== סעיף א'
ננסח את המשפט שלמדנו בהרצאה לגבי רציפות ביחס לתנאי התחלה במשוואות דיפרנציאליות רגילות.

#solution[
  תהיי $F:U arrow RR^n$ ליפשיצית מקומית כאשר $U subset.eq RR^n$ פתוחה. נגדיר
  $ Omega colon.eq {(p, t) bar p in U, t in J_p^*} subset.eq RR^(n+1) $
  לכל $(p,t) in Omega$ נגדיר את $Phi(p, t)=x_p (t) = phi_t (p)$ היכן ש־$x_p (t)$ פיתרון ל־$x'_p (t) = F(x_p (t))$ ו־$x_p (0) = p$.\
  תלות רציפה בתנאי התחלה אומר שהקבוצה $Omega$ היא פתוחה ו־$Phi: Omega arrow U$ היא רציפה.
]

=== סעיף ב'
נמצא את הצורה הכללית לפיתרון ממשי למשוואה $x^prime = mat(1, -13; 1, -3)x$.

#solution[
  נסמן $A=mat(1, -13; 1, -3)$ ונתחיל כרגיל מלמצוא ערכים עצמיים
  $
    det(A - lambda I) = det mat(delim: "[", 1-lambda, -13; 1, -3-lambda) = (1-lambda)(-3-lambda)+13 = lambda^2-2lambda+10 ==> lambda = frac(-2 plus.minus sqrt(4-40), 2) ==> lambda = -1 plus.minus 3i
  $
  ולכן יש זוג ערכים עצמיים מרוכבים, נמצא להם וקטורים עצמיים
  $ mat(2-3i, -13; 1, -2-3i) vec(a, b) = 0 <==> a-(2+3i)b = 0 <==> b= 1, a = 2+3i $
  כלומר $u=vec(2, 1), w = vec(3, 0)$.\
  מזהות אויילר הפתרונות הממשיים הם
  $ e^(alpha t)(u sin(beta t) + w cos(beta t)), quad e^(alpha t)(u cos(beta t) - w sin(beta t)) $
  כאשר $alpha=-1, beta = 3$ המקדמים של הערך העצמי ולכן שני הפתרונות הם
  $
    x_1 (t) = e^(-t)(vec(2, 1) cos(3t) - vec(3, 0) sin(3t)) = e^(-t) vec(2cos(3t)-3sin(3t), cos(3t)) \
    x_2 (t) = e^(-t)(vec(2, 1) sin(3t) + vec(3, 0) cos(3t)) = e^(-t)vec(2sin(3t)+3cos(3t), sin(3t))
  $
  ולכן הפיתרון הכללי הממשי הוא
  $ x(t)=c_1 x_1 (t) + c_2 x_2 (t) $
]

=== סעיף ג'
יהי $0!=x_0$ ונמצא את ערכי $t in RR$ עבורם הוקטורים $e^(t A) x_0$ ו־$x_0$ אינם תלויים לינארית.

#solution[
  זה שקול לכך שקיים $lambda in RR$ כך שמתקיים $e^(t A) x_0 = lambda x_0$.\
  נזכור שמחשבים $e^(t A) = P e^(t D) P^(-1)$ כאשר $P$ זו המטריצה המלכסנת שמצאנו עם הוקטורים העצמיים מהסעיף הקודם ו־$D$ המטריצה האלכסונית של הערכים העצמיים (כאשר נזכור שאם $v$ וקטור עצמי $u =overline(v)$ הוא הוקטור העצמי שמתאים במקרה השני), ואז
  $
    D=mat(-1+3i, 0; 0, -1-3i), quad P= mat(2+3i, 2-3i; 1, 1), quad P^(-1) = frac(1, 6i) mat(1, 3i-2; -1, 2+3i) ==> \
    e^(t A) = P e^(t D) P^(-1) = mat(2+3i, 2-3i; 1, 1) mat(e^((-1+3i)t), 0; 0, e^((-1-3i)t))mat(1, 3i-2; -1, 2+3i) = e^(-t) mat(cos(3t)+frac(2, 3) sin(3t), -frac(13, 3) sin(3t); frac(1, 3) sin(3t), cos(3t)-frac(2, 3) sin(3t))
  $
  ואכן
  $ e^(0 A) = mat(1, 0; 0, 1) $
  ונסמן
  $ B = mat(cos(3t)+frac(2, 3) sin(3t), -frac(13, 3) sin(3t); frac(1, 3) sin(3t), cos(3t)-frac(2, 3) sin(3t)) $
  אנחנו רוצים
  $ e^(t A) x_0 = e^(-t) B x_0 $
  מספיק לבדוק מתי $B(t) x_0 = lambda x_0$ וזה לכל $x_0 !=0$ ולכן צריך ש־$B(t)$ תהיה כפולה של הזהות, כלומר כל האיברים מחוץ לאלכסון צריכים להתאפס ולכן
  $ -frac(13, 3) sin(3t) = 0 = frac(1, 3) sin(3t) ==> 3t = k pi ==> t = frac(k pi, 3), k in ZZ $
  נשאר רק לבדוק את עצמנו שאם $t = frac(k pi, 3)$ עבור $k in ZZ$ כלשהו אז
  $ sin(3t) = 0, quad cos(3t) = (-1)^k $
  ואז
  $ e^(t A) = e^(-t)(-1)^k I $
  ולכן $e^(t A) x_0 = (-1)^k e^(-t) x_0$ תלויים לינארית ומכאן התלות לינארית היא עבור $t=frac(k pi, 3)$ עבור $k in ZZ$.
]

== שאלה 2
נוכיח את הטענה הבאה מתוךל הוכחת משפט היריעה היציבה: תהיי 0 נקודת שיווי משקל היפרבולית עבור שדה וקטורי $F:Omega arrow RR^n$ גזיר ברציפות ונגדיר $A = D F(0)$.\
נסמן ב־$H_plus$ ובהתאמה $H_minus$ את ה־$Span$ הממשי של הוקטורים העצמיים המוכללים של $A$ עם ערכים עצמיים עם חלק ממשי חיובי (בהתאמה שלילי) ותהיינה $pi_plus.minus$ ההטלות על־פני הפירוק הישר $RR^n = H_minus plus.o H_plus$.\
יהי $R>0$ כך שעל הכדור $B(0,R)$ הפונקציה $g(x)=F(x)-A x$ מקיימת $abs(g(x))<=abs(x)$ ונוכיח שאם $x:[0,infinity) arrow closure(B(0,R))$ הוא פיתרון למשוואה $x^prime = F(x)$ ואם $x_minus = p_minus (x(0))$ אזי
$
  x(t)=e^(t A)x_minus + integral_0^t e^((t-s)A) pi_minus (g(x(s))) dif s - integral_t^infinity e^((t-s)A) pi_plus (g(x(s))) dif s
$

#proof[
  נשים לב שמהגדרה
  $ F(x)=F(0) + A(x + o(norm(x))) ==>_(F(0) = 0) g(x) = F(x) - A x = o(norm(x)) $
  בפרט מהגדרת הגבול יש $R>0$ כך שלכל $x in B_R (0)$ מתקיים $norm(g(x)) <= norm(x)$ ונכתוב
  $ x(t) = e^(t A) x(0) + integral_0^t e^((t-s)A) g(x(s)) dif s $
  נכפול ב־$e^(-t A)$ ונפעיל את $pi_plus$ כי הכל לינארי ונקבל
  $ e^(-t A) pi_plus x(t) = pi_plus (x(0))+integral_0^t e^(-s A) pi_plus g(x(s)) dif s $
  קיים $C>0$ כך ש־$normop(pi_plus.minus)<=C$ כך שאם $0<mu < min {abs(re(lambda) bar "למדא ערך עצמי של A")}$ מתקיים
  $
    forall t > 0, space norm(e^(-t A) pi_plus x(t))<= C e^(-mu t) norm(x) \
    forall t<0, space norm(e^(-t A) pi_plus x(t))<= C e^(-abs(t) mu)
  $
  ולכן אם $x(t) in B_r (0)$ מתקיים
  $ norm(e^(-t A) pi_plus (x(t))) <= C^2 e^(-mu t) R stretch(arrow)_(t arrow infinity) 0 $
  ולכן לכל $s>0$ נקבל
  $ norm(e^(-s A) pi_plus g(x(s)))<= C^2 e^(-s mu) R $
  זה אינטגרבלי ב־$s$ ולכן ניתן ל־$t$ לשאוף לאינסוף ונקבל
  $ pi_plus (x(0)) = - integral_0^infinity e^(-=s A) pi_plus g(x(s)) dif s $
  אז אם נפרק את ההגדרה לעיל של $x(t)$ לפי ה־$Span$ נקבל עם מה שמצאנו לעיל
  $
    x(t) = e^(t A) pi_plus (x(0)) + e^(t A) pi_minus (x(0)) + integral_0^t e^((t-s)A) pi_plus (g(x(s))) dif s + integral_0^t e^((t-s)A) pi_minus (g(x(s))) dif s \
    = e^(t A) pi_minus (x_0) + integral_0^t e^((t-s)A) pi_minus (g(x(s))) dif s - integral_t^infinity e^((t-s)A) pi_plus ( g(x(s))) dif s
  $

]

== שאלה 3
יהי $x(t)$ הפיתרון המקסימלי לבעייתל תנאי ההתחלה
$ cases(x^prime (t) = x^2, x(0) = 1) $
ויהי $y(t)$ הפיתרון המקסימלי לבעיית תנאי ההתחלה
$ cases(y^prime (t) = y^2 + e^y sqrt(2+sin^3(y)), y(t) = 2) $

=== סעיף א'
נוכיח שלכל $t>0$ עבורו $x(t), y(t)$ מוגדרים מתקיים $y(t) > x(t)$.\
#proof[
  נניח בשלילה שהטענה לא מתקיימת ונסמן $tau = inf {t bar y(t)<=x(t)}$ ומרציפות הפתרונות נובע כי $overline(x) colon.eq x(tau)=y(tau)$.\
  נסמן $f(u) = u^2$ ו־$g(u) = u^2 + e^u sqrt(2+sin^3 (u))$ וברור שמתקיים $g(u)>f(u)$ שכן $e^u sqrt(2+sin^3 (u)) > 0$ ולכן ב־$tau$ מתקיים
  $ y^prime (tau) = g(y(tau)) > f(x(tau)) = x^prime (t) $
  אז נסתכל על ההפרש $h(t) = y(t) - x(t)$ הוא מקיים
  $ h(tau) = 0 , h(t) > 0 space (t < tau) $
  ולכן יש מינימום מקומי ב־$tau$ ומתקיים $h^prime (tau) <=0$, מצד שני
  $ h^prime (tau) = y^prime (tau) - x^prime (tau) > 0 $
  וזאת כמובן סתירה.
]

=== סעיף ב'
נסיק שלבעיית תנאי ההתחלה השנייה לא קיים פתרון לזמן ארוך $y:[0,infinity) arrow RR$.\

#proof[
  נפתור את המשוואה השנייה לפי שיטת הפרדת משתנים
  $ frac(dif x, x^2) = dif t ==> - frac(1, x) = t + C $
  תנאי ההתחלה הוא $x(0) = 1$ ולכן נקבל $C=-1$ כלומר $-frac(1, x) = t - 1$ כלומר $x(t) = frac(1, 1-t)$ והוא מוגדר רק עבור $0<=t<1$ ויתר על־כן $lim_(t arrow 1^minus) x(t) = infinity$.\
  אם נניח בשלילה שקיים פתרון לזמן ארוך, $y:[0,infinity) arrow RR$ מהסעיף הקודם לכל $0<t<1$ מתקיים
  $ y(t) > x (t) = frac(1, 1-t) $
  ולכן כאשר $t arrow 1^minus$
  $ y(t) >= x(t) $
  אבל זה פיתרון של משוואה דיפרנציאלית שמוגדר בנקודה $t=1$ חייב להיות סופי כי $y(1) in RR$ וזאת סתירה.
]

== שאלה 4
=== סעיף א'
נגיד את מושג השיכוך בסקאלה $epsilon$ של פונקציה $u in C(Omega)$ בנקודה $x_0 in Omega$ המקיימת $d(x_0, boundary(Omega)) > epsilon$.\

#solution[
  נגדיר $eta : [0,infinity) arrow RR$ על־ידי $x|_([0, frac(1, 2))) = 1$ ו־$eta(x)=0$ אחרת.\
  בהינתן $epsilon > 0$ נגדיר את $phi_epsilon : RR^n arrow RR$ על־ידי
  $ phi_epsilon = frac(eta(norm(x), epsilon), epsilon^n integral_(RR^n) eta(norm(y)) dif y) $
  $phi_epsilon$ היא חלקה, רדיאלית, נתמכת על $B(0,epsilon)$ ומקיימת $integral_(RR^n) phi_epsilon (y) dif y$.\
  נסמן $Omega_epsilon = {x in Omega bar dist(x, boundary(Omega)) > epsilon}$ ועבור $u in C(Omega)$ נגדיר את השיכוך בסקאלה $epsilon$ על $u$ להיות
  $ u^epsilon = phi_epsilon * u = integral_(RR^n) phi_epsilon (x-y) u(y) dif y $
  כאשר $u^epsilon : Omega_epsilon arrow RR$.
]

=== סעיף ב'
נוכיח את עיקרון המקסימום החזק לפונקציות הרמוניות: יהי $Omega subset.eq RR^n$ תחום חסום, פתוח וקשיר ותהיי $u in C^2 (Omega) inter C^0 (closure(Omega))$ הרמונית.\
אם קיים $x_0 in Omega$ כך ש־$u(x_0) = max_(x in closure(Omega)) u(x)$ אזי $u(x)=u(x_0)$ לכל $x in Omega$.\

#proof[
  נסמן $u(x_0) = M$ ונגדיר $A colon.eq { x in Omega bar u(x) = M}$.\
  מרציפות $u$ נובע ש־$A$ סגורה ולא ריקה כי $x_0 in A$ ונשאר רק להראות שהיא פתוחה ומקשירות נסיים.\
  ואכן, $A$ פתוחה מתכונת ערך הממוצע לפונקציות הרמוניות כמעט באופן ישיר.\
  יהי $x_0 in A$, מכך ש־$Omega$ פתוחה יש $r>0$ כך ש־$closure(B(x_0, r)) subset.eq Omega$ ומכך ש־$u$ הרמונית מתקיים
  $ M = u(x) = frac(1, abs(boundary(B(x_0, r)))) integral_boundary(B(x_0, r)) u dif V $
  כאשר $M$ מכיוון ש־$x_0 in A$.\
  מצד שני, מהגדרת $M$ נובע כי $u(y) <= M$ לכל $y in closure(Omega)$ ובפרט לכל $y in boundary(B(x_0, r))$ כלומר יש לנו ממוצע של פונקציה שאינה עוברת את $M$ אבל הממוצע שלה הוא $M$ ולכן בהכרח מתקיים $u(y)=M$ לכל $y in boundary(B (x_0, r))$ ולכן $boundary(B(x_0, r)) subset.eq A$.\
  כעת לכל $z in B(x_0, r)$ נבחר כדור קטן סביב $z$ שמוכל ב־$B(x_0, r)$ ומאותו טיעון נקבל ש־$u(z)=M$ בכל הכדור ולכן נקבל $B(x_0, r) subset.eq A$ ו־$A$ פתוחה.\
  $A$ פתוחה, סגורה ולא ריקה ו־$Omega$ קשירה ולכן $A=Omega$.
]

== שאלה 5
לא למדנו.

= מועד ב' 2022
== שאלה 1
נביט במערכת $ x^prime = mat(1, -frac(1, 2); 2, a) x $ כאשר $a in RR$ פרמטר.

=== סעיף א'
נוכיח שלכל $a<-1$ קיים $x_0 in RR^2$ כך ש־$lim_(t arrow infinity)norm(e^(t A) x_0) = infinity$ וגם $lim_(t arrow minus infinity) norm(e^(t A) x_0)=infinity$.

#proof[
  נחשב ערכים עצמיים, עקבה ודטרמיננטה (כי מה עוד יש לעשות)
  $ tr(A) = 1 + a $
  $ det(A) = 1 dot.op a - (-frac(1, 2)) dot.op 2 = a + 1 $
  נתון לנו ש־$a < -1$, ולכן מתקיים בהכרח $det(A) < 0$. \
  אנו יודעים שהדטרמיננטה של מטריצה שווה למכפלת הערכים העצמיים שלה ($det(A) = lambda_1 lambda_2$). מכיוון שהמכפלה שלילית, למטריצה יש בהכרח שני ערכים עצמיים ממשיים בעלי סימנים מנוגדים (אחד חיובי ואחד שלילי) ונסמן אותם ב־$lambda_1 > 0$ ו־$lambda_2 < 0$. \
  יהיו $v_1, v_2$ הווקטורים העצמיים המתאימים להם. כיוון שהם שייכים לערכים עצמיים שונים, הם בלתי־תלויים לינארית ופורשים את $RR^2$. \
  נבחר את תנאי ההתחלה להיות סכום של שני הווקטורים העצמיים
  $ x_0 = v_1 + v_2 $
  הפתרון של המערכת עבור תנאי התחלה זה נתון על־ידי
  $ x(t) = e^(t A) x_0 = e^(lambda_1 t) v_1 + e^(lambda_2 t) v_2 $
  נשאר לבדוק
  + כאשר $t arrow infinity$  מכיוון ש־$lambda_1 > 0$, המקדם $e^(lambda_1 t)$ ישאף לאינסוף. לעומתו, מכיוון ש־$lambda_2 < 0$, המקדם $e^(lambda_2 t)$ ישאף לאפס. כיוון ש־$v_1 != 0$, הגורם הראשון שולט והנורמה של הפתרון שואפת לאינסוף
  $ lim_(t arrow infinity) norm(e^(t A) x_0) = infinity $
  + כאשר $t arrow minus infinity$  ההפך הוא הנכון. החזקה של $e^(lambda_1 t)$ הולכת למינוס אינסוף ולכן הביטוי שואף לאפס. לעומת זאת, החזקה של $e^(lambda_2 t)$ היא מכפלה של שני מספרים שליליים (כי $lambda_2<0$ וגם $t<0$) ולכן שואפת לפלוס אינסוף. במקרה זה הגורם השני שולט, ושוב הנורמה שואפת לאינסוף
  $ lim_(t arrow -infinity) norm(e^(t A) x_0) = infinity $
]

=== סעיף ב'
נמצא ערך $a in RR$ עבורו קיים $x_0 in RR^2$ כך ש־$e^(t A) x_0$ היא פונקציה לינארית ב־$t$, כלומר $0<lim_(t arrow infinity) frac(norm(e^(t A) x_0), t) < infinity$

== שאלה 2
=== סעיף א'
ננסח את משפט פיאנו.\

#proof[
  תהיי $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ רציפה ו־$x_0 in U$. אז יש $delta > 0$ יש $x : (-delta, delta) arrow U$ גזירה כך ש־$x$ היא פיתרון לבעיית ההתחלה
  $ cases(x^prime (t) = F(x(t)), x(0) = x_0) $
]

=== סעיף ב'
ננסח ונוכיח את משפט פיקארד.\

#proof[
  *ניסוח:*
  תהיי $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ ליפשיצית מקומית, $x_0 in U$. אז  יש $delta > 0$ כך שקיים פיתרון יחיד בקטע $[-delta, delta]$ לבעיה
  $ cases(x^prime (t) = F(x(t)), x(0) = x_0) $
  *הוכחה באמצעות למה:* משפט פיקארד נובע ממשפט פיאנו יחד עם הלמה הבאה.\
  *למה:*
  בתנאי משפט פיקארד נניח שיש $x$ ו־$y$ פתרונות לבעיה כאשר $x$ מוגדרת על $I subset.eq RR$ ו־$y$ מוגדרת על $J subset.eq I$. אם $x(0) = y(0)$ ו־$0 in I inter J$ אזי $x(t)=y(t)$ לכל $t in I inter J$.\
  *הוכחת הלמה:* נוכיח עבור $I inter J inter [0,infinity)$, לפיתרון השני זה זהה.\
  נניח שלא ככה ונסמן $tau colon.eq inf {t in I inter J inter [0,infinity) bar x(t) != y(t)}$ ומרציפות הפיתרון $overline(x) = y(tau) = x(tau)$.\
  ניקח $r > 0$ כך ש־$closure(B(overline(x), r)) subset.eq U$ וניקח $delta > 0$ כך שיתקיים $[tau, tau+delta] subset.eq I inter J$ וגם לכל $x(t), y(t) in closure(B(overline(x), r))$ לכל $t in [tau, tau+delta]$.\
  מתקיים
  $
    frac(dif, dif t) norm(x(t)-y(t))^2 & = chevron.l x(t)-y(t), x^prime (t) - y^prime (t) chevron.r \
                                       & chevron.l x(t) - y(t), F(x(t)) - F(y(t)) chevron.l \
                                       & <= 2 norm(x(t)-y(t)) norm(F(x(t))-F(y(t))) \
                                       & <= 2 L norm(x(t)-y(t))^2
  $
  כאשר אי־השיוויונות נובעים מ אי־שיוויון קושי־שוורץ וקבוע ליפשיץ בהתאמה.\
  אז הפונקציה $f(t) = 2e^(-L t) norm(x(t)-y(t))^2$ היא מונוטונית יורדת מהגדרת הנגזרת ואי־שלילית אבל מצד שני מתקיים
  $ f(tau) = 2e^(- L tau) norm(x(tau)-y(tau)) = 0 $
  כלומר $f(t) eq.triple 0$ לכל $t$ אבל זאת סתירה כי אז $x(t) = y(t)$.\
  *הוכחה באמצעות משפט העתקה מכווצת:* מהמשפט היסודי נגדיר
  $ x(t) = x_0 + integral_0^t F(x(s)) dif s $
  ונגדיר
  $ K x = x_0 + integral_0^t F(x(s)) dif s $
  כעת הבעיה שקולה למציאת נקודת שבת של האופרטור $K$.\
  $F$ ליפשיצית מקומית ולכן קיים כדור סגור $B colon.eq closure(B(x_0, r)) subset.eq U$ שבו $F$ חסומה על־ידי $M_r$ וליפשיצית עם קבוע $C_r$.\
  נסתכל על המרחב המטרי $X$ מרחב הפונקציות הרציפות מהקטע $(-delta, delta)$ אל הכדור $B$ עם נורמת הסופרמום וזה מרחב מטרי שלם אז אם נבחר $delta <= min(frac(r, 2M_r), frac(1, 2C_r))$ מתקיים
  $ norm(K x(t) - x_0) <= integral_0^t norm(F(x(s))) dif s <= delta M_r <= frac(r, 2) < r $
  ולכל שתי פונקציות $x,y in X$ מתקיים
  $
    norm(K x(t) - K y(t)) <= integral_0^t norm(F(x(s))-F(y(s))) dif s <= integral_0^t C_r norm(x(s) - y(s)) dif s <= delta C_r norm(x-y)_infinity <= frac(1, 2) norm(x-y)_infinity
  $
  ולכן $K$ היא העתקה מכווצת והמרחב שלם אז ממשפט העתקה מכווצת יש נקודת שבת והיא יחידה, כלומר $K x = x$ והפיתרון יחיד.
]

== שאלה 3
=== סעיף א'
נגדיר את המושגים נקודת שיווי משקל ונקודת שיווי משקל אסימפטוטית.\

#proof[
  נגדיר ש־$p$ היא נקודת שיווי משקל של המערכת אם $F(p)=0$.\
  נגיד שהיא נקודת שיווי משקל יציבה אם לכל $epsilon > 0$ יש $delta > 0$ כך שלכל $q in B(p, delta)$ מתקיים $phi_t (q) in B(p, epsilon)$.\
  נגיד שהיא נקודת שיווי משקל יציבה אסימפטוטית אם היא גם יציבה וגם קיימת $eta > 0$ כך שלכל $q in B(p, eta)$ מתקיים $lim_(t arrow infinity) phi_t (q) = p$.
]

=== סעיף ב'
נמצא את כל נקודות שיווי־המשקל $(x_0, y_0)$ של המערכת $ vec(x, y)^prime = vec(x(x+y-3), 2x+y-1) $ ונסווג אילו מהן יציבות אסימפטוטית.\

#solution[
  נחשב
  $ vec(x, y)^prime = vec(x(x+y-3), 2x+y-1) = vec(0, 0) $
  חישוב זריז מניב שהנקודות הן $(0,1)$ ו־$(-2, 5)$.\
  נחשב את $D F (x,y)$
  $
    D F (x,y) = mat(2x+y-3, x; 2, 1) \
    A colon.eq D F (0,1) = mat(-2, 0; 2, 1) \
    B colon.eq D F (-2,5) = mat(-2, -2; 2, 1)
  $
  פולינומים אופיינים
  $
    P(A) = det(A - lambda I) = (-2-lambda)(1-lambda) ==> lambda_1 = -2, lambda_2 = 1 \
    P(B) = det(B- lambda I) = (-2-lambda)(1-lambda)+4 = -2 +2 lambda - lambda + lambda^2 + 4 = lambda^2 + lambda + 2 ==> lambda = frac(-b plus.minus sqrt(b^2 - 4 a c), 2a) = frac(-1 plus.minus sqrt(-7), 2) = frac(-1 plus.minus 7i, 2)
  $
  מהקריטריון הלינארי ליציבות אסימפטוטית  צריך שלכל ערך עצמי יש חלק ממשי שלילי ולכן הנקודה $(-2,5)$ היא נקודת שיווי משקל יציבה אסימפטוטית.\
  עבור $(0,1)$ יש לנו ערך עצמי עם חלק ממשי חיובי ולכן לפי הקריטריון הלינארי לאי־יציבות נובע שזו לא נקודה יציבה.
]

=== סעיף ג'
נסמן ב־$phi_t$ את הזרימה של המערכת מהסעיף הקודם. נוכיח שקיימת נקודה $(x_1 y_1) in RR^2$ שאיננה נקודת שיווי משקל כך ש־$phi_t (x_1, y_1)$ קיים לכל $t>0$ והגבול $lim_(t arrow infinity)phi_t (x_1, y_1)$ קיים ושווה ל־$(x_0, y_0)$ נקודת שיווי משקל לא יציבה.\

#proof[
  נקודת השיווי משקל שלא יציבה היא $(0,1)$ ולכן לפי משפט הקריטריון הלינארי לאי־יציבות (שהוא גם משפט היריעה היציבה) קיימת יריעה יציבה שעוברת דרך $(0,1)$ וכל נקודה עליה מתכנסל ־$(0,1)$ ולכן אפשר לבחור נקודה $(x_1, y_1) != (0,1)$ על היריעה שמקיימת את הנדרש.
]

== שאלה  4
=== סעיף א'
נגיד פונקציה תת־הרמונית.\
#proof[
  יהי $Omega subset.eq RR^n$ תחום. נגיד ש־$u in C^0 (Omega)$היא תת־הרמונית אם לכל
  $B subset.eq Omega$ כדור פתוח כך ש־$closure(B) subset.eq Omega$ ולכל $h in C(closure(B))$ הרמונית ב־$B$ המקיימת $u|_boundary(B) <= h|_boundary(B)$ מתקיים $u|_B <= h|_B$.
]

=== סעיף ב'
יהי $Omega$ תחום חסום וקשיר ותהיי $G:boundary(Omega) arrow RR$ חסומה. נגדיר מהו פתרון פרון לבעיה
$ mycases(Delta u = u, "on" Omega, u = g, "on" boundary(Omega)) $

#proof[
  $ u^per colon.eq sup {v bar v in C(closure(Omega)) "sub-harmonic", v|_boundary(Omega) <= g|_boundary(Omega)} $
]

=== סעיף ג'
נוכיח שפתרון פרון הוא הרמוני ב־$Omega$ (כלומר, להוכיח את משפט פרון שאני לא זוכרת).\

#proof[
  תהיי $y in Omega$ ולכן קיימת סדרה $v_n in S_g$ כך ש־$v_n (y) arrow u^per (y)$.\
  מעיקרון המקסימום מתקיים $v_n <= sup_boundary(Omega) g$ ונגדיר $tilde(v)_n colon.eq max {v_n, inf_boundary(Omega) g}$ ומתקיים
  $
    inf g <= tilde(v)_n <= sup g, quad v_n (y) <= tilde(v)_n (y) <=_(tilde(v)_n in S_g) u^per (y)
  $
  ומכלל הכריך נובע ש־$tilde(v)_n (y) arrow u^per (y)$ וזו סדרה של פונקציות חסומות ב־$S_g$.\
  יהי $B = B(y,r) subset.eq Omega$ כך ש־$closure(B) subset.eq Omega$, נשים לב שההרמה ההרמונית היא תת־הרמונית ולכן $tilde(v)_n <= V_n$ ולכן $V_n in S_g$ ונקבל את שרשרת אי־השיוויונות $tilde(v)_n <= V_n <= u^per$
  ולכן בנקודה $y$ נקבל $V_n (y) arrow u^per (y)$.\
  אז $(V_n)_(n=1)^infinity$ היא סדרה חסומה של פונקציות הרמוניות בכדור $B$ ומטענה שראינו לסדרת פונקציות הרמוניות חסומות קיימת תת־סדרה שמתכנסת לפונקציה תת־הרמונית, אז תת־סדרה $V_n_k$ שמתכנסת ב־$B$ לפונקציה הרמונית $h_v$ כך שמתקיים $V_n_k arrow h_v$ נקודתית ומיחידות הגבול $V_n_k (y) arrow u^per (y)$ וכן $V_n_k (y) arrow h_v (y)$.\
  נרצה להראות שזה מתקיים לכל נקודה ב־$B$: כבר ידוע $h_v <= u^per$ ב־$B$ ולכן נשאר להראות את האי־שיוויון השני; נניח בשלילה שקיימת $z in B$ עבורה $h_v (z) < u^per (z)$. תהיי $w_k in S_g$ כך ש־$w_k >= V_n_k$ ו־$w_k (z) arrow u^per (z)$.\
  מהגדרת $sup$ נקבל שקיימת סדרה $hat(w)_k in S_g$ המקיימת את התנאי השני ונחליף
  $w_k colon.eq max{hat(w)_k, V_n_k} in S_g$ ומתקיים $V_n_k <= w_k <= u^per$ ובפרט $w_k (z) arrow u^per (z)$ וכן $w_k (y) arrow u^per (y)$.\
  ושוב עם ההרמה ההרמונית, $W_k in S_g$ ומתקיים $V_n_k <= w_k <= W_k <= u^per$
  ונוכל למצוא תת־סדרה מתכנסת $W_k_n$ ב־$B$ לפונקציה הרמונית $h_w$ ומתקיים
  $ h_v <= h_w, quad h_v (y) = h_w (y) = u^per (y), quad h_v (z) < h_w (z) = u^per (z) $
  לכן הפונקציה $h_v - h_w <= 0$ היא פונקציה הרמונית שאינה קבועה ומקבלת מקסימום $0$ בנקודה פנימית $y$ בסתירה לעקרון המקסימום ולכן $h_v eq.triple u^per$ ב־$B$.\
  משרירותיות $B,y$ נקבל ש־$u^per$ הרמונית ב־$Omega$.
]

== שאלה 5
לא למדנו.

= מועד א' 2024
== שאלה 1
תהיי $U subset.eq RR^n$ קבוצה פתוחה ו־$F:U arrow RR^n$ פונקציה ליפשיצית מקומית. יהיו $I, J subset.eq RR$ קטעים פתוחים כך ש־$0 in I inter J$ ויהיו $x:I arrow U$, $y : J arrow U$ שני פתרונות למשוואה $x^prime (t) = F(x(t))$ כך שמתקיים $x(0)=y(0)$. נראה שלכל $t in I inter J$ מתקיים $x(t)=y(t)$.\

#proof[
  זו הלמה שמוכיחים איתה את משפט פיקארד.\
  נניח שלא ככה ונסמן $tau colon.eq in {t in I inter J inter [0,infinity) bar x(t)!=y(t)}$ ומרציפות הפתרונות כמובן שמתקיים $overline(x) colon.eq y(tau)=x(tau)$.\
  יהי $r>0$ כך שמתקיים $closure(B(overline(x), r)) subset.eq U$ ותהיי $delta>0$ כך שמתקיים $[tau, tau + delta] subset.eq closure(B(overline(x), r))$ וגם לכל $t in [tau, tau+delta]$  מתקיים $x(t), y(t) in closure(B(overline(x), r))$.\
  מאי־שיוויון קושי־שוורץ ומהליפשיציות מתקיים
  $
    frac(dif, dif t) norm(x(t)-y(t))^2 & = 2 chevron.l x(t)-y(t), x^prime (t) - y^prime (t) chevron.r \
                                       & = chevron.l x(t)-y(t), F(x(t))-F(y(t)) chevron.r \
                                       & <= 2 norm(x(t)-y(t)) norm(F(x(t))-F(x(y))) \
                                       & <= 2 L norm(x(t)-y(t))^2
  $
  כלומר הפונקציה $f(t)=2e^(-L t) norm(x(t)-y(t))^2$ היא פונקציה מונוטונית יורדת מגזירה
  $ frac(dif, dif t) f <= -2L f(t) + 2 f L (t) = 0 $
  ומתקיים $f(tau)=0$ ולכן בהכרח $f(t) eq.triple 0$ לכל $t in [tau, tau+delta]$ אבל זה אומר שבקטע הזה $x(t)-y(t) = 0$ וזאת סתירה.
]

== שאלה 2
יהי $I subset.eq RR$ קטע פתוח ותהיי $A : I arrow M_n (RR)$ פונקציה רציפה.\
מטריצת הפתרונות היסודית של המשוואה $ frac(dif x, dif t) = A(t) x(t) $
היא פונקציה $Phi : I arrow M_n (RR)$ שעמודתיה הם פתרונות בלתי־תלויים של המשוואה.\
נראה שאם $Phi$ היא מטריצת פתרונות יסודית אז מתקיים $ frac(dif det Phi(t), dif t) = tr A(t) det Phi (t) $
רמז: להראות שלכל $B in M_n (RR)$ מתקיים $det(Id + h B) = 1 + h tr B + o(h)$.\

#proof[
  ראשית הנדרש נובע ישירות מהרמז:
  לפי הגדרת הנגזרת
  $ frac(dif det Phi(t), dif t) = lim_(h arrow 0) frac(det Phi(t+h) - det Phi(t), h) $
  מכיוון ש־$Phi$ פותרת את המשוואה, הנגזרת שלה היא $Phi^prime (t) = A(t) Phi(t)$ ומפיתוח טיילור
  $
    Phi(t+h) & = Phi(t) + h Phi^prime (t) + o(h) \
             & = Phi(t) + h A(t) Phi(t) + o(h) \
             & = (Id + h A(t)) Phi(t) + o(h)
  $
  דטרמיננטה היא פולינום ולכן פונקציה חלקה ולכן איבר השארית נשאר קטן ומכפליות הדטרמיננטה נקבל
  $ det Phi(t+h) = det(Id + h A(t)) dot.op det Phi(t) + o(h) $
  ומהרמז אם $B=A(t)$ נקבל
  $
    det Phi(t+h) & = (1 + h tr(A(t)) + o(h)) dot.op det Phi(t) + o(h) = det Phi(t) + h tr(A(t)) det Phi(t) + o(h) \
  $
  ונקבל
  $ frac(det Phi(t+h) - det Phi(t), h) = tr(A(t)) det Phi(t) + frac(o(h), h) $
  מאריתמטיקה של גבול $frac(o(h), h) stretch(arrow)_(h arrow 0) 0$ ונקבל
  $ frac(dif det Phi(t), dif t) = tr(A(t)) det Phi(t) $
  אז רק נשאר להראות את הרמז.\
  נניח כי $lambda_1, lambda_2, dots, lambda_n$ הם הערכים העצמיים של המטריצה $B$ (מעל $CC$, כולל ריבוי אלגברי). \
  נשתמש בשלוש עובדות מוכרות מהאלגברה הלינארית
  + הערכים העצמיים של המטריצה $Id + h B$ הם בדיוק $1 + h lambda_i$ לכל $i=1,dots,n$.
  + הדטרמיננטה של מטריצה שווה למכפלת כל הערכים העצמיים שלה.
  + העקבה ($tr$) של מטריצה שווה לסכום כל הערכים העצמיים שלה, כלומר $tr B = sum_(i=1)^n lambda_i$.
  לכן, ניתן לחשב את הדטרמיננטה ישירות כמכפלת הערכים העצמיים
  $ det(Id + h B) = product_(i=1)^n (1 + h lambda_i) $
  כעת, נפתח את המכפלה (בדומה לפתיחת סוגריים בפולינום):
  + האיבר החופשי מתקבל מהכפלת כל ה־$1$־ים יחד, והוא שווה ל־$1$.
  + האיבר שמוכפל ב־$h$ בחזקת $1$ מתקבל מכל הפעמים שבחרנו $h lambda_i$ מסוגריים אחד, ו־$1$ מכל שאר הסוגריים. לכן, המקדם של $h$ הוא בדיוק סכום הערכים העצמיים:
  $ 1 + h(lambda_1 + lambda_2 + dots + lambda_n) + O(h^2) $
  + כל שאר המחוברים בפיתוח יכילו לפחות הכפלה של שני גורמי $h$ (כלומר $h^2, h^3$ וכו'), ולכן כולם יחד נבלעים ב־$o(h)$ כאשר $h arrow 0$.
  נציב את סכום הערכים העצמיים במקום העקבה, ונקבל מיד
  $ det(Id + h B) = 1 + h tr B + o(h) $
]

== שאלה 3
תהיי $U subset.eq RR^n$ קבוצה פתוחה ו־$F:U arrow RR^n$ פונקציה גזירה ברציפות.

== סעיף א'
נגדיר נקודת שיווי משקל יציבה אסימפטוטית של $F$.\

#proof[
  נגיד ש־$p$ היא נקודת שיווי משקל של $F$ אם מתקיים $F(p)=0$.\
  נגיד שהיא נקודת שיווי משקל יציבה אם לכל $epsilon > 0$ יש $delta > 0$ כך שאם $q in B(p, delta)$ אזי $phi_t (q) in B(p, epsilon)$.\
  נגיד שהיא נקודת שיווי משקל יציבה אסימפטוטית אם היא נקודת משקל יציבה ויש $eta > 0$ כך שלכל $q in B(p, eta)$ מתקיים $lim_(t arrow infinity) phi_t (q) = p$.
]

== סעיף ב'
תהיי $F:RR^2 arrow RR^2$ הפונקציה $ F(x_1, x_2) = (x_2^3, -x_1) $
ונתבונן במערכת
$ frac(dif x, dif t) = F(x(t)) $
נוכיח כי הערך של הפונקציה $H(x_1, x_2) = frac(x_1^2, 2) + frac(x_2^4, 4)$ נשמר לאורך מסלולי הזרימה של המערכת ונמצא את נקודות שיווי המשקל של המערכת ונקבע האם הן יציבות אסימפטוטית או לא יציבות.\

#proof[
  מכלל השרשרת
  $ frac(dif, dif t) H(x(t)) = chevron.l gradient H(x(t)), x^prime (t) chevron.r $
  כאשר
  $ gradient H = (x_1, x_2^3) $
  ולכן
  $ frac(dif, dif t) H(x(t)) = chevron.l (x_1 comma x_2^3), (x_2^3 comma -x_1) chevron.r = 0 $
  ולכן $H$ קבוע לאורך כל המסלול של המערכת.\
  נקודות שיווי משקל היא פשוט $(x_1, x_2) = (0,0)$ אז נשאר רק לסווגה.\
  לא ניתן להשתמש במבחן היעקוביאן כי $D F|_((0,0)) = mat(0, 0; -1, 0)$ ואז הערך העצמי הוא ערך אפס.\
  מצד שני, $H$ זו פונקציית ליאפונוב ולכן היא יציבה. אבל אין לנו עדיין וודאות על יציבות אסימפטוטית.\
  נניח בשלילה שזאת כן יציבות אסימפטוטית ולכן יש מסלול שמתחיל בנקודה $q != (0,0)$ שמתכנס לראשית.\
  מרציפות $H$ נקבל
  $ H(phi_t (q)) arrow H(0,0) = 0 $
  מצד שני $ H(phi_t (q)) = H(q) > 0 $
  לכל $t$ וזאת סתירה ולכן הנקודה יציבה אך לא יציבה אסימפטוטית.
]

== שאלה 4
אני לא למדתי שטורם־ליוביל.

== שאלה 5
לא בחומר.

= מועד ב' 2024
== שאלה 1
תהיי $a:[0, b) arrow RR$ פונקציה רציפה וניח כי $u:[0,b) arrow RR$ פונקציה גזירה כך שלכל $t in [0,b)$ מתקיים $ u^prime (t) <= a(t) u(t) $
נוכיח כי לכל $t in [0, b)$ מתקיים
$ u(t) <= u(0) exp(integral_0^t a(s) dif s) $

#proof[
  נגדיר $v(t) = e^(integral_0^t a(s) dif s)$ ונראה שהיא פותרת את הבעיה
  $ cases(v^prime (t) = a(t) v(t), v(0) = 1) $
  ואכן, $g(t)=integral_0^t a(s) dif s$ ומכלל שרשרת
  $ v^prime (t) = e^(g(t))g^prime (t) = e^(g(t)) dot.op a(t) = a(t) v(t) $
  ואכן מתקיים
  $ v(0)=e^(integral_0^0 a(s) dif s) = e^0 = 1 $
  נסתכל על $w(t) = frac(u(t), v(t))$, מתקיים
  $
    w^prime (t) = frac(u^prime (t) v(t) - v^prime (t) u(t), v(t)^2) = frac(v(t)(u^prime (t) - u(t)), a(t)v(t)^2) = frac(u^prime (t) - a(t) u(t), v(t))
  $
  נתון $u^prime (t) <= a(t) u(t)$ ולכן $w(t) <= 0$ וזו פונקציה מונוטונית יורדת, מתקיים
  $ w(0) = frac(w(0), v(0)) = frac(u(0), 1) = u(0) $
  כלומר $w(t) < = u(0)$ כלומר $u(t) <= u(0) v(t)$, כנדרש.
]

== שאלה 2
נתונה המערכת הלינארית
$ x^prime (t) = mat(-2, 1; 1, -2) x(t) + v $
היכן ש־$v in RR^2$ וקטור קבוע.

=== סעיף א'
באמצעות וריאציה של קבועים נכתוב נוסחה סגורה לפיתרון המשוואה עם תנאי התחלה $x_0 in RR^2$ ונוכיח שהנוסחה אכן מתארת את הפיתרון.\

#solution[
  נסמן $A = mat(-2, 1; 1, -2)$ ונחשב פולינום אופייני
  $
    P(A) = det(A-lambda I) = mat(delim: "[", -2-lambda, 1; 1, -2-lambda) = (-2-lambda)(-2-lambda)-1 = 4 + 4 lambda + lambda^2 - 1 = lambda^2 + 4lambda + 3 = (lambda+3)(lambda+1)
  $
  אז ערכים עצמיים הם $lambda_1 = -1, lambda_2 = -3$ ונמצא וקטורים עצמיים מתאימים
  $
    mat(-1, 1; 1, -1) vec(a, b) = 0 <==> vec(a, b) = vec(1, 1) \
    mat(1, 1; 1, 1) vec(a, b) = 0 <==> vec(1, -1)
  $
  ולכן המטריצות שלנו הן
  $ D = mat(-1, 0; 0, -3), quad P = mat(1, 1; 1, -1), quad P^(-1) = -frac(1, 2) mat(-1, -1; -1, 1) $
  נחשב
  $
    e^(t A) = frac(1, 2) mat(1, 1; 1, -1) mat(e^(-t), 0; 0, e^(-3t))mat(1, 1; 1, -1) = frac(1, 2) mat(e^(-t)+e^(-3t), e^(-t)-e^(-3t); e^(-t)-e^(-3t), e^(-t)+e^(-3t))
  $
  לפי עיקרון דומהל עבור $x(0)=x_0$ נקבל שמטריצת הפתרונות היסודית ניתנת על־ידי $pi(t) = e^(t A)$ ומתקיים
  $ x(t) = e^(t A) x_0 + integral_0^t e^((t-s)A) g(s) dif s $
  במקרה שלנו $g(s)=v$ וקטור קבוע ולכן ניתן לחשב את האינטגרל מימין
  $
    integral_0^t e^((t-s)A) v dif s = (integral_0^t e^((t-s)A) dif s)v = (integral_0^t e^(u A) dif u) v = A^(-1)(e^(t A) - Id) v
  $
  כאשר
  $ A^(-1) = frac(1, det(A)) mat(d, -b; -c, a) = mat(-frac(2, 3), -frac(1, 3); -frac(1, 3), -frac(2, 3)) $
  ולכן המועמדת לנוסחה סגורה היא
  $ x(t) = e^(t A) x_0 + A^(-1)(e^(t A) - Id )v $
  נשאר רק לבדוק ואכן
  $ x(0) = e^(t 0) x_0 + A^(-1)(e^(t 0)-Id ) v = x_0 $
  וגם
  $ x^prime (t) = A e^(t A) x_0 + A^(-1) A e^(t A) v = A e^(t A)x_0 + e^(t A) v $
  כעת  נציב $A x(t) + v$ ונקבל
  $
    A x(t) + v = A e^(t A) x_0 + A A^(-1) (e^(t A) - Id) v + v = A e^(t A) x_0 + (e^(t A) - Id )v + v = A e^(t A) x_0 + e^(t A ) v
  $
  ולכן זה אכן הפיתרון.
]

=== סעיף ב'
נראה שלכל $x_0 in RR^2$ הפיתרון למשוואה $x(0) = x_0$ מקיים $ lim_(t arrow infinity) x(t) = v $

#proof[
  אני לא מבינה מה רוצים ממני והג'מיני אומר שיש טעות בשאלה וזה אמור להתכנס לנקודת שיוי המשקל, זה גם מסתדר עם טענה שראינו: שני הערכים העצמיים של $A$ הם עם חלק ממשי שלילי ולכן לפי טענה שראינו
  $ e^(t A) stretch(arrow)_( t arrow infinity) 0 $
  ולכן
  $ lim_(t arrow infinity) x(t) = lim_(t arrow infinity) e^(t A)(x_0 + A^(-1) v) - A^(-1) v = - A^(-1) v $
  וזאת נקודת שיווי משקל שכן אם נסמן $p=-A^(-1) v$ נקבל
  $ A p + v = 0 $
]

== שאלה 3
תהיי $U subset.eq RR^n$ קבוצה פתוחה ו־$F:U arrow RR^n$ פונקציה ליפשיצית מקומית.

=== סעיף א'
נגדיר נקודת שיווי משקל יציבה של המערכת.\

#proof[
  נגיד ש־$p$ היא נקודת שיווי משקל של המערכת אם $F(x)=0$. \
  נגיד ש־$p$ נקודת שיווי משקל אם לכל $epsilon > 0$ יש $delta > 0$ כך שאם $q in B(p, delta)$ אזי $phi_t (q) in B(p, epsilon)$.
]

=== סעיף ב'
תהיי $x_0 in U$ כך ש־$F(x_0) =0$ ונניח שכל הערכים העצמיים של $D F(x_0 )$ הם בעלי חלק ממשי שלילי. נראה ש־$x_0$ נקודת שיווי משקל יציבה.\

#proof[
  בעצם אנחנו מתבקשים להוכיח את הקריטריון הלינארי ליציבות אסימפטוטית בלי השורה האחרונה שגם אותו אני עדיין לא זוכרת.\
  כזכור לכל $t in J_p^*$, $phi_t (x)$ גזירה ב־$p$ ו־$M=D phi_t (p)$ מקיימת
  $
    (star) space dif/(dif t) [D phi_t (p)] = D F (phi_t (p)) D phi_t (p), quad D phi_0 (p) = Id
  $
  אבל $p$ נקודת שיווי משקל כלומר $F(p)=0$ ולכן $phi_t (p) = p$ לכל $t$ ומכאן נובע ש־$(star)$ היא משוואה לינארית במקדמים קבועים ולכן $M^prime = D F (p) M$ ולכן
  $ D phi_t (p) = exp(t D F (p)) $
  בפרט מלמה שראינו נובע ש־$normop(exp(t D F(p))) stretch(arrow)_(t arrow infinity) 0$ ולכן יש $T > 0$ שעבורו
  $ normop(exp(T D F(p)))< 1/4 $
  יהי $epsilon > 0$ וקיימת $delta > 0$ כך שלכל $q in B_delta (p)$ ולכל $t in [0,T]$ מתקיים $phi_t (q) in B_epsilon (p)$ (מתלות רציפה בתנאי ההתחלה). בנוסף מהקירוב הלינארי
  $ phi_T (q) = phi_T (p) + D phi_T (p) (q-p) + o(norm(q-p)) $
  ולכן על־ידי הקטנה של $delta$ אם צריך נוכל להניח שהמחובר $o(p-q)$ לא עולה על $1/4 normop(p-q)$, כלומר $normop(phi_T (q) - phi_T (p)) <= normop(q-p)/2$.\
  בפרט $phi_T (q) in B_delta (p)$ שכן $phi_T (p) = p$ ושוב לכל $0<= t<=T$ מתקיים $phi_(T+t) (q) in B_epsilon (p)$ (שוב מהרציפות בתנאי ההתחלה) ואם נחזור על התהליך נקבל
  $ normop(phi_(k T) (q) - p)<= 2^(-k) norm(q-p) $
  לכל $t in [0,T]$ ולכל $k in NN$ מתקיים $phi_(k T + t) (q) in B_epsilon (p)$ כלומר לכל $t > 0$ מתקיים $phi_t (q) in B_epsilon (p)$ וזו בידיוק ההגדרה של יציבות.
]
== שאלה 4
אני לא יודעת שטורם־ליוביל.

== שאלה 5
נראה שאם $U subset.eq RR^n$ פתוחה ו־$f:U arrow RR$ רציפה ומקיימת את תכונת ערך הממוצע ב־$U$ אז $f$ חלקה.\

#proof[
  לכל $epsilon > 0$ נגדיר $U_epsilon colon.eq { x in U bar dist(x, boundary(U)> epsilon)}$.\
  נגדיר $eta : [0,infinity) arrow RR$ על־ידי $eta|_[0,frac(1, 2)) = 1$ ו־$eta(x)=0$ אחרת.\
  נגדיר $phi_epsilon : [0,infinity) arrow RR$ על־ידי
  $ phi_epsilon (y) = frac(eta(frac(norm(x), epsilon)), epsilon^n integral_(RR^n) eta(norm(z)) dif z) $
  עבור $f$ הנתונה נגדיר את השיכוך של $f$ ביחס לסקאלה $epsilon$ על־ידי
  $ f^epsilon = phi_epsilon * f = integral_(RR^n) phi(x-y) f(y) dif y $
  ולכן מספיק להראות שלכל $epsilon > 0$ מתקיים $f|_U_epsilon = u^epsilon$ ואז עבור $x in U_epsilon$ מתקיים
  $
    f^epsilon (x) &= integral_(B(x,r)) phi_epsilon (x-y) f(y) dif y \
    &= frac(1, integral_(RR^n) eta(norm(z)) dif z) integral_0^epsilon frac(eta(r, epsilon), epsilon^n) integral_boundary(B(x,r)) f(y) dif y dif r \
    &= frac(1, integral_(RR^n) eta(norm(z)) dif z) integral_0^epsilon frac(eta(r, epsilon), epsilon^n) integral_boundary(B(x,r)) f(x) dif y dif r \
    &= f(x) integral_(RR^n) phi(x-y) dif y \
    &= f(x)
  $
  שכן $f$ מקיימת את תכונת ערך הממוצע ו־$phi_epsilon$  חלקה והאינטגרל שלה על כל המרחב מנורמל.
]
