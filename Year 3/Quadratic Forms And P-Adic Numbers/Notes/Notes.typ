#import "../../../src/article.typ": *
#show: article.with(
  title: [ תבניות ריבועיות ומספרים $P$־אדיים ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#outline(depth: 1)

= הרצאה 3 – 28/04
_תזכורת:_
#proposition[
  יהי $V$ מרחב וקטורי נוצר סופית מעל $FF$ ו־$g$ תבנית בילנארית סימטרית על $V$.\
  אז קיים בסיס $cal(B)$ של $V$ כך ש־$[g]_(cal(B))$ מטריצה אלכסונית.
]
#corollary[
  לכל $A in M_n (FF)$ סימטרית קיימת מטריצה $D in M_n (FF)$ אלכסונית אשר חופפת ל־$A$.
]
-- סוף התזכורת -- \
יהי $FF$ שדה ונסתכל על $(FF^times)^2 = {a^2 bar a in FF^times}$ זו תת־חבורה של $FF^times$ ביחס לכפל.\
נסמן ב־$pi: FF^times arrow frac(FF^times, (FF^times)^2, style: "skewed")$ ההומומורפיזם הקאנוני כלומר $pi(a)=a(FF^times)^2$ לכל $a in FF^times$.\
תת־קבוצה $R subset.eq FF^times$ תיקרא קבוצת נציגים כאשר $pi|_R : R arrow frac(FF^times, (FF^times)^2, style: "skewed")$ הוא חד־חד ערכי ועל.\
מעכשיו נקבע קבוצת נציגים $R$ כלשהי ב־$FF$.\
#fact[
  לכל $a in FF^times$ קיים $r in R$ יחיד ו־$c in FF^times$ כך ש־$a=r c^2$.
]
#example[
  + $FF=CC$ אז $(CC^times)^2 = CC^times$ ומתקיים $abs(frac(CC^times, (CC^times)^2, style: "skewed"))=1$ וניתן לבחור $R={1}$
  + $FF=RR$ אז $(CC^times)^2 = {x in RR^times bar x>0}$ ומתקיים $abs(frac(RR^times, (RR^times)^2, style: "skewed"))=2$ וניתן לבחור $R={-1,1}$
]
#proposition[
  יהי $p$ ראשוני ו־$p!=2$ אז $abs(frac(FF_p^times, (FF_p^times)^2, style: "skewed"))=2$.\
  בנוסף, לכל $r in FF_p^times without (FF_p^times)^2$ ניתן לבחור קבוצת נציגים להיות $R={1,r}$.
]
#proof[
  נגדיר $s:FF_p^times arrow FF_p^times$ על־ידי $s(a)=a^2$ לכל $a in FF_p^times$ והוא כמובן הומומורפיזם (של חבורות) וגם $im(s)=(FF_p^times)^2$.\
  מתקיים $im(s) tilde.equiv frac(FF_p^times, ker s, style: "skewed")$ ובנוסף $x in ker s <==> s(x)=1 <==> x^2=1 <==> (x-1)(x+1)=0 <==> x in {-1, 1}$.\
  לכן $ker s = {1, -1}$ ומכאן $abs(ker s)=2$.\
  לסיכום
  $
    abs(frac(FF_p^times, (FF_p^times)^2, style: "skewed"))=abs(frac(FF_p^times, im(s), style: "skewed")) = abs(FF_p^times) : abs(im(s)) = abs(FF_p^times) : (abs(FF_p^times) : abs(ker s)) = abs(ker s)=2
  $
]
#proposition[
  יהי $V$ מרחב וקטורי נוצר נוספית מעל $FF$, $g$ תבנית בילנארית סימטרית על $V$. אז קיים בסיס $cal(C)$ של $V$ כך ש־$[g]_(cal(C))$ אלכסונית ואיברי אלכסונה שייכים ל־$R union {0}$ (כאשר $R$ הקבוצת נציגים).
]
#proof[
  יהי $cal(B) = (v_1, dots.h, v_n)$ בסיס של $V$ כך ש־$[g]_(cal(B))$ אלכסונית ($cal(B)$ בסיס אורתוגונלי).\
  נסמן $a_i = g(v_i, v_i) = q(v_i)$ לכל $1<=i<=n$.\
  אם $a_i != 0$ אז קיימים $r_i in R, c_i in FF^times$ כך ש־$a_i = r_i c_i^2$ ואם $a_i=0$ נגדיר $r_i = 0$ ו־$c_i = 1$.\
  כעת, נגדיר $cal(C)=(v_1/c_1, dots.h, v_n/c_n)$.\
  מטריצת המעבר בין הבסיסים נראית מהצורה הבאה
  $ [Id]^cal(C)_cal(B) = mat(1/c_1, , 0; , dots.down, dots.v; 0, , 1/c_n) $
  ומכאן
  $
    [g]_cal(C) = ([Id]^cal(C)_cal(B))^t [g]_cal(B) [Id]^cal(C)_cal(B) = mat(1/c_1, , 0; , dots.down, dots.v; 0, , 1/c_n) mat(a_1, , 0; , dots.down, dots.v; 0, , a_n) mat(1/c_1, , 0; , dots.down, dots.v; 0, , 1/c_n) = mat(a_1/c_1^2, , 0; , dots.down, dots.v; 0, , a_n/c_n^2) = mat(r_1, , 0; , dots.down, dots.v; 0, , r_n)
  $
]
#corollary[
  לכל מטריצה $A in M_n (FF)$ סימטרית קיימת $D in M_n (FF)$ אלכסונית כך שאיברי אלכסונה שייכים ל־$R union {0}$ אשר חופפת ל־$A$.
]

== פעולות עמודה אלמנטריות
תהיי $epsilon$ פעולת שורה אלמנטרית על מטריצות מ־$M_n (FF)$.\
נסמן ב־$overline(epsilon)$ את פעולת עמודה אלמנטרית המתאימה, כלומר
+ אם $epsilon = R_i mapsto c R_i$ אז $overline(epsilon) = C_i mapsto c C_i$
+ אם $epsilon = R_i mapsto R_i + c R_j$ אז $overline(epsilon) = C_i mapsto C_i + c R_j$
+ אם $epsilon = R_i arrow.r.l R_j$ אז $overline(epsilon) = C_i arrow.r.l C_j$ (החלפת שורות/עמודות)
#fact[
  לכל $A in M_n (FF)$ מתקיים $overline(epsilon)(A) = (epsilon(A^t))^t$.
]
#proposition[
  תהיי $epsilon$ פעולת שורה אלמנטרית, $A in M_n (FF)$. אז $overline(epsilon)(A) = A epsilon(I_n)^t$.\
  למה זה מעניין? כי באלגברה לינארית רואים ש־$epsilon(A)=epsilon(I_n)A$.
]
#proof[
  $ overline(epsilon)(A) = (epsilon(A^t))^t = (epsilon(I_n) A^t)^t = A epsilon(I_n)^t $
]
#corollary[
  תהיי $epsilon$ פעולת שורה אלמנטרית, $A in M_n (FF)$. אז $epsilon(overline(epsilon)(A))= overline(epsilon)(epsilon(A))=epsilon(I_n)A epsilon(I_n)^t$.
]
#proposition[
  תהיי $g$ תבנית בילנארית סימטרית על $FF^n$ ונסמן את $[t]_cal(E)=A$ (כאשר $cal(E)$ הוא הבסיס הסטנדרטי).\
  יהיו $epsilon_1, dots.h, epsilon_k$ פעולות שורה אלמנטריות ונסמן $D=overline(epsilon_k)(epsilon_k ( dots.h (overline(epsilon_1)(epsilon_1 (A)))))$ ו־$P=overline(epsilon_k)(dots.h(overline(epsilon_1)(I_n)))$.\
  נסמן ב־$b_1, dots.h, b_n$ את העמודות של $P$ ו־$cal(B) = (b_1, dots.h, b_n)$ הוא בסיס של $FF^n$ וגם $[g]_cal(B)=D$.
]
#proof[
  לפי הטענה לעיל מתקיים $P=I_n epsilon_1 (I_n)^t dots.h.c I_n epsilon_k (I_n)^t = epsilon_1 (I_n)^t dots.h.c epsilon_k (I_n)^t$ ובנוסף ברור כי $[Id_V]_cal(E)^cal(B) = P$ ולכן
  $
    [g]_cal(B) &= ([Id_V]_cal(C)^cal(B))^t [g]_cal(E) [Id_V]_cal(C)^cal(B) \
    &= P^t A P = (epsilon_1 (I_n)^t dots.h.c epsilon_k (I_n)^t)^t A epsilon_1 (I_n)^t dots.h.c epsilon_k (I_n)^t \
    &= epsilon_k (I_n) dot.op dots.h.c dot.op epsilon_1 (I_n) A epsilon_1 (I_n)^t dot.op dots.h.c dot.op epsilon_k (I_n)^t \
    &= overline(epsilon_k)(epsilon_k (dots.h (overline(epsilon_1)(epsilon_1)(A)))) = D
  $
]
#notation[
  בהינתן תבנית ריבועית $q:V arrow FF$ על מרחב וקטורי $V$ נסמן ב־$g_q : V times V arrow FF$ את התבנית הבילנארית הסימטרית המקיימת $ q(v)=g_q (v,v) $
]
#example[
  תבנית ריבועית $q:RR^3 arrow RR$ מוגדרת על־ידי
  $ q vec(x_1, x_2, x_3) = 2x_1^2 + 8x_1x_2 + 8x_2^2 + 2x_2x_3 + x_3^2 $
  נמצא בסיס $cal(B)$ של $RR^3$ כך ש־$[g_q]_cal(B)$ אלכסונית ואיברי אלכסונה שייכים ל־${1,-1,0}$.\
  מתקיים
  $ g_q (vec(x_1, x_2, x_3), vec(y_1, y_2, y_3)) = 2x_1y_1 + 4x_1y_2 + 4x_2y_1 + 8x_2y_2 + x_2y_3 + x_3y_2 + x_3y_3 $
  הצבה פשוטה מראה שמתקיים $ g_q (vec(x_1, x_2, x_3), vec(x_1, x_2, x_3)) = q(vec(x_1, x_2, x_3)) $
  עוד מתקיים (עם מטריצת גראם־שמידט?)
  $ [g_q]_cal(E) = mat(2, 4, 0; 4, 8, 1; 0, 1, 1) $
  וזו גם מטריצה סימטרית (פעולות שורה עושים רק על המטריצה למעלה ועל פעולות עמודה עושים על שניהם)
  $
    mat(2, 4, 0; 4, 8, 1; 0, 1, 1)/mat(1, 0, 0; 0, 1, 0; 0, 0, 1) stretch(arrow)^(R_2 mapsto R_2 - 2R_1) mat(2, 4, 0; 0, 0, 1; 0, 1, 1)/mat(1, 0, 0; 0, 1, 0; 0, 0, 1) stretch(arrow)^(C_2 mapsto C_2 - 2C_1) mat(2, 0, 0; 0, 0, 1; 0, 1, 1)/mat(1, -2, 0; 0, 1, 0; 0, 0, 1) stretch(arrow)^(R_2 arrow.r.l R_3) mat(2, 0, 0; 0, 1, 1; 0, 0, 1)/mat(1, -2, 0; 0, 1, 0; 0, 0, 1) stretch(arrow)^(C_2 arrow.r.l C_3) mat(2, 0, 0; 0, 1, 1; 0, 1, 0)/mat(1, 0, -2; 0, 0, 1; 0, 1, 0) \
    stretch(arrow)^(R_3 mapsto R_3 - R_2) mat(2, 0, 0; 0, 1, 1; 0, 0, -1)/mat(1, 0, -2; 0, 0, 1; 0, 1, 0) stretch(arrow)^(C_3 mapsto C_3 - C_2) mat(2, 0, 0; 0, 1, 0; 0, 0, -1)/mat(1, 0, -2; 0, 0, 1; 0, 1, -1) stretch(arrow)^(R_1 mapsto 1/sqrt(2) R_1) mat(sqrt(2), 0, 0; 0, 1, 0; 0, 0, -1)/mat(1, 0, -2; 0, 0, 1; 0, 1, -1) stretch(arrow)^(C_1 mapsto 1/sqrt(2) C_1) mat(1, 0, 0; 0, 1, 0; 0, 0, -1)/mat(sqrt(2)/2, 0, -2; 0, 0, 1; 0, 1, -1)
  $
  נגדיר $cal(B) = (vec(sqrt(2)/2, 0, 0), vec(0, 0, 1), vec(-2, 1, -1))$ ואז $[g_q]_cal(B) = mat(1, 0, 0; 0, 1, 0; 0, 0, -1)$
]
#example[
  תבנית ריבועית $q: RR^2 arrow RR$ מוגדרת על־ידי $q vec(x_1, x_2) = x_1x_2$.\
  מתקיים $ g_q (vec(x_1, x_2), vec(y_1, y_2))=1/2 x_1y_2 + 1/2 x_2y_1 $
  וכן
  $ [g_q]_cal(E) = mat(0, 1/2; 1/2, 0) $
  אז
  $
    mat(0, 1/2; 1/2, 0)/mat(1, 0; 0, 1) stretch(arrow)^(R_1 mapsto R_1 + R_2) mat(1/2, 1/2; 1/2, 0)/mat(1, 0; 0, 1) stretch(arrow)^(C_1 mapsto C_1 + C_2) mat(1, 1/2; 1/2, 0)/mat(1, 0; 1, 1) stretch(arrow)^(R_2 mapsto R_2 - -1/2 R_1) mat(1, 1/2; 0, -1/4)/mat(1, 0; 1, 1) stretch(arrow)^(C_2 mapsto C_2 - 1/2 C_1) mat(1, 0; 0, -1/4)/mat(1, -1/2; 1, 1/2)
  $
]
