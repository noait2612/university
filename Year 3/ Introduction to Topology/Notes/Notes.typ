#import "../../../src/article.typ": *
#show: article.with(
  title: [ מבוא לטופולוגיה ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 2)

= הרצאה 5 – 20/04
#definition[
  $F: (X, T_X) arrow (Y,T_Y)$ היא רציפה אם לכל $V subset.eq Y$ פתוחה גם $F^(-1)(V) subset.eq X$ פתוחה.
]
וראינו ש־$F$ רציפה אם ורק אם לכל $C subset.eq Y$ סגורה, $f^(-1)(C) subset.eq X$ סגורה אם ורק אם לכל $W$ בסיס של $T_Y$, $f^(-1)(W)$ פתוחה אם ורק אם לכל $x in X$ וסביבה $F$ של $F(X) in Y$ יש סביבה $E$ של $x$ עם $F(E) subset.eq ?$ אם ורק אם קיים לכל כיסוי פתוחה $???$ אם ורק אם לכל כיסוי סופי סגור $X = union.big A$, $F|_(A_i) : A_i arrow Y$ רציפה אם ורק אם לכל $A subset.eq X$, $F(closure(A)) subset.eq closure(F(A))$.
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
  אם $x in U_(beta_x)$ אז מהתנאי $F_(alpha_x) (x) = f_(beta_x) (x)$ ולכן $f$ מוגדרת היטב וברור שמקיימת $f|_(U_alpha) = f_alpha$ וברור שיחידה. מכך ש־$f|_(U_alpha) : U_alpha arrow Y$ רציפה לכל $alpha$ נקבל ממקודם ש־$f$ רציפה.
]
#definition[
  תהיי $h:Y arrow Z$ פונקציות של קבוצות ותהיי $T_Z$ טופולוגיה על $Z$.\
  הטופולוגיה המושרה מ־$T_Z$ על $Y$ דרך הפונקציה $h$ היא טופולוגיה הנתונה על־ידי $ h^* T_Z colon.eq {h^(-1)(W) bar W in T_Z subset.eq cal(P)(Y)} $
  מתכונות $h^(-1)$ נובע ש־$h^* T_Z subset.eq cal(P)(Y)$ היא טופולוגיה על $Y$ והיא המינימלית עבורה $h$ רציפה
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

= הרצאה 6 – 27/04
#definition("הומיאומורפיזם")[
  יהיו $X,Y$ מרחבים טופולוגיים אזי $f: X arrow Y$ נקראת *הומיאומורפיזם* אם היא רציפה, חד־חד ערכית ועל ובעלת הופכית $f^(-1) : Y arrow X$ רציפה.
]
#definition("מרחבים הומאומורפיים")[
  יהיו $X,Y$ מרחבים טופולוגיים אזי $X,Y$ נקראיים *הומאומורפיים* אם יש $F:X arrow Y$ הומיאומורפיזם ונסמן $X tilde.equiv Y$.
]
#example[
  + $Id_X$ (פונקציית הזהות על $X$) הומאומורפיזם כש־$X$ עם אותה הטופולוגיה
  + $f:X arrow Y$ ו־$g : Y arrow Z$ הומיאומורפיזם אז גם $g compose f$ הומיאומורפיזם וכן גם $f^(-1) : Y arrow X$ הומיאומורפיזם ($(g compose f)^(-1) = f^(-1) compose g^(-1)$)
]
#corollary[להיות הומאומורפיים זהו יחס שקילות על מרחבים טופולוגיים.]
#example[
  + $(0, 1) subset.eq RR, space (h, b+h) subset.eq RR$ עבור $b>0$ אז הם הומיאומורפיים דרך $f(x)=b x + h$ כי $f^(-1)(y) = (y - h)/b$ אז כמסקנה כל הקטעים הפתוחים ב־$RR$ הם הומיאומורפיים ונוכל לראות שגם $[0,1) tilde.equiv [h, b+h)$
  + $(-1, 1) tilde.equiv RR$ כי $x mapsto tan((x pi)/2)$ פונקציה חד־חד ערכית ועל עם הופכית $y mapsto (2 arctan(y))/pi$
  + אם נסתכל על $RR^2$ ו־$S^2 = {(x,y,z) in RR^3 bar x^2+y^2+z^2=1, space N=(0,0,1)}$ אז אם נסתכל על $S^2 without {N} tilde.equiv RR^2$ כי $ (x,y,z) mapsto (x/(1 z), y/(1-z)) wide (u,v) mapsto ((2u)/(u^2+v^2+1), (2v)/(u^2+v^2+1), (u^2+v^2-1)/(u^2+v^2+1)) $
    נשים לב שאם ניקח $t mapsto^f (cos(t), sin(t))$ ב־$[0, 2pi)$ אז היא חד־חד ערכית ועל ורציפה אבל $f^(-1)$ לא רציפה ולכן $f$ לא הומיאומורפיזם (זה בגלל הנקודות $0, 2pi$).\
    נסתכל על $[0, epsilon) subset.eq [0, 2pi)$ שהוא קטע פתוח ב־$RR$, אז אם $f^(-1)=g$ רציפה אזי $g^(-1)([0,epsilon)) subset.eq S^2$ פתוחה אבל בגלל שהטופולוגיה שלנו מושרית מהטופולוגיה על $RR^2$ כלומר כדורים פתוחים אז כדי להגיד שהקטע הזה פתוח זה אומר שהוא חייב להכיל איזשהו סביבה בסיסית של הנקודה בקצה בקטע וזה חיתוך של כדור ב־$RR^2$ עם $S^2$ ולכן הוא תמיד מכיל עוד נקודות בסביבה אז זו לא יכולה להיות סביבה פתוחה.
]

=== אקסיומת ההפרדה
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
]
#theorem[
  עבור $X$ מרחב טופולוגי כללי
  $
    "מרחב מטרי" arrow.double_(display(arrow.double.l.not)) T_4 arrow.double_(display(arrow.double.l.not)) T_3 arrow.double_(display(arrow.double.l.not)) T_2 arrow.double_(display(arrow.double.l.not)) T_1 arrow.double_(display(arrow.double.l.not)) T_0 arrow.double_(display(arrow.double.l.not)) "מרחב טופולוגי כללי"
  $
]
#proof[
  נשים לב ש־$T_4 arrow.double T_3 arrow.double T_2$ מהלמה למטה ו־$T_2 arrow.double T_1 arrow.double T_0$ מהגדרה.\
  $X = {a,b}$ עם $T_("triv")$ לא $T_0$ (והיא גם נורמלית ורגולרית ולא $T_2$) אבל עם $T = {emptyset, X, {a}}$ היא $T_0$ ולא $T_1$.\
  אם $abs(X)=infinity$ אזי עם הטופולוגיה הקו־סופית היא $T_1$ ולא $T_2$ (כי משלימות של סופיות בקבוצה אינסופית חייבות להיחתך).\
  #remark[
    אם $(X,T)$ מקיים את $T_0 \/ T_1 \/ T_2$ ו־$T subset.eq tilde(T)$ אזי כך גם $(X, cal(T))$.\
    $(X,T)$ מקיים את $T_1$ אם ורק אם $T_("cofin") subset.eq T$.
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

= הרצאה 7 – 28/04
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
  $X$ מקיים את אקסיומת ההפרדה $T_5$ אם הוא $T_4$ וכל $Y subset.eq X$ גם $T_4$.
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
  נראה $T_2$: יהיו $x!=y in X$ ו־$r=d(x,y)/2$ אזי $B_r (x), B_r (y)$ מפרידות.\
  עבור $A,B subset.eq X$ סגורות זרות נרצה הפרדה. לכל $x in X$ ו־$D subset.eq X$ נגדיר $d(x,D) = inf_(y in D) d(x,y)>=0$ כי אם $x in D$ זה יהיה אפס אבל זה יכול להיות אפס גם בלי זה כי זה אינפימום...\
  אם $A$ סגורה אזי לכל $x in.not A$, $d(x,A)>A$ כי $x in A^c subset.eq X$ פתוחה ולכן יש $epsilon > 0$ עם $B_epsilon (x) subset.eq A^c$ ואז $d(x,A)>=epsilon>0$.\
  נגדיר $A subset.eq U = union.big_(x in A) B_(d(x,B)/3) (x), B subset.eq V=union.big_(y in B) B_(d(y,A)/3) (x)$ והן פתוחות ב־$X$ כאיחוד של קבוצות פתוחות.\
  נצטרך להראות שהן זרות אחת לשנייה: אם לא, יש $z in U inter V$ ולכן יש $x in A$ כך ש־$z in B_(d(x,B)/3) (x)$ וגם $y in B$ כך ש־$z in B_(d(y,A)/3) (y)$ ולכן $z in B_(d(x,B)/3) (x) inter B_(d(y, A)/3) (y)$.\
  אז
  $ d(x,y) <= d(x,z)+d(y,z) < d(x,B)/3 + d(y,A)/3 $
  ומהגדרת האינפימום $d(x,y) >= d(x,B), d(y,A)$.\
  היות ואם $r>=s$ ו־$r>=t$ אזי $r>=(s+t)/2$ ולכן נקבל $ (d(x,B)+d(y,A))/2 <= d(x,y) < (d(x,B)+d(y,A))/3 $
  ואלו מספרים חיוביים ולכן זאת כמובן סתירה ולכן $U inter V = emptyset$ והן מפרידות.
]
