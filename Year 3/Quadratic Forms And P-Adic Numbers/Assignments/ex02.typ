#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 02 --- תבניות ריבועיות ומספרים $P$־אדיים, 80507 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהיו $(V,q)$ מרחב ריבועי מעל שדה $FF$ ו־$u_1, dots.h, v_k in V$.\
המטריצה $A = (a_(i j))_(1<=i,j<=n) in M_n (FF)$ מוגדרת על־ידי $a_(i j) = g_q (u_i, u_j)$.
נוכיח שאם $A$ הפיכה אז הסדרה $(u_1, dots.h, u_k)$ בלתי תלויה לינארית.

#proof[
  #todo
]

#question()
יהיו $(V,q), (V^prime, q^prime)$ מרחבים ריבועיים ו־$f:V arrow V^prime$ איזומטריה.\
נוכיח כי אם $(V,q)$ לא מנוון אז $f$ חד־חד ערכית.

#proof[
  $f$ איזומטריה כלומר לכל $v in V$ מתקיים $q(v)=q^prime (f(v))$.\
  נניח ש־$(V,q)$ לא מנוון ולכן $V^perp = {0_V}$ כאשר הגדרנו
  $ V^perp colon.eq {w in V bar forall v in V, space w perp v} $
  מכיוון ש־$f$ העתקה לינארית מספיק שנראה $ker f = {0}$.\
  נניח בשלילה שקיים $w!= 0$ כך ש־$f(w)=0_(V^prime)$.\
  מנוסחאת הפולריזציה ומכך ש־$f$ איזומטריה נקבל
  $ g_(q^prime) (f(v), f(u))=g_q (v,u) $
  ובמקרה שלנו עם כל $v in V$ מתקיים
  $ g_q (w, v) = g_(q^prime) (f(w), f(v)) = g_(q^prime) (0_(V^prime), f(v)) = 0 $
  כלומר קיבלנו ש־$g_q (w,v) = 0$ לכל $v in V$ כלומר $w in V^perp$ אבל הנחנו ש־$V^perp = {0}$ ו־$w!=0$ וזאת סתירה. אז $f$ חד־חד ערכית.
]

#question()
נביא דוגמה למרחבים ריבועיים $(V,q), (V^prime, q^prime)$ ואיזומטריה $f:V arrow V^prime$ שאיננה חד־חד ערכית.

#proof[
  #todo
]

#question()
#todo

#question()
נתונים שדה $FF$ ומטריצות $A,B in M_n (FF)$ החופפות זו לזו, נוכיח כי $rank A = rank B$.

#proof[
  מכך ש־$A,B$ חופפות נובע שקיימת $P in M_n (FF)$ הפיכה כך ש־$B = P^t A P$.\
  בלינארית 1 ראינו שאם $A$ מטריצה מסדר כלשהי נכפלת במטריצה $P$ שהיא הפיכה מאותם סדרים מתקיים $rank(A P) = rank(A)$ ולכן מתקיים
  $ rank(B) = rank(P^t A P) = rank(A P) = rank(A) $
]

#question()
יהיו $(V,q)$ מרחב ריבועי ו־$cal(B)$ בסיס של $V$. נוכיח $dim V=rank[g_q]_cal(B) + dim V^perp$.

#proof[
  מטענה שראינו בהרצאה נובע ש־$(V,q)$ מנוון אם ורק אם $[g_q]_cal(B)$ אינה הפיכה.\
  אם $(V,q)$ לא מנוון נובע ש־$V^perp = {0_V}$ ולכן $[g_q]_cal(B)$ היא מדרגה מלאה ו־$dim V^perp = 0$ והטענה נובעת.\
  אחרת, $(V,q)$ מנוון ולכן $V^perp != {0_V}$ כלומר $dim V^perp > 0$ ו־$[g_q]_cal(B)$ אינה הפיכה כלומר $rank([g_q]_cal(B)) < dim V$.\
  $w in V^perp$ אם ורק אם לכל $v in V$ מתקיים $g(w,v) = 0$, כלומר $w^t [g_q]_cal(B) v = 0$ לכל $v in V$ וזה קורה אם ורק אם $w^t [g_q]_cal(B)=0$ ו־$[g_q]_cal(B)$ כמובן סימטרית (כי היא מייצגת תבנית ביליניארית סימטרית) ולכן התנאי קורה אם ורק אם $[g_q]_cal(B)w = 0$.\
  לכן $w in V^perp$ אם ורק אם וקטור הקורדינאטות שלו נמצא במרחב האפס של המטריצה נסמנו ב־$nullspace([g_q]_cal(B))$ ולכן $dim V^perp = dim nullspace([g_q]_cal(B))$.\
  ממשפט הדרגה באלגברה לינארית נקבל
  $
    rank([g_q]_cal(B))=n - dim nullspace([g_q]_cal(B)) ==> rank([g_q]_cal(B))+ dim nullspace([g_q]_cal(B))=n <==> rank([g_q]_cal(B)) + dim V^perp = n
  $
]

#question()
#todo

#question()
יהיו $(V,q)$ מרחב ריבועי ו־$u,w in V$ כך ש־$q(u)=q(w)=0$. נסמן $U=Span(u)$ ו־$W=Span(u, w)$.

#subquestion()
נוכיח ש־$(U,q|_U)$ בהכרח מנוון.

#proof[
  נשים לב שמהגדרת הספאן נובע שכן $v in U$ הוא מהצורה $alpha u$ עבור $alpha$ סקלר כלשהו ולכן
  $ g(alpha u, beta u)= alpha beta g(u,u) = alpha beta q(u) = alpha beta 0 = 0 $
  וזה בידיוק אומר שכל וקטור ב־$U$ מאונך לכל וקטור אחר ב־$U$ ולכן $U=U^perp$ ובפרט $U^perp != {0_V}$ (תחת ההנחה ש־$u!=0$).
]

#subquestion()
נוכיח ש־$(W, q|_W)$ לא בהכרח מנוון.

#proof[
  נסתכל על $V=RR^2$ עם $q(x,y)=x y$, אז המטריצה המייצגת היא $A = mat(0, 1/2; 1/2, 0)$ ונבחר את הוקטורים $u=vec(1, 0), v=vec(0, 1)$.\
  אכן מתקיים $q(u) = 0, q(v) =0$ ובפרט $u,v$ פורשים את $RR^2$ אבל $A$ מטריצה הפיכה ולכן משאלה 6 נובע ש־$W^perp = {0_V}$ (כי ההפתרון היחיד למשוואה הוא הפיתרון הטריוויאלי).
]

#question()
יהיו $V$ מרחב וקטורי מעל שדה $FF$ ו־$ell_1, ell_2 : V arrow FF$ העתקות לינאריות.\
נגדיר $q:V arrow FF$ על־ידי $q(v)=ell_1 (v)ell_2 (v)$.

#subquestion()
נוכיח ש־$q$ היא תבנית ריבועית.

#proof[
  עלינו להראות
  + לכל $v in V$ ולכל סקלר $alpha in FF$ מתקיים $q(alpha v) = alpha^2 q(v)$
  + להראות קיום של תבנית בילנארית סימטרית
  יהי $v in V$ ו־$alpha in FF$, מתקיים מכך ש־$ell_1, ell_2$ העתקות לינאריות
  $
    q(alpha v) = ell_1 (alpha v) ell_2 (alpha v) = alpha ell_1 (v) alpha ell_2 (v) = alpha^2 ell_1 (v) ell_2 (v) = alpha^2 q(v)
  $
  נגדיר אם כך
  $ g(u,v) = 1/2 (q(u+v)-q(u)-q(v)) $
  היא כמובן סימטרית מכך ש־$ell_1, ell_2$ הן העתקות לינאריות ותכונות ההעתקה הלינארית.\
  נראה לינאריות ברכיב הראשון, גם זה נובע מהיות $ell_1, ell_2$ העתקות לינאריות
  $
    g(alpha u + w, v) & = 1/2(q(alpha u + w + v)-q(alpha u + w)-q(v)) \
    & = 1/2 (ell_1 (alpha u + w + v) ell_2 (alpha u + w + v)-ell_1(alpha u+w)ell_2(alpha u+w)-ell_1(v)ell_2(v)) \
    &=1/2 ((alpha ell_1 (u) + ell_1 (w) + ell_1 (v))(alpha ell_2 (u) + ell_2 (w) + ell_2 (v))-(alpha ell_1(u)+ell_1(w))(alpha ell_2(u)+ell_2(w))-ell_1 (v) ell_2 (v)) \
    &=_((star))1/2 (alpha a_1 + b_1 + c_1)(alpha a_2 + b_2 + c_2)-(alpha a_1+b_1)(alpha a_2 + b_2)-c_1 c_2 \
    & = 1/2 (cancel(alpha^2 a_1 a_2)+ cancel(alpha a_1 b_2) + alpha a_1 c_2 + cancel(b_1 alpha a_2) + cancel(b_1 b_2) + b_1 c_2 + c_1 alpha a_2 + c_1 b_2 + cancel(c_1 c_2) - cancel(alpha^2 a_1 a_2) - cancel(alpha a_1 b_2) - cancel(b_1 alpha a_2) - cancel(b_1b_2) - cancel(c_1c_2)) \
    &= 1/2 (alpha a_1 c_2 + b_1 c_2 + c_1 alpha a_2 + c_1 b_2) \
    &= alpha/2 (a_1 c_2 + c_1 a_2) + 1/2(b_1 c_2 + c_1 b_2) \
    &= alpha q(u,v)+g(w,v)
  $
  כאשר $(star)$ זה כי סימנו $a_i =ell_i (u)$, $b_i = ell_i (w)$ ו־$c_i = ell_i (v)$ לפשטות.\
]

#subquestion()
נוכיח שאם $dim V>=3$ אזי $(V,q)$ מנוון.

#proof[
  נביט בגרעינים של שתי ההעתקות הליניאריות
  $ U_1 = ker(ell_1) = {v in V bar ell_1(v) = 0} wide U_2 = ker(ell_2) = {v in V bar ell_2(v) = 0} $
  $ell_1, ell_2$ הן העתקות לינאריות לתוך שדה שמימדו $1$ הרי ש־$dim U_1 >= dim V - 1$ ו־$dim U_2 >= dim V - 1$.\
  ממשפט המימד מתקיים
  $ dim(U_1 inter U_2) = dim U_1 + dim U_2 - dim(U_1 + U_2) $
  מכיוון ש־$dim(U_1 + U_2) <= dim V$, נקבל
  $ dim(U_1 inter U_2) >= (dim V - 1) + (dim V - 1) - dim V = dim V - 2 $
  מההנחה, $dim V >=3$ ולכן $dim(U_1 inter U_2) >= 3 - 2 = 1$.\
  מכאן שקיים ווקטור $w != 0$ כך ש-$w in U_1 inter U_2$, כלומר $ell_1(w) = 0$, $ell_2(w) = 0$.\
  נציב $ell_1 (w) = 0 = ell_2 (w)$ בהגדרת $q(w,v)$ לכל $v in V$ ונקבל
  $ g(w, v) = 1/2 (0 dot ell_2(v) + 0 dot ell_1(v)) = 0 $
  קיבלנו ש-$w != 0$ ומאונך לכל $v in V$, לכן $w in V^perp$ ולכן $V^perp !- {0_V}$ ולכן $(V,q)$ מנוון.
]

#question()
יהי $FF$ שדה ותהיי תבנית ריבועית $q:FF^2 arrow FF$ מוגדרת על־ידי $ q vec(x_1, x_2) = x_1^2+x_2^2 $
נוכיח כי $0 in q(FF^2 without {vec(0, 0)})$ אם ורק אם $-1 in (FF_p^times)^2$.

#proof[
  #todo
  $<==$ \
  $==>$ נניח כי $-1 in (FF_p^times)^2$
]

#question()
#todo

#question()
#todo
