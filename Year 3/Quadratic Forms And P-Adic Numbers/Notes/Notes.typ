#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *

#show: thmbox-init()

#show: article_he.with(
  title: [ תבניות ריבועיות ומספרים $P$־אדיים ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#set block(breakable: true)
#outline(depth: 2)

= תבניות ביליניאריות סימטריות
== כותרת כלשהי
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
#claim[
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
#notation[
  תהיי $epsilon$ פעולת שורה אלמנטרית על מטריצות מ־$M_n (FF)$.\
  נסמן ב־$overline(epsilon)$ את פעולת עמודה אלמנטרית המתאימה, כלומר
  + אם $epsilon = R_i mapsto c R_i$ אז $overline(epsilon) = C_i mapsto c C_i$
  + אם $epsilon = R_i mapsto R_i + c R_j$ אז $overline(epsilon) = C_i mapsto C_i + c R_j$
  + אם $epsilon = R_i arrow.r.l R_j$ אז $overline(epsilon) = C_i arrow.r.l C_j$ (החלפת שורות/עמודות)
]
#claim[
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
    [g]_cal(B) = ([Id_V]_cal(C)^cal(B))^t [g]_cal(E) [Id_V]_cal(C)^cal(B) = P^t A P = (epsilon_1 (I_n)^t dots.h.c epsilon_k (I_n)^t)^t A epsilon_1 (I_n)^t dots.h.c epsilon_k (I_n)^t \
    = epsilon_k (I_n) dot.op dots.h.c dot.op epsilon_1 (I_n) A epsilon_1 (I_n)^t dot.op dots.h.c dot.op epsilon_k (I_n)^t = overline(epsilon_k)(epsilon_k (dots.h (overline(epsilon_1)(epsilon_1)(A)))) = D
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
  הצבה פשוטה מראה שמתקיים $g_q (vec(x_1, x_2, x_3), vec(x_1, x_2, x_3)) = q(vec(x_1, x_2, x_3))$ ועם (מטריצת גראם־שמידט) מתקיים גם־כן
  $ [g_q]_cal(E) = mat(2, 4, 0; 4, 8, 1; 0, 1, 1) $
  וזו גם מטריצה סימטרית, אז (פעולות שורה עושים רק על המטריצה למעלה ועל פעולות עמודה עושים על שניהם)
  $
    mat(2, 4, 0; 4, 8, 1; 0, 1, 1)/mat(1, 0, 0; 0, 1, 0; 0, 0, 1) stretch(arrow)^(R_2 mapsto R_2 - 2R_1) mat(2, 4, 0; 0, 0, 1; 0, 1, 1)/mat(1, 0, 0; 0, 1, 0; 0, 0, 1) stretch(arrow)^(C_2 mapsto C_2 - 2C_1) mat(2, 0, 0; 0, 0, 1; 0, 1, 1)/mat(1, -2, 0; 0, 1, 0; 0, 0, 1) stretch(arrow)^(R_2 arrow.r.l R_3) mat(2, 0, 0; 0, 1, 1; 0, 0, 1)/mat(1, -2, 0; 0, 1, 0; 0, 0, 1) stretch(arrow)^(C_2 arrow.r.l C_3) mat(2, 0, 0; 0, 1, 1; 0, 1, 0)/mat(1, 0, -2; 0, 0, 1; 0, 1, 0) \
    stretch(arrow)^(R_3 mapsto R_3 - R_2) mat(2, 0, 0; 0, 1, 1; 0, 0, -1)/mat(1, 0, -2; 0, 0, 1; 0, 1, 0) stretch(arrow)^(C_3 mapsto C_3 - C_2) mat(2, 0, 0; 0, 1, 0; 0, 0, -1)/mat(1, 0, -2; 0, 0, 1; 0, 1, -1) stretch(arrow)^(R_1 mapsto 1/sqrt(2) R_1) mat(sqrt(2), 0, 0; 0, 1, 0; 0, 0, -1)/mat(1, 0, -2; 0, 0, 1; 0, 1, -1) stretch(arrow)^(C_1 mapsto 1/sqrt(2) C_1) mat(1, 0, 0; 0, 1, 0; 0, 0, -1)/mat(sqrt(2)/2, 0, -2; 0, 0, 1; 0, 1, -1)
  $
  נגדיר $cal(B) = (vec(sqrt(2)/2, 0, 0), vec(0, 0, 1), vec(-2, 1, -1))$ ואז $[g_q]_cal(B) = mat(1, 0, 0; 0, 1, 0; 0, 0, -1)$.
]
#example[ תבנית ריבועית $q: RR^2 arrow RR$ מוגדרת על־ידי $q vec(x_1, x_2) = x_1x_2$.\
  מתקיים $ g_q (vec(x_1, x_2), vec(y_1, y_2))=1/2 x_1y_2 + 1/2 x_2y_1 $
  וכן
  $ [g_q]_cal(E) = mat(0, 1/2; 1/2, 0) $
  אז
  $
    mat(0, 1/2; 1/2, 0)/mat(1, 0; 0, 1) stretch(arrow)^(R_1 mapsto R_1 + R_2) mat(1/2, 1/2; 1/2, 0)/mat(1, 0; 0, 1) stretch(arrow)^(C_1 mapsto C_1 + C_2) mat(1, 1/2; 1/2, 0)/mat(1, 0; 1, 1) stretch(arrow)^(R_2 mapsto R_2 - -1/2 R_1) mat(1, 1/2; 0, -1/4)/mat(1, 0; 1, 1) stretch(arrow)^(C_2 mapsto C_2 - 1/2 C_1) mat(1, 0; 0, -1/4)/mat(1, -1/2; 1, 1/2)
  $
]
#end_of_lecture("3 – 28/04")

= מיון מרחבים ריבועיים
תשלימי...

#end_of_lecture("4 – 05/05")

#example[
  + $FF=CC$ ויהי $(V,q)$ מרחב ריבועי לא מנוון מעל $CC$, אז קיים בסיס $cal(B)$ של $V$ כך שמתקיים $[g_q]_cal(B) = I_n$.\
    בפרט, אם $(V,q), (V^prime, q^prime)$ מרחבים ריבועיים לא מנוונים מעל $CC$ כך ש־$dim V = dim V^prime$ אז $(V,q) tilde.equiv (V^prime, q^prime)$.
  + $FF=RR$ יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $RR$ כאשר $dim V = n$ אז קיים בסיס $cal(B)$ של $V$ כך שמתקיים $[g_q]_cal(B) = mat(
      I_k, 0;
      0, -I_(n - k)
    )$ כאשר $0<=k<=n$.
]

#theorem[משפט סילבסטר][
  יהיו $k, ell in ZZ, n in NN$ כך ש־$0<=k<ell<=n$.\
  נגדיר $q_1, q_2 : RR^n arrow RR$ על־ידי
  $
    q_1 vec(x_1, dots.v, x_n) = x_1^2 + dots.h.c + x_k^2 - x_(k+1)^2 - dots.h.c - x_n^2 \
    q_2 vec(x_1, dots.v, x_n) = x_1^2 + dots.h.c + x_ell^2 - x_(ell-1)^2 - dots.h.c - x_n^2
  $
  אז $(RR^n, q_1) tilde.equiv.not (RR^n, q_2)$.
]

#proof[
  נניח בשלילה שקיים איזומורפיזם $f:(RR^n, q_1) arrow (RR^n, q_2)$.\
  נסמן ב־$U = Span("e"_1, dots.h, "e"_ell)$, $V = Span("e"_(k+1), dots.h, "e"_n)$ ואת $W=f(V)$.\
  מתקיים ש־$dim U = ell$ ומכך ש־$f$ איזומורפיזם $dim W = dim V = n-k$.\
  מכאן נובע
  $ dim(U inter W) = dim U + dim W - dim(U + W) >= ell + (n-k) - n = ell - k >=1 $
  לכן קיים $0_V != z in U inter W$.\
  מאחר ש־$z in U$ נובע שקיימים $c_1, dots.h, c_ell in RR$ כך שלא כולם אפס ומתקיים $z=vec(c_1, dots.v, c_ell, 0, dots.v, 0)$ ולכן
  $ q_2 (z) = c_1^2 + dots.h.c + c_ell^2 - 0^2 + dots.h.c + 0^2 > 0 $
  מאחר ש־$z in W$ נובע שקיים $0_V != v in V$ כך ש־$f(v)=z$ ולכן קיימים $d_(k+1), dots.h, d_n in RR$ לא כולם אפס ומתקיים $v = vec(0, dots.v, 0, d_(k+1), dots.v, d_n)$ ולכן
  $ q_2 (z) = q_2 (f(v)) =_((star)) q_1 (v) = 0^2 + dots.h.c + 0^2 - d_(k+1)^2 - dots.h.c - d_n^2 < 0 $
  כאשר $(star)$ נובע מכך ש־$f$ איזומורפיזם וכמובן שהגענו לסתירה.
]

#example[
  יהי $p != 2$ ראשוני, נסמן $FF=FF_p$ ו־$r in FF_p^times without (FF_p^times)^2$.\
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF_p$ עם $dim V = n$.\
  אז קיים בסיס $cal(B)$ של $V$ כך שמתקיים $[g_q]_cal(B) = mat(
    I_k, 0;
    0, r I_(n - k)
  )$ (מטריצת בלוקים).
]<example_for_blocks>

#definition[תבניית מייצגת][
  יהי $(V,q)$ מרחב ריבועי מעל $FF$ ו־$a in FF$. אומרים ש־$q$ מייצגת את $a$ כאשר $a in q(V without {0_V})$.
]

#exercise[
  יהיו $(V, q), (V^prime, q^prime)$ מרחבים ריבועיים כך ש־$(V,q) tilde.equiv (V^prime, q^prime)$. אז $q(V without {0_V}) = q^prime (V^prime without {0_V})$.
]

#theorem[
  יהי $p$ ראשוני ויהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF_p$ עם $dim V = 2$. אז $FF_p^times subset.eq q(V without {0})$.
]

#proof[
  יהי $cal(B)$ בסיס אורתוגונלי של $V$ אז $[g_q]_cal(B) = mat(a_1, 0; 0, a_2)$ כאשר $a_1, a_2 in FF_p^times$.\
  נגדיר $q^prime : FF_p^2 arrow FF_p$ על־ידי $ q^prime vec(x_1, x_2) = a_1 x_1^2 + a_2 x_2^2 $
  ולכן $(V,q) tilde.equiv (FF_p^2, q^prime)$ כי הם מיוצגים על־ידי אותה המטריצה.\
  יהי $b in FF_p^times$ ונוכיח כי קיימים $vec(x_1, x_2) in FF_p^2$ כך ש־$q^prime vec(x_1, x_2) = b$.\
  נסמן
  $
    A_1 colon.eq {a_1 x^2 bar x in FF_p} \
    A_2 colon.eq {a_2 x^2 bar x in FF_p} \
    B colon.eq {b-a_2 x^2 bar x in FF_p}
  $
  נגדיר $f:(FF_p^times)^2 union {0} arrow A_1$ על־ידי $f(x_1) = a_1 x$ ולכן $f$ היא חד־חד ערכית ועל (ההופכית זה חילוק) ולכן $abs((FF_p^times)^2 union {0}) = abs(A_1) = (p+1)/2$.\
  באופן דומה גם $abs(A_2) = (p+1)/2$.\
  נגדיר $g: A_2 arrow B$ על־ידי $g(y)=b-y$ וכמובן שגם $g$ היא חד־חד ערכית ועל ולכן $abs(B)=abs(A_2)=(p+1)/2$ ומכאן
  $ abs(A_1 inter B) = abs(A_1) + abs(B) - abs(A_1 union B) >= (p+1)/2 + (p+1)/2 - p = 1 $
  כלומר החיתוך שלהם לא ריק ולכן קיים $c in A_1 inter B$ כלומר קיימים $x_1, x_2 in FF_p$ כך ש־$a_1 x_1^2 = c = b-a_2 x_2^2$ ומכאן $q^prime vec(x_1, x_2) = a_1 x_1^2 + a_2 x_2^2 = b$.\
  יתר על־כן, $vec(x_1, x_2) != vec(0, 0)$ כי $b!=0$.
]

#remark[
  זה כמובן לא נכון ב־$RR$ כשהדוגמה הקלאסית היא מכפלה פנימית למרות שהיא מגדירה מרחב ריבועי לא מנוון.
]

#corollary[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF_p$ עם $dim V >=2$. אז $FF_p^times subset.eq q(V without {0})$.
]

#proof[
  נסמן $dim V = n$ ויהי $cal(B) = (v_1, dots.h, v_n)$ בסיס אורתוגונלי של $V$ אז קיימים $a_1, dots.h, a_n in FF_p^times$ כך שמתקיים $[g_q]_cal(B) = mat(a_1, , 0; , dots.down, , ; 0, , a_n)$.\
  נסמן $cal(C)=(v_1, v_2)$, $U = Span cal(C), space$ אז $dim U = 2$ וגם $[g_(q|_U)]_cal(C) = mat(a_1, 0; 0, a_2)$.\
  לכן $(U, q|_U)$ מרחב לא מנוון ומתקיים $FF_p^times subset.eq q|_U (U without {0_V}) subset.eq q(V without {0})$.
]

#lemma[
  יהי $(V,q)$ מרחב ריבועי לא מנוון ותהיי $u in V$ כך ש־$q(u)!=0$. נסמן $W={u}^perp$ אז $(W, q|_W)$ הוא מרחב ריבועי לא מנוון.
]

#proof[
  יהי $z in W$ בגרעין של $(W, q|_W)$ כלומר לכל $w in W$ מתקיים $g_q (z,w) = 0$.\
  יהי $v in V$, מאחר ש־$V = Span(u) plus.o W$ נובע שקיימים $w in W, c in FF$ כך ש־$v=c u + w$ ומכאן
  $ g_q (z,v) = c q_g (z,u) + g_q (z,w) = 0 $
  כאשר $g_q (z,u)=0$ כי $z in w$ בגרעין ולכן $z in V^perp$.\
  מאחר ש־$(V,q)$ לא מנוון אנו מקבלים כי $z=0_V$ ולכן $(W, q|_W)$ לא מנוון.
]

#theorem[
  יהי $p!=2$ ראשוני ו־$r in FF_p^times without (FF_p^times)^2$ ויהי $(V,q)$ מרחב ריבועי לא מנוון עם $dim V = n$. אז קיים בסיס $cal(B)$ של $V$ כך ש־$[g_q]_cal(B) = I_n$ או $[g_q]_cal(B) = mat(I_(n-1), 0; 0, r)$.
]

#proof[
  באינדוקציה על $n$: עבור $n=1$ כבר ראינו ב@example_for_blocks ונניח כי הטענה נכונה למרחב ריבועי ממימד $n-1$.\
  מאחר ש־$1 in FF_p^times subset.eq q(V without {0_V})$ וגם $dim V >=2$ קיים $u in V$ כך ש־$q(u)=1$.\
  נסמן $W = {u}^perp$ אז $dim W = n-1$ וגם $(W, q|_W)$ לא מנוון ומהנחת האינדוקציה קיים בסיס $cal(C) = (w_1, dots.h, w_(n-1))$ של $W$ כך ש־$[g_(q|_W)]_cal(C) = I_(n-1)$ או \
  ש־$[g_(q|_W)]_cal(C)= mat(I_(n-2), 0; 0, r)$.\
  נגדיר $cal(B) = (u, w_1, dots.h, w_(n-1))$. מאחר ש־$V = Span(u) plus.o W$ נובע ש־$cal(B)$ הוא בסיס של $V$.\
  כמו־כן, $[g_q]_cal(B) = I_n$ או $[g_q]_cal(B) = mat(I_(n-1), 0; 0, r)$.
]

#proposition[
  יהי $n in NN$ ונגדיר $q_1, q_2 : FF_p^n arrow FF_p$ על־ידי
  $
    q_1 vec(x_1, dots.v, x_n) = x_1^2 + dots.h.c + x_n^2 \
    q_2 vec(x_1, dots.v, x_n) = x_1^2 + dots.h.c + x_(n-1)^2 + r x_n^2
  $
  כאשר $r in FF_p^times without (FF_p^times)^2$ כבטענה הקודמת. אז $(FF_p^n, q_1) tilde.equiv.not (FF_p^n, q_2)$.
]

#proof[
  נניח בשלילה שהם איזומורפיים ולכן המטריצות $[g_(q_1)]_cal(E) = I_n$ ו־$[g_(q_2)] = mat(I_(n-1), 0; 0, r)$ חופפות כלומר קיימת $P in M_n (FF_p)$ הפיכה כך שמתקיים
  $ mat(I_(n-1), 0; 0, r) = P^t I_n P = P^t P $
  נסמן $det P = c$ ו־$c!=0$ כי $P$ הפיכה ונקבל
  $ r = det mat(I_(n-1), 0; 0, r) = det(P^t P) = c^2 in (FF_p^times)^2 $
  וזאת סתירה.
]

#corollary[
  יהיו $(V,q), (V^prime, q^prime)$ מרחבים ריבועיים לא מנוונים מעל $FF_p$ ויהיו $cal(B), cal(B)^prime$ בסיסים של $V, V^prime$ בהתאמה כך שמתקיים
  + $dim V = dim V^prime$
  + $det [g_q]_cal(B) dot.op (FF_p^times)^2 = det [g_(q^prime)]_(cal(B)^prime) dot.op (FF_p^times)^2$
  אז $(V,q) tilde.equiv (V^prime, q^prime)$.
]

#example[
  עבור $p=7$ אז $q:FF_7^2 arrow FF_7$ אז $r = -1 in.not (FF_7^times)^2$ והתבנית $q vec(x_1, x_2) = -x_1^2-x_2^2$.\
  מהמשפט קיים בסיס $cal(B)$ של $FF_7^2$ כך שמתקיים $[g_q]_cal(B) = mat(1, 0; 0, plus.minus 1)$.
]
