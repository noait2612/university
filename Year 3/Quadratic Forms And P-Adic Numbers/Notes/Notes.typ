#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *

#show: thmbox-init()

#show: article_he.with(
  title: [ תבניות ריבועיות ומספרים $p$־אדיים ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#set block(breakable: true)
#outline(depth: 2)

= תבניות ביליניאריות סימטריות

#end_of_lecture("1 – 24/03")
תשלימי...

#end_of_lecture("2 – 14/04")
תשלימי...

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

== מיון מרחבים ריבועיים
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

#end_of_lecture("5 – 12/05")

== איזוטרפיות
מוטיבציה: נסתכל על התבנית הריבועית $q:FF^2 arrow FF$ הנתונה על־ידי $q vec(x_1, x_2) = x_1^2-x_2^2$ והמרחב הריבועי עם התבנית הזאת הוא לא מנוון (המטריצה המייצגת הפיכה) אבל נניח הוקטור $q vec(1, 1)=0$ ותופעה כזאת נקראת איזוטרופיה והיא מעניינת.\
יהי $(V,q)$ מרחב ריבועי מעל $FF$ ויהי $v in V$ נגדיר $g_q^v : V arrow FF$ על־ידי $g_q^v (w) = g_q (v,w)$ וברור כי $g_q^v in Hom(V, FF)$.\
נגדיר $hat(g_q) : V arrow Hom(V, FF)$ על־ידי $hat(g_q)=g_q^v$.

#proposition[
  יהי $(V,q)$ מרחב ריבועי מעל $FF$. אז $(V,q)$ לא מנוון אם ורק אם $hat(g_q)$ חד־חד ערכית.
]

#proof[
  $(V,q)$ מנוון אם ורק אם קיים $0_V != v in V^perp$ אם ורק אם קיים $0_V != v in V$ כך ש־$g_q^v eq.triple 0$ אם ורק אם קיים $0_V != v in V$ כך ש־$hat(g_q)(v)=0$ אם ורק אם $ker hat(g_q) != {0_V}$ אם ורק אם $hat(g_q)$ אינה חד־חד ערכית.
]

#lemma[
  $V$ מרחב וקטורי נוצר סופית מעל $FF$ ו־$U$ תת־מרחב של $V$.\
  נגדיר $rho_U : Hom(V, FF) arrow Hom(U, FF)$ על־ידי $rho_U (ell) = ell|_U$ לכל $ell in Hom(V, FF)$ אז $rho_U$ העתקה לינארית על.
]<lemma-to-prove>

#exercise[
  הוכיחו את @lemma-to-prove.
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF$ ו־$U$ תת־מרחב של $V$. אז
  $ dim V = dim U + dim U^perp $
]

#proof[
  נתבונן בהעתקה הלינארית $rho_U compose hat(g_q) : V arrow Hom(U, FF)$ ויהי $v in V$.\
  אז $v in U^perp$ אם ורק אם $g_q^v |_U = 0$ אם ורק אם $phi_U compose hat(g_q) = 0_V$ אם ורק אם $v in ker phi_U compose hat(g_q)$ ולפיכך $U^perp = ker rho_U compose hat(g_q)$.\
  מאחר ש־$(V,q)$ לא מנוון נובע ש־$hat(g_q)$ חד־חד ערכית ולכן $hat(g_q)$ היא גם על ומכאן (למה?) ש־$rho_U compose hat(g_q)$ על כלומר $im rho_U compose hat(g_q) = Hom(U, FF)$.\
  לפי משפט המימדים
  $
    dim V = dim im rho_U compose hat(g_q) + dim ker rho_U compose hat(g_q) + dim Hom(U, FF) + dim U^perp = dim U + dim U^perp
  $
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF$ ו־$U$ תת־מרחב של $V$. אז $(U^perp)^perp = U$.
]

#proof[
  יהי $u in U$. לכל $w in U^perp$ מתקיים ש־$u perp w$ ולכן $u in (U^perp)^perp$ ולפיכך $U subset.eq (U^perp)^perp$ וזה נכון בכל מרחב ריבועי.\
  לפי הטענה הקודמת מתקיים
  $ dim (U^perp)^perp = dim V - dim U^perp = dim V - (dim V - dim U) = dim U $
]

#exercise[
  מתי ההכלה השנייה שהוכחנו לעיל לא מתקיימת?
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF$ ו־$U$ תת־מרחב של $V$. אז $(U, q|_U)$ $cancel("לא")$ מנוון אם ורק אם $(U^perp, q|_(U^perp))$ $cancel("לא")$ מנוון.
]

#proof[
  $<==$ $(U, q|_U)$ מנוון ולכן קיים $0 != v in U$ כך ש־$v perp u$ לכל $u in U$ ולכן $v in U^perp$.\
  מאחר ש־$v in U$ מתקיים ש־$v perp w$ לכל $w in U^perp$ וזה אומר כי $(U^perp, q|_(U^perp))$ מנוון. \
  $==>$ מכך ש־$(U^perp, q|_(U^perp))$ מנוון נובע כי $((U^perp)^perp, q|_((U^perp)^perp))$ גם מנוון ולפי הטענה הקודמת אנחנו מקבלים כי $(U, q|_U)$ מנוון.
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF$ ו־$U$ תת־מרחב של $V$ כך ש־$(U, q|_U)$ לא מנוון אז
  + $(U^perp, q|_(U^perp))$ לא מנוון
  + $V = U plus.o^perp U$
]

#proof[
  + נובע מהטענה הקודמת
  + יהי $v in U inter U^perp$ ונרצה להראות שהוא וקטור האפס: מאחר ש־$v in U^perp$ מתקיים ש־$v perp u$ לכל $u in U$ ובגלל ש־$v in U$ נובע ש־$v$ בגרעין של $(U, q|_U)$ אבל $(U, q|_U)$ הוא לא מנוון ולכן הגרעין שלו הוא וקטור האפס כלומר $v=0_V$ ולכן $U inter U^perp = 0$. לסיום
  $ dim(U + U^perp) = underbrace(dim U + dim U^perp, dim V) - underbrace(dim(U inter U^perp), 0) = dim V $
]

#definition[וקטור איזוטרופי][
  יהי $(V,q)$ מרחב ריבועי מעל $FF$ ו־$0_V != v in V$ אז $v$ נקרא *איזוטרופי* אם $q(v)=0$.
]

#definition[מרחב ריבועי איזוטרופי][
  מרחב ריבועי $(V,q)$ נקרא *מרחב איזוטרופי* אם קיים $0_V != v in V$ כך ש־$v$ איזוטרופי. כלומר, $0 in q(V without {0_V})$.
]

#corollary[
  כל מרחב ריבועי מנוון הוא איזוטרופי.
]

#definition[מישור היפרבולי][
  נגדיר תבנית ריבועית $h:FF^2 arrow FF$ על־ידי $h vec(x_1, x_2) = x_1 x_2$. מרחב ריבועי $(FF^2, h)$ נקרא *מישור היפרבולי*.
]

#proposition[
  + $[g_h]_cal(E) = mat(0, 1/2; 1/2, 0)$
  + $det [g_h]_cal(E) = -1/4$ ובפרט $(FF^2, h)$ לא מנוון
  + $h$ תבנית איזוטרופית ובפרט $(FF^2, h)$ איזוטרופי
  + $h(FF^2 without {vec(0, 0)})=FF$
  + נגדיר $q:FF^2 arrow FF$ על־ידי $q vec(x_1, x_2) = x_1^2-x_2^2$ אז $(FF^2, h) tilde.equiv (FF^2, q)$
]

#proof[
  + נובע מכך ש־$h vec(x_1, x_2) = x_1 x_2 = 1/2 x_1 x_2 + 1/2 x_2 x_1$
  + הגדרה
  + $h vec(1, 0) = 0$
  + לכל $c in FF$ מתקיים $h vec(1, c) = c$
  + עם חפיפת מטריצות ישירה $ mat(1, 1; -1, 1) mat(0, frac(1, 2, style: "horizontal"); frac(1, 2, style: "horizontal"), 0) mat(1, -1; 1, 1) = mat(1, 0; 0, -1) $
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי לא מנוון ואיזוטרופי מעל $FF$. אז קיים תת־מרחב $U$ של $V$ כך ש־$(U, q|_U) tilde.equiv (FF^2, h)$.
]

#proof[
  מאחר ש־$(V,q)$ איזוטרופי קיים $0_V != v in V$ כך ש־$q(v)=0$ ומאחר ש־$(V,q)$ לא מנוון קיים $w in V$ כך ש־$g_q (v,w) != 0$.\
  נסמן $b=g_q (v,w)$ ונגדיר $w^prime = 1/(2b)$ ונקבל $g_q (v,w^prime) = 1/(2b) g_q (v,w) = 1/2$.\
  לכל $c in FF$ מתקיים
  $
    q(w^prime + c v) = g_q (w^prime + c v, w^prime + c v) = g_q (w^prime, w^prime) + 2 g_q (w^prime, c v) = g (w^prime) + 2c underbrace(g_q (w^prime, v), = 1/2) = g(w^prime) + c
  $
  אז נגדיר $c=-g(w^prime)$ ו־$u=w^prime - q(w^prime) v$ אז $g(u)=0$.\
  בנוסף מתקיים
  $ g_q (v,u) = g_q (v, w^prime c v) = g_q (v, w^prime) = 1/2 $
  עכשיו $cal(B) = (v,u)$ היא סדרה בלתי־תלויה לינארית (כי אחרת היינו מקבלים ש־$g_q (v,u)=0$) ונגדיר $U = Span(U)$.\
  אז $cal(B)$ בסיס של $U$ ומתקיים $ [g_q|_U] = mat(0, frac(1, 2, style: "horizontal"); frac(1, 2, style: "horizontal")) $
  ולכן $(U, q|_U) tilde.equiv (FF^2, h)$
]

#corollary[
  יהי $(V,q)$ מרחב ריבועי לא מנוון ואיזוטרופי מעל $FF$ כך ש־$dim V = 2$. אז $(V,q) tilde.equiv (FF^2, h)$.
]

#corollary[
  יהי $(V,q)$ מרחב ריבועי לא מנוון ואיזוטרופי מעל $FF$. אז $q(V without {0_V}) = FF$.
]

#theorem[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF$. אז קיים $m in NN union {0}$ ותתי־מרחבים $U_1, dots.h, U_m, W$ של $V$ כך שמתקיים
  + $V = U_1 plus.o^perp dots.h plus.o^perp U_m plus.o^perp W$
  + לכל $i <=m$ מתקיים $(U_i, q|_(U_i)) tilde.equiv (FF^2, h)$ ו־$(W, q|_W)$ אינו איזוטרופי
]

#proof[
  מתקבלת באינדוקציה על מימד $V$ בשימוש עם הטענה הקודמת ובטענה $1.25$
]

#end_of_lecture("6 – 19/05")

#definition[מרחב אנאיזוטרופי][מרחב ריבועי $(V,q)$ שאינו איזוטרופי נקרא אנאיזוטרופי.]

#remark[
  מרחב ריבועי $({0_V}, Q)$ היינו אנאיזוטרופי.
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF$ כך ש־$dim V = 1$ אז $(V,q)$ אנאיזוטרופי.
]

#proof[
  כי אם הוא לא מנוון, יש לו בסיס מוקטור אחד שביחס אליו המטריצה היא מטריצה $1 times 1$ שצריכה להיות הפיכה כלומר יש לה ערך אחד שאינו אפס אז כל וקטור הוא סקלר של וקטור הבסיס ששונה מאפס והטענה נובעת.
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF$ כך ש־$dim V = 2$ ו־$cal(B)$ הוא בסיס של $V$. אז $(V,q)$ איזוטרופי אם ורק אם $minus det [g_q]_cal(B) in (FF^times)^2$.
]

#proof[
  $<==$ נניח שהמרחב הוא איזוטרופי ולכן קיים $0_V != v in V$ כך ש־$q(v)=0$.\
  מאחר ש־$(V,q)$ לא מנוון קיים $w in V$ כך ש־$g_q (v,w) !=0$ ולכן $cal(C)=(v,w)$ בלתי־תלויים לינארית כי אחרת היינו מקבלים ש־$g_q (v,w) =0$.\
  נסמן $g_q (v,w) = b$ ו־$g_q (w,w) = q(w) = c$ אז
  $ [g_q]_cal(C) = mat(0, b; b, c) $
  מאחר ש־$[g_q]_cal(C)$ ו־$[g_q]_cal(B)$ חופפות קיימת מטריצה $P$ הפיכה עבורה מתקיים
  $ [g_q]_cal(B) = P^t [g_q]_cal(C) P $
  ולכן
  $
    -det [g_q]_cal(B) = - det P^t det [g_q]_cal(C) det P = -(det P)^2 det [g_q]_cal(C) = -(det P^2) (-b^2) = (b det P)^2 in (FF^times)^2
  $
  $==>$ יהי $cal(C) = (v_1, v_2)$ בסיס אורתוגונלי של $V$ אז קיימים $a_1, a_2 in FF^times$ עבורם
  $ [g_q]_cal(C) = mat(a_1, 0; 0, a_2) $
  קיימת $P$ הפיכה עבורה מתקיים
  $ [g_q]_cal(C) = P^t [g_q]_cal(B) P $
  מאחר ש־$-det [g_q]_cal(B) in (FF^times)^2$ קיים $k in FF^times$ כך ש־$det [g_q]_cal(B) = -k^2$.\
  אז $ a_1 a_2 = det mat(a_1, 0; 0, a_2) = det [g_q]_cal(C) = det P^t det[g_q]_cal(B) det P = -(k det P)^2 $
  נגדיר $v = k det P v_1 + a_1 v_2$ מאחר ש־$a_1 !=0$ מתקיים $v!=0_V$ ולכן
  $
    q(v) & =q(k det P v_1 + a_1 v_2) \
         & = q(k det P v_1) + g(a_1 v_2) \
         & = (k det P)^2 q(v_1)+a_1^2 q(v_2) \
         & = (k det P)^2 a_1 + a_1^2 a_2 \
         & = a_1 (underbrace((k det P)^2, =-a_1 a_2)+a_1a_2) \
         & = 0
  $
]

#example[
  + $FF=CC$ מעל המרוכבים כל מספר הוא ריבוע כלשהו.\
    נבחין שאם $(V,q)$ מרחב ריבועי לא מנוון מעל $CC$ עם $dim V >=2$, אז קיים תת־מרחב $U$ של $V$ כך ש־$(U, q|_U)$ לא מנוון וגם $dim U = 2$.\
    לפיכך, כל מרחב ריבועי אנאיזוטרופי לא טריוויאלי מעל $CC$ איזומורפי ל־$(CC,q)$ כאשר $q:CC arrow CC$ מוגדר על־ידי $g(x)=x^2$
  + $FF=RR$
    כל מרחב ריבועי אנאיזוטרופי לא טריוויאלי מעל $RR$ איזומורפי לאחד מהמרחבים הבאים
    + $(RR^n, q_1)$ כאשר $q_1 vec(x_1, dots.v, x_n) = sum_(i=1)^n x_i^2$
    + $(RR^n, q_(-1))$ כאשר $q_(-1) vec(x_1, dots.v, x_n) = sum_(i=1)^n -x_i^2$
  + $FF = FF_p$ כאשר $p!=2$ ראשוני
    + יהי $p!=2$ ראשוני כך ש־$-1 in.not (FF_p^times)^2$. אז כל מרחב אנאיזוטרופי לא טריוויאלי מעל $FF_p$ איזומורפי לאחד מהמרחבים הבאים
      + $(FF_p, q_1)$ כאשר $q_1 : FF_p arrow FF_p$ מוגדר על־ידי $q_1 (x) = x^2$
      + $(FF_p, q_(-1))$ כאשר $q_(-1) : FF_p arrow FF_p$ מוגדר על־ידי $g_(-1) (x) = -x^2$
      + $(FF_p^2, q_(1,1))$ כאשר $q_(1,1) : FF_p^2 arrow FF_p$ מוגדר על־ידי $q_(1,1) vec(x_1, x_2) = x_1^2 + x_2^2$
      כאשר השניים הראשונים ממימד 1 והאחרון ממימד 2.
    + יהי $p!=2$ ראשוני כך ש־$-1 in (FF_p^times)^2$ ויהי $r in FF_p^times without (FF_p^times)^2$.\
      אז כל מרחב אנאיזוטרופי לא טריוויאלי מעל $FF_p$ איזומורפי לאחד מהמרחבים הבאים
      + $(FF_p, q_1)$ כמקודם $q_1 (x) = x^2$
      + $(FF_p, q_r)$ כאשר $q_r : FF_p arrow FF_p$ מוגדרת על־ידי $q_r (x) = r x^2$
      + $(FF_p, q_(1,r))$ כאשר $q_(1,r) : FF_p^2 arrow FF_p$ מוגדרת על־ידי $q_(1,r) vec(x_1, x_2) = x_1^2 + r x_2^2$
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF_p$ כך ש־$dim V >=3$. אז $(V,q)$ איזוטרופי.
]

#proof[
  קיים בסיס אורתוגונלי $cal(B)=(v_1, dots.h, v_n)$ של $V$ כלומר קיימים $a_1, dots.h, a_n in FF_p^times$ כך שמתקיים
  $
    [g_q]_cal(B) = mat(
      a_1, , 0;
      , dots.down, ; 0, , a_n
    )
  $
  נגדיר תבנית ריבועית $g^prime : FF_p^2 arrow FF_p$ על־ידי $g^prime vec(x_1, x_2) = a_1 x_1^2 + a_2 x_2^2$ ולכן $ [g_(q^prime)]_cal(E) = mat(a_1, 0; 0, a_2) $
  ולכן $(FF_p^2, q^prime)$ לא מנוון ולכן קיים $vec(x)1, x_2) in FF_p^2$ כך ש־$a_1x_1^2+a_2x_2^2 = g^prime vec(x_1, x_2) = - a_3$.\
  נגדיר $v=x_1 v_1 + x_2 v_2 + v_3$ וברור ש־$v!=0$. בנוסף
  $
    q(v)=q(x_1v_1)+q(x_2v_2)+q(v_3) = x_1^2 q(v_1) + x_2^2 q(v_2) + q(v_3) = a_1 x_1^2+a_2x_2^2 + a_3 = -a_3 + a_3 = 0
  $
]

= מספרים $p$־אדיים
== שדות נורמיים
#definition[נורמה][
  יהי $F$ שדה ממציין כלשהו. פונקציה $norm(dot.op) : FF arrow RR^plus = {x in RR bar x>=0}$ נקראת *נורמה* כאשר
  + $norm(a)=0$ אם ורק אם $a=0$
  + $norm(a b) = norm(a)norm(b)$ לכל $a,b in FF$
  + $norm(a+b)<=norm(a)+norm(b)$ לכל $a,b in FF$
]

#proposition[תכונות הנורמה][
  תהיי $norm(dot.op) : FF arrow RR^plus$ נורמה אז
  + $norm(1) = norm(-1) = 1$
  + $norm(a^n) = norm(a)^n$ לכל $a in FF$
  + $norm(a/b) = norm(a)/norm(b)$ לכל $a,b in FF$ עם $b!=0$
  + $norm(a-b)>= norm(a)-norm(b)$
  + $norm(n)<=n$ לכל $n in NN$
]

#proof[
  כולן נובעות ישירות מהגדרה (תרגיל).
]

#example[
  + $FF$ שדה ו־$norm(dot.op) : FF arrow RR^plus$ מוגדרת על־ידי $norm(0)=0, norm(a)=1$ לכל $a in FF^times$
  + $FF = QQ, RR, CC$ ו־$norm(dot.op) : FF arrow RR^plus$ המוגדרת על־ידי $norm(a)=abs(a)$ לכל $a in FF$
]<example-norms>

#definition[שדה נורמי][
  לזוג $(FF, norm(dot.op))$ כאשר $FF$ שדה ו־$norm(dot.op)$ נורמה קוראים *שדה נורמי*.
]

#definition[מטריקה][
  יהי $(FF, norm(dot.op))$ שדה נורמי. נגדיר $d:FF times FF arrow RR$ על־ידי $d(a,b)=norm(a-b)$ ו־$d$ היא פונקציית מרחק על $FF$ כלומר $(FF, d)$ הוא מרחב מטרי.
]

#definition[שדה ארכימדי][
  שדה נורמי $(FF, norm(dot.op))$ נקרא *ארכימדי* כאשר לכל $a in FF$ קיים $n in NN$ כך ש־$norm(n)>norm(a)$.
]

#proposition[
  יהי $(FF, norm(dot.op))$ שדה נורמי. אז $(FF, norm(dot.op))$ ארכימדי אם ורק אם קיים $n in NN$ כך ש־$norm(n)>1$.
]<archimedean-norm-property>

#proof[
  $<==$ עבור $a=1$ קיים $n in NN$ כך ש־$norm(n)> norm(1) = 1$.\
  $==>$ יהי $a in FF$ מאחר ש־$norm(n)>1$ נובע שקיים $N in NN$ כך ש־$norm(n)^N > norm(a)$ (לדוגמה $N=floor(log_norm(n) (norm(a)))+1$). אז $norm(n^N) = norm(n)^N > norm(a)$.
]

#example[
  בהמשך ל@example-norms, הנורמה הראשונה לא ארכימדית בעוד הנורמה השנייה כן ארכימדית.
]

#proposition[
  יהי $(FF, norm(dot.op))$ שדה נורמי. אז $(FF, norm(dot.op))$ לא ארכימדי אם ורק אם לכל $a,b in FF$ מתקיים $norm(a+b)<=max(norm(a), norm(b))$ (אי־שיוויון האולטרה מטרי).
]

#proof[
  $<==$ נניח שהוא לא ארכימדי ויהיו $a,b in FF$ ובלי הגבלת הכלליות נניח $norm(a)>=norm(b)$. מתקיים
  $
    norm(a+b)^n = norm((a+b)^n) = norm(sum_(k=0)^n binom(n, k) a^k b^(n-k)) <= sum_(k=0)^n norm(binom(n, k) a^k b^(n-k))
    = sum_(k=0)^n norm(binom(n, k))norm(a)^k norm(b)^(n-k)
    <=_((star)) sum_(k=0)^n norm(a)^k norm(b)^(n-k)
    <= sum_(k=0)^n norm(a)^k norm(a)^(n-k) \
    = sum_(k=0)^n norm(a)^n = (n+1) norm(a)^n
  $
  כאשר $(star)$ נובע מהיות השדה לא ארכימדי ועם @archimedean-norm-property.\
  מכאן ש־$norm(a+b)^n <= root(n, n+1) norm(a)$ ומאחר ש־$display(lim_(n arrow.r infinity) root(n, n+1))=1$, נסיק כי $norm(a+b)<=norm(a) = max(norm(a), norm(b))$.\
  $==>$ לכל $n in NN$ מתקיים $norm(n)=norm(sum_(i=1)^n 1) <= max(norm(1), dots.h, norm(1)) = 1$ ולכן $(FF, norm(dot.op))$ לא ארכימדי.
]

#proposition[
  יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי ויהיו $a,b in FF$ כך ש־$norm(a)!=norm(b)$ אז $norm(a+b)=max(norm(a), norm(b))$.
]

#proof[
  בלי הגבלת הכלליות $norm(b)<norm(a)$ ונניח בשלילה כי $norm(a+b)<max(norm(a), norm(b))=norm(a)$ ולכן
  $
    norm(a)>max(norm(a+b), norm(b))=max(norm(a+b), norm(-b))>=_("אי־שיוויון האולטרה מטרי") max(norm(a+b)+(-b)) = norm(a)
  $
  וזאת סתירה ולכן $norm(a+b)=max(norm(a), norm(b))$.
]

#proposition[
  יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי ויהיו $a,b,c in FF$. אז בין המספרים $norm(a-b), norm(b-c), norm(a-c)$ יש שניים ששווים זה לזה.
]

#proof[
  בלי הגבלת הכלליות $max(norm(a-b), norm(b-c), norm(a-c)) = norm(a-c)$ ונניח בשלילה כי הם כולם שונים זה מזה ומהנחת השלילה נקבל
  $ norm(a-c) = norm((a-b)+(b-c))<=_("אי־שיוויון האולטרה מטרי") max(norm(a-b), norm(b-c)) < norm(a-c) $
  וזאת סתירה ולכן מתוכם יש שניים ששווים זה לזה (ובעצם הוא יהיה שווה למקסימום).
]

#end_of_lecture("7 – 26/05")

#proposition[
  יהי $(FF, norm(dot.op))$ לא ארכימדי ונגדיר
  $
    cal(O)_norm(dot.op) colon.eq {x in FF bar norm(x)<=1} \
    cal(M)_norm(dot.op) colon.eq {x in FF bar norm(x)<1} \
    cal(O) without cal(M) = cal(U)_norm(dot.op) colon.eq {x in FF bar norm(x)=1}
  $
  אז
  + $cal(O)_norm(dot.op)$ הוא חוג קומוטטיבי עם יחידה
  + $cal(O)_norm(dot.op)^times = cal(U)_norm(dot.op)$
  + $cal(M)_norm(dot.op)$ אידיאל מקסימלי יחיד ב־$cal(O)_norm(dot.op)$
]

#proof[
  + נוכיח כי $cal(O)_norm(dot.op)$ סגורה ביחס לחיבור וכפל וכי $-1, 1 in cal(O)_norm(dot.op)$.\
    יהיו $x,y in cal(O)_norm(dot.op)$ ולכן $norm(x), norm(y)<=1$ ומכאן $norm(x y) = norm(x) norm(y) <= 1$ ואי־שיוויון המשולש האולטרה מטרי מניב לנו $norm(x+y)<=max(norm(x), norm(y)) <=1$.\
    לכן קיבלנו סגירות לכפל ולחיבור ונשים לב ש־$norm(1)=norm(-1)=1$ ולכן גם $-1, 1 in cal(O)_norm(dot.op)$.
  + יהי $x in cal(O)_norm(dot.op)$ כלומר $norm(x)<=1$. אז
    $
      x in cal(O)_norm(dot.op)^times <==> 1/x in cal(O)_norm(dot.op)^times <==> norm(1/x)<=1 <==> 1/norm(x) <=1 <==> 1<=norm(x) <==> norm(x)=1 <==> x in cal(U)_norm(dot.op)
    $
  + יהיו $x,y in cal(M)_norm(dot.op)$. אז $norm(x), norm(y)<1$ ולכן מאי־שיוויון האולטרה מטרי $norm(x+y)<=max(norm(x), norm(y))<1$ ומכאן $x+y in cal(M)_norm(dot.op)$, כלומר $cal(M)_norm(dot.op)$ סגור לחיבור.\
    יהיו $x in cal(M)_norm(dot.op), y in cal(O)_norm(dot.op)$ אז $norm(y)<=1, norm(x)<1$. מכאן ש־$norm(x y) = norm(x)norm(y) < 1$ ומכאן $x y in cal(M)_norm(dot.op)$ וזה בידיוק אומר ש־$cal(M)_norm(dot.op)$ אידיאל.\
    יהי $I$ אידיאל ב־$cal(O)_norm(dot.op)$ כך ש־$cal(M) subset.eq I$ ו־$I!=cal(M)$. אז קיים $x in I without cal(M)_norm(dot.op) subset.eq cal(O)_norm(dot.op) without cal(M)_norm(dot.op) = cal(U)_norm(dot.op) in cal(O)_norm(dot.op)^times$.\
    אז $1/x in cal(O)_norm(dot.op)$ ולכן $1 = 1/x dot.op x in I$ וזאת סתירה, לכן $cal(M)_norm(dot.op)$ אידיאל מקסימלי.\
    נוכיח כי כל אידיאל של $cal(O)_norm(dot.op)$ מוכל ב־$cal(M)_norm(dot.op)$: יהי $I$ אידיאל ב־$cal(O)_norm(dot.op)$ ונניח בשלילה ש־$I subset.eq.not cal(M)$ כלומר קיים $x in I without cal(M)_norm(dot.op) subset.eq cal(O)_norm(dot.op)^times$ ולכן $1/x in cal(O)_norm(dot.op)$ ולכן $1 = 1/x dot.op x in I$ וזאת סתירה ולכן $I subset.eq cal(M)_norm(dot.op)$ וקיבלנו ש־$cal(M)_norm(dot.op)$ הוא אידיאל מקסימלי יחיד.
]

#remark[
  $cal(U)_norm(dot.op)$ זה כל האיברים ההפיכים.
]

#definition[שדה שאריות][
  יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי. השדה $closure(FF)_norm(dot.op)$ נקרא *שדה השאריות* של $(FF, norm(dot.op))$.
]

#definition[הערכה $bold(p)$־אדית][
  יהי $p$ ראשוני, נגדיר $v_p : ZZ arrow NN union {0} union {infinity}$ על־ידי
  $ v_p (a) = max {k in NN union {0} union {infinity} bar p^k divides a} $
]

#proposition[תכונות ההערכה ה־$bold(p)$־אדית][
  + $v_p (a) = infinity$ אם ורק אם $a=0$
  + $v_p (a b) = v_p (a) + v_p (b)$ לכל $a,b in ZZ$
  + $v_p (a+b) >= min(v_p (a), v_p (b))$
]<p_adic_valuation_properties>

#remark[
  יהיו $a in ZZ without {0}$, $s in NN union {0}$. אז $v_p (a) =s$ אם ורק אם קיים $u in ZZ without {0}$ כך ש־$a = p^s u$ וגם $p divides.not u$.
]

#proof[@p_adic_valuation_properties][
  + ישירות מהגדרה
  + אם $a=0$ או $b=0$  השיוויון ברור. אחרת, נסמן $t=v_p (b)$ ו־$s = v_p (a)$ ולכן קיימים $u,v in ZZ without {0}$ כך ש־$p divides.not u, p divides.not v$ ואז $a=p^s u$ ו־$b = p^t v$. מכאן
    $ a b = p^s u dot.op p^t v = p^(s+t) u v $
    אבל $p divides.not u$ וגם $p divides.not v$ ולכן גם $p divides.not u v$. מכאן $v_p (a b) = s + t = v_p (a) + v_p (b)$
  + אם $a=0$ או $b=0$ האי־שיוויון ברור.\
    אחרת, נסמן $t=v_p (b), s=v_p (a)$. אז קיימים $u,v in ZZ$ כך ש־$p divides.not u, p divides.not v$ וגם $a=p^s u, b = p^t v$.\
    בלי הגבלת הכלליות, $v_p (a) <= v_p (b)$ כלומר $s<=t$. אז
    $ a +b = p^s u + p^t v =p^s (u + p^(t-s) v) $
    מכאן נובע ש־$p^s divides a+b$ ולכן $v_p (a+b) >= s = min(s, t) = min(v_p (a), v_p (b))$.
]

#definition[הרחבת ההערכה ה־$bold(p)$־אדית לרציונליים][
  נגדיר $tilde(v)_p : QQ arrow ZZ union {infinity}$ עבור $m in ZZ, n in NN$ על־ידי
  $ tilde(v)_p (m/n) = v_p (m) - v_p (n) $
]

#remark[
  $tilde(v)_p$ מוגדרת היטב ולא תלוי בהצגה של $q in QQ$ כשבר: אם $m, m^prime in ZZ, n, n^prime in NN$ כך ש־$m/n = m^prime/n^prime$ אז $m^prime n = n^prime m$ ולכן
  $ v_p (m^prime) + v_p (n) = v_p (m^prime n) = v_p (n^prime m) = v_p (n^prime) + v_p (m) $
  ולכן $v_p (m^prime) - v_p (n^prime) = v_p (m) - v_p (n)$.
]

#proposition[תכונות של $bold(tilde(v)_p)$][
  + $tilde(v)_p (x) = infinity$ אם ורק אם $x=0$
  + $tilde(v)_p (x y) = tilde(v)_p (x) + tilde(v)_p (y)$ לכל $x,y in QQ$
  + $tilde(v)_p (x+y) >= min(tilde(v)_p (x), tilde(v)_p (y))$ לכל $x,y in QQ$
]

#proof[
  תרגיל.
]

#definition[נורמה $bold(p)$־אדית][
  יהי $alpha in RR$ כך ש־$0<alpha<1$. נגדיר $abs(dot.op)_(p, alpha) : QQ arrow RR^plus$ על־ידי
  $ abs(x)_(p, alpha) = alpha^(tilde(v)_p (x)) $
]<p_adic_norm>

#proposition[
  $(QQ, abs(dot.op)_(p, alpha))$ הוא שדה נורמי לא ארכימדי.
]

#proof[
  + $abs(x)_(p, alpha) = 0$ אם ורק אם $tilde(v)_p (x) = infinity$ וזה קורה אם ורק אם $x=0$
  + $abs(x y)_(p, alpha) = alpha^(tilde(v)_p (x y)) = alpha^(tilde(v)_p (x))alpha^(tilde(v)_p (y)) = abs(x)_(p, alpha)abs(y)_(p, alpha)$
  + $abs(x +y)_(p, alpha) = alpha^(tilde(v)_p (x+y)) <= alpha^(min(tilde(v)_p (x), tilde(v)_p (y))) = max(alpha^(tilde(v)_p (x)), alpha^(tilde(v)_p (y))) = max(abs(x)_(p, alpha), abs(y)_(p, alpha))$
]

#definition[
  $
    cal(O)_(abs(dot.op)_(p, alpha)) colon.eq {x in QQ bar abs(x)_(p, alpha) <=1} = {x in QQ bar tilde(v)_p (x) >= 0} = {m/n in QQ bar m in ZZ, n in NN, p divides.not n}
  $
  בפרט $cal(O)_abs(dot.op)_(p,alpha)$ לא תלוי ב־$alpha$ ונסמן $ZZ_((p)) = cal(O)_abs(dot.op)_(p, alpha)$.
]

#proposition[
  ב־$(QQ, abs(dot.op)_(p, alpha))$ מתקיים ש־$closure(ZZ) = ZZ_((p))$.
]

#proof[\
  $closure(ZZ) subset.eq ZZ_((p))$: נובע מההגדרה של $ZZ_((p))$ ש־$ZZ_((p))$ קבוצה סגורה (כי זה כדור סגור) ו־$ZZ subset.eq ZZ_((p))$ כי כל מספר שלם אפשר לכתוב כמספר רציונלי עם מכנה $1$ ולפיכך $closure(ZZ) subset.eq ZZ_((p))$.\
  $closure(ZZ) supset.eq ZZ_((p))$: יהי $x in ZZ_((p))$ כלומר $z = m/n in QQ$ כך ש־$m in ZZ, n in NN$ ו־$p divides.not n$.\
  יהי $epsilon > 0$ ונוכיח כי קיים $z in ZZ$ כך ש־$abs(z-x)_(p, alpha) < epsilon$.\
  קיים $N in NN$ כך ש־$alpha^N < epsilon$ (לדוגמה $N=floor(log_alpha (epsilon))+1$).\
  מאחר ש־$gcd(n, p^N) =1$ נובע שקיימים $s, t in ZZ$ כך ש־$s p^N + t n = 1$ (מאלגוריתם אוקלידס).\
  מכאן  $m s p^N + m t n = m$ ולכאן $m s p^N = m - m t n$ אבל $p^N divides m s p^N$ נגדיר $z = m t$ ונראה שהוא מקיים את הנדרש:
  $ N<=v_p (m- m t n) = v_p (m-z n) $
  לכן $ N<= tilde(v)_p (m-z n) - underbrace(tilde(v)_p (n), =0) = tilde(v)_p ((m-z n)/n) = tilde(v)_p (x-z) $
  ומכאן
  $ epsilon>alpha^N>=alpha^(tilde(v)_p (x-z)) = abs(x-z)_(p, alpha) = abs(z-x)_(p, alpha) $
  לפיכך $x in closure(ZZ)$ כלומר $ZZ_((p)) subset.eq closure(ZZ)$.
]

#definition[
  $
    cal(M)_abs(dot.op)_(p, alpha) = {x in QQ bar abs(x)_(p, alpha) < 1} = {x in QQ bar tilde(v)_p (x) > 0} = {m/n in QQ bar m in ZZ, n in NN, p divides m, p divides.not n}
  $
]

#proposition[
  + $cal(M)_abs(dot.op)_(p, alpha) = p ZZ_((p))$
  + $cal(M)_abs(dot.op)_(p, alpha) inter ZZ = p ZZ_((p)) inter ZZ = p ZZ$
]

#proof[
  תרגיל.
]

#proposition[
  $
    closure(FF)_abs(dot.op)_(p, alpha) = cal(O)_abs(dot.op)_(p, alpha) slash cal(M)_abs(dot.op)_(p, alpha) = ZZ_((p)) slash p ZZ_((p)) = FF_p
  $
]

#proof[
  לכל $x in ZZ_((p))$ קיים $z in ZZ$ כך ש־$abs(x-z)_(p, alpha) < 1$ כלומר $x-z in cal(M)_abs(dot.op)_(p, alpha)$.\
  נגדיר $pi:ZZ_((p)) arrow ZZ slash p ZZ = FF_p$ על־ידי $pi(x)=z + p ZZ$.\
  אם $z^prime in ZZ$ כך ש־$abs(x-z^prime)_(p, alpha)<1$ אז $x-z^prime in p ZZ_((p))$ ולכן $z^prime - z in p ZZ_((p))$ וגם $z^prime - z in ZZ$ ולכן $z^prime -z = p ZZ$ כלומר $pi(x)$ לא תלוי בבחירה של $z$.\
  קל לוודא כי $pi$ הוא הומומורפיזם של חוגים שהוא על וגם ש־$ker pi = p^(ZZ_((p)))$ ולפיכך $ZZ_p slash p ZZ_((p)) tilde.equiv ZZ slash p ZZ_p = FF_p$ ממשפטי האיזומורפיזם.
]

#end_of_lecture("8 – 02/06")

#theorem[משפט אוסטרובסקי][
  תהיי $norm(dot.op) : QQ arrow RR_plus$ נורמה לא ארכימדית ולא טריוויאלית. אז קיימים $p$ ראשוני ו־$alpha in RR$ כך ש־$0<alpha<1$ כך ש־$norm(dot.op)=abs(dot.op)_(p,alpha)$.
]

#proof[
  מאחר ש־$norm(dot.op)$ לא ארכימדית, לכל $n in NN$ מתקיים $norm(n)<=1$. מאחר ש־$norm(dot.op)$ לא טריוויאלית, קיים $n in NN$ כך ש־$norm(n)<1$. \
  נגדיר $p colon.eq min{n in NN bar abs(n)<1}$ ונראה ש־$p$ ראשוני (ברור שהוא לא $1$). נניח בשלילה כי $p$ פריק ולכן קיימים $a,b in NN$ כך ש־$a,b<p$ ו־$p = a b$.\
  מאחר ש־$a,b < p$ מתקיים ש־$norm(a)=norm(b)=1$ ולכן מכפליות הנורמה $norm(p)=norm(a b) = norm(a)norm(b) =1$ וזו סתירה לכך ש־$norm(p)<1$ ולפיכך $p$ ראשוני.\
  יהי $u in NN$ כך ש־$p divides.not u$ אז קיימים $q in NN union {0}, r in NN$ כך ש־$u= q p + r$ ו־$r<p$.\
  מתקיים ש־$norm(r)=1$ וכמו כן $norm(q)<=1$ ולכן $norm(q p) = norm(q) norm(p) < 1$. מאחר ש־$norm(p q) != norm(r)$ מתקיים ש־$norm(u)=norm(q p + r) = max(norm(q p), norm(r)) = norm(r) = 1$.\
  יהי $v in ZZ_minus$ (כלומר $v in ZZ, v<0$) ו־$p divides.not v$ אז $-v in NN$ ו־$p divides.not -v$ ולכן $norm(v)=norm(-v)=1$.\
  נגדיר $alpha=norm(p)$ ויהי $0 != q in QQ$ אז קיימים $0 != m in ZZ, n in NN$ כך ש־$q=m/n$. קיימים $s in ZZ, t in NN$ כך ש־$p divides.not s, p divides.not t$ ו־$m=p^(v_p (m)) s, n = p^(v_p (n)) t$. אז
  $
    q = (p^(v_p (m)) s)/(p^(v_p (n)) t) = p^(tilde(v)_p (q)) s/t ==> norm(q) = norm(p^(tilde(v)_p (q)) s/t) = norm(p)^(tilde(v)_p (q)) norm(s)/norm(t) = alpha^(tilde(v_p) (q)) 1/1 = alpha^(tilde(v_p) (q)) = abs(q)_(p,alpha)
  $
]

#remark[
  + יהי $p$ ראשוני, $gamma, alpha in RR$ כך ש־$0<alpha<1$ וגם $0<gamma$. אז לכל $q in QQ$
    $
      abs(q)_(p, alpha)^gamma = (alpha^(tilde(v)_p (q)))^alpha = (alpha^gamma)^(tilde(v)_p (q)) = abs(q)_(p, alpha^gamma)
    $
  + יהי $p$ ראשוני, $alpha, beta in RR$ כך ש־$0<alpha,beta<1$. אז לכל $q in QQ$ $abs(q)_(p, beta) = abs(q)_(p, alpha)$ כאשר $gamma = log_alpha (beta)$.
]

#proposition[
  יהיו $p$ ראשונני, $alpha, beta in RR$ כך ש־$0<alpha,beta<1$ ו־$S subset.eq QQ$. אז $S$ פתוחה ב־$(QQ, abs(dot.op)_(p, alpha))$ אם ורק אם $S$ פתוחה ב־$(QQ, abs(dot.op)_(p, beta))$.
]

#proof[
  נניח כי $S$ פתוחה ב־$(QQ, abs(dot.op)_(p, beta))$. אז לכל $x in S$ קיים $r>0$ כך שלכל $y in QQ$, $abs(y-x)_(p, beta) < 1$ גורר ש־$y in S$.\
  אז לכל $y in QQ$ כך ש־$abs(y-x)_(p, alpha) < r^(log_beta (alpha))$ מתקיים
  $ abs(y-x)_(p, beta)=abs(y-x)_(p, alpha)^(log_alpha (beta)) < (r^(log_beta (alpha)))^(log_alpha (beta)) = r $
  לפיכך $S$ פתוח ב־$(QQ, abs(dot.op)_(p, alpha))$ והכיוון ההפוך סימטרי.
]

#proposition[
  יהיו $p$ ראשוני, $alpha, beta in RR$ כך ש־$0<alpha,beta<1$ ו־$(a_n)_(n=1)^infinity$ היא סדרת מספרים רציונליים. אז $(a_n)_(n=1)^infinity$ היא סדרת קושי ב־$(QQ, abs(dot.op)_(p, alpha))$ אם ורק אם $(a_n)_(n=1)^infinity$ היא סדרת קושי ב־$(QQ, abs(dot.op)_(p, beta))$
]

#proof[
  נניח כי $(a_n)_(n=1)^infinity$ היא סדרת קושי ב־$(QQ, abs(dot.op)_(p, alpha))$ ויהי $0<epsilon$ ולכן $0<epsilon^(log_beta (alpha))$ ולכן קיים $N in NN$ כך שלכל $k, l in NN$ המקיימים $k, l > N$ מתקיים
  $ abs(a_k - a_l)_(p, alpha) < epsilon^(log_beta (alpha)) $
  מכאן מתקיים
  $
    abs(a_k - a_l)_(p, beta) = abs(a_k-a_l)_(p,alpha)^(log_beta (alpha)) < epsilon^(log_beta (alpha))^(log_alpha (beta)) = epsilon
  $
  ולכן $(a_n)_(n=1)^infinity$ היא סדרת קושי ב־$(QQ, abs(dot.op)_(p, beta))$
]

#notation[
  יהי $p$ ראשוני. אז מסמנים $abs(dot.op)_p = abs(dot.op)_(p, 1/p)$.
]

== תזכורת על מרחבים מטריים שלמים והשלמה

#definition[מרחב מטרי שלם][
  מרחב מטרי $(M, d)$ נקרא שלם כאשר כל סדרת קושי בו מתכנסת.
]

#theorem[יהי
  $(M,d)$ מרחב מטרי (לאו דווקא שלם). אז קיים מרחב מטרי שלם $(hat(M), hat(d))$ כך ש־$M subset.eq hat(M)$, $hat(d)|_M = d$ ו־$closure(M)=hat(M)$ וההשלמה יחידה (זה לא קריטי לנו).\
  $underline(:hat(M) "בניית")$ נסמן ב־$C S(M)$ את הקבוצה של כל סדרות קושי ב־$M$. נגדיר יחס $~$ על $C S(M)$ באופן הבא: $(x_n) ~ (y_n)$ אם ורק אם $lim_(n arrow.r infinity) d(x_n, y_n) = 0$.\
  אז $hat(M)$ היא קבוצת מחלקות השקילות $hat(d)([(x_n)], [(y_n)]) = lim_(n arrow.r infinity) d(x_n, y_n)$.\
  לכל $x in M$ נתאים סדרה $(x_n)$ כאשר $x_n = x$ לכל $n in NN$. אז $M subset.eq hat(M)$.
]

#definition[שדה נורמי שלם][
  יהי $(FF, norm(dot.op))$ שדה נורמי. $(FF, norm(dot.op))$ נקרא שלם כאשר מרחב מטרי $(FF, d)$ שלם עבור $d(x,y) = norm(x-y)$ לכל $x,y in FF$ ונסמן ב־$(hat(FF), hat(d))$ את ההשלמה של $(FF, d)$.\
  נגדיר $plus, dot.op, norm(dot.op)$ על $hat(FF)$ על־ידי
  $
    [(x_n)] + [(y_n)] = [(x_n + y_n)] \
    [(x_n)] dot.op [(y_n)] = [(x_n dot.op y_n)] \
    norm([(x_n)]) = hat(d)([(x_n)], [(0)])
  $
]

#proposition[
  + $plus, dot.op$ ב־$hat(FF)$ מוגדרים היטב ומקיימים את אקסיומת השדה
  + $norm(dot.op)$ היא נורמה ב־$hat(FF)$ וגם $(hat(FF), hat(d))$ שדה נורמי שלם
  + $(hat(FF), norm(dot.op))$ ארכימדי אם ורק אם $(FF, norm(dot.op))$ ארכימדי
]

#proof[
  תרגיל.
]

#remark[
  ההשלמה של $(QQ, abs(dot.op))$ היא $(RR, abs(dot.op))$.
]

#lemma[
  יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי ו־$(a_n)_(n=1)^infinity$ סדרת קושי ב־$FF$ שאינה שואפת ל־$0$. אז קיים $N in NN$ כך שלכל $n>=N$ מתקיים כי $norm(a_n)= norm(a_N)$ (כלומר החל ממקום מסויים היא קבועה).
]<important_lemma>

#proof[
  מאחר ש־$(a_n)_(n=1)^infinity$ אינה שואפת ל־$0$, קיים $0<epsilon$ כך שלכל $m in NN$ קיים $n>m$ כך ש־$epsilon<norm(a_n)$.\
  מאחר ש־$(a_n)_(n=1)^infinity$ סדרת קושי, קיים $M$ כך שלכל $k, l in NN$ עבורם $k, l > M$ מתקיים $norm(a_k-a_l)<epsilon$.\
  אז קיים $M<N$ כך ש־$epsilon<norm(a_N)$ ואז לכל $N<n$ מתקיים
  $ norm(a_n) = norm((a_n -a_N) + a_N) = max(norm(a_n - a_N), norm(a_N)) = norm(a_N) $
]

#proposition[
  יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי. נסמן את חוג השלמים והאידיאל המקסימלי של $(hat(FF), norm(dot.op))$ ב־$hat(M)_norm(dot.op)$ ו־$hat(O)_norm(dot.op)$ בהתאמה. אז
  + $hat(O)_norm(dot.op) = closure(O_norm(dot.op))$
  + $hat(M)_norm(dot.op) = closure(M)_norm(dot.op)$
  + נסמן ב־$closure(FF_norm(dot.op))$ את שדה השאריות. אז $closure(hat(FF)_norm(dot.op)) tilde.equiv closure(FF_norm(dot.op))$
  + ${norm(a) bar a in hat(FF)} = {norm(a) bar a in FF}$
]

#proof[
  + מאחר ש־$O_norm(dot.op) subset.eq hat(O)_norm(dot.op)$ וגם $hat(O)_norm(dot.op)$ סגור מתקיים ש־$closure(O)_norm(dot.op) subset.eq hat(O)_norm(dot.op)$. בכיוון השני, יהי $0!=a in hat(O)_norm(dot.op)$. אז קיימת סדרת קושי $(a_n)_(n=1)^infinity subset.eq FF$ כך ש־$lim_(n arrow.r infinity) a_n = a$
    אז $lim_(n arrow.r infinity) norm(a_n) = norm(a)$. לפי הלמה, קיים $N in NN$ כך שלכל $N<n$ מתקיים ש־$norm(a_n) = norm(a_N) = norm(a)$ אבל $norm(a) < 1$ ומכאן $a_n in O_norm(dot.op)$. ולכן $a in closure(O)_norm(dot.op)$ כגבול של סדרה.\
  + זהה
  + נגדיר $phi: closure(FF) arrow closure(hat(FF))$ על־ידי $phi(a+M_norm(dot.op)) = a+hat(M)_norm(dot.op)$ לכל $a in O_norm(dot.op)$.\
    קל לראות שזה מוגדר היטב וזה הומומורפיזם של חוגים. מאחר ש־$closure(FF)$ שדה אז $ker phi = {0}$ ולכן $phi$ חד־חד ערכית.\
    לא טריוויאלי שהוא על (מה עם ההרחבה גדולה יותר?). יהי $a in hat(O)_norm(dot.op)$ ולכן קיימת סדרת קושי $(a_n)_(n=1)^infinity subset.eq O_norm(dot.op)$ כך ש־$lim_(n arrow.r infinity) a_n = a$. \
    אז קיים $N in NN$ כך שלכל $N<n$ מתקיים $norm(a_n - a)<1$ כלומר $a_n - a in hat(M)_norm(dot.op)$. מכאן ש־$phi(a_n) = a_n + hat(M)_norm(dot.op) = a + hat(M)_norm(dot.op)$ ולכן $phi$ על ו־$phi$ איזומורפיזם.
  #end_of_lecture("9 – 09/06")
  4. ברור כי ${norm(x) bar x in FF} supset.eq {norm(x) bar x in hat(FF)}$. בכיוון השני, יהי $0!=a in hat(FF)$. אז קיימת סדרה $(a_n)$ של איברים מ־$FF$ כך ש־$lim_(n arrow.r infinity) a$. מהלמה קיים $N in NN$ כך שלכל $N<=n$ מתקיים $norm(a_n) = norm(a_N)$ ומאחר ש־$lim_(n arrow.r infinity) norm(a_n) = norm(a)$ לכל $N<=n$ מתקיים $norm(a_n) = norm(a)$ ולכן $norm(a) = norm(a_n) in {norm(x) bar x in FF}$
]

== שדה המספרים ה־$p$־אדיים
#notation[
  נסמן את ההשלמה של $(QQ, abs(dot.op)_p)$ ב־$QQ_p$ ונקרא לו שדה המספרים ה־$p$־אדיים.\
  בנוסף, נסמן
  $ ZZ_p colon.eq {x in QQ_p bar abs(x)_p <=1} $
]

#proposition[
  + $ZZ_p = closure(ZZ_((p))) = closure(ZZ)$
  + האידיאל המקסימלי ב־$(QQ_p, abs(dot.op)_p)$ הוא $closure(p ZZ_((p))) = p ZZ_p$
  + שדה השאריות של $(QQ_p, abs(dot.op))$ הוא $ZZ_p slash p ZZ_p tilde.equiv ZZ_((p)) slash p ZZ_((p)) tilde.equiv FF_p$
  + ${abs(x)_p bar x in QQ_p} = {abs(x)_p bar x in QQ}={1/p^s bar s in ZZ union {infinity}}$
]

#proof[
  אנלוגי לטענה הקודמת.
]

#lemma[
  יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי שלם ותהיי $(a_n)$ סדרה ב־$FF$ ששואפת ל־$0$. אזי $sum_(n=0)^infinity a_n = lim_(n arrow.r infinity) a_i$ מתכנס.
]

#proof[
  יהי $epsilon>0$, קיים $N in NN$ כך שלכל $N <= n$ מתקיים $norm(a_n) < epsilon$. מכאן, לכל $N<-m<n$ מתקיים כי
  $ norm(b_n - b_m) = norm(sum_(i=1m+)^n a_i) <= max_(m+1<=i<=n) norm(a_i) < epsilon $
  לכן $(b_n)$ היא סדרת קושי ומאחר ש־$(FF, norm(dot.op))$ שלם היא מתכנסת.
]

#notation[
  $NN_0 = NN union {0}$.\
  מעתה והלאה הנורמה המדוברת היא הנורמה ה־$p$־אדית אלא אם נאמר אחרת (לפעמים נרשם $norm(dot.op)$ או $abs(dot.op)$ אבל הכוונה לנורמה ה־$p$־אדית).
]

#proposition[
  תהיי $(a_n)_(n=1)^infinity$ סדרה ב־$ZZ$ כך ש־$0<= a_n <= p-1$ עבור $n in NN_0$.\
  ב־$QQ_p$ קיים הגבול $sum_(n=0)^infinity a_n p^n = a$ וגם $a in ZZ_p$ ויתר על־כן, $a in p ZZ_p <==> a_0 = 0$.
]

#proof[
  מאחר ש־$norm(a_n) in {0,1}$ לכל $n in NN_0$ מתקיים $norm(a_n p^n) in {0, 1/p^n}$ ולכן $lim_(n arrow.r infinity) a_n p^n = 0$ ומהלמה הקודמת הסכום $sum_(n=0)^infinity a_n p^n$ מתכנס ל־$a$.\
  מאחר ש־$abs(sum_(i=1)^n a_i p^i)_p < 1$ (מ@important_lemma) מתקיים $abs(sum_(i=1)^infinity a_i p^i)_p < 1$ ולכן אם $a_0 = 0$ אז $abs(a)_p = abs(sum_(i=1)^infinity a_i p^i)_p < 1$.\
  אם $a_0 != 0$ אז $abs(a_0)_p = 1$ ולכן $abs(a)_p = max(abs(a_0)_p, abs(sum_(i=1)^infinity a_i p^i)_p) = 1$.
]

#proposition[
  תהיינה $(a_n)_(n=0)^infinity, (b_n)_(n=0)^infinity$ סדרות ב־$ZZ$ כך ש־$0<=a_n, b_n <= p-1$ לכל $n in NN_0$ וגם $sum_(i=0)^infinity a_n p^n = sum_(i=0)^infinity b_n p^n$ אז $a_n = b_n$ לכל $n in NN_0$.
]

#proof[
  נניח בשלילה שקיים $n in NN_0$ כך ש־$a_n != b_n$ ולכן נגדיר $m = min{n in NN_0 bar a_n != b_n}$. \
  אזי $sum_(i=0)^(m-1) a_i p^i = sum_(i=0)^(m-1) b_i p^i$ ולכן גם $sum_(i=m)^infinity a_i p^i = sum_(i=m)^infinity b_i p^i$ (זנב) ומכאן
  $
    a_m + sum_(i=m+1)^infinity a_i p^(i-m) = sum_(i=m)^infinity a_i p^(i-m) = sum_(i=m)^infinity b_i p^(i-m) = b_m + sum_(i=m+1)^infinity b_i p^(i-m)
  $
  לכן
  $ a_m - b_m = sum_(i=m+1)^infinity b_i p^(i-m)-sum_(i=m+1)^infinity a_i p^(i-m) $
  כמו בהוכחה הקודמת,
  $ abs(sum_(i=m+1)^infinity b_i p^(i-m)-sum_(i=m+1)^infinity a_i p^(i-m))_p < 1 $
  אבל $a_m != b_m$ ולכן $abs(a_m - b_m)_p = 1$ וזאת סתירה.
]

#proposition[
  לכל $x in ZZ_p$ ולכל $k in NN_0$ קיים $r in ZZ$ יחיד כך ש־$0<=r<=p^x-1$ כך ש־$abs(x-r)_p <= 1/p^k$.
]

#proof[
  מאחר ש־$closure(ZZ)=ZZ_p$ נובע שקיים $z in ZZ$ כך ש־$abs(x-z)_p <= 1/p^k$.\
  נחלק את $z$ ב־$p^k$ עם שארית ונקבל $q,r in ZZ$ כך ש־$z=q p^k + r$ ו־$0<=r<=p^k-1$ ומתקיים
  $ abs(x-r)_p = abs((x-z)+(z-r))_p = abs(x-z+q p^k) <= max(abs(x-z)_p, abs(q p^k)_p) <= 1/p^k $
  נשאר להראת יחידות – יהיו $0<=r_1, r_2 <= p-1$ כך ש־$abs(x-r_1)_p, abs(x-r_2)_p <= 1/p^k$ מכאן $ abs(r_1 - r_2)_p = abs((x-r_1) - (x-r_2))_p <= max(abs(x-r_1)_p, abs(x-r_2)_p) <= 1/p^k $
  מאחר ש־$-(p^k-1) <= abs(r_1-r_2) <= p^k - 1$ אנו מסיקים ש־$r_2 - r_1 = 0$.
]

#corollary[
  לכל $x in ZZ_p$ קיימת סדרה יחידה $(r_n)_(n=1)^infinity subset.eq ZZ$ כך שמתקיים
  + $0<=r_k <= p^k-1$
  + $abs(x-r_k)_p <= 1/p^k$
  + $p^k divides r_(k+1) - r_k$
]

#proof[
  נשים לב ש־$1$ ו־$2$ נובעים מהטענה הקודמת. עבור $3$,
  $ abs(r_(k+1) - r_k)_p = abs((x-r_k)-(x-r_(k+1))) <= max(abs(x-r_k)_p, abs(x-r_(k+1))_p) <=_((2)) 1/p^k $
]

#proposition[
  יהי $x in ZZ_p$ קיימת סדרה $(a_n)_(n=0)^infinity subset.eq ZZ$ כך ש־$0<=a_n <= p-1$ לכל $n in NN_0$ וגם $lim_(n arrow infinity) sum_(i=0)^n a_i p^i =sum_(n=0)^infinity a_n p^n = x$.
]

#proof[
  נגדיר $ a_0 = r_1, quad a_1 = frac(r_-2 - r_1, p),quad a_2 = frac(r_3 - r_2, p^2), quad a_i = frac((r_(i+1) - r_(i)), p^i) $
  מהמסקנה $a_i in ZZ$ ומאחר ש־$0<=r_(i+1)<=p^(i+1)-1$ ו־$0<=r_i <= p^i - 1$ מתקיים $-(p^i-1)<= r_(i+1) - r_i <= p^(i+1) - 1$.\
  מאחר ש־$p^i divides r^(i+1) - r^i$ מתקיים $0<=r_(i+1)-r_i <= p^(i+1)-p^i$ ולכן $0<=a_i <= p-1$ ולסיום
  $ r_n = r_(n-1) + a_(n-1) p^(n-1) = r_(n-2) + a_(n-2) p^(n-2) + a_(n-1) p^(n-1) = dots.h.c = sum_(i=0)^(n-1) a_i p^i $
  ולכן $lim_(n arrow.r infinity) sum_(i=0)^n a_i p^i = lim_(n arrow.r infinity) r_(n+1) = x$.
]

#proposition[
  לכל $x in QQ_p^times$ קיים $s in ZZ$ וסדרה $(a_n)_(n=s)^infinity subset.eq ZZ$ כך ש־$0<=a_n <= p-1$ לכל $n in ZZ$ עם $n>=s$ ובנוסף $a_s !=0$ ו־$sum_(n=s)^infinity a_n p^n = x$.
]

#proof[
  קיים $s in ZZ$ כך ש־$abs(x)_p = 1/p^s$ ולכן נגדיר $x^prime = frac(x, p^s)$ ואז $abs(x^prime)_p = frac(abs(x)_p, abs(1/p^s)_p) = 1$ ולכן קיימת סדרה $(a^prime_n)_(n=0)^infinity subset.eq ZZ$ כך ש־$0<=a^prime_n <= p-1$ וגם $sum_(n=0)^infinity a^prime_n p^n$ ומאחר ש־$abs(x^prime)=1$ מתקיים $a^prime_0 != 0$ ולכן נגדיר $a_n = a^prime_(n-s)$ לכל $n in NN$ ו־$s<=n$ ונקבל $sum_(n=s)^infinity a_n p^n = sum_(n=0)^infinity a_(n+s) p^(n+s) = sum_(n=0)^infinity a^prime_n p^n p^s = x^prime p^s = x$.
]

#end_of_lecture("10 – 16/06")

#notation[
  + אם $(a_i)_(i=0)^infinity subset.eq ZZ$ כאשר $0<=a_i<=p-1$ רושמים $(dots.h a_2 a_1 a_0)_p = sum_(i=0)^infinity a_i p^i$
  + אם $s in ZZ_minus$ ו־$(a_i)_(i=s)^infinity subset.eq ZZ$ עם $0<=a_i <= p-1$ ו־$a_s !=0$ רושמים $( dots.h a_1 a_0.a_(-1) dots.h a_(s+1) a_s)_p = sum_(i=s)^infinity a_i p$
]

#corollary[
  $closure(NN_0) = ZZ_p$.
]

#example[
  $x=-1$ ואז
  $
    -1 = lim_(n arrow.r infinity) (p^n-1) = lim_(n arrow.r infinity) (p-1)(1+p+1+ dots.h.c + p^(n-1)) = lim_(n arrow.r infinity) sum_(i=0)^(n-1) (p-1)p^i = sum_(i=0)^infinity (p-1)p^i
  $
  כלומר $(dots.h (p-1)(p-1))=-1$
]

#proposition[
  יהיו $s,t in ZZ$, $d in NN$ ו־$(a_i)_(i=s)^infinity subset.eq ZZ$ כך ש־$0<=a_i <=p-1$ לכל $n in ZZ$, $s<=n$ עם $a_s != 0$, $s<=t$ ולכל $t<=i$ מתקיים $a_(i+d) = a_i$.\
  אזי $sum_(i=s)^infinity a_i p^i in QQ$.
]

#remark[
  $s$ המיקום של הספרה הראשונה, $d$ אורך המחזור ו־$t$ כמה ספרות יש עד שזה הופך להיות למחזורי (המיקום של ההתחלה של המחזור הראשון).
]

#proof[
  נסמן $ x=sum_(i=s)^infinity a_i p^i, wide r = sum_(i=s)^(t-1) a_i p^i, wide q = sum_(s=t)^(t+d-1) a_i p^i $
  אז
  $
    x-r-q = sum_(i=t+d)^infinity a_i p^i =_(a_(i+d) = a_i) p^d sum_(i=t+d)^infinity a_(i-d) p^(i-d) = p^d sum_(j=t)^infinity a_j p^j = p^d (x-r)
  $
  מכאן $(x-r)(1-p^d)=q$ ולכן $x=r+frac(q, 1-p^d) in QQ$.
]

#proposition[
  יהיו $s in ZZ$, $(a_i)_(i=s)^infinity subset.eq S$ כך ש־$0<=a_i <= p-1$ לכל $s<=i$, $a_s != 0$ וגם $sum_(i=s)^infinity a_i p^i in QQ$. אז קיימים $t in ZZ$, $s<=t$ ו־$d in NN$ כך ש־$a_(i+d) = a_i$ לכל $t<=i$.
]

#proof[
  קיימים $m, n in ZZ$ כך ש־$p divides.not m, p divides.not n$ וגם $sum_(i=s)^infinity a_i p^i = p^s frac(m, n)$ כאשר כמובן $n!=0$.\
  לכל $i in NN_0$ נגדיר $c_i = a_(i+s)$ ואז
  $ frac(m, n) = sum_(i=s)^infinity a_i p^(i-s) = sum_(j=0)^infinity a_(j+s) p^j = sum_(j=0)^infinity c_j p^j $
  מכאן $m=n sum_(j=0)^infinity c_j p^j$.\
  לכל $k in NN$ נסמן $ r_k colon.eq frac(n sum_(j=k)^infinity c_j p^j, p^k) = frac(m - n sum_(j=0)^(k-1) c_j p^j, p^k) $
  אז $r_k in QQ$, $abs(r_k)_p <=1$ וגם $r_k in ZZ$. יתר על־כן מתקיים
  $
    frac(m+n, p^k)-n = frac(m-n(p^k-1), p^k) <= frac(m-n sum_(j=0)^(k-1) (p-1)p^j, p^k) frac(m-n sum_(j=0)^(k-1) c_j p^j, p^k) <= frac(m, p^k)
  $
  קיים $N in NN$ כך שלכל $N<=k$ מתקיים ש־$abs(frac(m, p^k)) < 1$ וגם $abs(frac(m+n, p^k))<1$ ולכן עבור $N <=k$ מתקיים $-n-1 < r_k < 1$ ולכן קיימים $N <= k <l$ כך ש־$r_k = r_l$.\
  מאחר שמתקיים כי $r_k eq.triple n c_k mod p$ אנו מסיקים כי $n c_k eq.triple n c_l mod p$ ומכאן $c_k eq.triple c_l mod p$ אבל מכך ש־$0<=a_i <= p-1$ נובע כי $c_k = c_l$.\
  בנוסף, מתקיים ש־$ r_(k+1) = frac(r_k - n c_k, p) = frac(r_l - n c_l, p) = r_(l+1) $
  אז לכל $i in NN_0$ מתקיים כי $c_(k+1) = c_(l+1)$, נגדיר $t=k+s$, $d=l-k$ ואז לכל $t<=i$ מתקיים $0<=i-k-s$ ולכן $ a_(i+d)= c_(i+d-s) = c_(l+(i-k-s)) = c_(k+i-k-s) = c_(i-s) = a_i $
]

#example[
  נמצא הצגה $5$־אדית של $frac(1, 3)$ ולכן נסמן $frac(1, 3) = sum_(i=0)^infinity a_i p^i$ כאן $s=0$, $m=1$, $n=3$, $r_0 = m = 1$ ו־$0<=a_i = c_i <= p-1 = 4$.\
  מתקיים $1 eq.triple_(mod 5) 3 a_0$ ולכן $a_0 = 2$ אז $r_1 = frac(r_0 - n a_0, p) = frac(1-3 dot.op 2, 5) = frac(-5, 5) = -1$.\
  כעת ניתן לחשב גם $-1 eq.triple_(mod 5) 3 dot.op a_1$ ולכן $a_1 = 3$ ואז באופן דומה $r_2 = frac(r_1 - n a_1, 5) = frac(-1-3 dot.op 3, 5) = frac(-10, 5) = -2$.\
  ניקח $-2 eq.triple_(mod 5) 3 dot.op a_2$ ולכן $a_2 = 1$ ושוב $r_3 = frac(r_2 - n a_2, 5) = frac(-2 - 3 dot.op 1, 5) = frac(-5, 5) = -1$.\
  מתקיים ש־$r_3 = r_1$ ובעצם התחלנו את המחזור ולכן לכל $1<=i$ מתקיים כי $a_(i+2) = a_i$ ולסיכום $(dots.h 1 3 1 3 2)_5 = frac(1, 3)$.
]

#proposition[
  כל אידיאל ב־$ZZ_p$ הוא מהצורה $p^n ZZ_p$ עבור $n in NN$.
]

#proof[
  יהי $I$ אידיאל ב־$ZZ_p$ ולכן מתקיים $I subset.eq p ZZ_p$ ו־${abs(x)_p bar x in p ZZ_p} = {frac(1, p^i) bar i in NN}$.\
  לכן קיים $h=max{abs(x)_p bar x in I}$ וגם קיים $a in I$ כך ש־$abs(a)_p = h$. בנוסף, קיים $n in NN$ כך ש־$h = frac(1, p^n)$, נוכיח כי $I = p^n ZZ_p$.\
  מתקיים כי $abs(p^n)_p = h$ ומכאן $abs(frac(p^n, a))_p = 1$ ולכן $frac(p^n, a) in ZZ_p$ ומכאן $p^n in a ZZ_p subset.eq I$ לפיכך $p^n ZZ_p subset.eq I$.\
  להכלה השנייה, יהי $b in I$ ואז $abs(b)_p <= abs(a)_p = h$ ומכאן $abs(frac(b, p^n))_p <= 1$ ולכן $frac(b, p^n) in ZZ_p$ וכמקודם $b in p^n ZZ_p$ ולפיכך $I subset.eq p^n ZZ_p$.
]

#corollary[
  $ZZ_p$ הוא חוג ראשי (תחום שלמות שכל אידיאל שלו הוא ראשי).
]

#notation[
  + עבור $a,b in ZZ_p$ נרשום $a eq.triple_(mod p^n) b$ כאשר $a-b in p^n ZZ$
  + לכל $a in ZZ_p$ נסמן $closure(a) = a + p ZZ_p in ZZ_p slash p ZZ_p$ (הרדוקציה)
]

#lemma[הלמה של הנזל][
  יהיו $f in ZZ_p [x]$ ו־$w_0 in ZZ_p$ כך ש־$closure(f(w_0))=0$ וגם $closure(f^prime (w_0)) != 0$. אז קיים $w in ZZ_p$ יחיד כך ש־$closure(w) = closure(w_0)$ וגם $f(w)=0$.
]

#remark[
  עבור $f= c_n x^n + dots.h.c + c_1 x + c_0$ הנגזרת היא $f^prime = n c_n x^(n-1) + dots.h.c + c_1$.
]

#example[
  עבור $p!=2$ ראשוני, נבחר $a in ZZ_p$  כך ש־$closure(a)!=0$ (לא מתחלק ב־$p$) ונגדיר $f=x^2-a$.\
  מתקיים $d^prime = 2x$ ומהלמה של הנזל נובע כי אם קיים $w_0 in ZZ_p$ כך ש־$w_0^2 eq.triple_(mod p) a$ אז מאחר ש־$a eq.triple.not_(mod p) 0$ מתקיים $f^prime (w_0) = 2w_0 eq.triple.not_(mod p) 0$ ולכן קיים $w in ZZ_p$ כך ש־$w^2 = a$ כלומר קיים שורש!
]

#remark[
  כאשר $p=2$ הדוגמה לעיל לא נכונה כי עבור $a = 3$ נסתכל על הפולינום $f=x^2-3 = x^2-1$ ועבור $w_0 = 1$ מתקיים ש־$1^2 eq.triple_(mod 2) 3$ אבל ב־$ZZ_2$ אין שום מספר שהריבוע שלו ייתן לנו שלוש בידיוק כי זה או אפס או אחד.
]

#end_of_lecture("11 – 23/06")
