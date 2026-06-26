#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *

#show: thmbox-init()

#show: article_he.with(
  title: [ מבוא לטופולוגיה ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 2)

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
  + איחוד של איחודים הוא איחוד: אם ${U_alpha}_(alpha in I) subset.eq tau$ אז לכל $alpha in I$ מתקיים $U_alpha = union.big_(i in I_alpha) B_(r_(x_i)) (x_i)$ עבור אוסף $I_alpha$ כלומר $union.big_(alpha in I) U_alpha =union.big_(alpha in I) union.big_(i in I_alpha) B_(r_(x_i)) (x_i)$.
  + יהי ${U_i}_(i=1)^n subset.eq U$ ונסמן $V = inter.big_(i=1)^n U_i$ ונראה ש־$V in tau$: מהשקילות נובע שלכל $y in V$ מתקיים $y in U_i$ לכל $i in [n]$ ולכן יש $r_i > 0$ שעבורו $B_(r_i) (y) subset.eq U_i$. נגדיר $r=min_(i in [n]) (r_i)$ ונקבל $y in B_r (y) subset.eq B_(r_i) (y) subset.eq U_i$ ולכן $B_(r_i) subset.eq V$
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
  תהיינה $tau, tau^prime$ הטופולוגיות המושרות מ־$d, d^prime$ בהתאמה. \
  אם $U in tau$ אז מההגדרה השקולה ביחס ל־$d$ נקבל שעבור כל $y in U$ קיים $r>0$ כך שמתקיים $B_r (y) subset.eq U$ ולכן $B_(r/C)^prime (y) subset.eq B_r (y) subset.eq U$ וההגדרה השקולה מתקיימת גם ל-$d^prime$ ולכן $U in tau^prime$ והכיוון השני זהה עם היפוך תפקידים.
]

#remark[
  הכיוון השני לא נכון – שתי מטריקות יכולות להשרות את אותה הטופולוגיה אך לא להיות שקולות.\
  אם ניקח $X=RR$ עם המטריקה הסטנדרטית ו־$d^prime (x,y) = d(x,y)/((1+d(x,y)))$ הן כמובן אינן שקולות.
]

#proposition[
  לא כל טופולוגיה מושרית ממטריקה.
]

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
נסמן את הטופולוגיה המושרית מהבסיס $cal(B)$ ב־$tau_(cal(B))$ ונראה שזו אכן טופלוגיה.\
מהגדרת הבסיס כיסוי נובע ש־$X, emptyset in tau_cal(B)$ וכפי שראינו איחוד של איחודים הוא איחוד אז נשאר להראות רק סגירות לחיתוכים סופיים:\
יהיו $U_1, U_2 in cal(B)$ ונראה ש־$V = U_1 inter U_2 in tau_cal(B)$, אז יהי $x in V$.\
מאחר ש־$U_1$ היא איחוד של איברים מ־$cal(B)$ אז קיים $Z_1 in cal(B)$ כך ש־$x in Z_1 subset.eq U_1$.  באופן דומה, קיים $Z_2 in cal(B)$ עבורו $x in Z_2 subset.eq U_2$ ולכן $x in Z_1 inter Z_2$  ולכן מהגדרת הבסיס קיים $W_x in cal(B)$ כך ש־$x in W_x subset.eq Z_1 inter Z_2$ ובפרט $x in W_x subset.eq V$.

#end_of_lecture("1 – 23/03")

#example[
  + יהי $(X,d)$ מרחב מטרי אינסופי, נגדיר $cal(B)= {B_(1/n) (x) bar x in X, n in NN}$ והוא מהווה בסיס על $X$ והוא משרה את הטופולוגיה של המרחב המטרי (כלומר הטופולוגיה המושרית מהמטריקה $d$)
  + אם $X=RR$ נוכל להגדיר שני בסיסים
    + $cal(B) = {(a,b) bar a<b}$ זהו אוסף הכדורים (קטעים) הפתוחים ביחס למטריקה הסטנדרטית על
    + $cal(B)^prime = {[a,b) bar a<b}$
    האם $cal(B)=cal(B)^prime$? האם טופולוגיה אחת חלשה מהאחרת?\
    אז $cal(B)$ חלשה ממש מ־$cal(B)^prime$ כלומר $cal(B) subset.neq cal(B)^prime$.\
    שכן, האיברים של $cal(B)^prime$ אינם פתוחים ביחס למטריקה הרגילה על $RR$ (כי אין קטע פתוח מסביב ל־$a$ המוכל ב־$[a,b)$) ולכן $cal(B)^prime subset.eq.not cal(B)$.\
    מצד שני, איברי $cal(B)$ שייכים ל־$cal(B)^prime$ שכן לכל קטע פתוח $(a,b) in cal(B)$ מתקיים
    $ (a,b) = union.big_(a^prime in (a,b)) [a^prime, b) in cal(B)^prime $
    מסגירות $cal(B)^prime$ לאיחוד נובע ש־$cal(B) subset.eq cal(B)^prime$.
]

#lemma[
  יהי $(X,tau)$ מרחב טופולוגי ו־$B subset.eq tau$ ונניח כי לכל $U in tau$ ולכל $x in U$ קיים $H in B$ כך ש־$x in H subset.eq U$.\
  אז $B$ הוא בסיס והוא משרה את $tau$.
]

#proof[
  נוודא ש־$B$ הוא אכן בסיס: מהיות $X in tau$ מההנחה נובע שלכל $x in X$ קיים $H in B$ כך ש־$x in H$ וזה בידיוק אומר ש־$B$ הוא כיסוי של $X$.\
  יהיו $V,W in B$ ויהי $x in V inter W$. מסגירות לחיתוך סופי נובע ש־$V inter W in tau$ ולכן מההנחה קיים $H in B$ כך ש־$x in H subset.eq V inter W$.\
  אז $B$ הוא אכן בסיס.\
  תהיי $tau^prime$ הטופולוגיה המושרית מ־$B$ ונראה ש־$tau^prime=tau$ על־ידי הכלה דו־כיוונית.\
  $(subset.eq)$ נובע ישירות מכך ש־$B subset.eq tau$ ולכן $tau^prime subset.eq tau$.\
  $(supset.eq)$ יהי $U in T$ ומההנחה קיים $x in U$ ו־$H_x in B$ כך ש־$x in H_x subset.eq U$ אז $U = union.big_(x in U) H_x in tau^prime$.
]

#definition[תת־בסיס][
  נגדיר את *תת־הבסיס* על $X$ להיות $C subset.eq cal(P)(X)$ המכסה את $X$ ואת *הבסיס המושרה מ־$C$* נגדיר להיות אוסף החיתוכים הסופיים של איברים ב־$C$ (לא כולל חיתוך ריק).
]
נסמן ב־$cal(C)$ את הבסיס המושרה מ־$C$ ונראה שהוא אכן בסיס.\
מכך ש־$cal(C)$ מכיל את $C$ הוא בבירור מכסה את $X$ ואם $U, V in cal(C)$ ו־$x in U inter V$ אז אם ניקח $W = U inter V$ נסיים כי $U,V$ הם חיתוכים סופיים של איברים ב־$C$ ולכן גם $U inter V$ הוא חיתוך סופי של איברים ב־$C$ אז $x in W subset.eq U inter V$.


#example[
  תהיי $X$ קבוצה ונסתכל על התת־בסיס $C={X}$. אז הבסיס המושרה מ־$C$ הוא $cal(C)={X}$ והטופולוגיה המושרית מ־$cal(C)$ היא $tau = {emptyset, X}$.
]

#definition[הטופולוגיה המושרית מתת־קבוצה]
#todo
#lemma[#todo]

#end_of_lecture("2 – 24/03")
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
== אקסיומות ההפרדה
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
    נסתכל על $[0, epsilon) subset.eq [0, 2pi)$ שהוא קטע פתוח ב־$RR$, אז אם $f^(-1)=g$ רציפה אזי $g^(-1)([0,epsilon)) subset.eq S^2$ פתוחה אבל בגלל שהטופולוגיה שלנו מושרית מהטופולוגיה על $RR^2$ כלומר כדורים פתוחים אז כדי להגיד שהקטע הזה פתוח זה אומר שהוא חייב להכיל איזשהו סביבה בסיסית של הנקודה בקצה בקטע וזה חיתוך של כדור\
    ב־$RR^2$ עם $S^2$ ולכן הוא תמיד מכיל עוד נקודות בסביבה אז זו לא יכולה להיות סביבה פתוחה.
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
  נצטרך להראות שהן זרות אחת לשנייה: אחרת, יש $z in U inter V$ כלומר $x in A$ כך ש־$z in B_(d(x,B)/3) (x)$ וגם $y in B$ כך ש־$z in B_(d(y,A)/3) (y)$ ולכן \
  $z in B_(d(x,B)/3) (x) inter B_(d(y, A)/3) (y)$.\
  אז
  $ d(x,y) <= d(x,z)+d(y,z) < d(x,B)/3 + d(y,A)/3 $
  ומהגדרת האינפימום $d(x,y) >= d(x,B), d(y,A)$.\
  היות ואם $r>=s$ ו־$r>=t$ אזי $r>=(s+t)/2$ ונקבל $ (d(x,B)+d(y,A))/2 <= d(x,y) < (d(x,B)+d(y,A))/3 $
  אלו מספרים חיוביים ולכן זאת כמובן סתירה ולכן $U inter V = emptyset$ והן מפרידות.
]
#end_of_lecture("7 – 28/04")
אקסיומות ההפרדה ‐ דוגמאות נוספות

== הלמה של אוריסון
#theorem[הלמה של אוריסון][
  יהי $X$ מרחב טופולוגי נורמלי ויהיו $C,D subset.eq X$ סגורות זרות. אז קיימת $f:X arrow [0,1]$ רציפה כך ש־$f|_D = 1, f|_C = 0$.
]
#proof[
  נרצה להשתמש בתכונה השקולה לנורמליות: $X$ נורמלי אם ורק אם לכל $U subset.eq X$ פתוחה ו־$A subset.eq X$ סגורה כך ש־$A subset.eq U$ יש קבוצה פתוחה $W subset.eq X$ וקבוצה סגורה $Z subset.eq X$ כך ש־$A subset.eq W subset.eq Z subset.eq U$ (בעבר ניסחנו את זה עם $Z=closure(W)$ אבל הניסוח הזה שקול).\
  מעכשיו, קבוצות המסומנות ב־$V_i$ תהיינה פתוחות ב־$X$ ו־$C_i$ תהיינה סגורות ב־$X$.
]
#end_of_lecture("8 – 04/05")
#end_of_lecture("9 – 05/05")

== אקסיומת המנייה
== משפט המטריזציה של אוריסון
#definition[מרחב מטריזבילי][
  מרחב טופולוגי $X$ נקרא *מטריזבילי* אם קיימת מטריקה על $X$ שמשרה את הטופולוגיה הנתונה.
]
#remark[
  אם $X$ מרחב טופולוגי מטריזבילי אז גם כל תת־מרחב מושרה שלו הוא גם מטריזבילי.
]
#remark[
  כל מרחב מטריזבילי הוא $T_6$ כי לכל $C!=emptyset$ סגורה הפונקציה $x mapsto min(1, d(x,C))$ היא רציפה ומקבלת $0$ בידיוק כאשר $x in C$.
]
#lemma[
  אם $X$ רגולרי ומקיים את אקסיומת המנייה השנייה אז הוא נורמלי.
]
#proof[
  יהי $cal(B)$ בסיס בן־מנייה ל־$X$ ותהיינה $C,D subset.eq X$ סגורות זרות.\
  לכל $x in C$ יש קבוצה בסיסית $U_x in cal(B)$ כך ש־$x in U_x subset.eq D^c$ ומרגולריות יש $W_x in cal(B)$ כך שמתקיים $x in W_x subset.eq closure(W_x) subset.eq U_x$.\
  הקבוצה ${W_x}_(x in X) subset.eq cal(B)$ בת־מנייה ולכן יש נקודות ${x_n}_(n=1)^infinity$ כך ש־${W_x}_(x in X) = {W_(x_n)}_(n=1)^infinity$.\
  באופן דומה נוכל לבחור ${V_(y_n)}_(n=1)^infinity subset.eq cal(B)$ כך שלכל $y in D$ יש $n$ עבורו $y in V_(y_n) subset.eq closure(V_(y_n)) subset.eq C^c$.\
  מתקיים אם כך
  $ C subset.eq union.big_(n=1)^infinity W_(x_n) wide D subset.eq union.big_(n=1)^infinity V_(y_n) $
  וכן
  $ union.big_(n=1)^infinity closure(W_(x_n)) inter D = emptyset = union.big_(n=1)^infinity closure(V_(y_n)) inter C $
  לכל $k in NN$ נגדיר
  $
    S_k = W_(x_k) without union.big_(n=1)^k closure(V_(y_n)) subset.eq W_(x_k) \
    T_ell = V_(y_ell) without union.big_(n=1)^ell closure(W_(x_n)) subset.eq V_(y_ell)
  $
  אלו קבוצות פתוחות כי הן מתקבלות מהפרש של קבוצה סגורה מקבוצה פתוחה ולכן גם $U = union.big_(k=1)^infinity S_k, space V = union.big_(ell=1)^infinity T_ell$ פתוחות.\
  מהיות $C subset.eq union.big_(n in NN) W_(x_n)$ וזרה ל־$union.big_(n in NN) closure(V_(y_n))$ מתקיים $C subset.eq U$ ובאופן דומה גם $D subset.eq V$.\
  אילו $U,V$ לא היו זרות בפרט היו קיימים בלי הגבלת הכלליות $k<=ell in NN$ כך ש־$S_k, T_ell$ לא זרות אבל $S_k subset.eq W_(x_k) subset.eq closure(W_(x_k))$ ומהגדרת $T_ell$ הוא זר ל־$closure(W_(x_k))$, בסתירה.
]

#theorem[
  יהי $X$ מרחב טופולוגי המקיים את $T_4$ ואת אקסיומת המנייה השנייה.\
  אז $X$ ניתן לשיכון בתוך $[0,1]^p$ עם טופולוגיית המכפלה כאשר $P$ היא קבוצה בת־מנייה.\
  ניתן לשיכון קרי קיימת $F:X arrow [0,1]^P$ שהיא הומיאומורפיזם מ־$X$ ל־$F(X)$.
]

#proof[]
#theorem[משפט המטרזביליות של אוריסון][

]

= קשירות
== מבוא
#definition[מרחב קשיר][
  מרחב טופולוגי $X$ נקרא קשיר אם *לא* ניתן לכתוב $X= U union V$ עם $U,V$ פתוחות, זרות ולא ריקות.\
  תת־קבוצה $Y subset.eq X$ נקראת קשירה אם היא מהווה תת־מרחב קשיר בטופולוגיה המושרית.
]

#example[מרחבים לא קשירים][
  + כל מרחב מהצורה $[a,b] union [c,d]$ לכל $a<b<c<d in RR$ הוא לא קשיר ב־$RR$ (זה נכון גם לקטעים פתוחים)
  + $QQ$ בטופולוגיה הסטנדרטית אינו קשיר ב־$RR$ כי $QQ=(-infinity, sqrt(2)) union (sqrt(2), infinity)$
  + מרחב המטריצות ההפיכות $GL_n (RR)$ בטופולוגיה המושרית מ־$RR^(n^2)$ אינו קשיר (כי ניתן להציג אותו כאיחוד זר של אוסף המטריצות המקיימות $det < 0$ ואוסף המטריצות המקיימות $det > 0$ ואלו קבוצות פתוחות בטופולוגיה הסטנדרטית על $GL_n (RR)$ כי פונקציית הדטרמיננטה היא פולינומאלית ולכן רציפה ומכן שהתמונה ההפוכה של הפתוחות $RR_(<=0)$ ו־$RR_(>=0)$ תחת $det$ פתוחה גם היא)
]

#remark[
  באופן שקול ניתן להגדיר מרחב טופולוגי $X$ כקשיר אם לא קיימת הצגה מהצורה $X=C union D$ עבור $C,D$ סגורות, זרות ולא ריקות.\
  כי אם $X$ קשיר אז קיימות $U,V$ פתוחות, זרות ולא ריקות המקיימות $X=U union V$ ולכן $emptyset = V^c inter U^c$.\
  אבל להגיד ש־$emptyset = U inter V$ זה שקול ללהגיד ש־$X=V^c union U^c$.\
  אבל אם $U,V$ פתוחות אזי $V^c, U^c$ סגורות ולכן $emptyset != U,V$ אם ורק אם $emptyset != V^c, U^c$.
]
#lemma[
  אם $X = U union V$ ו־$y subset.eq X$ קשירה אז $Y subset.eq U$ או $Y subset.eq V$.
]

#proof[
  מכך ש־$Y subset.eq = U union V$ אזי $Y = (Y inter U) union (Y inter V)$ כשהאיחוד הוא איחוד של פתוחות וזרות ולכן אחת מהן ריקה.
]

#lemma[
  אם $X$ קשיר ו־$F:X arrow Y$ רציפה ועל אז גם $Y$ קשיר (במילים אחרות – תמונה של מרחב קשיר היא קשירה).
]<image_of_connected_domain_over_surjective_continuous_function_is_connected>

#proof[
  נניח שלא, ולכן $Y = U union V$ פתוחות, זרות ולא ריקות ואז $X=f^(-1)(U) union f^(-1)(V)$ פתוחות וזרות (כי $f$ רציפה) ולא ריקות (כי $f$ על) וזאת סתירה.
]

#corollary[
  אם $f:X arrow Y$ רציפה ו־$A subset.eq X$ קשירה אזי $f(A) subset.eq Y$ קשירה.
]
#proof[
  כי $f|_A : A arrow f(A)$ היא רציפה ועל ומהלמה הקודמת המסקנה נובעת.
]

#definition[קטע][
  קבוצה $I subset.eq RR$ היא קטע אם ורק אם לכל $a < b in I$ ו־$a<c<b$ גם $c in I$.
]

#proposition[
  $A subset.eq RR$ קשירה אם ורק אם $A$ היא קטע.
]

#proof[
  $<==$ נניח ש־$A$ קשירה ונראה שזה קטע.\
  אם $A$ לא קטע אזי יש $a<b in A$ ו־$a<c<b$ עם $c in.not A$ ואז $A = [A inter (-infinity, c)] union [A inter (c, infinity)]$ שהן פתוחות, זרות ולא ריקות כי $a in A inter (-infinity, c)$ וגם \
  $b in A inter (c, infinity)$ כלומר $A$ לא קשירה וזאת סתירה.\
  $==>$ נניח ש־$A$ קטע ונראה שהיא קשירה.\
  נניח ראשית ש־$A=[a,b]$ אזי אם $A = U union V$ עבור $U,V$ פתוחות זרות ו־$a in U$ ונראה ש־$V=emptyset$.\
  נגדיר $ S colon.eq {a<=x<=b bar [a,x] subset.eq U} \
  m = a<= sup S <= b $
  מתקיים $a<m$ כי אם לא אז $U={a}$ בסתירה לפתיחותה.\
  כמו־כן, $m in.not U$ כי אם $m in U$ כדי לשמור על $U$ פתוחה בהכרח $m=b$ ואז $V=emptyset$ בסתירה לקשירות ולכן בהכרח $m in V$.\
  אבל מהגדרת $m$ נובע שבכל סביבה של $m in V$ קיים משמאל איבר שאינו ב־$V$ בסתירה לפתיחות $V$ ולכן בהכרח קטע מהצורה $[a,b]$ הוא קשיר.\
  עבור $A$ קטע כללי אם בשלילה $A= U union V$ פתוחות, זרות ולא ריקות אז נבחר בלי הגבלת הכלליות $U in.rev a < b in V$ אבל אז $[a,b] = (U inter [a,b]) union (V inter [a,b])$.
]

#theorem[משפט ערך הביניים][
  אם $X$ קשירה ו־$f:X arrow RR$ רציפה אזי לכל $x,y in X$ כך ש־$f(x)<f(y)$  ולכל $f(x) < t < f(y)$ יש $z in X$ כך ש־$f(z)=t$.
]

#proof[
  במילים אחרות תמונה של פונקציה רציפה על תחום קשיר היא קטע וב־$RR$ קבוצה קשירה היא מילה נרדפת לקטע.
]

#lemma[תנאים שגוררים קשירות][
  + אם $A subset.eq X$ קשירה אז $closure(A) subset.eq X$ קשירה
  + אם ${Y_alpha}_(alpha in I) subset.eq X$ אוסף של קבוצות קשירות ויש $beta$ עם $Y_beta inter Y_alpha != emptyset$ לכל $alpha$ אז $union.big_(alpha in I) Y_alpha$ קשירה
  + $X_alpha$ קשיר לכל $alpha$ אם ורק אם $product Y_alpha$ קשירה (בטופולוגיית המכפלה ולא טופולוגיית הקופסה)
]<conditions_that_implies_connected>
#proof[
  במהלך ההוכחה נשתמש בכך שאם $X$ מרחב קשיר אז כל פונקציה רציפה $X arrow {0,1}$ היא קבועה.\
  + ניקח $f: closure(A) arrow {0,1}$ רציפה אזי $f|_A : A arrow (0,1)$ היא פונקציה רציפה ובלי הגבלת הכלליות $f|_A eq.triple 0$\
    אזי $f^(-1)(0) subset.eq closure(A)$ סגורה (תמונה של סגורה) וכוללת את $A$ ולכן זה $closure(A)$ ו־$f$ קבועה.
  + תהיי $g: union.big_(alpha in I) U_alpha arrow {0,1}$ רציפה ובלי הגבת־הכלליות $g|_(Y_alpha) eq.triple 0$ לכל $alpha in I$  ולכן $g|_(Y_alpha) : Y_alpha arrow {0,1}$ קבועה אבל לכל $Y_alpha inter Y_beta != emptyset$ מקבלת $0$ ולכן היא אפסה על הכל ו־$g eq.triple 0$ וקבועה
  + $==>$ נובע ישירות מ@image_of_connected_domain_over_surjective_continuous_function_is_connected עם $pi_alpha : product X_alpha arrow X_alpha$ רציפה ועל.\
    $<==$ צריך להראות בשלבים.\
    נניח ש־$X,Y!=emptyset$ קשירות ונראה שגם $X times Y$ קשיר.\
    נכתוב את $X times Y$ בתור $({x} times Y) union.big_(z in Y) X times {z}$ ו־${x} times Y tilde.equiv Y$ קשירה ו־$X times {z} tilde.equiv X$ קשירה ומ־$(2)$ האיחוד הוא קשיר.\
    באינדוקציה על $n$, $product_(i=1)^n Y_i$ קשירה שהכופלים קשירים.\
    עבור מכפלה כללית $P = product_(alpha in I) X_alpha$ ניקח $y = (y_alpha)_(alpha in I) in P$ מאקסיומת הבחירה.\
    לכל $J subset.eq I$ סופית נגדיר $X_J = product_(alpha in J) X_alpha times product_(alpha in I) {y_alpha} subset.eq P$ קשיר כי מכפלה סופית וכולם נחתכים ב־$y$ ולכן $union.big_J X_J subset.eq P$ קשירה.
    #todo עדיף להשלים מסודר מהסיכום של תמי
]

#end_of_lecture("10 – 11/05")

#corollary[
  אם $X tilde.equiv Y$ אז אם $X$ קשיר גם $Y$ קשיר.
]

#proof[
  יש לנו הומיאומורפיזם $f:X arrow Y$ (ובכיוון ההפוך $f^(-1) : Y arrow X$) וזו כמובן פונקציה שהיא על ולכן מ@image_of_connected_domain_over_surjective_continuous_function_is_connected הטענה נובעת.
]

#definition[רכיב קשירות][
  יהי $X$ מרחב טופולוגי ו־$y in X$ אזי רכיב הקשירות של $y$ מוגדר להיות $display(
    C_y colon.eq
    union.big_(y in A subset.eq X \
    "קשירה" A) A supset.eq {y}
  )$.
]

#proposition[תכונות רכיבי הקשירות][
  + רכיבי הקשירות הם קשירים וסגורים
  + לכל $y, z in X$ מתקיים או $C_y = C_z$ או $C_y inter C_z = emptyset$
  + רכיבי קשירות מייצרים יחס שקילות על $X$ (להיות באותו רכיב קשירות)
]

#proof[
  + נובע מ־2 ו־1 ב@conditions_that_implies_connected בהתאמה
  + אם $C_y inter C_z != emptyset$ אזי מ@conditions_that_implies_connected נובע ש־$C_y union C_z$ קשירה ואז $C_y = C_y union C-z = C_z$ ואם יש $A subset.eq X$ קשירה עם $y,z in A$ אזי $C_y inter C_z != emptyset$ כי $A in C_y inter C_z$.
]

#example[
  + $X$ קשיר ולכן $C_y = X$ לכל $y in X$
  + $X=QQ$ ולכן לכל $y in QQ$ מתקיים $C_y = {y}$ שכן $QQ$ לא מכיל אף קטע שאינו יחידון (נקרא *בלתי קשיר לחלוטין*)
  + ראינו ש־$GL_2 (RR)$ מרחב לא קשיר אבל $GL_2^plus (RR), GL_2^minus (RR)$ הם רכיבי קשירות
]

== קשירות מקומית
#definition[קשירות מקומית][
  מרחב טופולוגי $X$ נקרא *קשיר מקומית* ב־$y in X$ אם לכל סביבה $y in E$ יש $y in U subset.eq E$ פתוחה וקשירה.\
  נגיד ש־$X$ *קשיר מקומית* אם היא קשירה מקומית בכל $y in X$.
]

#example[
  + $X$ דיסקרטי הוא כזה ולא קשיר אם $abs(X)>=2$ כי אם ניקח את $U = {y}$ וקיבלנו קשירות מקומית.
  + $RR$ קשיר מקומית כי כל פתוחה מכילה קטע
  + $QQ$ לא קשיר מקומית באף $y in QQ$ (אין סביבה קשירה סביב אף $y in QQ$)
]

#remark[
  בוודאי שקשיר מקומית לא גורר קשירות אבל גם הכיוון השני לא נכון.
  נגדיר את $X$ להיות מרחב המסרק
  $
    X colon.eq ([0,1] times {0}) union ({0} times [0,1]) union (union.big_(n in NN) {1/n} times [0,1])
  $
  ו־$X$ קשיר מ@conditions_that_implies_connected.\
  מצד שני, לכל $t>0$ נסתכל על $y=(0,t)$ ועבור $epsilon < t/(1-t)$ וניקח סביבה
  $ [0,epsilon] times (t-epsilon, t+epsilon) inter X $
  #todo
  דורש הרחבה.
]

#end_of_lecture("11 – 12/05")

== קשירות מסילתית
כל פרק 8 אצל גלעד בסיכום ועוד קצת:

#theorem[
  אם $X$ קשיר מסילתית וגם $F:X arrow Y$ רציפה ועל אז גם $Y$ קשיר מסילתית.
]
#proof[
  מהגדרה, לכל מסילה $gamma:[0,1] arrow X$ ההרכבה $f compose gamma [0,1] arrow Y$ מסילה.\
  יהיו $y, z in Y$ ומכך ש־$f$ על יש $x, w in X$ כך ש־$f(w)=z, f(x)=y$ ואם $gamma$ מסילה ב־$X$ מ־$x$ ל־$w$ אז $f compose gamma$ מסילה ב־$y$ ל־$z$.
]

#proposition[
  $X_alpha != emptyset$ מרחבים טופולוגים לכל $alpha$ אזי $P = product X_alpha$ קשירה מסילתית אם ורק אם $X_alpha$ קשיר מסילתית לכל $alpha$.
]

#proof[
  $<==$ נובע מההטלות.\
  $==>$ יהיו $y = {y_alpha}_alpha$ ו־$z={z_alpha}_alpha$ ב־$P$.\
  לכל $alpha$, תהיי $gamma_alpha :[0,1] arrow X_alpha$ ומחברת בין $y_alpha$ ל־$z_alpha$ ולכן מוגדרת.\
  $gamma:[0,1] arrow P$ מוגדרת על־ידי $pi_alpha compose gamma = gamma_alpha$ לכל $alpha$ והיא רציפה כי $X_alpha$ רציפה לכל $alpha$.\
  קיבלנו מסילה $gamma$ ב־$P$ עם $gamma(0) = {y_alpha}_alpha = gamma_alpha (0) = y$ ובאותו אופן $gamma(1)=z$.
]

#lemma[
  אם $X$ קשיר מסילתית מקומית אזי רכיבי הקשירות המסילתית שלו פתוחים.
]

#proof[
  לכל $x$ ברכיב הקשירות המסילתית $V$ של $y$ קיימת סביבה קשירה מסילתית $U_x$ של $x$.\
  לכל $z in U_x$ מתקיים ש־$y tilde x tilde z$ ולכן $U_x subset.eq V$ ואז $V = union.big_(x in V) U_x$.
]

#corollary[
  מרחב שהוא גם קשיר וגם קשיר מסילתית מקומית גורר קשיר מסילתית.
]

#proof[
  רכיבי הקשירות המסילתית פתוחים וסגורים ואז יש אחד כזה.
]

#corollary[
  כל מרחב קשיר מסילתית מקומית הוא קשיר מקומית.
]

#example[
  עבדנו על להראת שהמברק קשיר מסילתית ולכן קשיר אבל לא קשיר מקומית ולכן לא קשיר מסילתית מקומית.
]

#end_of_lecture("12 – 18/05")

#end_of_lecture("13 – 19/05")

#end_of_lecture("14 – 25/05")

#end_of_lecture("15 – 26/05")

= קומפקטיות

#proposition[
  אם $X$ מרחב מטרי וקומפקטי סדרתית אז
  + יש מספר לבג לכל כיסוי
  + $X$ קומפקטי
]

#proof[
  + נניח שלא ואז יש כיסוי פתוח $cal(O)$ של $X$ כך שלכל $n in NN$ יש $x_n in X$ כך ש־$B_(1/n) (x_n)$ לא מוכן במלואו באף $U in cal(O)$.\
    מקומפקטיות סדרתית יש תת־סדרה ${x_n_k}_(k=1)^infinity$ ו־$y in X$ עם $x_n_k arrow y$. יש $y in V in cal(O)$ ולכן יש $delta>0$ עם $B_delta (y) subset.eq V$ וניקח $k$ מספיק גדול כך ש־$1/n_k < delta/2$ וכן $d(x_n_k, y) < delta/2$ אבל אז נקבל $B_(1/n_k) (x_n_k) subset.eq B_delta (y) subset.eq V in cal(O)$ בסתירה (כי אם $d(z, x_n_k) < 1/n_k$ אז $d(z,y)<1/n_k + delta/2 < delta$ וזאת סתירה).
  + ניקח כיסוי פתוח $cal(O)$ של $X$ ומ־$1$ יש לבג $epsilon > 0$. מכך ש־$X$ חסום לחלוטין יש ${y_i}_(i=1)^n$ כך ש־$X=union.big_(i=1)^n B_epsilon (y_i)$ ומכך ש־$epsilon$ הוא לבג של $cal(O)$ לכל $i$ יש $U_i in cal(O)$ עם $B_epsilon (y_i) subset.eq U_i$ אבל אז $X=union.big_(i=1)^n B_epsilon (y_i) subset.eq union.big_(i=1)^n U_n subset.eq X$ וקיבלנו תת־כיסוי סופי.
]

#corollary[
  המרחב $I=[0,1]$ קומפקטי.
]

#example[קומפקטיות לא גוררת קומפקטיות סדרתית][
  $X = I^I = product_(alpha in I) I$ קומפקטי מטיכונוף ונבנה סדרה ללא תת־סדרה מתכנסת: לכל $t in I$ יש פיתוח בינארי ${t_i}_(i=1)^infinity$ כך ש־$t=sum_i t_i/2^i$.\
  נגדיר $x_n in X$ בו לכל $t in I$ הקורדינאטה ה־$t$־ית היא $t_n$ ונראה של־$x_n$ אין תת־סדרה מתכנסת.\
  נניח שיש $x_n_k arrow y = {y_t}_(t in I)$ ונגדיר $s in I$ עם
  $ s_n_k = mycases(0, k mod 2 = 0, 1, k mod 2 = 1) $
  ומכך ש־$x_n_k arrow y$ נקבל $x_n_s arrow y_s$
]

#example[קומפקטיות סדרתית לא גוררת קומפקטיות][

]

#definition[קומפקטיות מקומית][מרחב טופולוגי $X$ הו קומפקטי מקומית אם לכל $y in X$ יש סביבה קומפקטית.
]

#lemma[
  אם $X$ הוא $T_2$ (האוסדורף) אז $X$ קומפקטי מקומית אם ורק אם לכל $y in X$ יש $y in U$ פתוחה עם $closure(U)$ קומפקטית.
]

#proof[
  $==>$ מיידי מהגדרה \
  $<==$ תהיי $y in U subset.eq E$ עם $U$ פתוחה ו־$E$ קומפקטית ומכך ש־$X$ הוא $T_2$ נקבל ש־$E$ סגורה ולכן $closure(U) subset.eq E$ וזו סגורה בתוך קומפקטית ולכן קומפקטית.
]

#definition[קומפקטיפיקציה][
  קומפקטיפיקציה של מרחב טופולוגי $X$ הוא מרחב טופולוגי קומפקטי $Y$ עם תת־קבוצה $tilde(X)$ שהיא צפופה והומיאמורפית ל־$X$.
]

#theorem[
  + לכל מרחב טופולוגי $X$ יש קומפקטיפיקציה $hat(X)$ עם $abs(hat(X)-X)<=1$
  + אם $X$ קומפקטי מקומית והאוסדורף אזי גם $hat(X)$ האוסדורף
]

#proof[
  נגדיר את $hat(X) = X union {infinity}$ ($infinity in.not X$) וגם $hat(T) = T union {hat(X) without C bar C subset.eq X "compact and closed"}$ ($T$ הכוונה לטופולוגיה)
  + $hat(T)$ טופולוגיה כי $emptyset in T$ וגם $hat(X) = hat(X) without emptyset in hat(T)$ ואיחוד סופי של קומפקטיות/סגורות הוא קומפקטי/סגור ולכן $inter.big_(i=1)^n (hat(X) without C_i) = hat(X) without union.big_(i=1)^n C_i in hat(T)$ וגם $union.big_(alpha in I) (X without C_alpha) = X without inter.big_(alpha in I) C_alpha$ אבל $inter.big_(alpha in I) C_alpha$ הוא סגור בתוך קומפקטי ולכן קומפקטי אז $U inter (hat(X) without C) = U without C in T$ וכן $U union (hat(X) without C) = hat(X) without (C without U)$ כאשר $C without U$ קומפקטי סגור אז אכן טופולוגיה.
]

#end_of_lecture("16 – 01/06")

= דלילות
#definition[קבוצה דלילה][
  קבוצה $A subset.eq X$ במרחב טופולוגי $X$ נקראת *דלילה* אם $X without closure(A)$ צפופה ב־$X$ (אם ורק אם $closure(A)^circle.small = emptyset$).\
  מכאן ברור ש־$A$ דלילה אם ורק אם $closure(A)$ דלילה (כי אם $A$ דלילה אז גם $B subset.eq A$ דלילה).
]

#example[
  + ${1/n}_(n=1)^infinity subset.eq RR$ דלילה כי $({1/n}_(n=1)^infinity union {0})^circle.small = emptyset$
  + $Q subset.eq RR$ לא דלילה
]

#corollary[
  מההגדרה, $Z subset.eq X$ צפופה אם ורק אם לכל $emptyset != subset.eq X$ פתוחה, $Z inter U != emptyset$.
]

#proof[
  תרגיל.
]

#definition[קבוצה מקטגוריה ראשונה ושנייה][
  מרחב טופולוגי $X$ נקרא *מקטגוריה ראשונה* אם $X = union.big_(n=1)^infinity A_n$ עם $A_n subset.eq X$ דלילה לכל $n$.\
  מרחב טופולוגי $X$ נקרא *מקטגוריה שנייה* אם הוא לא מקטגוריה ראשונה.
]

#example[
  $QQ = union.big_(q in QQ) {q}$ הוא מקטגוריה ראשונה.
]

#theorem[משפט הקטגוריה של בייר][
  יהי $X$ או מרחב מטרי שלם או קומפקטי האוסדורף. אם $A_n subset.eq X$ דלילה לכל $n$ אזי $X without (union.big_n A_n)$ צפוף ב־$X$.
]

#proof[
  בלי הגבלת הכלליות, $A_n$ סגורה לכל $n$ (כי נוכל לקחת את אוסף הסגורים שלהן) ו־$X$ נורמלי (כי הוכחנו בתרגיל שקומפקטי האוסדורף הוא נורמלי ועבור מטרי קומפקטי ו־$T_2$ גורר $T_4$, תרגיל).\
  תהיי $emptyset != U subset.eq X$ פתוחה וצריך להראות ש־$y in U without (union.big A_n)$.
]

#end_of_lecture("17 – 02/06")
