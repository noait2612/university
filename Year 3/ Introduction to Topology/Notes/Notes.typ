#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *

#show: thmbox-init()

#show: article_he.with(
  title: [ מבוא לטופולוגיה ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 2)

#let trivialTopology(x) = $#x _italic("triv")$
#let discrateTopology(x) = $#x _italic("disc")$
#let cofiniteTopology(x) = $#x _italic("cofinite")$

= מרחבים טופולוגיים
== טופולוגיה
#definition[טופולוגיה][
  תהיי $X$ קבוצה, $tau subset.eq 2^X$ אוסף תתי־קבוצות של $X$ נקרא *טופולוגיה* אם מתקיים
  + $X, emptyset in tau$
  + #underline("סגירות לאיחוד כלשהו:") אם ${U_alpha}_(alpha in I) subset.eq tau$ אז $union.big_(alpha in I) U_alpha in tau$
  + #underline("סגירות לחיתוך סופי:") אם ${U_i}_(i=1)^n subset.eq tau$ אז $inter.big_(i=1)^n U_i in tau$
]
#remark[
  מספיק לדרוש שאם $U,V in tau$ יתקיים $U inter V in tau$.
]
#example[
  + הטופולוגיה הטריוויאלית – $trivialTopology(tau) = {X, emptyset}$
  + הטופולוגיה הדיסקרטית – $discrateTopology(tau)=cal(P)(X)$
]
#definition[מרחב טופולוגי][
  תהיי $X$ קבוצה ו־$tau$ טופולוגיה על $X$ נאמר שהזוג הסדור $(X,tau)$ הוא *מרחב טופולוגי* ונקרא לאיברי $tau$ קבוצות פתוחות.
]
#definition[טופולוגיה חזקה וחלשה ביחס לאחרת][
  נניח ש־$tau, tau^prime$ טופולוגיות על $X$. אם $tau subset.eq tau^prime$ נאמר ש־$tau$ *גסה/חלשה* ביחס ל־$tau^prime$ וש־$tau^prime$ *חזקה יותר* מ־$tau$ או *מעדנת* את $tau$.
]
== מרחבים מטריים
#definition[מטריקה][
  מטריקה על קבוצה $X$ היא פונקציה $d:X times X arrow RR_plus$ המקיימת
  + אי־שליליות בהחלט – אם $x!=y$ אז $d(x,y)>0$ ו־$d(x,y)=0 <==> x=y$
  + סימטריה – לכל $x,y$, $d(x,y)=d(y,x)$
  + אי־שיוויון המשולש – לכל $x,y,z in X$ מתקיים $d(x,y)<=d(x,z)+d(z,y)$
  לזוג הסדור $(X, d)$ נקרא מרחב מטרי.
]
#definition[כדור פתוח במטריקה][
  הכדור הפתוח ביחס למטריקה $d$ מוגדר על־ידי $B_r (x) colon.eq {y in X bar d(x,y)<r}$.
]
#proposition[טופולוגיה המושרית ממטריקה][
  יהי $(X,d)$ מרחב מטרי. הטופולוגיה המושרית $tau subset.eq cal(P)(X)$ נתונה על־ידי
  $
    tau colon.eq {union.big_(i in I) B_i (x_i) bar r_i > 0, space x_i in X} = {U subset.eq X bar forall y in U, space exists r>0, space B_r (y) subset.eq U}
  $
]
#proof[
  נראה את השקילות מימין ונראה שזו אכן טופולוגיה.\
  #underline("שקילות:")
  נניח שלכל $y in U$ קיים $r>0$ כך ש־$B_r (y) subset.eq U$ ולכן $U subset.eq union.big_(y in U) B_r (y) subset.eq U$
  כלומר $U$ איחוד של פתוחות ולכן $U in tau$.\
  מצד שני, אם $y in U in tau$ אז יש כדור $y in B_s (z) subset.eq U$ ולכן עבור $r=s-d(y,z) > 0$ ומתקיים $B_r (y) subset.eq U$ מאי־שיוויון המשולש.\
  #underline("טופולוגיה"):
  + $X, emptyset in tau$ שכן $X=union.big_(x in X) B_1 (x)$
  + איחוד של איחודים הוא איחוד: אם ${U_alpha}_(alpha in I) subset.eq tau$ אז לכל $alpha in I$ מתקיים $display(U_alpha = union.big_(i in I_alpha) B_(r_(x_i)) (x_i))$ עבור אוסף $I_alpha$ כלומר $display(union.big_(alpha in I) U_alpha =union.big_(alpha in I) union.big_(i in I_alpha) B_(r_(x_i)) (x_i))$.
  + יהי ${U_i}_(i=1)^n subset.eq U$ ונסמן $V = inter.big_(i=1)^n U_i$ ונרצה להראות ש־$V in tau$: מהשקילות נובע שלכל $y in V$ מתקיים $y in U_i$ לכל $i in [n]$ ולכן יש $r_i > 0$ שעבורו $B_(r_i) (y) subset.eq U_i$. נגדיר $r=min_(i in [n]) (r_i)$ ולכן $y in B_r (y) subset.eq B_(r_i) (y) subset.eq U_i$ ולכן $B_(r_i) subset.eq V$
]
#definition[שקילות מטריקות][
  שתי מטריקות $d, d^prime$ על $X$ נקראות שקולות אם קיימים $0<=c<=C$ עבורם לכל $x,y in X$ מתקיים
  $ c d(x,y)<= d^prime (x, y) <= C d(x,y) <==> 1/C d^prime (x,y) <= d(x,y) <= 1/c d^prime (x,y) $
  על כדורים נכתוב $B_r (y)$ הכדור הפתוח ביחס למטריקה $d$ ו־$B_r^prime (y)$ הכדור הפתוח ביחס למטריקה $d^prime$.
]
#proposition[מטריקות שקולות משרות את אותה הטופולוגיה][
  מהגדרת השקילות לכל $y in X$ נקבל
  $B_r^prime (y) subset.eq B_(C r) (y), space B_r (y) subset.eq B_(c r)^prime (y)$ שכן
  $ d(x,y) < r ==> d^prime (x,y) = C d(x,y) < C r ==> B^prime_(C r) (y) $
  תהיינה $tau, tau^prime$ הטופולוגיות המושרות מ־$d, d^prime$ בהתאמה. אם $U in tau$ אז מההגדרה השקולה ביחס ל־$d$ נקבל שעבור כל $y in U$ קיים $r>0$ כך שמתקיים $B_r (y) subset.eq U$ ולכן $B_(r/C)^prime (y) subset.eq B_r (y) subset.eq U$ וההגדרה השקולה מתקיימת גם ל-$d^prime$ ולכן $U in tau^prime$ והכיוון השני זהה עם היפוך תפקידים.
]
#remark[
  הכיוון השני לא נכון – שתי מטריקות יכולות להשרות את אותה הטופולוגיה אך לא להיות שקולות.\
  אם ניקח $X=RR$ עם המטריקה הסטנדרטית ו־$d^prime (x,y) = d(x,y)/((1+d(x,y)))$ הן כמובן אינן שקולות.
]
#proposition[לא כל טופולוגיה מושרית ממטריקה.]
#proof[
  ניקח $X={a,b}$ עם $tau={emptyset, {a}, X}$ ובבירור זוהי טופולוגיה.\
  נניח שיש מטריקה $d$ על $X$ ונגדיר $t colon.eq d(a,b)>0$ אז $B_r (b) = {b} in.not tau$ ולכן ההגדרה השקולה לטופולוגיה המושרית ממטריקה לא מתקיימת.
]
== הטופולוגיה הקו־סופית
#definition[הטופולוגיה הקו־סופית][
  תהיי $X$ קבוצה אינסופית ונגדיר $ cofiniteTopology(tau) colon.eq {emptyset} union.big {U subset.eq X bar abs(X without U)<infinity } $
  וזו אכן טופולוגיה: מהגדרה $X, emptyset in cofiniteTopology(tau)$ ונראה סגירות לאיחוד כלשהו ולחיתוכים סופיים: \
  יהיו ${V_i}_(i in I) subset.eq tau$ ונניח שלפחות $i in I$ אחד מקיים ש־$V_i !=emptyset$ (אחרת האיחוד הוא טריוויאלי הקבוצה הריקה) ולכן $(union.big_(i in I) V_i)^c = inter.big_(i in I) V_i^c subset.eq V_i^c$ והאחרון הוא סופי מהגדרת $tau$ ולכן $union.big_(i in I) V_i in tau$.\
  כעת, יהיו ${U_i}_(i=1)^n subset.eq tau$ ונסמן $V = inter.big_(i=1)^n U_i$. מכללי דה־מורגן נקבל $V^c=(inter.big_(i=1)^n U_i)^c = union.big_(i=1)^n U_i^c$ איחוד סופי של קבוצות סופיות אז $V in tau$.
]
#remark[
  אם $X$ סופי אז $cofiniteTopology(tau)=discrateTopology(tau)$.
]
== בסיס טופולוגי
#definition[בסיס של טופולוגיה][
  תהיי $X$ קבוצה נקרא ל־$cal(B) subset.eq cal(P)(X)$ *בסיס* של $X$ אם היא מקיימת
  + $X subset.eq union.big_(V in cal(B)) V$ (קרי $cal(B)$ מכסה את $X$)
  + אם $U, V in cal(B)$ ו־$y in U inter V$ אז קיים $W in cal(B)$ המקיים $y in W subset.eq U inter V$
]
#remark[
  אם $cal(B)$ מכסה את $X$ וסגור לחיתוכים סופיים אז היא בסיס.
]
#example[
  נסתכל על כדורים פתוחים במרחב מטרי אז לכל $y in X$ מתקיים $y in B_1 (y)$ ולכן $X subset.eq union.big_(y in X) B_1 (y)$. נניח $V = B_t (w), U=B_s (z)$ עבור $w,z in X$ ונניח שקיים $y in U inter V$ אז אם נגדיר $r colon.eq min{s-d(y,z), t-d(y,w)}$ נקבל ש־$y in B_r (y) subset.eq U inter V$.
]
#definition[טופולוגיה מושרית מבסיס][
  יהי $cal(B)$ בסיס של $X$. *הטופולוגיה המושרית* מ־$cal(B)$ היא אוסף תתי־הקבוצות של $X$ שהן איחוד של איברים מ־$cal(B)$.
]
#remark[
  זו אכן טופולוגיה: מהכיסוי נובע ש־$X, emptyset in tau$ וכפי שראינו איחוד של איחודים הוא איחוד אז נשאר להראות רק סגירות לחיתוכים סופיים: יהיו $U_1, U_2 in tau$ ונסמן $V=U_1 inter U_2$. לכל $y in V$ ו־$i in {1,2}$ ניקח $Z_i in cal(B)$ עבורו $y in Z_i subset.eq U_i$ ולכן $y in Z_1 inter Z_2$ ולכן קיים גם $W_y in cal(B)$ עם $y in W_y subset.eq Z_1 inter Z_2$ ולכן $V = union.big_(y in V) W_y in tau$
]
#end_of_lecture("1 – 23/03")
== מרחבים טופולוגיים מיוחדים
== סגירות במרחב טופולוגי
== רציפות במרחב טופולוגי
#definition[
  $f: (X, T_X) arrow (Y,T_Y)$ היא רציפה אם לכל $V subset.eq Y$ פתוחה גם $f^(-1)(V) subset.eq X$ פתוחה.
]
וראינו ש־$f$ רציפה אם ורק אם לכל $C subset.eq Y$ סגורה, $f^(-1)(C) subset.eq X$ סגורה אם ורק אם לכל $W$ בסיס של $T_Y$, $f^(-1)(W)$ פתוחה אם ורק אם לכל $x in X$ וסביבה $f$ של $f(X) in Y$ יש סביבה $E$ של $x$ עם $f(E) subset.eq ?$ אם ורק אם קיים לכל כיסוי פתוחה $???$ אם ורק אם לכל כיסוי סופי סגור $X = union.big A$, $f|_(A_i) : A_i arrow Y$ רציפה אם ורק אם לכל $A subset.eq X$, $f(closure(A)) subset.eq closure(f(A))$.
#example[
  + פונקציות קבועות הן רציפות (יש $y in Y$ כך ש־$f(x)=y$ לכל $x in X$) כי התמונה ההפוכה היא או הקבוצה הריקה או הכל
  + אם $T_Y$ (הטופלוגיה על $Y$) היא טריוויאליות אזי כל $f:X arrow Y$ רציפה (כי שוב הקבוצות הפתוחות הן או הקבוצה הריקה או הכל)
  + אם $T_X = cal(P)(X)$ דיסקרטית אזי כל $f:X arrow Y$ רציפה (?)
  + תהיי $A subset.eq X$ תתי־קבוצה עם הטופולוגיה המושרה אזי $i_A : A arrow.hook X$ (חד־חד ערכית) הנתונה על־ידי $i_A (y) = y$ לכל $y in A$ היא רציפה (כי \
    $T_(X bar_A) = {U inter A bar U in T_X}$ וניקח $U subset.eq X$ פתוחה ואז $i_A^(-1)(U) = U inter A in T_(X bar_A)$ מהגדרה)
  + יהיו $f:X arrow Y, g:Y arrow z$ רציפות אזי $g compose f:X arrow Z$ היא רציפה (תהיי $W in Z$ פתוחה (בטופולוגיה $T_Z$) ונרצה $(g compose f)^(-1)(W)$ פתוחה.\
    $
      (g compose f)^(-1) (W) = {x in X bar g compose f(x) in W} = {x in X bar g(f(x)) in W} = {x in X bar f(x) in g^(-1)(W)} = f^(-1)(g^(-1)(W))
    $
    מכך ש־$g$ רציפה ו־$W$ פתוחה אזי $g^(-1)(W)$ פתוחה ומכך ש־$g^(-1)(W)$ פתוחה אזי $f^(-1)(g^(-1)(W))$ פתוחה)\
    *מסקנה:* אם $f:X arrow Y$ רציפה ו־$A subset.eq X$ כללית (עם הטופולוגיה המושרה) אזי $f|_A : A arrow Y$ רציפה (נובע ישירות מהטענה כיוון ש־$f|_(A) = f compose i_A$)
  + עבור מכפלה $X times Y$ של מרחבים טופולוגיים ההטלות $pi_X : X arrow Y, pi_Y: X arrow Y arrow Y$ הנתונות על־ידי $pi_X (x,y) = x, p_Y (x,y)=y$ הן רציפות (ל־$U subset.eq X$ פתוחה, $pi_X^(-1)(U) = U times Y subset.eq X times Y$ פתוחה ואותו הדבר ל־$V subset.eq Y$)
]
#lemma[
  נניח ש־$X,Y$ מרחבים טופולוגיים, $X = union.big_(alpha in I) U_alpha$ כיסוי פתוח ונניח שלכל $alpha$ יש פונקציה $f_alpha : U_alpha arrow Y$ כך שעבור כל $alpha,beta$ מתקיים $f_alpha|_(U_alpha inter U_beta)= f_beta|_(U_alpha inter U_beta)$ אזי קיימת $f:X arrow Y$ רציפה יחידה כך שלכל $alpha$, $f|_(U_alpha)=f$
]
#proof[
  לכל $x in X$ יש $alpha=alpha_x in I$ עם $x in U_(alpha)$ ונגדיר $f(x)=f_(alpha) (x) in Y$.\
  אם $x in U_(beta_x)$ אז מהתנאי $f_(alpha_x) (x) = f_(beta_x) (x)$ ולכן $f$ מוגדרת היטב וברור שמקיימת $f|_(U_alpha) = f_alpha$ וברור שיחידה. מכך ש־$f|_(U_alpha) : U_alpha arrow Y$ רציפה לכל $alpha$ נקבל ממקודם ש־$f$ רציפה.
]
#definition[
  תהיי $h:Y arrow Z$ פונקציה של קבוצות ותהיי $T_Z$ טופולוגיה על $Z$.\
  הטופולוגיה המושרה מ־$T_Z$ על $Y$ דרך הפונקציה $h$ היא טופולוגיה הנתונה על־ידי $h^* T_Z colon.eq {h^(-1)(W) bar W in T_Z subset.eq cal(P)(Y)}$
  ומתכונות $h^(-1)$ נובע ש־$h^* T_Z subset.eq cal(P)(Y)$ היא טופולוגיה על $Y$ והיא המינימלית עבורה $h$ רציפה.
]
#exercise[
  עבור פונקציה $g:(X, T_X) arrow (Y, h^* T_Z)$ היא רציפה אם ורק אם $h compose g : (X, T_X) arrow (Z, T_Z)$ רציפה.
]
#definition[
  $h:Y arrow Z$ קבוצתית ו־$T_Y$ טופולוגיה על $Y$ ונגדיר את
  הטופולוגיה המושרה ב־$T_Y$ על $Z$ דרך $h$
  $ h_* T_Y colon.eq {W subset.eq Z bar h^(-1)(W) in T_Y } subset.eq cal(P)(Z) $
  מתכונות $h^(-1)$ זו טופולוגיה על $Z$ (תרגיל) וזו הטופולוגיה המקסימלית על $Z$ עבורה $h$ רציפה.
]
#exercise[
  פונקציה $f: (Z, h_* T_Y) arrow (X, T_X)$ רציפה אם ורק אם $f compose h:(Y, T_Y) arrow (X, T_X)$ רציפה
]

*נשים לב שגם למכפלה של 3 זה אותו הדבר*.
אז אפשר להסתכל על זה כתת־בסיס ואז הבסיס המתקבל הוא
$ cal(B) colon.eq {U_1 times U_2 times U_3 bar "פתוחה" U_i subset.eq X} $
* מעכשיו מניחים את אקסיומת הבחירה * \
יהי $(X_alpha, T_alpha)$ מרחב טופולוגי לכל $alpha in I$ עבור קבוצת אינדקסים ונגדיר $P colon.eq product_(alpha in I) X_alpha != emptyset$.\
נגדיר את טופולוגיית הקופסה $T_(b o x)$ להיות המושרה מהבסיס
$ cal(B)_(b o x) colon.eq {product_(alpha in I) U_alpha bar "פתוחה" U_alpha subset.eq X_alpha} $
התת־בסיס $C$ המתקבל ממה שנדרש עבור הרציפות של $pi_alpha : P arrow X_alpha$ לכל $alpha$ כולל את הקבוצות $U_alpha times product_(beta != alpha) X_beta subset.eq P$ לכל $alpha in I$ ו־$U_alpha subset.eq X_alpha$ פתוחה.\
הבסיס $B = cal(B)_(p r o d)$ הנוצר מ־$C$ (ומשרה את טופולוגיית המכפלה $T_(p r o d)$) הוא
$
  { product_(i=1)^n U_(alpha_i) times product_(beta in I without {alpha_1 dots.h.c, alpha_n}) X_beta bar } = {product)*alpha in Z}
$
#end_of_lecture("5 – 20/04")

= הפרדה
#definition[הומיאומורפיזם][
  יהיו $X,Y$ מרחבים טופולוגיים. $f: X arrow Y$ נקראת *הומיאומורפיזם* אם היא רציפה, חד־חד ערכית ועל וגם $f^(-1) : Y arrow X$ רציפה.
]
#definition[מרחבים הומאומורפיים][
  יהיו $X,Y$ מרחבים טופולוגיים. $X,Y$ נקראיים *הומאומורפיים* אם יש $f:X arrow Y$ הומיאומורפיזם ונסמן $X tilde.equiv Y$.
]
#example[
  + $Id_X$ (פונקציית הזהות על $X$) הומאומורפיזם כש־$X$ עם אותה הטופולוגיה
  + $f:X arrow Y, g : Y arrow Z$ הומיאומורפיזם אז גם $g compose f, f^(-1)$ הומיאומורפיזמים ($(g compose f)^(-1) = f^(-1) compose g^(-1)$)
]
#corollary[להיות הומאומורפיים זה יחס שקילות על מרחבים טופולוגיים.]
#example[
  + $(0, 1) subset.eq RR, space (h, b+h) subset.eq RR$ עבור $b>0$ אז הם הומיאומורפיים דרך $f(x)=b x + h$ כי $f^(-1)(y) = (y - h)/b$ אז כמסקנה כל הקטעים הפתוחים ב־$RR$ הם הומיאומורפיים ונוכל לראות שגם $[0,1) tilde.equiv [h, b+h)$
  + $(-1, 1) tilde.equiv RR$ כי $x mapsto tan((x pi)/2)$ פונקציה חד־חד ערכית ועל עם הופכית $y mapsto (2 arctan(y))/pi$
  + אם נסתכל על $RR^2$ ו־$S^2 = {(x,y,z) in RR^3 bar x^2+y^2+z^2=1, space N=(0,0,1)}$ אז אם נסתכל על $S^2 without {N} tilde.equiv RR^2$ כי $ (x,y,z) mapsto (x/(1 z), y/(1-z)) wide (u,v) mapsto ((2u)/(u^2+v^2+1), (2v)/(u^2+v^2+1), (u^2+v^2-1)/(u^2+v^2+1)) $
    נשים לב שאם ניקח $t mapsto^f (cos(t), sin(t))$ ב־$[0, 2pi)$ אז היא חד־חד ערכית ועל ורציפה אבל $f^(-1)$ לא רציפה ולכן $f$ לא הומיאומורפיזם (זה בגלל הנקודות $0, 2pi$).\
    נסתכל על $[0, epsilon) subset.eq [0, 2pi)$ שהוא קטע פתוח ב־$RR$, אז אם $f^(-1)=g$ רציפה אזי $g^(-1)([0,epsilon)) subset.eq S^2$ פתוחה אבל בגלל שהטופולוגיה שלנו מושרית מהטופולוגיה על $RR^2$ כלומר כדורים פתוחים אז כדי להגיד שהקטע הזה פתוח זה אומר שהוא חייב להכיל איזשהו סביבה בסיסית של הנקודה בקצה בקטע וזה חיתוך של כדור ב־$RR^2$ עם $S^2$ ולכן הוא תמיד מכיל עוד נקודות בסביבה אז זו לא יכולה להיות סביבה פתוחה.
]

#definition("ניתנות להפרדה")[
  $X$ מרחב טופולוגי, $G,H subset.eq X$ נקראות *ניתנות להפרדה* אם יש $U, V subset.eq X$ פתוחות זרות עם $G subset.eq U$ ו־$H subset.eq V$.
]
#definition[מרחב טופולוגי $X$ מקיים את / נקרא
  + אקסיומת ההפרדה $T_0$ אם לכל $x != y in X$ יש $x in U subset.eq X$ פתוחה כך ש־$y in.not U$ או $y in U subset.eq X$ פתוחה כך ש־$x in.not U$
  + אקסיומת ההפרדה $T_1$ אם לכל $x!=y in X$ יש $x in U subset.eq X$ ו־$y in.not U$ ($y in V subset.eq X$ ו־$x in.not V$) (כמובן ש־$U, V$ פתוחות)
  + אקסיומת ההפרדה $T_2$ אם כל $x!=y in X$ ניתנות להפרדה
  + $X$ נקרא רגולרי אם $A subset.eq X$ סגורה ו־$x in.not A$ אזי $x,A$ ניתנות להפרדה
  + $X$ נקרא נורמלי אם $A,B subset.eq X$ סגורות זרות אזי הן ניתנות להפרדה
  + אקסיומת ההפרדה $T_3$ אם רגולרי ומקיים $T_1$
  + אקסיומת ההפרדה $T_4$ אם נורמלי ומקיים $T_1$
] <separation-axim>
#theorem[
  עבור $X$ מרחב טופולוגי כללי
  $
    "מרחב מטרי" arrow.double_(display(arrow.double.l.not)) T_4 arrow.double_(display(arrow.double.l.not)) T_3 arrow.double_(display(arrow.double.l.not)) T_2 arrow.double_(display(arrow.double.l.not)) T_1 arrow.double_(display(arrow.double.l.not)) T_0 arrow.double_(display(arrow.double.l.not)) "מרחב טופולוגי כללי"
  $
] <separation-axiom-chain>
#proof[
  נשים לב ש־$T_4 arrow.double T_3 arrow.double T_2$ מהלמה למטה ו־$T_2 arrow.double T_1 arrow.double T_0$ מהגדרה.\
  $X = {a,b}$ עם $T_("triv")$ לא $T_0$ (והיא גם נורמלית ורגולרית ולא $T_2$) אבל עם $T = {emptyset, X, {a}}$ היא $T_0$ ולא $T_1$.\
  אם $abs(X)=infinity$ אזי עם הטופולוגיה הקו־סופית היא $T_1$ ולא $T_2$ (כי משלימות של סופיות בקבוצה אינסופית חייבות להיחתך).\
  #remark[
    אם $(X,T)$ מקיים את $T_0 \/ T_1 \/ T_2$ ו־$T subset.eq tilde(T)$ אזי כך גם $(X, cal(T))$ ו־$(X,T)$ מקיים את $T_1$ אם ורק אם $T_("cofin") subset.eq T$.
  ]
]
#lemma[
  + $T_1$ שקול לזה שכל יחידון הוא סגור
  + $T_2$ שקול לזה שאם נגדיר את האלכסון $Delta_X = {(x,x) bar x in X} subset.eq X times X$ הוא סגור
  + רגולרי שקול לאם $x in V$ פתוחה אזי יש $W subset.eq X$ פתוחה כך ש־$x in W subset.eq closure(W) subset.eq V$
  + נורמלי שקול לכך שאם $B subset.eq V$ עבור $B$ סגורה ועבור $V$ פתוחה אזי יש $W subset.eq X$ פתוחה כך ש־$B subset.eq W subset.eq closure(W) subset.eq V$
]
#proof[
  + ניקח $x in X$ ואז לכל $x!=y in X$ יש $V_y subset.eq X$ פתוחה כך ש־$y in V_y, x in.not V_y$ מהגדרת $T_1$ אזי ${x}^c = union.big_(x!=y in X) V_y subset.eq X$ כאשר $V_y$ פתוחה וזה איחוד של קבוצות פתוחות ולכן פתוח ו־${x}$ סגור. לחילופין אם $x!=y$ אזי $y in {x}^c in.not.rev x$ ו־${x}^c$ פתוח
  + הטופלוגיה על $X times X$ מושרית מהבסיס $U times V$ כאשר $U,V subset.eq X$ פתוחות.\
    אם $(x,y) in X times X without Delta_X$ אזי $x!=y$ ניתנות להפרדה על־ידי סביבות $x in U_(x,y), space y in V_(x,y)$ ולכן $Delta_X^c = union.big_(x!=y in X) U_(x,y) times V_(x,y)$ וזה פתוח. לחילופין, אם $Delta_X$ סגור ו־$x!=y$ אזי $(x,y) in Delta_X^c$ נמצא בפתוחה בסיסית $(x,y) in U times V subset.eq Delta_X^c$ ולכן סביבות מפרידות (כי $x in U, y in V$ ובגלל ש־$U times V subset.eq Delta_X^c$ אזי $U inter V = emptyset$)
  + נניח רגולרי וניקח $x in V$ כך ש־$B subset.eq V$ ונגדיר $A=V^c$ פתוחה לכן יש $A subset.eq U$ פתוחה ופתוחה $x in W$ $B subset.eq W$ שזרה ל־$U$ ואז נקבל $W subset.eq U^c$ ו־$U^c$ סגורה ולכן $closure(W) subset.eq U^c$ מהיות $V^c subset.eq U$ נקבל ש־$closure(W) subset.eq U^c subset.eq V$.\
    בכיוון ההפוך, אם $A$ סגורה ו־$x in.not A$, $B inter A = emptyset$ סגורה אזי עם $V=A^c$
    #todo עדיף להוכיח לבד.
]
נראה ש־$T_2 arrow.double.not T_3$: נגדיר $cal(tilde(B))$ על $RR$ על־ידי $cal(tilde(B)) = {(a,b)} union.big {(a,b) without ({1/n bar n in NN})}$ ונשים לב ש־$tilde(cal(B))$
#end_of_lecture("6 – 27/04")

#lemma[
  אם $X$ מרחב טופולוגי כלשהו שהוא אחד מהבאים $T_0, T_1, T_2, T_3$ אז כל $Y subset.eq X$ עם אותה תכונה.
]
#proof[
  יהיו $x!=y in Y$ אז $x!=y in X$ וב־$T_0, T_1, T_2$ יש פתוחה (ב־$X$) $U, V subset.eq X$ עם התכונה הנדרשת ולכן $U inter Y subset.eq Y$ ו־$V inter Y subset.eq Y$ פתוחה עם התכונה הנדרשת (ב־$Y$).\
  ראינו ש־$T_3 ==> T_1$ ולכן רק נשאר להראות רגולריות: $B subset.eq Y$ סגורה ב־$Y$ ו־$x in Y without B$ ונרצה סביבות שמפרידות ביניהם ומכך ש־$B$ סגורה יש $A subset.eq X$ סגורה עם $A inter Y = B$ וברור ש־$x in.not A$ ומהרגולריות של $X$ יש $x in U subset.eq X$ ו־$A subset.eq V subset.eq X$ פתוחות מפרידות ונקבל \
  $x in (U inter Y) subset.eq Y$ ו־$B subset.eq V inter Y subset.eq Y$ כדרוש.\
  למה ב־$T_4$ ההוכחה לא עובדת: אם יש לי שתי קבוצות סגורות שאני רוצה להפריד ביניהן ב־$Y$ הן חיתוך של $Y$ עם סגורות ב־$X$ אבל אף אחד לא מבטיח שיש זרות בסגורות ב־$X$ ולכן ההוכחה נשברת.
]
#definition("מרחב נורמלי לחלוטין")[
  $X$ מקיים את אקסיומת ההפרדה $T_5$ ונקרא *מרחב נורמלי לחלוטין* אם הוא $T_4$ וכל $Y subset.eq X$ גם $T_4$.
]
#lemma[
  אם $X,Y$ מקיימים את $T_0, T_1, T_2, T_3$ אזי כך גם עבור $X times Y$
]
#proof[
  עבור $T_0, T_1, T_2$ צריך לקחת שתי נקודות שונות במכפלה וליצור קבוצות פתוחות שמתנהגות באופן שאנחנו רוצים: יהיו $(x,y) != (z,w) in X times Y$ (לפחות אחת מהקורדינאטות שונה ובלי הגבלת הכלליות נניח $x!=z$). מתכונת $X$ יש פתוחה $U subset.eq X$ (או גם $V subset.eq X$) עם התכונה הנדרשת.\
  אזי $U times Y subset.eq X times Y$ (עם $V times Y$) עם התכונה הנדרשת במכפלה.\
  עבור $T_3$, אם אז ממקודם $T_1$ עובד ולכן רק צריך להראות רגולריות ונרצה לעבוד עם הניסוח השקול: ניקח $(x,y) in H subset.eq X times Y$ פתוחה ובלי הגבלת הכלליות $H = U times V$ פתוחה בסיסית אזי $x in U, y in V$ ומתכונה $T_3$ יש $x in Z subset.eq closure(Z) subset.eq U subset.eq X$ ו־$y in W subset.eq closure(W) subset.eq V subset.eq Y$ ונסתכל על $(x,y) in Z times W subset.eq closure(Z times W) subset.eq closure(Z) times closure(W) subset.eq U times V subset.eq H$ וזה נותן את הדרישה ל־$T_3$.\
]
#remark[עובד בידיוק באותו אופן למכפלה כללית (כמובן עם טופולוגיית המכפלה).]
#proposition[מרחב מטרי הוא $T_5$.]
#proof[מספיק להראות שהוא $T_4$ (כי תת־מרחב של מרחב מטרי הוא מרחב מטרי).\
  מ@separation-axim נובע שמספיק להראות שהמרחב הוא נורמלי ומקיים את $T_1$ ומ@separation-axiom-chain מספיק להראות שהוא $T_2$ ונורמלי: \
  יהיו $x!=y in X$ ו־$r=frac(d(x comma y), 2)$ אזי $B_r (x), B_r (y)$ מפרידות.\
  עבור $A,B subset.eq X$ סגורות זרות נרצה הפרדה. לכל $x in X$ ו־$D subset.eq X$ נגדיר $d(x,D) = inf_(y in D) d(x,y)>=0$ כי אם $x in D$ זה יהיה אפס אבל זה (כמובן יכול להיות אפס גם בלי זה מהגדרת $inf$).\
  אם $A$ סגורה אזי לכל $x in.not A$, $d(x,A)>A$ כי $x in A^c subset.eq X$ פתוחה ולכן יש $epsilon > 0$ עם $B_epsilon (x) subset.eq A^c$ ואז $d(x,A)>=epsilon>0$.\
  נגדיר $ A subset.eq U = union.big_(x in A) B_(d(x,B)/3) (x) wide B subset.eq V=union.big_(y in B) B_(d(y,A)/3) (x) $ והן פתוחות ב־$X$ כאיחוד של קבוצות פתוחות.\
  נצטרך להראות שהן זרות אחת לשנייה: אם לא, יש $z in U inter V$ ולכן יש $x in A$ כך ש־$z in B_(d(x,B)/3) (x)$ וגם $y in B$ כך ש־$z in B_(d(y,A)/3) (y)$ ולכן $z in B_(d(x,B)/3) (x) inter B_(d(y, A)/3) (y)$.\
  אז
  $ d(x,y) <= d(x,z)+d(y,z) < d(x,B)/3 + d(y,A)/3 $
  ומהגדרת האינפימום $d(x,y) >= d(x,B), d(y,A)$.\
  היות ואם $r>=s$ ו־$r>=t$ אזי $r>=(s+t)/2$ ונקבל $ (d(x,B)+d(y,A))/2 <= d(x,y) < (d(x,B)+d(y,A))/3 $
  אלו מספרים חיוביים ולכן זאת כמובן סתירה ולכן $U inter V = emptyset$ והן מפרידות.
]
#end_of_lecture("7 – 28/04")
