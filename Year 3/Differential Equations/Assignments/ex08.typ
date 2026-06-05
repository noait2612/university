#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 08 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נתבונן בבעיית תנאי ההתחלה
$
  (star) space cases((partial^2 u)/(partial t^2) (x,t) = c^2 (partial^2 u)/(partial x^2) (x,t), u(x,0) = f(x), (partial u)/(partial t)(x,0) = g(x))
$
כאשר $f in C^2 (RR), g in C^1 (RR)$ ונניח כי $u:RR^2 arrow RR$ פונקציה גזירה פעמיים, נקבע $x_0 in RR, L>0$. לכל $tau in [0, L/c]$ נגדיר
$
  E(tau) = 1/2 integral_(x_0+c tau - L)^(x_0 + L - c tau) ((partial u)/(partial t) (x,tau))^2 + c^2 ((partial u)/(partial x) (x, tau))^2 (x, tau) dif x
$

#subquestion()
נסביר בקצרה מדוע $E(tau)$ גזירה.

#proof[
  נבחין שהאינטגרנד גזיר כי $u in C^2$ ולכן הנגזרות הראשונות שלה קיימות, רציפות וגזירות ברציפות וגם הריבועים של הנגזרות האלו גזירות ברציפות וגם גבולות האינטגרציה הם פונקציות לינאריות גזירות ולכן לפי כלל לייבניץ לגזירה תחת סימן האינטגרנד $E(tau)$ גזירה.
]

#subquestion()
נראה כי אם $u$ פותרת את משוואת הגלים אז $(dif E)/(Dif tau)<=0$ כלומר $E$ מונוטונית יורדת.\

#proof[
  נעזר בהנחייה. נסביר תחילה למה אפשר להסתכל בלי הגבלת הכלליות על למה $x_0 =0$ שכן משוואת הגלים המקורית לא תלויה בקורדינאטה $x$ ולכן אם נגדיר \
  $tilde(x)=x-x_0$ הנגזרות החלקיות לא ישתנו כלל וגבולות האינטגרציה יזוזו להיות סביב ה־$0$ ולכן סביב $x_0$.\
  נחשב את $dif/(dif tau)E(tau)$. מכלל לייבניץ נקבל מגזירה (ועם לכפול ב־$2$) ולשם הפשטות נסמן את האינטגרנד הפנימי ב־$F$
  $
    2 dif/(dif tau) E(tau) = F(L-c tau, tau) dot.op (-c) - F(c tau - L, tau) dot.op (c) + integral_(c tau - L)^(L-c tau) (partial F)/(partial tau) (x,tau) dif x
  $
  נסמן את האינטגרל מהרמז ב־$I$ ומאינטגרציה בחלקים נקבל
  $
    I = 2 integral_(c tau - L)^(L - c tau) ( (partial u)/(partial t) (partial^2 u)/(partial t^2) + c^2 (partial u)/(partial x) (partial^2 u)/(partial x partial t) ) dif x
  $
  $u$ פותרת את משוואת הגלים ולכן ניתן להחליף את $(partial^2 u)/(partial t^2)$ ב־$c^2 (partial^2 u)/(partial x^2)$ ולקבל
  $
    I = 2 integral_(c tau - L)^(L - c tau) ( c^2 (partial u)/(partial t) (partial^2 u)/(partial x^2) + c^2 (partial u)/(partial x) (partial^2 u)/(partial x partial t) ) dif x
  $
  אבל זו בידיוק נגזרת מכפלה לפי $x$ ולכן מהמשפט היסודי של החדו"א נקבל
  $
    I = 2 c^2 integral_(c tau - L)^(L - c tau) (partial)/(partial x) ( (partial u)/(partial t) (partial u)/(partial x) ) dif x = 2 c^2 [ (partial u)/(partial t) (partial u)/(partial x) ]_(x=c tau - L)^(x=L - c tau)
  $
  נסמן $u_t, u_x$ ונקבל לנגזרות החלקיות ונקבל
  $
    (diamond) space 2 E^prime (tau) = underbrace(-c u_t^2 - c^3 u_x^2 + 2c^2 u_t u_x, x=L-c tau) + underbrace(-c u_t^2 - c^3 u_x^2 - 2c^2 u_t u_x, x=c tau - L)
  $
  נשים לב שהרמז של האי־שיוויון אומר
  $ abs(a b) <= 1/2 (a^2+b^2) <==> 2 abs(a b) <= a^2 + b^2 <==> plus.minus 2 a b <= 2 abs(a b) <= a^2+b^2 $
  נבחר $a=u_t, b= c u_x$ ונקבל
  $
    plus.minus 2 c abs(u_t u_x) <= u_t^2 + (c u_x)^2 = u_t^2 + c^2 u_x^2 <==>_(c > 0) plus.minus 2 c^2 u_t u_x <= 2 c^2 abs(u_t u_x) <= c u_t^2 + c^3 u_x^2 \
    ==> +2c^2 u_t u_x \le c u_t^2 + c^3 u_x^2 wide -2c^2 u_t u_x \le c u_t^2 + c^3 u_x^2
  $
  ואם נעביר אגפים נקבל
  $ -c u_t^2 - c^3 u_x^2 plus.minus 2c^2 u_t u_x <= 0 $
  אבל זה בידיוק המחוברים ב־$(diamond)$ ולכן גם הסכום שלהם הוא מספר שלילי או אפס ולכן $dif/(dif tau) E(tau)<=0$.
]

#subquestion()
נסיק כי הפתרון לבעיה $(star)$ הוא יחיד.

#proof[
  נעזר בהנחייה, נניח כי קיימות $v_2 (x,t), v_1 (x,t)$ שפותרות את בעיית תנאי ההתחלה $(star)$ ונגדיר $u(x,t) = v_1 (x,t) - v_2 (x,t)$.\
  מכיוון שמשוואות הגלים היא לינארית אז $u$ פותרת את המשוואה ההומגנית עם תנאי התחלה אפס שכן
  $
    cases(
      u_(t t) = (v_1)_(t t) - (v_2)_(t t) = c^2 (v_1)_(x x) - c^2 (v_2)_(x x) = c^2 (v_1 - v_2)_(x x) = c^2 u_(x x),
      u(x,0) = v_1 (x,0) - v_2 (x,0) = f(x) - f(x) = 0,
      u_t (x,0) = (v_1)_t (x,0) - (v_2)_t (x,0) = g(x) - g(x) = 0
    )
  $
  אז $u(x,0) =0$ לכל $x$ ולכן גם $u_x (x,0) =0$.\
  עבור $tau=0$ מתקיים
  $ E(0) = 1/2 integral_(x_0 - L)^(x_0 + L) ( (u_t(x,0))^2 + c^2 (u_x(x,0))^2 ) dif x $
  ומתנאי ההתחלה שמצאנו
  $ E(0) = 1/2 integral_(x_0 - L)^(x_0 + L) (0^2 + c^2 dot.op 0^2) dif x = 0 $
  בסעיף הקודם ראינו $dif/(dif tau) E(tau) <=0$ ולכן $E(tau)$ פונקציה מונוטונית יורדת ולכן לכל $tau>=0$ מתקיים גם
  $ E(tau) <= E(0) = 0 $
  אבל מצד שני $E(tau)$ מוגדרת כאינטגרל על סכום של ריבועים אי־שליליים ואינטגרל של פונקציה אי־שלילית הוא גדול או שווה לאפס ולכן גם
  $ E(tau)>=0 $
  מטריכוטומיה נקבל $E(tau)=0$ לכל $tau in [0, L/c]$.\
  אבל אינטגרנד של פונקציה רציפה ואי־שלילית שהאינטגרל שלה הוא אפס הפונקציה חייבת להיות זהותית אפס בכל תחום האינטגרציה ולכן
  $ (u_t (x,tau))^2 + c^2 (u_x (x,tau))^2 = 0 <==> u_t (x, tau) = 0, quad u_x (x, tau) = 0 $
  אז הנגזרות החלקיות מתאפסות ולכן הפונקציה $u(x, tau)$ היא פונקציה קבועה וידוע כי $u(x,0) =0$ ולכן הקבוע הוא אפס, כלומר
  $ u(x,tau) = 0 <==> v_1 (x,tau) - v_2 (x,tau) = 0 <==> v_1 (x,tau) = v_2 (x,tau) $
  משרירותיות $L, x_0$ נקבל שהשיוויון מתקיים לכל $x,t$ והפיתרון הוא יחיד.
]

#question()
נתבונן בבעיה
$
  (star star) space cases(c(x) rho(x) (partial T)/(partial t) = partial/(partial x) (K(x) (partial T)/(partial x)) space (x comma t) in [0,L] times RR_(>=0), T(0,t) = T(L, t) = 0)
$
כאשר $rho, c, K$ פונקציות גזירות ברציפות וחיוביות ו־$0< L in RR$.\
נניח כי איננו פיזקאים $c(x)=1$ ונמצא מערכת שטורם ליוביל כך שאם $T$ פיתרון ל־$(star star)$ מהצורה $T(x,t) = f(t)g(x)$ אז $g(x)$ היא פונקציה עצמית של אותה ומערכת ונמצא את הצורה הכללית של $f(t)$.

#solution[
  נציב $T(x,t) = f(t) g(x)$ ב־$(star star)$ ונקבל
  $
    rho(x) f^prime (t) g(x) = partial/(partial x) (K(x) f(t) g^prime (x)) <==> rho(x) f^prime (t) g(x) = f(t) d/(d x) (K(x) g^prime (x))
  $
  כדי להפריד משתנים, נחלק את שני האגפים בביטוי $rho(x) f(t) g(x)$ (תחת ההנחה שהוא שונה מאפס) ונקבל
  $ (f^prime (t))/(f(t)) = 1/(rho(x) g(x)) d/(d x) (K(x) g^prime (x)) $
  אגף שמאל תלוי ב־$t$ בלבד ואגף ימין תלוי ב־$x$ בלבד וזה ייתכן רק אם שני האגפים שווים לקבוע בלתי תלוי $-lambda$
  $ (f^prime (t))/(f(t)) = 1/(rho(x) g(x)) d/(d x) (K(x) g^prime (x)) = -lambda $
  (אותו טריק מההרצאה שמניחים ש־$lambda>0$ ועושים את זה כדי לשמור על סימן, אבל זה נובע ממשוואות הזמן כי
  $ (f^prime (t))/f(t) = K ==> f^prime (t) = K f(t) $
  ולכן $f(t)=C e^(K t)$ ולכן לא ייתכן ש־$K$ חיובי כי הטמפרטורה תגדל מעריכית לאינסוף  ככל שהזמן עובר והמוט לא יכול להתחמם מעצמו בלי אנרגיה. אם $K$ שלילי הטמפרטורה תדעך לאפס ככל שהזמן עובר וזה הגיוני כי גוף חם שמתקרר מהסביבה שלו אז אנחנו מכריחים את הקבוע להיות שלילי)\
  מכאן אנו מקבלים שתי משוואות דיפרנציאליות רגילות. נתחיל בבניית המערכת עבור $x$: ניקח את האגף התלוי ב־$x$ ונשווה ל־$-lambda$ ונקבל
  $
    1/(rho(x) g(x)) d/(d x) (K(x) g^prime (x)) = -lambda <==>d/(d x) (K(x) g^prime (x)) + lambda rho(x) g(x) = 0 <==>(K(x) g^prime (x))^prime + lambda rho(x) g(x) = 0
  $
  נתון תנאי השפה $T(0,t) = T(L,t) = 0$ ומתקיים $T(x,t)=f(t)g(x)$ שהוא פיתרון לא טריוויאלי ולכן בהכרח מתקיים
  $
    f(t)g(0) = 0 <==> g(0) = 0 \
    f(t)g(L) = 0 <==> g(L) = 0
  $
  לכן, מערכת שטורם־ליוביל המבוקשת היא בעיית שפת הערך הבאה:
  $
    cases(
      d/(d x) (K(x) g^prime (x)) + lambda rho(x) g(x) = 0,
      g(0) = 0,
      g(L) = 0
    )
  $
  נשים לב שמשוואה זו היא בדיוק בצורת שטורם־ליוביל עבור $q(x)=0, p(x) = K(x), w(x) = rho(x)$ ומתקיים
  $ (p(x)y^prime)^prime + (q(x) + lambda w(x))y = 0 $
  בשביל הצורה הכללית של $f(t)$, ניקח את האגף התלוי ב־$t$ מתוך משוואת ההפרדה
  $ (f^prime (t))/(f(t)) = -lambda <==> f^prime (t) = -lambda f(t) $
  זו משוואה דיפרנציאלית לינארית הומוגנית מסדר ראשון הניתנת להפרדת משתנים או שאפשר להשתמש מהטריק ממרוכבות על חוקי נגזרת כאלו ולקבל שהפיתרון הכללי שלה הוא פונקציה מעריכית $f(t)=C e^(-lambda t)$ עבור $C$ קבוע ממשי או מורכב.
]

#question()
תהיי מערכת שטורם ליוביל רגולרית
$
  (star star star) space cases(dif/(dif t) (p(t) dif/(dif t) u(t)) + (q(t) + lambda rho(t)) u(t) = 0, u(t) = 0, u(a) = u(b) =0)
$
כאשר $p, rho$ פונקציות חיוביות ונגדיר $T = integral_a^b sqrt(rho(s)/p(s))dif s$. נתבונן במערכת
$ (star star star star) space cases(w^prime.double (tau) + (Q(tau) + lambda)w(tau) = 0, w(0) = w(T) = 0) $
כאשר הפונקציה $Q:[0,T] arrow RR$ מוגדרת על־ידי
$
  Q(integral_a^t sqrt(rho(s)/p(s)) dif s) = 1/rho(t) (q(t) + (p(t)rho(t))^(1/4) dif/(dif t) (p(t) dif/(dif t) p(t)rho(t))^(-1/4))
$
תהיי $w:[0,T] arrow RR$ ונגדיר $u:[a,b] arrow RR$ על־ידי
$ u(t) = (p(t)rho(t))^(-1/4) w(integral_a^t sqrt(rho(s)/p(s)) dif s) $

#subquestion()
נראה כי
$ integral_a^b rho(t) u^2 (t) dif t = integral_0^T w^2(tau) dif tau $
ההוכחה היא ל־$w^2 (tau)$ ולא ל־$w(tau)$ מחוקי חזקות...

#solution[
  נציב ומהגדרה נקבל
  $
    integral_a^b rho(t) u^2 (t) dif t &= integral_a^b rho(t) [ (p(t)rho(t))^(-1/4) w(tau(t)) ]^2 dif t \
    &= integral_a^b rho(t) (p(t)rho(t))^(-1/2) w^2 (tau(t)) dif t = integral_a^b rho(t) p(t)^(-1/2) rho(t)^(-1/2) w^2 (tau(t)) dif t \
    &= integral_a^b rho(t)^(1/2) p(t)^(-1/2) w^2 (tau(t)) dif t \
    &= integral_a^b sqrt(rho(t)/p(t)) w^2 (tau(t)) dif t
  $
  נשתמש בהחלפת משתנים על־ידי $tau(t) = integral_a^t sqrt(rho(s)/p(s)) dif s$ ולכן מהמשפט היסודי $(dif tau)/(dif t) = sqrt(rho(t)/p(t)) arrow.double dif tau = sqrt(rho(t)/p(t)) dif t$.\
  יש לנו גבולות אינטגרציה חדשים: $t=a$ נהפך ל־$tau(a) = integral_a^a sqrt(rho/p) dif s = 0$ ו־$t=b$ נהפך ל־$tau(b) = integral_a^b sqrt(rho/p) dif s = T$
  ולכן
  $
    integral_a^b rho(t) u^2 (t) dif t = integral_a^b sqrt(rho(t)/p(t)) w^2 (tau(t)) dif t = integral_0^T w^2 (tau) dif tau
  $
]

#pagebreak()

#subquestion()
נגדיר $tau(t) = integral_a^t sqrt(rho(s)/p(s)) dif s$ ונסמן $w^prime = (partial w)/(partial tau)$, נראה שמתקיים
$
  p (partial u)/(partial t) = (p rho)^(1/4) (partial w)/(partial tau) (tau(t)) + p w(tau(t))partial/(partial t) (p rho)^(-1/4)
$

#solution[
  נגזור את $u(t)$ לפי $t$ ונקבל
  $
    (partial u)/(partial t) = (partial)/(partial t) (p rho)^(-1/4) dot.op w(tau(t)) + (p rho)^(-1/4) dot.op (partial w)/(partial tau) dot.op (dif tau)/(dif t) =_((dif tau)/(dif t) = sqrt(rho/p) = rho^(1/2) p^(-1/2)) = (partial u)/(partial t) = w(tau(t)) (partial)/(partial t)(p rho)^(-1/4) + (p rho)^(-1/4) rho^(1/2) p^(-1/2) (partial w)/(partial tau)
  $
  ולכן
  $
    p (partial u)/(partial t) = p w(tau(t)) (partial)/(partial t)(p rho)^(-1/4) + p dot.op (p rho)^(-1/4) rho^(1/2) p^(-1/2) (partial w)/(partial tau)
  $
  נפשט את אגף ימין לפי הנגזרת $w$ ונקבל
  $
    p dot.op p^(-1/4) dot.op p^(-1/2) dot.op rho^(-1/4) dot.op rho^(1/2) = p^(1 - 1/4 - 1/2) rho^(-1/4 + 1/2) = p^(1/4) rho^(1/4) = (p rho)^(1/4)
  $
  נציב בחזרה ונקבל
  $
    p (partial u)/(partial t) = (p rho)^(1/4) (partial w)/(partial tau) (tau(t)) + p w(tau(t)) (partial)/(partial t) (p rho)^(-1/4)
  $
]

#subquestion()
נראה כי
$
  partial/(partial t) (p partial/(partial t) u) + q u = rho^(3/4) p^(-1/4) (partial^2 w)/(partial tau^2) (tau(t)) + rho^(3/4) p^(-1/4) Q(tau(t))w(tau(t))
$

#solution[
  נסמן $v(t) = (p(t) rho(t))^(-1/4)$ ונזכור $(partial tau)/(partial t) = sqrt(rho/p) = rho^(1/2) p^(-1/2)$.\
  מהסעיף הקודם נקבל $ p (partial u)/(partial t) = (p rho)^(1/4) (partial w)/(partial tau) + p v^prime (t) w $
  נגזור שוב לפי $t$
  $
    (partial)/(partial t) (p (partial u)/(partial t)) = (partial)/(partial t) [ (p rho)^(1/4) (partial w)/(partial tau) ]) + (partial)/(partial t) [ p v^prime (t) w ] = ((p rho)^(1/4))^prime (partial w)/(partial tau) + (p rho)^(1/4) (partial^2 w)/(partial tau^2) dot.op underbrace(rho^(1/2) p^(-1/2), (partial tau)/(partial t)) + (p v^prime)^prime w + p v^prime (partial w)/(partial tau) dot.op underbrace(rho^(1/2) p^(-1/2), (partial tau)/(partial t))
  $
  נחבר לפי מקדמי נגזרות של $w$
  + המקדם של הנגזרת השנייה $(partial^2 w)/(partial tau^2)$
    $ (p rho)^(1/4) rho^(1/2) p^(-1/2) = p^(1/4 - 1/2) rho^(1/4 + 1/2) = p^(-1/4) rho^(3/4) $
  + המקדם של $w$ הוא $(p v^prime)^prime$
  + המקדם של הנגזרת הראשונה של $w$
    $ ((p rho)^(1/4))^prime + p v^prime rho^(1/2) p^(-1/2) = ((p rho)^(1/4))^prime + p^(1/2) rho^(1/2) v^prime $
  נזכור שהגדרנו $v = (p rho)^(-1/4)$, ולכן מתקיים $(p rho)^(1/4) = v^(-1)$ ונרצה להראות שהמקדם של הנגזרת הראשונה הוא אפס, אז נגזור שוב לפי $t$
  $ ((p rho)^(1/4))^prime = -v^(-2) v^prime = -((p rho)^(-1/4))^(-2) v^prime = -(p rho)^(1/2) v^prime $
  נציב במקדם שלנו ונקבל $-(p rho)^(1/2) v^prime + (p rho)^(1/2) v^prime = 0$ ולכן כל הביטוי שלנו לעיל נהפך להיות
  $
    (partial)/(partial t) (p (partial u)/(partial t)) = p^(-1/4) rho^(3/4) (partial^2 w)/(partial tau^2) + (p v^prime)^prime w
  $
  נוסיף את $q u$ כאשר אנחנו זוכרים ש־$u = v w$ ונקבל
  $
    (partial)/(partial t) (p (partial u)/(partial t)) + q u = p^(-1/4) rho^(3/4) (partial^2 w)/(partial tau^2) + (p v^prime)^prime w + q v w = p^(-1/4) rho^(3/4) (partial^2 w)/(partial tau^2) + p^(-1/4) rho^(3/4) [ p^(1/4) rho^(-3/4) ( (p v^prime)^prime + q v ) ] w
  $
  נסתכל על הסוגריים המרובעים
  $
    p^(1/4) rho^(-3/4) q v + p^(1/4) rho^(-3/4) (p v^prime)^prime = p^(1/4) rho^(-3/4) q (p rho)^(-1/4) + p^(1/4) rho^(-3/4) (partial)/(partial t) ( p (partial)/(partial t) (p rho)^(-1/4) ) = 1/rho q + 1/rho p^(1/4) rho^(1/4) (partial)/(partial t) ( p (partial)/(partial t) (p rho)^(-1/4) ) = 1/rho ( q + (p rho)^(1/4) (partial)/(partial t) ( p (partial)/(partial t) (p rho)^(-1/4) ) )
  $
  וזו בידיוק ההגדרה של $Q(tau)$ וקיבלנו
  $
    (partial)/(partial t) (p (partial u)/(partial t)) + q u = rho^(3/4) p^(-1/4) (partial^2 w)/(partial tau^2) (tau(t)) + rho^(3/4) p^(-1/4) Q(tau(t)) w(tau(t))
  $
]

#subquestion()
נסיק כי $u$ פותרת את בעיה $(star star star)$ אם ורק אם $w$ פותרת את בעיה $(star star star star)$ ובמקרה והן פתרון למערכות הערך העצמי שלהן זהה.

#proof[
  לפי מערכת $(star star star)$, משוואת הערך העצמי היא $ (partial)/(partial t) (p (partial u)/(partial t)) + q u + lambda rho u = 0 $
  נציב את הביטוי שפיתחנו בסעיף ג' עבור שני האיברים הראשונים באגף שמאל $ rho^(3/4) p^(-1/4) [ w^prime.double + Q w ] + lambda rho u = 0 $
  נציב את הגדרת $u = (p rho)^(-1/4) w$ לתוך האיבר האחרון
  $ rho^(3/4) p^(-1/4) [ w^prime.double + Q w ] + lambda rho (p rho)^(-1/4) w = 0 $
  נפשט את המקדם של האיבר האחרון
  $ lambda rho p^(-1/4) rho^(-1/4) = lambda p^(-1/4) rho^(3/4) $
  נוציא את הגורם המשותף $p^(-1/4) rho^(3/4)$ מכל המשוואה
  $ p^(-1/4) rho^(3/4) [ w^prime.double + Q w + lambda w ] = 0 $
  מכיוון שנתון $p, rho$ הן פונקציות חיוביות ממש בקטע $[a,b]$, הגורם $p^(-1/4) rho^(3/4)$ אינו יכול להתאפס. לכן ניתן לחלק בו את המשוואה ולקבל
  $ w^prime.double + (Q + lambda) w = 0 $
  שזוהי בדיוק המשוואה הדיפרנציאלית של בעיה $(star star star star)$.\
  נבדוק את תנאי השפה
  $ u(a) = 0 <==> (p(a)rho(a))^(-1/4) w(tau(a)) = 0 <==> w(0) = 0 $
  שכן המקדם חיובי, אז
  $ u(b) = 0 <==> (p(b)rho(b))^(-1/4) w(tau(b)) = 0 <==> w(T) = 0 $
  הראינו שקיימת שקילות מלאה בין המשוואות הדיפרנציאליות ובין תנאי השפה שלהן תחת אותה החלפת משתנים.\
  לכן $u$ פותרת את בעיה $(star star star)$ עם ערך עצמי $lambda$ אם ורק אם $w$ פותרת את בעיה $(star star star star)$ עם אותו ערך עצמי $lambda$.
]
