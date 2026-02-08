#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 12 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
השלמת משפטים.

#subquestion()
נוכיח את משפט ההעתקה הפתוחה: יהיו $G$ תחום ו־$f in Hol(G)$ לא קבועה. אז $f(G)$ פתוחה.

#proof[
  ניזכר במשפט העתקה מקומית: תהיי $f in Hol(G)$ לא קבועה, $z_0 in G$ ו־$w_0 = f(z_0)$. יהי $m$ סדר ההתאפסות של $f-w_0$ בנקודה $z_0$.\
  אז קיים $epsilon_0 > 0$ כך שלכל $0<epsilon<epsilon_0$ יש $delta>0$ כך שלכל $B(w_0, delta)^*$ יש בידיוק $m$ פתרונות שונים למשוואה $f(z)=w$ בכדור $B(z_0, epsilon)$.
]

#question()
נוכיח שהבאים שקולים:
+ התחום $G$ פשוט קשר
+ האינטגרל של כפונקציה הולומורפית ב־$G$ לאורך מסילה סגורה וחלקה למקוטעין הוא אפס
+ כל פונקציה הולומורפית ב־$G$ היא נגזרת של פונקציה הולומורפית
+ כל פונקציה הולומורפית ב־$G$ שלא מתאפסת היא בעלת לוגריתם
+ כל פונקציה הולומורפית ב־$G$ שלא מתאפסת היא בעלת שורש
+ לכל מסילה סגורה וחלקה למקוטעין ב־$G$ אינדקס הליפוף של כל נקודה שאינה ב־$G$ הוא אפס

#proof[
  נוכיח את הגרירות $1==>2==>3==>4==>5==>6$ ובתרגול ראינו $6==>1$ וזה יסיים.\
  $1==>2$: נניח ש־$G$ תחום פשוט קשר, כלומר $hat(CC) without G$ הוא קשיר כאשר $hat(CC) = CC union {infinity}$.\
  תהיי $gamma$ מעגל מוכלל ב־$G$, אז לכל $z_0 in.not G$ נובע כי $z_0 in hat(CC) without G$, אז $z mapsto ind_gamma (z)$ רציפה ומקבלת ערכים מהטבעיים על $hat(CC) without gamma$ אז היא חייבת להיות קבועה על $hat(CC) without G$ (בשביל הרציפות).\
  מכך ש־$ind_gamma (infinity) = 0$ אז $ind_gamma (z_0) = 0$ לכל $z_0 in.not G$ (כי $infinity in hat(CC) without G$).\
  ממשפט קושי המוכלל נובע שלכל $f in Hol(G)$ ולכל מעגל מוכלל ממקודם לכל $z in.not G$ מתקיים $integral_gamma f(z) dif z = 0$.\
  $2==>3$: תהיי $z_0 in G$ ולכל $z in G$ נגדיר $F(z) = integral_(gamma_z) f(zeta) dif zeta$ כאשר $gamma_z$ היא המסילה הרציפה למקוטעין המחברת בין $z_0$ ו־$z$.\
  אם $gamma_1, gamma_2$ הן שתי מסילות בין $z_0$ ל־$z$ אזי $gamma=gamma_1-gamma_2$ היא מסילה סגורה ומההנחה שלנו $integral_gamma f(z) dif z = 0$, כלומר $integral_(gamma_1) f = integral_(gamma_2) f$ ולכן $F(z)$ תלוי רק ב־$z$ ולא על המסילה ומניוטון לייבניץ' נקבל ש־$F'(z)=f(z)$ כלומר $f$ היא הנגזרת של פונקציה הולומורפית $F$.\
  $3==>4$: תהיי $f in Hol(G)$ כך ש־$f(z)!=0$ לכל $z in G$ ולכן הפונקציה $(f'(z))/f(z)$ היא פונקציה הולומורפית ומההנחה נובע שקיימת $g(z)$ כך ש־$g'(z) = (f'(z))/f(z)$ ונסתכל על הנגזרת של $f(z)e^(-g(z))$
  $ dif/(dif z) (f(z)e^(-g(z)))=f'(z)e^(-g(z))-f(z)g'(z)e^(-g(z))=e^(-g(z))(f'(z)-f(z) (f'(z))/f(z)) = 0 $
  כלומר, $f(z)e^(-g(z))=c$ עבור קבוע כלשהו ולכן $c=e^k$ עבור $k$ קבוע כלשהו.\
  כלומר, $f(z)=e^(g(z)+k)$ והפונקציה $L(z)=g(z)+k$ היא לוגריתם רציף של $f$.\
  $4==>5$: תהיי $g(z) in Hol(G)$ כך ש־$g(z)!=0$. מההנחה, קיימת $phi.alt(z) in Hol(G)$ כך ש־$e^(phi.alt(z))=g(z)$ ונגדיר $f(z)=e^(1/2 phi.alt(z))$, אז
  $ (f(z))^2=(e^(1/2 phi.alt(z)))^2 = e^(phi.alt(z))=g(z) $
  כלומר $f$ היא שורש של $g$.\
  $5==>6$: נקבע $gamma subset G$ ו־$z_0 in.not G$, אז הפונקציה $f(z)=z-z_0$ היא הולומורפית ולא נעלמת ב־$G$.\
  מההנחה, $f$ בעלת שורש ולכן $(g_1(z))^2=z-z_0$ ולפי הגדרת אינדקס הליפוף
  $
    ind_gamma (z_0) = 1/(2pi i) integral_gamma 1/(z-z_0) dif z = 1/(2pi i) integral_gamma (2g_1 (z)g'_1(z))/(g_1(z))^2 = 1/(pi i) integral_gamma (g'_1(z))/(g_1(z)) dif z = 2 dot.op ind_(g_1 compose gamma) (0)
  $
  ולכן $ind_gamma(z_0)$ חייב להיות זוגי.\
  $g_1(z)$ לא עלמת ולכן מההנחה יש להה שורש, $g_2$. נמשיך ונחזור על התהליך באינדוקציה ונקבל $ind_gamma (z_0)$ מתחלק ב־$2^k$ לכל $k in NN$ אבל המספר היחידי שמתחלק בכל החזקות של $2$ הוא אפס ולכן $ind_gamma (z_0) = 0$.
]

#question()
תהיי $f:DD arrow.r DD$ הולומורפית בעלת המשכה רציפה ל־$overline(D)$ ונניח בנוסף ש־$f$ איננה קבועה וש־$f(partial DD) subset.eq partial DD$.

#subquestion()
נוכיח שיש $z in DD$ כך ש־$f(z)=0$.

#proof[
  מכך ש־$f(partial DD) subset.eq partial DD$ נובע כי $abs(f(z))=1$ לכל $z in partial DD$.\
  מכך ש־$f$ הולומורפית על $DD$  ורציפה על $overline(DD)$, ניתן להשתמש בעיקרון המקסימום.\
  מכך ש־$abs(f(z))=1$ על $partial DD$ ו־$f$ היא לא קבועה, נובע כי לכל $z in DD$ מתקיים
  $ abs(f(z))<1 $ ולכן $f(DD) subset DD$.\
  על השפה $partial DD$, $f$ ממפה את מעגל היחידה לעצמו, כלומר העקומה $f(e^(- i t))$ מסתובבת (מלופפת) $k$ פעמים סביב הראשית.
  מהיות $f$ לא קבועה ורציפה על $partial DD$ נובע כי אינדקס הליפוף הוא לפחות 1, ומעיקרון הארגומנט כמות האפסים של $f$ על $DD$ כולל ריבויים זהה לאינדקס הליפוף $k$, ולכן לכל הפחות ל־$f$ יש אפס אחד.
]

#subquestion()
עבור $a in DD$ תהיי $phi_a : overline(DD) arrow overline(DD)$ ההעתקה $phi_a (z) = (a-z)/(1-overline(a)z)$
נוכיח כי קיימים $n, m_k in NN union {0},a_k in DD$ ו־$abs(lambda)=1$ כך שמתקיים
$ f(z) lambda product_(k=1)^n phi_(a_k)^(m_k) (z) $

#proof[
  ראשית מתקיים
  + $phi_a$ הולומורפית על $DD$ ורציפה על $overline(DD)$
  + $phi_a (DD) = DD$ ו־$phi_a (partial DD) = partial DD$
  + $phi_a (a) = 0, phi_a (0) = a$
  + $abs(phi_a (z))=1$ לכל $z in partial DD$
  כלומר ,$phi_a$ הוא אוטומורפיזם של מעגל היחידה שמזיז את $a$ ל־$0$.\
  ראינו של־$f$ יש לפחות אפס אחד ב־$DD$ ומהיות $f$ הולומורפית על $DD$ ורציפה על $overline(DD)$ נובע כי מספר האפסים האלו הוא סופי, ולכן יש $a_1, dots.h, a_n in DD$ עם ריבוי $m_1, dots.h, m_n in NN$.\
  נגדיר
  $ g(z) = product_(k=1)^n phi_(a_k)^(m_k) (z) $
  אז $g$ הולומורפית על $DD$, $g(partial DD) subset partial DD$ ול־$g$ יש בידיוק את אותה כמות אפסים כמו של $f$ מבנייה והפונקצייה
  $ h(z) = f(z)/g(z) $
  היא הולומורפית ולא מתאפסת על $DD$ ורציפה על $overline(DD)$ ולכן $z in partial DD$ מתקיים
  $ abs(h(z))=abs(f(z))/abs(g(z))=1 $
  אבל $h$ הולומורפית על $DD$ ורציפה על $overline(DD)$ ועל השפה מקבלת $abs(h)=1$ ולכן מעיקרון המקסימום נובע כי $h(z)=lambda$ עבור $abs(lambda)=1$ לכל $z$.\
  כלומר
  $ f(z) = lambda product_(k=1)^n phi_(a_k)^(m_k) (z) $
  כנדרש.
]

$ e^(1/pi log(-t e^((-pi i)/2-i epsilon)))=e^(1/pi (log(-t)-(pi/2+epsilon)i) $
