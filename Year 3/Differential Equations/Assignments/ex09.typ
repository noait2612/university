#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 09 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי מערכת שטורם ליוביל מהצורה
$ (star) space cases(dif/(dif t)(p(t) dif/(dif t) u(t)) + (q(t) + lambda)u(t) = 0, u(a)=u(b)=0) $
כאשר $p$ פונקצייה חיובית.

#subquestion()
יהי $V=C([a,b])$ מרחב הפונקציות הרציפות ונגדיר מכפלה פנימית על $V$ על־ידי
$ chevron.l u bar v chevron.r = integral_a^b u(x)v(x) dif x $
נגדיר $W=C_0^1 ([a,b])$ את מרחב הפונקציות הגזירות ברציפות ב־$[a,b]$ המתאפסות בקצוות הקטע.\
נגדיר $D:W arrow V$ על־ידי $D u = u^prime$ ונוכיח כי $D$ אופרטור אנטי־סימטרי

#proof[
  לכל $u,v in W$ מתקיים $u(a)=u(b)=0 = v(a) = v(b)$ ולכן
  $
    chevron.l Dif u|v chevron.r = integral_a^b u'(x)v(x) dif x
    = [u(x)v(x)]_(x=a)^(x=b) - integral_a^b u(x)v^prime(x)dif x
    =_((diamond)) - integral_a^b u(x)v^prime(x)dif x
    = -chevron.l u|D v chevron.r
  $
  כאשר $(diamond)$ זה מכך שהפונקציות מתאפסות בקצוות ומכאן האופרטור הוא אנטי־סימטרי.
]

#subquestion()
שוב נסמן $V=C([a,b])$ ונסמן $W=C_0^2([a,b])$ מרחב הפונקציות הגזירות פעמיים ברציפות המתאפסות בקצוות הקטע ויהי $Delta = D^2$ אופרטור הגזירה פעמיים.\
נראה כי $Delta : W arrow V$ אופרטור סימטרי ונסיק כי האופרטור $S:W arrow V$ המוגדר על־ידי
$ S u(t) = dif/(dif t)(p(t) dif/(dif t) u(t))+ q(t)u(t) $
הוא אופרטור סימטרי.

#proof[
  תהיינה $u,v in W$ ואז
  $
    chevron.l Delta u|v chevron.r = integral_a^b u^prime.double(x)v(x)dif x = [u'(x)v(x)]_(x=a)^(x=b) - integral_a^b u'(x)v'(x)dif x = - integral_a^b u^prime (x) v^prime (x)dif x
  $
  שוב $v(x)$ מתאפסות בקצוות הקטע ומתקיים
  $
    chevron.l u| Delta v chevron.r = integral_a^b u(x)v^prime.double (x)dif x = [u(x)v^prime (x)]_(x=a)^(x=b) - integral_a^b u^prime (x)v^prime (x) dif x = - integral_a^b u^prime (x)v^prime (x)dif x
  $
  כלומר $chevron.l Delta u bar v chevron.r = chevron.l u bar Delta v chevron.r$ והאופרטור סימטרי.\
  בשביל החלק השני של השאלה, מתקיים
  $
    chevron.l S u|v chevron.r = integral_a^b ((p u^prime)^prime v + q u v) dif t = integral_a^b (p u^prime )^prime v dif t + integral_a^b q u v dif t = [p u^prime v]_a^b - integral_a^b p u^prime v^prime dif t + integral_a^b q u v dif t= - integral_a^b p u^prime v^prime dif t+ integral_a^b q u v dif t
  $
  כלומר
  $ chevron.l S u|v chevron.r = - integral_a^b p u^prime v^prime dif t + integral_a^b q u v dif t $
  אבל ביטוי זה סימטרי בהחלפת $u,v$ ולכאן באותה דרך נקבל שזה שווה ל־$chevron.l u bar S v chevron.r$ ו־$S$ אופרטור סימטרי.
]

#pagebreak()

#subquestion()
נוכיח כי אם $T:W arrow V$ אופרטור סימטרי ו־$u,v$ וקטורים עצמיים של ערכים עצמיים שונים אזי $u perp v$ כלומר $chevron.l u bar v chevron.r =0$.\
נסיק כי אם $u,v$ פותרות את בעיה $(star)$ עבור ערכים עצמיים שונים אזי
$ integral_a^b u(t) v(t) dif t = 0 $

#proof[
  נניח $T u = lambda_1 u, v = lambda_2 v$ כאשר $lambda_1 != lambda_2$, מכך ש־$T$ סימטרי נקבל
  $
    chevron.l T u bar v chevron.r = chevron.l u bar T v chevron.r <==> chevron.l lambda_1 u bar v chevron.r = chevron.l u bar lambda_2 v chevron.r <==> lambda_1 chevron.l u bar v chevron.r = lambda_2 chevron.l u bar v chevron.r
  $
  אבל $lambda_1 != lambda_2$ ולכן בהכרח $chevron.l u bar v chevron.r$ כלומר קיבלנו אורתוגונליות.\
  עבור $(star)$ בעיית שטורם ליוביל האופרטור $S$ הוא סימטרי ולכן הפונקציות העצמיות השייכות לערכים עצמיים שונים מקיימים $chevron.l u bar v chevron.r = 0$ כלומר $integral_a^b u(t)v(t) dif t$.
]

#question()
יהיו $p,q$ פונקציות גזירות ברציפות כך ש־$p>0$, נתבונן בבעייה
$ cases(dif/(dif t) (p(t) dif/(dif t)u(t)) + (q(t)+lambda)u(t) = 0, u(a)=u(b)=0) $
בהינתן $lambda in RR$ נגדיר את הפונקציה $u_lambda (t)$ להיות הפיתרון לבעיה
$
  cases(
    dif/(dif t) (p(t) dif/(dif t) u(t))+(q(t)+lambda)u(t) = 0,
    u(a) = 0,
    u^prime (a) = 1
  )
$
הגדרנו קורדינאטות פולאריות של המערכת על־ידי
$
  p(t) u^prime_lambda (t) cos(theta_lambda (t)) \
  u_lambda (t) = r_lambda (t) sin(theta_lambda (t))
$
נוכיח כי $lambda mapsto theta_lambda (b)$ היא פונקציה רציפה לפי $lambda$.

#proof[
  נשים לב שמהרמז מתקבלת המשוואה הדיפרנציאלית מסדר ראשון עבור הזווית $theta_lambda (t)$
  $ theta_lambda^prime (t) = frac(1, p(t)) cos^2(theta lambda(t)) + (q(t)+ lambda) sin^2(theta lambda(t)) $
  נסמן את אגף ימין כפונקציה $F(t,theta,lambda)$. מהיות $p,q$ רציפות ו־$p$ חיובית, הפונקציה $F$ רציפה בכל המשתנים שלה ובפרט רציפה ב־$lambda$.\
  יתר על־כן, $F$ מקיימת את תנאי ליפשיץ ביחס ל־$theta$ באופן מקומי ותנאי ההתחלה הוא אחיד
  $ u(a)=0, u^prime (a) = 1 ==> theta_lambda (a) =0 $
  ממשפט התלות הרציפה בפרמטרים ובנתוני ההתחלה מתרגיל 4 שאלה 1, הפיתרון $theta_lambda (t)$ רציף כפונקציה של $lambda$ ולכן ההעתקה $lambda mapsto theta_lambda (b)$ היא פונקציה רציפה.
]

#question()
נוכיח את הנוסחה הבאה
$ divergence F = 1/r partial_r (r F_r) + 1/r partial_phi F_phi $
יהי $F:RR^2 arrow RR^2$ שדה וקטורי גזיר ונסמן
$ F=F_x hat(x) + F_y hat(y) $
נגדיר קורדינאטות גלילות על־ידי
$ x=r cos phi wide y = r sin phi $
ונגדי את וקטורי היחידה של הקורדינאטות הגליליות על־ידי $hat(r), hat(phi)$ והם ניתנים על־ידי
$
  hat(r)(x,y) = (x,y)/norm((x,y)) = (x hat(x)+ y hat(y))/sqrt(x^2+y^2) \
  hat(phi)(x,y) = (-y hat(x) + x hat(y))/sqrt(x^2+y^2)
$
ואז נרשום $F=F_r hat(r) + F_phi hat(phi)$.\
לבסוף נגדיר ב־$partial_x, partial_y$ את אופרטורי הגזירה לפי המשתנים הקרטזיים ו־$partial_r, partial_phi$ אופרטורי הגזירה לפי המשתנים הגליליים.

#subquestion()
נוכיח כי
$
  F_r = cos phi F_x + sin phi F_y = x/r F_x + y/r F_y \
  F_phi = -sin phi F_x + cos phi F_y = -y/r F_x + x/r F_y
$

#solution[
  מתקיים
  $
    F_r = F dot hat(r) = (F_x hat(x) + F_y hat(y)) dot (cos phi hat(x) + sin phi hat(y)) = F_x cos phi + F_y sin phi
  $
  נציב $cos phi = x/r$ ו־$sin phi = y/r$ ונקבל
  $ F_r = x/r F_x + y/r F_y $
  באופן דומה עבור הרכיב הזוויתי $F_phi$
  $
    F_phi = F dot hat(phi) = (F_x hat(x) + F_y hat(y)) dot (-sin phi hat(x) + cos phi hat(y)) = -F_x sin phi + F_y cos phi
  $
  נציב את הביטויים עבור הסינוס והקוסינוס ונקבל
  $ F_phi = -y/r F_x + x/r F_y $

]

#subquestion()
נוכיח כי $ partial_r = cos phi partial_x + sin phi partial_y = x/r partial_x + y/r partial_y \
partial_phi = -r sin phi partial_x + r cos phi partial_y = - y partial_x + x partial_y $

#solution[
  נחשב נגזרות חלקיות
  $
    (partial x) / (partial r) = cos phi = x/r , quad (partial y) / (partial r) = sin phi = y/r , quad (partial x) / (partial phi) = -r sin phi = -y , quad (partial y) / (partial phi) = r cos phi = x
  $
  משימוש פעמיים בכלל השרשרת נקבל
  $
    partial_r = cos phi partial_x + sin phi partial_y = x/r partial_x + y/r partial_y \
    partial_phi = -r sin phi partial_x + r cos phi partial_y = -y partial_x + x partial_y
  $
]

#subquestion()
נראה שמתקיים
$ divergence(F) = 1/r partial_r (r F_r) + 1/r partial_phi F_phi $

#solution[
  מתוך סעיפים 1 ו־2 נוכל לבודד את $F_x, F_y$ ואת אופרטורי הגזירה $partial_x, partial_y$ ולחשב
  $
    F_x = cos phi F_r - sin phi F_phi \
    F_y = sin phi F_r + cos phi F_phi \
    partial_x = cos phi partial_r - (sin phi)/r partial_phi \
    partial_y = sin phi partial_r + (cos phi)/r partial_phi
  $
  הדיברגנס בקואורדינטות קרטזיות הוא $divergence(F) = partial_x F_x + partial_y F_y$.\
  נציב ונגזרות לפי כלל המכפלה
  $
    partial_x F_x &= (cos phi partial_r - (sin phi)/r partial_phi) (cos phi F_r - sin phi F_phi) \
    &= cos^2 phi partial_r F_r - cos phi sin phi partial_r F_phi + (sin^2 phi)/r F_r + (sin phi cos phi)/r F_phi - (sin phi cos phi)/r partial_phi F_r + (sin^2 phi)/r partial_phi F_phi
    partial_y F_y \
    &= (sin phi partial_r + (cos phi)/r partial_phi) (sin phi F_r + cos phi F_phi) \
    &= sin^2 phi partial_r F_r + sin phi cos phi partial_r F_phi + (cos^2 phi)/r F_r - (sin phi cos phi)/r F_phi + (sin phi cos phi)/r partial_phi F_r + (cos^2 phi)/r partial_phi F_phi
  $
  נצמצם ונשתמש בזהות $cos^2 phi + sin^2phi =1$ ונקבל
  $
    divergence(F) = (cos^2 phi + sin^2 phi) partial_r F_r + 1/r (sin^2 phi + cos^2 phi) F_r + 1/r (sin^2 phi + cos^2 phi) partial_phi F_phi = partial_r F_r + 1/r F_r + 1/r partial_phi F_phi
  $
  לבסוף, נשים לב שניתן לרשום את שני האיברים הראשונים יחד כנגזרת של מכפלה
  $ 1/r partial_r (r F_r) = 1/r (F_r + r partial_r F_r) = 1/r F_r + partial_r F_r $
  נציב בחזרה ונקבל
  $ divergence(F) = 1/r partial_r (r F_r) + 1/r partial_phi F_phi $
]

#question()
#subquestion()
תהיי $Omega subset.eq RR^d$ פתוחה ויהיו $u:Omega arrow RR, F : Omega arrow RR^d$ העתקות גזירות. נוכיח כי
$ divergence(u F) = chevron.l gradient u bar F chevron.r + u divergence(F) $

#solution[
  נתון $divergence(u F) = sum_(i=1)^d partial_(x_i) (u F_i)$ ומכלל המכפלה לנגזרות
  $ sum_(i=1)^d partial_(x_i) (u F_i) = sum_(i=1)^d (partial_(x_i) u)F_i + sum_(i=1)^d u (partial_(x_i) F_i) $
  הסכום הראשון הוא המכפלה הסקלרית של $gradient$ ב־$F$ והסכום השני הוא $u$ כפול הדיברגנס של $F$
  $ chevron.l gradient u bar F chevron.r + u dot.op divergence(F) $
]

#subquestion()
תהיי $U subset.eq RR^d$ פתוחה וחסומה עם שפה חלקה ויהיו $u,v in C^2 (closure(Omega))$. נשתמש במשפט הדיברגנס כדי להראות את זהות גרין הראשונה
$
  integral_Omega u delta v = integral_boundary(Omega) u (partial u)/(partial nu) - integral_Omega chevron.l arrow(gradient) u bar arrow(gradient) v chevron.r
$

#solution[
  נציב את השדה הוקטורי $F=gradient v$ בתוצאת הסעיף הקודם ונקבל
  $
    divergence(u gradient v) = chevron.l gradient u bar gradient v chevron.r + u dot.op divergence(gradient v) = chevron.l gradient u bar gradient v chevron.r + u Delta v
  $
  נבצע אינטגרציה על $Omega$ ונפעיל את המשפט הדיברגנס על האגף השמאלי ונקבל
  $
    integral_Omega divergence(u gradient v) dif x = integral_boundary(Omega) chevron.l u gradient v bar nu chevron.r dif s = integral_boundary(Omega) u frac(partial v, (partial nu))
  $
  מצד שני אינטגרציה על אגף ימין מניבה
  $ integral_Omega chevron.l gradient u bar gradient v chevron.r + u Delta v dif x $
  כלומר
  $
    integral_Omega u Delta v = integral_boundary(Omega) u frac(partial v, partial nu) - integral_Omega chevron.l gradient u | gradient v chevron.r
  $
]

#subquestion()
תחת אותם תנאים של הסעיף הקודם נוכיח את זהות גרין השנייה
$
  integral_Omega u Delta v - integral_Omega v Delta u = integral_boundary(Omega) (u (partial v)/(partial nu) -v (partial u)/(partial nu) )
$

#solution[
  נרשום את זהות גרין הראשונה מהסעיף הקודם כאשר אנחנו מחליפים בין התפקידים של $u,v$
  $
    integral_Omega u Delta v = integral_boundary(Omega) u frac(partial v, partial nu) - integral_Omega chevron.l gradient u bar gradient v chevron.r \
    integral_Omega v Delta u = integral_boundary(Omega) v frac(partial u, partial nu) - integral_Omega chevron.l gradient v bar gradient u chevron.r
  $
  נחסר את שתי המשוואות ו־$integral_Omega chevron.l gradient u bar gradient v chevron.r$ יתבטל מהקומוטטיביות של המכפלה הפנימית ולכן
  $
    integral_Omega u Delta v - integral_Omega v Delta u = integral_boundary(Omega) u frac(partial v, partial nu) - v frac(partial u, partial nu) dif s
  $
]

#pagebreak()

#subquestion()
תהיי $U subset.eq RR^d$ פתוחה וחסומה עם שפה חלקה ונגדיר $C_0^2 (closure(Omega))$ מרחב הפונקציות ב־$C^2 (closure(Omega))$ שמתאפסות על שפת $Omega$.\
נסיק כי אם נתבונן על הלפלסיאן בתור אופרטור $Delta : C_0^2 (closure(Omega)) arrow C(closure(Omega))$ אז $Delta$ הוא אופרטור סימטרי.

#proof[
  יהיו $u,v in C_0^2 (closure(Omega))$ ולכן הן מתאפסות על $boundary(Omega)$ ולכן $u=v=0$ על $boundary(Omega)$.\
  מהסעיף הקודם נקבל
  $ integral_boundary(Omega) 0 dot.op frac(partial v, partial nu) - 0 dot.op frac(partial u, partial nu) dif s = 0 $
  ולכן נשארנו עם
  $ integral_Omega u Delta v - integral_Omega v Delta u = 0 ==> integral_Omega u Delta v = integral_Omega v Delta u $
  זה שקול בידיוק לכך ש־$chevron.l u bar Delta v chevron.r = chevron.l Delta u bar v chevron.r$ ולכן $Delta$ אופרטור סימטרי במרחב הזה.
]
