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

= מרחבים ריבועיים
== תבניות ביליניאריות סימטריות
#definition[תבנית בילנארית סימטרית][
  יהי $FF$ שדה כך ש־ $char(FF) != 2$ (כלומר $1_FF + 1_FF != 0_FF$), ויהי $V$ מרחב וקטורי מעל $FF$.
  פונקציה $g: V times V -> FF$ נקראת תבנית בילינארית סימטרית (תב"ס) אם היא מקיימת את האקסיומות הבאות
  + לכל $v, w_1, w_2 in V$ מתקיים $g(v, w_1 + w_2) = g(v, w_1) + g(v, w_2)$
  + לכל $v,w in V$ ולכל $c in FF$ מתקיים $g(v, c w) = c g(v, w)$
  + לכל $v,w in V$ מתקיים $g(v, w) = g(w, v)$
]

#remark[
  + אלא אם צוין אחרת, מעתה והלאה נעבוד עם שדות כך ש־ $char(FF) != 2$.
  + בהגדרה לעיל מספיק לדרוש לינאריות במשתנה השני בגלל הסימטריות
]

#proposition[
  תהי $g$ תבנית בילינארית סימטרית (תב"ס) מעל מרחב וקטורי $V$, אזי
  + לכל $v_1, v_2, w in V$ מתקיים $g(v_1 + v_2, w) = g(v_1, w) + g(v_2, w)$
  + לכל $v,w in V$ ולכל $c in FF$ מתקיים $g(c v, w) = c g(v, w)$
]

#proof[
  $
    g(v_1 + v_2, w) = g(w, v_1 + v_2) =_"סימטריות" g(w, v_1) + g(w, v_2) =_"לינאריות במשתנה השני" g(v_1, w) + g(v_2, w)
  $
  ובאופן דומה עבור כפל בסקלר.
]

#example[
  $FF = bb(R)$, $(V, chevron.l dot, dot chevron.r)$ מרחב מכפלה פנימית, ו־ $g(v, w) = chevron.l v, w chevron.r$.
]

#example[
  $V$ מרחב וקטורי מעל $FF$, ו־ $forall v, w in V: g(v, w) = 0_FF$. זוהי התבנית הבילינארית הסימטרית הטריוויאלית.
]

#example[
  עבור $V = FF^2$ לכל $display(vec(x_1, x_2)), display(vec(y_1, y_2)) in FF^2)$ מתקיים $ g(mat(x_1; x_2), mat(y_1; y_2)) = x_1 y_1 - x_2 y_2 $
]<special_example>

#remark[
  ההוכחה שהדוגמה לעיל היא תבנית בילינארית סימטרית היא מקרה פרטי של ההוכחה שנראה עבור הדוגמה הבאה.
]

#example[
  $FF$ הוא שדה, $A in M_n(FF)$ היא מטריצה סימטרית, $V = FF^n$ ולכל $v,w in FF^n$ מתקיים $g(v, w) = v^t A w$. נראה כי $g$ היא תבנית בילינארית סימטרית.
]

#proof[
  יהיו $u, v, w in FF^n$ ו־ $c in FF$. מתקיים כי
  $ g(u, v+w) = u^t A(v+w) = u^t A v + u^t A w = g(u, v) + g(u, w) $
  $ g(u, c v) = u^t A(c v) = c(u^t A v) = c g(u, v) $
  זה נובע מתכונות בסיסיות של כפל מטריצות, ומקיים את אקסיומות (1) ו־(2).
  כעת מתקיים כי
  $ g(u, v) = u^t A v eq_((star)) (u^t A v)^t = v^t A^t u eq_((star star)) v^t A u = g(v, u) $
  כאשר $(star)$ זה  מכיוון ש־ $u^t A v in FF$ ו־$(star star)$ זה מהיות $A$ סימטרית.
  מה שמקיים את אקסיומה (3).
]

#proof[@special_example][
  הדוגמה נובעת מבחירת $A = mat(1, 0; 0, -1)$.
]

#definition[מטריצת גראם][
  יהי $V$ מרחב וקטורי ממד סופי מעל $FF$, $g$ תבנית בילינארית סימטרית, ו־ $cal(B) = (v_1, dots.h, v_n)$ בסיס של $V$.
  מטריצת גראם (Gram matrix) של $g$ ביחס לבסיס $cal(B)$ היא
  $ [g]_cal(B) = (g_(i j))_(i, j) $
  כך ש־ $g_(i,j) = g(v_i, v_j)$ לכל $i, j in [n]$.
  $
    [g]_cal(B) = mat(
      g_(1,1), dots.h, g_(1,n);
      dots.v, dots.down, dots.v;
      g_(n,1), dots.h, g_(n,n)
    )
  $
]

#proposition[
  $[g]_cal(B)$ היא סימטרית.
]

#proof[
  לכל $i, j in [n]: g_(i,j) = g(v_i, v_j) = g(v_j, v_i) = g_(j,i)$.
]

#proposition[
  תהי $A in M_n(FF)$ סימטרית, $g$ תבנית בילינארית סימטרית מעל $FF^n$ המוגדרת על ידי $g(v, w) = v^t A w$, ו־ $E = (e_1, dots.h, e_n)$ הבסיס הסטנדרטי של $FF^n$. אזי
  $ [g]_E = A $
]

#proof[
  נסמן
  $
    A = mat(
      a_(1,1), dots.h, a_(1,n);
      dots.v, dots.down, dots.v;
      a_(n,1), dots.h, a_(n,n)
    )
  $
  נשים לב שמתקיים: $g_(i,j) = e_i^t A e_j = a_(i,j)$.
]

#proposition[
  יהי $(V, chevron.l dot, dot chevron.r)$ מרחב מכפלה פנימית ממד סופי מעל $bb(R)$, $g(v, w) = chevron.l v, w chevron.r$, ו־ $cal(B) = (v_1, dots.h, v_n)$ בסיס אורתונורמלי של $V$. אזי $[g]_cal(B) = I_n$.
]

#proof[
  נזכור שעבור בסיס אורתונורמלי מתקיים
  $
    chevron.l v_i, v_j chevron.r = cases(1 & "אם" i=j, 0 & "אם" i!=j) , "לכן" g_(i,j) = cases(1 & "אם" i=j, 0 & "אם" i!=j)
  $
]

#proposition[
  יהי $V$ מרחב וקטורי ממד סופי מעל $FF$, $g$ תבנית בילינארית סימטרית, ו־ $cal(B) = (v_1, dots.h, v_n)$ בסיס של $V$.
  אזי לכל $v, w in V$: $g(v, w) = [v]_cal(B)^t [g]_cal(B) [w]_cal(B)$.
]<base_change>

#proof[
  נסמן
  $ [v]_cal(B) = mat(c_1; dots.v; c_n) "ו־" [w]_cal(B) = mat(d_1; dots.v; d_n) $
  כלומר: $v = sum_(i=1)^n c_i v_i$ ו־ $w = sum_(j=1)^n d_j v_j$.
  נשים לב כי:
  $
    g(v, w) = g(sum_(i=1)^n c_i v_i, sum_(j=1)^n d_j v_j) eq.star sum_(i=1)^n sum_(j=1)^n c_i d_j g(v_i, v_j) = sum_(i=1)^n sum_(j=1)^n c_i d_j g_(i,j)
  $
  כאשר המעבר האחרון נובע מהבילנאריות של $g$ אך מצד שני
  $
    [v]_cal(B)^t [g]_cal(B) [w]_cal(B) = mat(c_1, dots.h, c_n) mat(
      g_(1,1), dots.h, g_(1,n);
      dots.v, dots.down, dots.v;
      g_(n,1), dots.h, g_(n,n)
    ) mat(d_1; dots.v; d_n) eq.star sum_(i=1)^n sum_(j=1)^n c_i d_j g_(i,j)
  $
  כאשר המעבר האחרון זה מהגדרת כפל מטריצות.\
  לכן $g(v, w) = [v]_cal(B)^t [g]_cal(B) [w]_cal(B)$ כנדרש.
]

#corollary[
  תהי $g$ תבנית בילינארית סימטרית מעל $FF^n$, אזי $g(v, w) = v^t [g]_E w$.
]

#proposition[
  יהי $V$ מרחב וקטורי ממד סופי מעל $FF$, $g$ תבנית בילינארית סימטרית, ו־ $cal(B), cal(B)'$ בסיסים של $V$.
  אזי $[g]_cal(B)' = ([Id]_cal(B)^cal(B)')^t [g]_cal(B) [Id]_cal(B)^cal(B)'$.
]<another_base_change>

#proof[
  נסמן $cal(B)' = (w_1, dots.h, w_n)$, אז לכל $i in [n]$ העמודה ה־$i$ של $[Id]_cal(B)^cal(B)'$ היא $[w_i]_cal(B)$, כלומר $[Id]_cal(B)^cal(B)' e_i = [w_i]_cal(B)$.\
  כעת הכניסה ה־$i,j$ של המטריצה $[g]_cal(B)'$ היא
  $
    g(w_i, w_j) =_((star)) [w_i]_cal(B)^t [g]_cal(B) [w_j]_cal(B) = ([Id]_cal(B)^cal(B)' e_i)^t [g]_cal(B) [Id]_cal(B)^cal(B)' e_j = e_i^t ([Id]_cal(B)^cal(B)')^t [g]_cal(B) [Id]_cal(B)^cal(B)' e_j
  $
  כאשר $(star)$ נובע מ@base_change.
  אך נשים לב ש־ $e_i^t ([Id]_cal(B)^cal(B)')^t [g]_cal(B) [Id]_cal(B)^cal(B)' e_j$ היא הכניסה ה־$i,j$ של המטריצה $([Id]_cal(B)^cal(B)')^t [g]_cal(B) [Id]_cal(B)^cal(B)'$.
]

== חפיפת מטריצות

#definition[מטריצה חופפת][
  יהיו $A, B in M_n(FF)$. אנו אומרים ש־$B$ חופפת ל־$A$
  כאשר קיימת מטריצה הפיכה $P in M_n(FF)$ כך ש־ $B = P^t A P$.
]

#remark[
  תחת ההנחות של @another_base_change,  $[g]_cal(B)'$ חופפת ל־ $[g]_cal(B)$.
]

#proposition[
  חפיפת מטריצות היא יחס שקילות.
]

#proof[
  + רפלקסיביות – לכל $A$ מתקיים ש־ $A = I^t A I$, לכן $A$ חופפת ל־$A$.
  + סימטריה – יהיו $A$ ו־$B$ מטריצות כך ש־$B$ חופפת ל־$A$. תהי $P$ מטריצה הפיכה כך ש־ $B = P^t A P$ ונסמן $Q = P^(-1)$, אזי:
    $ Q^t B Q = Q^t P^t A P Q = (P Q)^t A (P Q) = I^t A I = A $
    לכן $A$ חופפת ל־$B$.
  + טרנזיטיביות (מעבר) – יהיו $A, B$ ו־$C$ מטריצות כך ש־$B$ חופפת ל־$A$ ו־$C$ חופפת ל־$B$. יהיו $P$ ו־$Q$ מטריצות הפיכות כך ש־ $B = P^t A P$ ו־ $C = Q^t B Q$. לכן מתקיים:
    $ C = Q^t B Q = Q^t P^t A P Q = (P Q)^t A (P Q) $
    ו־$P Q$ היא הפיכה, לכן $C$ חופפת ל־$A$.
]

#proposition[
  יהי $V$ מרחב וקטורי ממד סופי מעל $FF$, $g$ תבנית בילינארית סימטרית, ו־$cal(B)$ בסיס של $V$.
  תהי $A in M_n(FF)$ חופפת ל־ $[g]_cal(B)$. אזי קיים בסיס $cal(B)'$ של $V$ כך ש־ $A = [g]_cal(B)'$.
]

#proof[
  תהי $P in M_n(FF)$ מטריצה הפיכה כך ש־ $A = P^t [g]_cal(B) P$.
  יהי $cal(B)'$ בסיס כך ש־ $P = [Id_V]_cal(B)^cal(B)'$. הבסיס $cal(B)'$ יהיה סדרת הווקטורים כך שווקטור הקואורדינטות ביחס לבסיס $cal(B)$ של הווקטור ה־$i$ הוא העמודה ה־$i$ של $P$.
  סדרה כזו היא אכן בסיס מכיוון ש־$P$ הפיכה. לכן כעת מתקיים:
  $ A = P^t [g]_cal(B) P = ([Id_V]_cal(B)^cal(B)')^t [g]_cal(B) [Id_V]_cal(B)^cal(B)' = [g]_cal(B)' $
  כנדרש.
]

#corollary[
  כל מטריצה שחופפת למטריצה סימטרית היא בעצמה סימטרית.
]

#end_of_lecture("1 – 24/03")
נראה כי לא רק ששתי מטריצות המייצגות את אותה תבנית בילנארית סימטרית g בבסיסים שונים הן חופפות, אלא שגם ההפך הוא נכון.

#proposition[
  יהי $V$ מרחב וקטורי נוצר סופית מעל $FF$ ממימד $n$ ויהי $B$ בסיס של $V$ ותהיי $g$ תבנית בילנארית סימטרית על $V$ ותהיי $C in M_n (FF)$ מטריצה שחופפת$[g]_B$. אזי קיים בסיס $B^prime$ של $V$ עבורו $C=[g]_(B^prime)$.
]

#proof[
  #todo
]

== תבניות ריבועיות

#definition[תבנית ריבועית][
  יהי $V$ מרחב וקטורי מעל $FF$ עם מציין שונה מ־$2$ ו־$g$ תבנית בילנארית סימטרית על $V$. תבנית ריבועית שמתאימה ל־$g$ היא $g:V arrow FF$ המוגדרת על־ידי
  $ q(v) = g(v,v) $
]

#example[
  + עבור $F=RR$ ו־$(V, chevron.l dot.op chevron.r)$ מרחב מכפלה פנימית, $g:V times V arrow RR$ המוגדרת על־ידי $g(v,w) = chevron.l v, w chevron.r$ אזי $g(v) = chevron.l v,v chevron.r = norm(v)^2$
  + עבור $V$ מרחב וקטורי מעל $FF$, $g(v,w) eq.triple 0$ אזי $g(v) eq.triple 0$
  + עבור $V=FF^2$ ו־$g:FF^2 times FF^2 arrow FF$ המוגדרת על־ידי $ g(vec(x_1, x_2), vec(y_1, y_2)) = x_1 y_1 - x_2 y_2 $
    אזי
    $ q(vec(x_1, x_2)) = x_1^2-x_2^2 $
]

צה לשאול האם אותה תבנית ריבועית יכולה להתקבל משתי תבניות ריבועיות סימטריות שונות? התשובה היא לא.

#proposition[נוסחת הפלורליזציה][
  יהי $V$ מרחב וקטורי מעל $FF$, $g$ תבנית בילנארית סימטרית על $V$ ו־$q$ תבנית ריבועית המתאימה ל־$g$. אזי לכל $v,w in V$ מתקיים
  $ g(v,w) = frac(q(v+w)-q(v)-q(w), 2) $
]

#proof[
  $
    g(v+w)-g(v)-g(w) =g(v+w, v+w) - g(v,v) - g(w,w)
    =_((1)) cancel(g(v,v), stroke: #(paint: teal)) + g(v,w) + g(w,v) + cancel(g(w,w), stroke: #(paint: teal)) - cancel(g(v,v)) - cancel(g(w,w))
    =_((2)) 2g(v,w)
  $
  כאשר $(1)$ נובע מלינאריות ו־$(2)$ מסימטריה. נחלק ב־$2$ ונקבל את המבוקש.
]

#corollary[
  אם תבנית בילנארית סימטרית היא לא תבנית ה־$0$ אז גם התבנית הריבועית המתאימה לה היא לא תבנית ה־$0$.\
  כלומר, אם $V$ מרחב וקטורי מעל $FF$, $g$ תבנית בילנארית סימטרית ששונה מתבנית ה־$0$ אזי קיים $v in V$ כך ש־$q(v)!=0$.
]

#definition[ניצבות][
  יהי $V$ מרחב וקטורי מעל $FF$, $g$ תבנית בילנארית סימטרית על $V$ ו־$v,w in V$. אומרים כי $v$ ו־$w$ ניצבים ומסמנים $v perp w$ כאשר $g(v,w)=0$.
]

#definition[תת־מרחב ניצב][
  יהי $V$ מרחב וקטורי מעל $FF$, $g$ תבנית בילנארית סימטרית על $V$ ו־$S subset.eq V$. נגדיר
  $ S^perp colon.eq {w in V bar forall v in S, space v perp w} $
  ו־$S^perp$ הוא תת־מרחב של $V$.
]

#proposition[
  יהי $V$ מרחב וקטורי מעל $FF$, $g$ תבנית בילנארית סימטרית על $V$ ויהי $v in V$ כך ש־$g(v,v)!=0$, אזי
  + $dim{v}^perp = n-1$
  + ${v}^perp plus.o Span(v) = V$
]

#proof[
  + נגדיר $T:V arrow FF$ על־ידי $T(w) =g(v,w)$. $T$ לינארית כי $g$ לינארית לפי הרכיב השני ומתקיים $ker T = {w in V bar g(v,w) =0} = {v}^perp$ כלומר אנחנו צריכים למצוא את המימד של הגרעין של $T$.\
    מההנחה, $T(v)=g(v,v)!=0$ ולכן התמונה של $T$ היא לא רק $0$ ולכן בפרמט היא ממימד אחד, כלומר $im T = FF$ ומכאן
    $ dim{v}^perp = dim ker T = dim V - dim im T = n-dim FF = n-1 $
  + יהי $w in {v}^perp inter Span(v)$ ולכן קיים $c in FF$ כך ש־$w=c v$ וכמו־כן מתקיים
    $ c g(v,v) = g(v, c v) = g(v,w) = 0 $
    מכיוון ש־$g(v,v)!=0$ נובע כי $c=0$ ולכן $w = 0 v = 0_V$ כלומר ${v}^perp inter Span(v) = 0_V$ ולכן
    $ dim({v}^perp + Span(v)) = dim{v}^perp + dim Span(v) - dim({v}^perp inter Span(v)) = n-1 + 1 - 0 =n = dim V $
]

#definition[בסיס אורתוגונלי][
  יהי $V$ מרחב וקטורי מעל $FF$, $g$ תבנית בילנארית סימטרית על $V$ ו־$B={v_1, dots.h, v_n }$ בסיס של $V$. $B$ נקרא אורתוגונלי כאשר $v_i perp v_j$ לכל $1<=i<j<=n$.
]

#proposition[
  יהי $V$ מרחב וקטורי מעל $FF$ ו־$g$ תבנית בילנארית סימטרית על $V$. אז ב־$V$ קיים בסיס אורתוגונלי.
]

#proof[
  באינדוקציה על המימד של $V$.\
  נסמן $dim V = n$, בבסיס $n=1$ כל בסיס של $V$ הוא בסיס אורתוגונלי וכעת נניח כי הטענה נכונה עבור כל מרחב וקטורי שמימדו קטן מ־$n$ ויהי $V$ מרחב וקטורי שמימדו $n$.\
  אם לכל $v in V$ מתקיים ש־$g(v,v)=0$ אזי $g(v,w)=0$ לכל $v,w in V$ מנוסחת הפלורליזציה ובפרט נקבל כי כל בסיס של $V$ הוא אורתוגונלי שכן אחרת קיים $v in V$ כך ש־$g(v,v)!=0$ ולפי הטענה הקודמת היה מתקיים שהמימד של ${v}^perp = n-1$.\
  מהנחת האינדוקציה ל־${v}^perp$ קיים בסיס אורתוגונלי $B^prime = {v_1, dots.h, v_(n-1)}$ ומהטענה הקודמת $B^prime plus.o {v} = V$ וגם $v perp v_i$ לכל $1<=i<=n-1$ ולכן \
  $B={v_1, dots.h, v_(n-1), v}$ הוא בסיס אורתוגונלי.
]

#proposition[
  יהי $V$ מרחב וקטורי מעל $FF$, $g$ תבנית בילנארית סימטרית על $V$ ו־$B$ בסיס של $V$. אזי $B$ אורתוגונלי אם ורק אם מטריצת גראם $[g]_B$ אלכסונית.
]

#corollary[
  יהי $V$ מרחב וקטורי מעל $FF$ ו־$g$ תבנית בילנארית סימטרית על $V$. אז קיים בסיס $B$ של $V$ כך ש־$[g]_B$ אלכסונית.
]

#corollary[
  לכל $A in m_n (FF)$ סימטרית קיים $D in M_n (FF)$ אלכסונית אשר חופפת ל־$A$.
]

#proof[
  נגדיר $g:FF^n times FF^n arrow FF$ על־ידי $g(x,y) = x^t A y$ ואז $[g]_cal(E) = A$ כאשר $cal(E)$ הוא הבסיס הסטנדרטי של $FF^n$.\
  לפי המסקנה הקודמת קיים בסיס $B$ של $FF^n$ כך ש־$[g]_B$ אלכסונית ונגדיר $D=[g]_B$. מאחר ש־$[g]_B$ חופפת ל־$[g]_cal(E)$ מתקיים ש־$D$ חופפת ל־$A$.
]

#end_of_lecture("2 – 14/04")

#definition[הומומורפיזם הקנוני][
  יהי $FF$ שדה ונסתכל על $(FF^times)^2 = {a^2 bar a in FF^times}$ זו תת־חבורה של $FF^times$ ביחס לכפל.\
  נסמן ב־$pi: FF^times arrow frac(FF^times, (FF^times)^2, style: "skewed")$ ההומומורפיזם הקאנוני כלומר $pi(a)=a(FF^times)^2$ לכל $a in FF^times$.\
]

#definition[קבוצת נציגים][
  תת־קבוצה $R subset.eq FF^times$ תיקרא קבוצת נציגים כאשר $pi|_R : R arrow frac(FF^times, (FF^times)^2, style: "skewed")$ הוא חד־חד ערכי ועל.\
]

מעכשיו נקבע קבוצת נציגים $R$ כלשהי ב־$FF$.\
#claim[
  לכל $a in FF^times$ קיים $r in R$ יחיד ו־$c in FF^times$ כך ש־$a=r c^2$.
]

#example[
  + $FF=CC$ אז $(CC^times)^2 = CC^times$ ומתקיים $abs(frac(CC^times, (CC^times)^2, style: "skewed"))=1$ וניתן לבחור $R={1}$
  + $FF=RR$ אז $(CC^times)^2 = {x in RR^times bar x>0}$ ומתקיים $abs(frac(RR^times, (RR^times)^2, style: "skewed"))=2$ וניתן לבחור $R={-1,1}$
]

#proposition[
  יהי $p$ ראשוני ו־$p!=2$ אז $abs(frac(FF_p^times, (FF_p^times)^2, style: "skewed"))=2$. יתר על־כן, לכל $r in FF_p^times without (FF_p^times)^2$ ניתן לבחור קבוצת נציגים להיות $R={1,r}$.
]

#proof[
  נגדיר $s:FF_p^times arrow FF_p^times$ על־ידי $s(a)=a^2$ לכל $a in FF_p^times$ והוא כמובן הומומורפיזם (של חבורות) וגם $im(s)=(FF_p^times)^2$.\
  מתקיים $im(s) tilde.equiv frac(FF_p^times, ker s, style: "skewed")$ ובנוסף $x in ker s <==> s(x)=1 <==> x^2=1 <==> (x-1)(x+1)=0 <==> x in {-1, 1}$.\
  לכן $ker s = {1, -1}$ ומכאן $abs(ker s)=2$.
  לסיכום
  $
    abs(frac(FF_p^times, (FF_p^times)^2, style: "skewed"))=abs(frac(FF_p^times, im(s), style: "skewed")) = abs(FF_p^times) : abs(im(s)) = abs(FF_p^times) : (abs(FF_p^times) : abs(ker s)) = abs(ker s)=2
  $
]

#proposition[
  יהי $V$ מרחב וקטורי נוצר נוספית מעל $FF$, $g$ תבנית בילנארית סימטרית על $V$. אז קיים בסיס $cal(C)$ של $V$ כך ש־$[g]_(cal(C))$ אלכסונית ואיברי אלכסונה שייכים ל־$R union {0}$.
]

#proof[
  יהי $cal(B) = (v_1, dots.h, v_n)$ בסיס של $V$ כך ש־$[g]_(cal(B))$ אלכסונית ($cal(B)$ בסיס אורתוגונלי).\
  נסמן $a_i = g(v_i, v_i) = q(v_i)$ לכל $1<=i<=n$.  אם $a_i != 0$ אז קיימים $r_i in R, c_i in FF^times$ כך ש־$a_i = r_i c_i^2$ ואם $a_i=0$ נגדיר $r_i = 0$ ו־$c_i = 1$.\
  כעת, נגדיר $cal(C)=(v_1/c_1, dots.h, v_n/c_n)$ ומטריצת המעבר בין הבסיסים נראית מהצורה הבאה
  $
    [Id]^cal(C)_cal(B) = mat(1/c_1, , 0; , dots.down, dots.v; 0, , 1/c_n) \
    ==>
    [g]_cal(C) = ([Id]^cal(C)_cal(B))^t [g]_cal(B) [Id]^cal(C)_cal(B) = mat(1/c_1, , 0; , dots.down, dots.v; 0, , 1/c_n) mat(a_1, , 0; , dots.down, dots.v; 0, , a_n) mat(1/c_1, , 0; , dots.down, dots.v; 0, , 1/c_n) = mat(a_1/c_1^2, , 0; , dots.down, dots.v; 0, , a_n/c_n^2) = mat(r_1, , 0; , dots.down, dots.v; 0, , r_n)
  $
]

#corollary[
  לכל מטריצה $A in M_n (FF)$ סימטרית קיימת $D in M_n (FF)$ אלכסונית כך שאיברי אלכסונה שייכים ל־$R union {0}$ אשר חופפת ל־$A$.
]

#definition[פעולות עמודה אלמנטריות][
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
  תהיי $epsilon$ פעולת שורה אלמנטרית, $A in M_n (FF)$. אז $overline(epsilon)(A) = A epsilon(I_n)^t$ (למה זה מעניין? כי באלגברה לינארית רואים ש־$epsilon(A)=epsilon(I_n)A$).
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
  בהינתן תבנית ריבועית $q:V arrow FF$ על מרחב וקטורי $V$ נסמן ב־$g_q : V times V arrow FF$ את התבנית הבילנארית הסימטרית המקיימת $q(v)=g_q (v,v)$.
]

#example[
  תבנית ריבועית $q:RR^3 arrow RR$ מוגדרת על־ידי
  $ q vec(x_1, x_2, x_3) = 2x_1^2 + 8x_1x_2 + 8x_2^2 + 2x_2x_3 + x_3^2 $
  נמצא בסיס $cal(B)$ של $RR^3$ כך ש־$[g_q]_cal(B)$ אלכסונית ואיברי אלכסונה שייכים ל־${1,-1,0}$.  מתקיים
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

#definition[מרחב ריבועי][
  יהי $V$ מרחב וקטורי נוצר סופית מעל השדה $FF$, $g:V arrow FF$ תבנית ריבועית. הזוג $(V,q)$ נקרא מרחב ריבועי ונגדיר כי $(V,q)$ מרחב ריבועי מעל $FF$.\
  בהינתן $(V,q)$ מרחב ריבועי, נסמן ב־$g_q$ את התבנית הבילנארית הסימטרית מעל $FF$ המקיימת $g_q (v,v)=q(v)$.
]

#definition[איזומטריה][
  יהיו $(V,q)$ ו־$(V^prime, q^prime)$ מרחבים ריבועיים מעל $FF$. העתקה לינארית $f:V arrow V^prime$ נקראת איזומטריה אם לכל $v in V$ מתקיים $q(v)=q^prime (f(v))$.\
  בפרט, איזומטריה שהיא חד־חד ערכית ועל נקראת איזומורפיזם.
]

#claim[
  יהיו $(V,q)$ ו־$(V^prime, q^prime)$ מרחבים ריבועיים מעל $FF$ ו־$f:(V,q) arrow (V^prime, q^prime)$ איזומורפיזם. אזי $ g_(q^prime) (f(v), f(w)) = g_q (v,w) $
]

#proposition[
  יהיו $(V,q)$ ו־$(V^prime, q^prime)$ מרחבים ריבועיים מעל $FF$, $f:(V,q) arrow (V^prime, q^prime)$ העתקה לינארית, חד־חד ערכית ועל, $cal(B) = {v_1, dots.h, v_n}$ בסיס של $V$ ונסמן ב־$cal(B)^prime = {f(v_1), dots.h, f(v_n)}$.\
  אזי $f$ איזומורפיזם אם ורק אם $[g_(q^prime)]_(cal(B)^prime) = [g_q]_cal(B)$.
]

#proof[
  $==>$ נניח כי איזומורפיזם ולכן לכל $1<=i,j <=n$ מתקיים
  $ g_(q^prime) (f(v_i), f(v_j)) = g_q (v_i, v_j) $
  ולכן $[g_(q^prime)]_(cal(B)^prime) = [g_q]_cal(B)$.\
  $<==$ נניח כי $[g_(q^prime)]_(cal(B)^prime) = [g_q]_cal(B)$ ויהי $[v]_cal(B) = vec(c_1, dots.v, c_n)$ כלומר
  $ v = c_1 v_1 + dots.h.c + c_n v_n $
  מכך ש־$f$ העתקה לינארית
  $ f(v)=c_1 f(v_1) + dots.h.c + c_n f(v_n) $
  כלומר $[f(v)]_(cal(B)^prime) = vec(c_1, dots.v, c_n)$ ומכאן
  $
    q^prime (f(v)) = g_(q^prime) (f(v), f(v)) = ([f(v)]_(cal(B)^prime))^t [g_(q^prime)]_(cal(B)^prime)[f(v)]_(cal(B)^prime) = ([v]_cal(B))^t [g_(q^prime)]_(cal(B)^prime) [v]_cal(B) = g_q (v,v) = q(v)
  $
  כלומר $f$ איזומורפיזם.
]

#claim[
  + לכל איזומורפיזם קיים איזומורפיזם הופכי
  + הרכבת איזומורפיזמים היא איזומורפיזם
]

#definition[מרחבים ריבועיים איזומורפיים][
  נקרא למרחבים ריבועיים $(V,q)$ ו־$(V^prime, q^prime)$ איזומורפיים אם קיים איזומורפיזם $f : (V,q) arrow (V^prime, q^prime)$ ונסמן $(V,q) tilde.equiv (V^prime, q^prime)$.
]

#claim[
  איזומורפיות הוא יחס שקילות על אוסף המרחבים הריבועיים.
]

כעת המטרה שלנו היא למיין את המ"ר מעל שדה F עד כדי איזומורפיזם.

#proposition[
  יהיו $(V,q)$ ו־$(V^prime, q^prime)$ מרחבים ריבועיים מעל $FF$ עם $cal(B)$ ו־$cal(B)^prime$ בסיסים של $(V,q)$ ו־$(V^prime, q^prime)$ בהתאמה. אזי $(V,q) tilde.equiv (V^prime, q^prime)$ אם ורק אם $[g_(q^prime)]_(cal(B)^prime)$ ו־$[g_q]_cal(B)$ חופפות.
]

#proof[
  $==>$ נניח כי המרחבים איזומורפיים ויהי $f:(V,q) arrow (V^prime, q^prime)$ איזומורפיזם. נסמן $cal(B) = {v_1, dots.h, v_n}$ ו־$cal(B)^prime.double = {f(v_1), dots.h, f(v_n)}$, אזי גם cal(B)^prime.double בסיס של $V^prime$ ומהטענה הקודמת $[g_(q^prime)]_(cal(B)^prime.double) = [g_q]_cal(B)$ וכעת $[g_(q^prime)]_(cal(B)^prime.double)$ ו־$[g_(q^prime)]_(cal(B)^prime)$ חופפות.\
  $<==$ נניח ש־$[g_(q^prime)]_(cal(B)^prime.double)$ ו־$[g_(q^prime)]_(cal(B)^prime)$ חופפות, אז קיים בסיס $cal(B)^prime.double$ של $V^prime$ עבורו $[g_(q^prime)]_(cal(B)^prime.double) = [g_q]_cal(B)$ ונסמן $cal(B) = {v_1, dots.h, v_n}$ ו־$cal(B)^prime.double = {w_1, dots.h, w_n}$ ונגדיר $f:V arrow V^prime$ העתקה לינארית על־ידי $f(v_i) = w_i$ לכל $1<=i<=n$ מהטענה הקודמת $f$ איזומורפיזם ולכן המרחבים איזומורפיים.
]

#definition[סכום ישר ניצב][
  יהי $(V,q)$ מרחב ריבועי מעל $FF$ ויהיו$U_1, U_2$ תתי־מרחבים של $V$ כך שמתקיים $V= U_1 plus.o U_2$. נאמר כי $V$ הוא סכום ישר ניצב של $U_1, U_2$ ומסמנים $V = U_1 plus.o^perp U_2$ אם לכל $u_1 in U_1$ ו־$u_2 in U_2$ מתקיים $u_1 perp u_2$.
]

#example[
  יהי $(V,q)$ מרחב ריבועי ו־$cal(B)={v_1, dots.h, v_n}$ בסיס אורתוגונלי של $V$ אז נקבל
  $ V = Span{v_1} plus.o^perp dots.h.c plus.o^perp Span{v_n} $
]

#claim[
  יהי $(V,q)$ מרחב ריבועי מעל $FF$, $U_1, U_2$ תתי־מרחבים של $V$ כך שהם סכום ישר ניצב עם $cal(B)_1$ ו־$cal(B)_2$ בסיסים של $U_1$ ו־$U_2$ בהתאמה. נסמן $cal(B) = cal(B)_1 union cal(B)_2$ אז $cal(B)$ בסיס של $V$ וגם
  $ [g_q]_cal(B) = mat([g_q |U_1]_cal(B)_1, 0; 0, [g_q |U_2]_cal(B)_2) $
]

#definition[גרעין של מרחב ריבועי][
  יהי $(V,q)$ מרחב ריבועי מעל $FF$. תת־המרחב $V^perp colon.eq {w in V bar forall v in V, space v perp w}$ נקרא הגרעין של $(V,q)$.
]

#claim[
  יהיו $(V,q)$ ו־$(V^prime, q^prime)$ מרחבים ריבועיים מעל $FF$ ו־$f:(V,q) arrow (V^prime, q^prime)$ איזומורפיזם. אזי $f(V^perp)=(V^prime)^perp$.
]

#corollary[
  יהיו $(V,q)$ ו־$(V^prime, q^prime)$ מרחבים ריבועיים איזומורפיים. אזי $dim V^perp = dim (V^prime)^perp$.
]

#definition[מרחב ריבועי מנוון][
  יהי $(V,q)$ מרחב ריבועי. נאמר שהוא מנוון אם $V^perp != {0_V}$.
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי מעל $FF$ ו־$cal(B)$ בסיס של $V$. אז $(V,q)$ מנוון אם ורק אם $[g_q]_cal(B)$ אינה הפיכה.
]

#proof[
  $==>$ נניח כי המרחב מנוון ולכן קיים $0!=v in V^perp$ ונסמן $dim V = n$. אזי קיימים $v_2, dots.h, v_n in V$ כך ש־$cal(B)^prime = {v, v_2, dots.h, v_n}$ בסיס של $V$. אז העמודה הראשונה של $[g_q]_(cal(B)^prime)$ היא עמודת אפסים ולכן היא אינה הפיכה ומחפיפה עם $[g_q]_cal(B)$ נקבל את הנדרש.\
  $<==$ נניח כי $[g_q]_cal(B)$ לא הפיכה ולכן קיים $(0, dots.h, 0) != (c_1, dots.h, c_n) in FF^n$ כך ש־$[g_q]_cal(B) vec(c_1, dots.v, c_n) = vec(0, dots.v 0)$. נסמן $cal(B) = {v_1, dots.h, v_n}$ ונגדיר $w = c_1 v_1 + dots.h.c + c_n v_n$ ואז $[w]_cal(B) = vec(c_1, dots.v, c_n)$ ומכאן לכל $v in V$ מתקיים
  $
    g_q (v, w) = ([v]_cal(B))^t [g_q]_cal(B) [w]_cal(B) = ([v]_cal(B))^t [g_q]_cal(B) vec(c_1, dots.v, c_n) = ([v]_cal(B))^t vec(0, dots.v, 0) = vec(0, dots.v, 0)
  $
  כלומר $w perp v$ ומכן $w in V^perp$ ולכן המרחב מנוון.
]

#corollary[
  יהי $(V,q)$ מרחב ריבועי מעל $FF$, $cal(B) = {v_1, dots.h, v_n}$ בסיס אורותוחגונלי של $V$. אזי $(V,q)$ מנוון אם ורק אם קיים $1<=i<=n$ כך ש־$q(v_i) =0$.
]

#corollary[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $FF$ ו־$R subset.eq FF$ קבוצת נציגים מודולו ריבועיים. אזי קיים בסיס $cal(B)$ של $V$ כך ש־$[g_q]_cal(B)$ אלכסונית ואיברי אלכסונה שייכים ל־$R$ (ללא אפס).
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי מעל $FF$, $W, V$ תתי־מרחבים של $V$ כך ש־$V = U plus.o^perp W$ ו־$(U, q|_U)$ לא מנוון ו־$q|_W (w) =0$ לכל $w in W$. אזי $V^perp = W$.
]

#proof[
  לכל $w in W$, נתון שלכל $v in V$ קיים $u^prime in U$ ו־$w^prime in W$ כך ש־$v=u^prime + w^prime$ ולכן
  $
    g_q (v,w) = underbrace(g_q (u^prime, w), U plus.o^perp W ==> = 0) + underbrace(g_q (w^prime, w), = 0 "מפלורליזציה") = 0
  $
  ולכן $w in V^perp$. כעת יהי $v in V^perp$ וקיימים $u in U$ ו־$w in W$ כך ש־$v=u+w$. נניח בשלילה כי $!=0$ אז מכייון ש־$(U, q|_U)$ לא מנוון קיים $u^prime in U$ עבורו $g_q (u^prime, u) !=0$ ולכן
  $
    g_q (u^prime, v) = g_q (u^prime, u + w) = underbrace(g_q (u^prime, u), != 0) + underbrace(g_q (u^prime, w), =0) = g_q (u^prime, u) != 0
  $
  בסתירה לכך ש־$v in V^perp$ ולכן $u=0$ ו־$v in W$ ולכן $W=V^perp$.
]

#proposition[
  יהי $(V,q)$ מרחב ריבועי מעל $FF$ ו־$U$ תת־מרחב של $V$ כך ש־$V = U plus.o V^prime$ (סכום ישר רגיל) אזי
  + $V = U plus.o^perp V^perp$
  + $(U, q|_U)$ לא מנוון
]

#proof[
  + לכל $w in V^perp$ ו־$u in U$ מתקיים מהגדרה $g_q (u,w)=0$ ולכן $V = U plus.o^perp V^perp$
  + יהי $u in U$ שנמצא בגרעין של $(U, q|_U)$ כלומר $g_q (u, tilde(u))=0$ לכל $tilde(u) in U$. יהי $v in V$ אז קיימים $u^prime in U$ ו־$w^prime in V^perp$ כך ש־$v=u^prime + w^prime$ ולכן
    $
      g_q (v, u) = g_q (u^prime + w^prime, u) = underbrace(g_q (u^prime, u), =0) + underbrace(g_q (w^prime, u), =0) = 0
    $
    ולכן $u in V^perp$ כלומר $u in V^perp inter U = {0_v}$ ולכן המרחב לא מנוון.
]

מעכשיו נתרכז במרחבים ריבועיים לא מנוונים.

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
  + לכל $a in ZZ_p$ נסמן $overline(a) = a + p ZZ_p in ZZ_p slash p ZZ_p$ (הרדוקציה)
]

#lemma[הלמה של הנזל][
  יהיו $f in ZZ_p [x]$ ו־$w_0 in ZZ_p$ כך ש־$overline(f(w_0))=0$ וגם $overline(f^prime (w_0)) != 0$. אז קיים $w in ZZ_p$ יחיד כך ש־$overline(w) = overline(w_0)$ וגם $f(w)=0$.
]<hensels_lemma>

#remark[
  עבור $f= c_n x^n + dots.h.c + c_1 x + c_0$ הנגזרת היא $f^prime = n c_n x^(n-1) + dots.h.c + c_1$.
]

#example[
  עבור $p!=2$ ראשוני, נבחר $a in ZZ_p$  כך ש־$overline(a)!=0$ (לא מתחלק ב־$p$) ונגדיר $f=x^2-a$.\
  מתקיים $d^prime = 2x$ ומהלמה של הנזל נובע כי אם קיים $w_0 in ZZ_p$ כך ש־$w_0^2 eq.triple_(mod p) a$ אז מאחר ש־$a eq.triple.not_(mod p) 0$ מתקיים $f^prime (w_0) = 2w_0 eq.triple.not_(mod p) 0$ ולכן קיים $w in ZZ_p$ כך ש־$w^2 = a$ כלומר קיים שורש!
]

#remark[
  כאשר $p=2$ הדוגמה לעיל לא נכונה כי עבור $a = 3$ נסתכל על הפולינום $f=x^2-3 = x^2-1$ ועבור $w_0 = 1$ מתקיים ש־$1^2 eq.triple_(mod 2) 3$ אבל ב־$ZZ_2$ אין שום מספר שהריבוע שלו ייתן לנו שלוש בידיוק כי זה או אפס או אחד.
]

#end_of_lecture("11 – 23/06")

#proof[@hensels_lemma][
  נבנה סדרה $(r_k)_(k=1)^infinity$ כך ש־$r_k in ZZ$, $0<=r_k <= p^k-1$, $overline(r_k)=overline(w_0)$, $p^k divides r_(k+1) - r_k$, $f(r_k) in p^k ZZ_p$ לכל $k in NN$ באופן רקורסיבי.\
  קיים $r_1 in ZZ$ יחיד כך ש־$0<=r_1 <= p-1$ ו־$overline(r_1) = overline(w_0)$ ונניח כי $r_1, dots.h, r_k$ כבר הוגדרו ומקיימים את התנאים הנדרשים. \
  נגדיר $r_(k+1) = r_k + d p^k$ כאשר $0<=d<=p-1$ יוגדר באופן הבא: נניח כי קיים $0<=d<=p-1$ יחיד כך ש־$f(r_(k+1)) in p^(k+1) ZZ_p$.\
  נסמן $f=c_0 + c_1 x + dots.h.c + c_n x^n$ ואז לכל $d in ZZ$, $0<=d<=p-1$ מתקיים
  $
    f(r_(k+1)) &= f(r_k + d p^k) = c_0 + c_1 (r_k + d p^k) + c_2 (r_k + d p^k)^2 + dots.h.c + c_n (r_k + d p^k)^n \
    &= c_0 + c_1 (r_k + d p^k) + c_2 (r_k^2 + 2r_k d p^k + d^2 p^(2k)) + dots.h.c + c_n (r_k^n + n r_k^(n-1) d p^k + binom(n, 2) r_k^(n-2) d^2 p^(2 k)) + dots.h.c + binom(n, n) d^n p^(n k) \
    &eq.triple_(mod p^(k+1)) c_0 + c_1 (r_k + d p^k) + c_2 (r_k^2 + 2 r_k d p^k) + c_3 (r_k^3 + 3r_k^2 d p^k) + dots.h.c + c_n (r_k^n + n r_k^(n-1) d p^k) \
    &= (c_0 + c_1 r_k + c_2 r_k^2 + c_3 r_k^3 + dots.h.c + c_n r_k^n) + (c_1 + 2c_2 r_k + 3 c_3 r_k^2 + dots.h.c + n c_n r_k^(n-1)) d p^k \
    &= f(r_k) + f^prime (r_k) d p^k mod p^(k+1)
  $
  מאחר ש־$f(r_k) in p^k ZZ_p$, קיים $z in ZZ_p$ כך ש־$f(r_k) = z p^k$.\
  מאחר ש־$f^prime (r_k) = f^prime (w_0) != 0$, קיים ויחיד $d in ZZ$ עבורו $0<=d<=p-1$ כך ש־$f^prime (r_k) d eq.triple_(mod p) -z$ ואז $p divides z + f^prime (r_k) d$.\
  מכאן
  $ f(r_k) = f(r_k) + f^prime (r_k) d p^k = (z+f^prime (r_k) d)p^k in p^(k+1) ZZ $
  בנוסף $0<=r_(k+1) <= p^k - 1 + (p-1)p^k = p^(k+1)-1$ וגם $overline(r_(k+1)) = overline(r_k) = overline(w_0)$ ו־$p^k divides d p^k = r_(k+1) - r_k$.\
  לפיכך $r_1, dots.h, r_(k+1)$ מקיימים את כל התנאים הנדרשים ולכן הסדרה $(r_k)_(k=1)^infinity$ היא סדרת קושי ולכן קיים $w=lim_(k arrow infinity) r_k$.\
  יתר על־כן, מתקיים
  $ f(w)=f(lim_(k arrow infinity) r_k) = lim_(k arrow infinity) f(r_k) = 0 $
]

#corollary[
  אם $p !=2$ וגם $a in ZZ_p$ כך ש־$overline(a)!=0$ ו־$w_0 in ZZ_p$ כך ש־$overline(w_0^2) = overline(a)$. אז קיים $w in ZZ_p$ כך ש־$w^2=a$ וגם $overline(w)=overline(w_0)$.
]

#proof[
  נגדיר $f=x^2-a$ ואז מכך ש־$overline(w_0^2) = overline(a)$ נקבל
  $
    overline(f(w_0)) = overline(w_0^2) - overline(a) = 0 \
    overline(f^prime (w_0)) = overline(2 w_0) = overline(2) overline(w_0) != 0
  $
  לכן קיים $w in ZZ_p$ כך ש־$f(w)=0$ כלומר $w^2=a$.
]

#remark[
  + התנאי $p!=2$ הכרחי. דוגמה נגדית קלאסית היא $a=3 in ZZ_2 = ZZ_p$.
  + התנאי $overline(a)!=0$ הכרחי. דוגמה נגדית קלאסית היא $a=p in ZZ_p$.
]

#corollary[
  אם $p!=2$ וגם $a in ZZ_p$ כך ש־$overline(a)=1$ אז קיים $w in ZZ_p$ כך ש־$w^2=a$ וגם $overline(w)=1$.
]

#proposition[
  יהי $p!=2$ ראשוני. אז $ ZZ_p^times slash (ZZ_p^times)^2 tilde.equiv FF_p^times slash (FF_p^times)^2 tilde.equiv ZZ slash 2ZZ $
]

#proof[
  נגדיר $p r : ZZ_p arrow ZZ_p slash p ZZ_p tilde.equiv FF_p$ על־ידי $p r (a) = a + p ZZ_p$.\
  אז $p r$ הוא הומומורפיזם של חוגים ולכן $p r|_(ZZ_p^times) : ZZ_p^times arrow FF_p^times$ הוא הומומורפיזם של חבורות שהוא על.\
  נסמן $pi : FF_p^times arrow FF_p^times slash (FF_p^times)^2$ על־ידי $pi(x)= x dot.op (FF_p^times)^2$ ולכן גם $pi$ הוא הומומורפיזם של חבורות שהוא על.\
  נרכיב ונקבל $pi compose p r|_(ZZ_p^times) : ZZ_p^times arrow FF_p^times slash (FF_p^times)^2$.\
  אם $x in (ZZ_p^times)^2$ אזי $p r|_(z_p^times) (x) in (FF_p^times)^2$ ולכן $pi compose p r|_(ZZ_p^times) (x) = 1$ ולכן $(ZZ_p^times)^2 subset.eq ker (pi compose p r|_(ZZ_p^times))$.\
  יהי $a in ker(pi compose p r|_(ZZ_p^times))$ אז $p r|_(ZZ_p^times) (a) = ker pi = (FF_p^times)^2$ מכאן קיים $w_0 in ZZ_p$ כך ש־$overline(a)=overline(w_0^2)$ ומהמסקנה שראינו קיים $w in ZZ_p$ כך ש־$a=w^2$ ולכן $a in (ZZ_p^times)^2$ ולפיכך $ker(pi compose p r|_(ZZ_p^times)) subset.eq (ZZ_p^times)^2$.\
  אז לפי משפט ההומומורפיזם מתקיים $ZZ_p^times slash (ZZ_p^times)^2 tilde.equiv FF_p^times slash (FF_p^times)^2$.
]

#proposition[
  יהי $p$ ראשוני. אזי $QQ_p^times tilde.equiv ZZ_p^times times ZZ$.
]

#proof[
  נגדיר $f:ZZ_p^times times ZZ arrow QQ_p^times$ על־ידי $f(u,s) = u p^s$.\
  קל לראות ש־$f$ הומומורפיזם, חד־חד ערכית ועל כלומר איזומורפיזם.
]

#corollary[
  יהי $p!=2$ ראשוני. אז $QQ_p^times slash (QQ_p^times) tilde.equiv ZZ slash 2ZZ times ZZ slash 2ZZ$.\
  בנוסף, אם $r in ZZ_p^times$ כך ש־$overline(r) in FF_p^times slash (FF_p^times)^2$ אז
  $ QQ_p^times slash (QQ_p^times)^2 = {(QQ_p^times)^2, r (QQ_p^times)^2, p(QQ_p^times)^2, r p (QQ_p^times)^2} $
]

#remark[
  ניקח כעובדה את המקרה של $p=2$
  $
    QQ_2^times slash (QQ_2^times)^2 tilde.equiv ZZ slash 2 ZZ times ZZ slash 2ZZ times ZZ slash 2ZZ \
    (QQ_2^times) slash (QQ_2^times)^2 = {(QQ_2^times)^2, - (QQ_2^times)^2, 2(QQ_2^times)^2, -2(QQ_2^times)^2, 5(QQ_2^times)^2, -5(QQ_2^times)^2, 10(QQ_2^times)^2, -10(QQ_2^times)^2}
  $
]

= בחזרה לתבניות ריבועיות
#proposition[
  יהי $(V,q)$ מרחב ריבועי לא מנוון מעל $QQ_p$ עבור $p!=2$.\
  אז קיים בסיס $cal(B)$ של $V$ כך שמתקיים
  $
    [g_q]_cal(B) = mat(
      a_1, , 0; , dots.down, ;
      0, , a_n
    )
  $
  כאשר $a_i in {1, r, p, p r}$ לכל $1<=i<=n$.
]

#end_of_lecture("12 – 30/06")
