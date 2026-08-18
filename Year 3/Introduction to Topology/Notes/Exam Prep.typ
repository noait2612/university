#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: thmbox-init()
#show: article_he.with(
  title: [ הכנה למבחן --- מבוא לטופולוגיה ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 3)

= הטופולוגיה של פורסטנברג ואינסופיות הראשוניים
#theorem[
  יש אינסוף מספרים ראשוניים.
]

#proof[
  נגדיר $cal(B) = {a ZZ + b bar a,b in ZZ} subset.eq cal(P)(ZZ)$ זה בסיס ונגדיר על $ZZ$ את הטופולוגיה הנוצרת על־ידי בסיס זה.\
  אכן, $cal(B)$ כיסוי של $ZZ$ וצריך להראות את תכונת החיתוך. יהיו $A_1 = a_1 ZZ + b_1, A_2 = a_2 ZZ + b_2$ שתי סדרות חשבוניות. אם החיתוך ריק, סיימנו. אחרת יש $x in A_1 inter A_2$ ואכן $x + a_1 a_2 ZZ$ היא סדרה המקיימת את הדרוש.\
  נשים לב שגם כל סדרה חשבונית היא סגורה כי המשלימה של $a ZZ + b$ היא
  $ ZZ without (a ZZ + b) = union.big_(b_i = 1, dots.h, abs(a)-1) (a ZZ + (b + b_i)) $
  כלומר, בדיוק כל שאר השאריות האפשריות מודולו $a$. אז הסדרה המשלימה היא איחוד של $abs(a)-1$ סדרות חשבוניות כלומר איחוד סופי של פתוחות ולכן פתוחה, אז מהגדרת המשלים $a ZZ + b$ סגורה.\
  כעת, ידוע שלכל מספר שלם יש פירוק סופי לראשוניים ולכן אם $a = p_1 dot.op dots.h.c dot.op p_n$ (אולי עם חזרות) אז ברור כי $a in p_1 ZZ$ ומכאן $display(union.big_(p "is prime") p ZZ = ZZ without {plus.minus 1})$\
  (שכן ל־$plus.minus 1$ אין פירוק לראשוניים).\
  אם בשלילה היה רק מספר סופי של ראשוניים אז $ZZ without {plus.minus}$ הייתה סגורה כי היא איחוד סופי של סדרות חשבוניות של קבוצות סגורות ועל־כן סגורה ואז ${plus.minus 1}$ המשלימה שלה היא פתוחה אבל זו לא סדרה חשבונית.
]

= אפיונים שקולים לאקסיומות ההפרדה
#theorem[אפיון שקול למרחב $bold(T_1)$][
  מרחב טופולוגי $(X, tau)$ הוא מרחב $T_1$ אם ורק אם לכל $x in X$ מתקיים ש־${x} subset.eq X$ הוא תת־קבוצה סגורה של $X$.
]

#proof[
  $<==$ יהי $x in X$. לכל $y in X without {x}$ יש $U_y$ פתוחה המכילה את $y$ ולא את $x$ ולכן $X without {x} = union.big_(y in X without {x}) U_y$ זה איחוד של פתוחות ולכן פתוחה ו־${x}$ סגורה.\
  $==>$ אם כל יחידון הוא סגור אז לכל $x,y in X$ הקבוצה $X without {x}$ פתוחה ומקיימת את הנדרש.\

]

#theorem[אפיון שקול למרחב האוסדרוף $bold(T_2)$][
  מרחב טופולוגי $(X, tau)$ הוא מרחב האוסדרוף ($T_2$) אם ורק אם
  $ Delta_X = {(x,x) bar x in X} subset.eq X times X $
  הוא תת־קבוצה סגורה ב־$X times X$ ביחס לטופולוגיית המכפלה.
]

#proof[
  בכיוון הראשון נניח כי $X$ האוסדרוף. תהיי $(x,y) in Delta^c$ כלומר $x!=y$. מכך ש־$X$ האוסדרוף נובע שניתן להפריד את $x,y$ על־ידי זוג קבוצות פתוחות וזרות $U,V$ בהתאמה ומכאן $(x,y) in U times V subset.eq X times X$ ומתקיים $U times V subset.eq Delta^c$ מזרות.\
  בכיוון השני אם $Delta subset.eq X times X$ סגורה עם טופולוגיית המכפלה אזי $Delta^c$ פתוחה ולכן לכל $x != y in X$ קיימת קבוצה פתוחה $W$ כך שמתקיים $(x,y) in W$ אבל קבוצה פתוחה בטופולוגיית המכפלה היא מהצורה $W = U times V$ כאשר $U, V$ פתוחות ב־$X$ ולכן $(x,y) in U times V$ כך ש־$x in U$ ו־$y in V$ והן כמובן זרות כי אחרת אם היה $t in U inter V$ אז היה מתקיים $(t,t) in U times V$ בסתירה לכך ש־$U times V subset.eq Delta^c$.
]

#theorem[איפיון שקול למרחב רגולרי][
  מרחב טופולוגי הוא רגולרי אם ורק אם לכל $x in X$, לכל פתוחה $x in U$ קיימת פתוחה $V$ שמכילה את $x$ כך שמתקיים $x in V subset.eq closure(V) subset.eq U$.
]

#proof[
  $<==$ תהיי $V subset.eq X$ פתוחה ו־$x in V$. אז $V^c$ סגורה ולכן $V^c, {x}$ ניתנות להפרדה אז יש $W,U$ פתוחות וזרות כך ש־$x in W, V^c subset.eq U$.\
  מכיוון ש־$W subset.eq U^c$ שסגורה אז $closure(W) subset.eq U^c$ ו־$V^c subset.eq U$ ולכן $U^c subset.eq V$ וכן $closure(W) subset.eq U^c subset.eq V$.\
  $==>$ יהיו $A subset.eq X$ סגורה ו־$x in.not A$ ולכן $x in A^c$ שפתוחה ומההנחה יש $W subset.eq X$ פתוחה כך ש־$x in W subset.eq closure(W) subset.eq A^c$ ולכן $W, closure(W)^c$ זרות ומפרידות.\
]

#theorem[איפיון שקול למרחב נורמלי][
  מרחב טופולוגי הוא נורמלי אם ורק אם לכל קבוצה סגורה $A$, לכל פתוחה $U$ שמכילה
  את $A$ קיימת פתוחה $V$ שמכילה את $A$ כך שמתקיים $A subset.eq V subset.eq closure(V) subset.eq U$.
]

#proof[
  $<==$ יהיו $V subset.eq X$ פתוחה המכילה קבוצה סגורה $A$ ולכן $A,V^c$ ניתנות להפרדה ויש $U,W$ פתוחות וזרות כך ש־$A subset.eq W, V^c subset.eq U$. $U^c$ סגורה ומכילה את $W$ ומתקיים $A subset.eq W subset.eq closure(W) subset.eq U^c subset.eq V$.\
  $==>$ יהיו $A,B$ סגורות וזרות ולכן $A^c$ פתוחה שמכילה את $B$ ומההנחה יש $W subset.eq X$ פתוחה כך ש־$B subset.eq W subset.eq closure(W) subset.eq A^c$ ואז $W, closure(W)^c$ פתוחות ומפרידות את $A,B$.
]

#theorem[כל מרחב מטרי הוא $bold(T_4)$][
  כל מרחב מטרי הוא $T_4$ (בפרט, כל מרחב מטרי הוא גם $T_5$ כי תת־מרחב של מרחב מטרי הוא מרחב מטרי).
]

#proof[
  יהיו $A,B$ סגורות וזרות במרחב מטרי $X$ ונשים לב שכל יחידון הוא סגור כי ${x}={y in X bar d(y,x)<=0}$.\
  בשביל הנורמליות, לכל $x in A$ מתקיים $dist(x, B)>0$ כי אחרת $x in closure(B) =B$ בסתירה לזרות ובאופן דומה גם ל־$x in B$. לכל $a in A$ ולכל $b in B$ נגדיר $dist(a, B) colon.eq r_(a,B) > 0$ ו־$dist(b, A) colon.eq r_(b, A) > 0$ ונגדיר
  $
    A subset.eq U eq.colon union.big_(a in A) B(a, frac(r_(a,B), 2)), quad B subset.eq V eq.colon union.big_(b in B) B(a, frac(r_(b,A), 2))
  $
  מספיק שנראה ש־$U,V$ זרות ונקבל הפרדה: נניח בשלילה כי $x in U inter V$ ולכן יש $a_0 in A$ ו־$b_0 in B$ כך ש־$x in B(a_0, frac(r_(a_0, B), 2)) inter B(b_0, frac(r_(b_0, A), 2))$ ומאי־שיוויון המשולש
  $
    d(a_0, b_0)<=d(a_0, x) + d(b_0, x) < frac(d(a_0, B), 2) + frac(d(b_0, A), 2) <= frac(d(a_0, b_0), 2) + frac(d(a_0, b_0), 2) = d(a_0, b_0)
  $
]

#theorem[
  $T_4 ==> T_3 ==> T_2 ==> T_1 ==> T_0$.
]

#proof[
  כל מרחב נורמלי הוא רגולרי ולכן $T_4 ==> T_3$. אם $X$ הוא $T_3$ אז הוא $T_1$ ולכן מהטענה לעיל כל יחידון הוא סגור ולכן אם $x!=y$ אז ${x}, {y}$ סגורות וניתנות להפרדה ולכן $T_2$. $T_2 ==> T_1 ==> T_0$ נובע מהגדרה.
]

#theorem[
  אם $X$ מרחב טופולוגי המקיים את אקסיומת ההפרדה $T_i$ עבור $i in {0,1,2,3}$ אזי כל $Y subset.eq X$ עם הטופולוגיה המושרית הוא $T_i$.
]

#proof[
  נניח ש־$i in {0,1,2}$ ויהיו $x!=y in Y$. מ־$T_i$ נקבל שקיימת פתוחה $U subset.eq X$ (וגם $V subset.eq X$ פתוחה אם $i=2$) שמכילה את $x$ ולא את $y$ או להיפך, בהתאם לאקסיומה. אז $U inter Y$ (וגם $V inter Y$ אם $i=2$) פתוחה שמקיימת את התכונה הנדרשת.\
  נניח ש־$i=3$, הראנו $T_1$ ולכן נשאר להראות רגולריות: יהיו $B subset.eq Y$ סגורה ו־$x in Y without B$. אז קיימת $A subset.eq X$ סגורה כך ש־$B = A inter Y$ ו־$x in.not A$. מרגולריות $X$ יש $U,V subset.eq X$ פתוחות שמפרידות בין $x$ ל־$A$ והקבוצות $U inter Y, V inter Y subset.eq Y$ פתוחות ומפרידות בין $x$ ל־$B$.
]

#theorem[
  אם $X,Y$ מקיימים $T_i$ עבור $i in {0,1,2,3}$ אזי גם $X times Y$ מקיים $T_i$.
]

#proof[
  נניח ש־$i in {0,1,2}$ ויהיו $(x,y) != (z,w) in X times Y$ ובלי הגבלת הכלליות $x!=z$.\
  מכך ש־$X$ מקיים $T_i$ יש $U subset.eq X$ פתוחה (וגם $V subset.eq X$ פתוחה אם $i=2$) המכילה את $x$ ולא את $z$ או להיפך, בהתאם לאקסיומה. אז $U times Y subset.eq X times Y$ (וגם $V times Y$ אם $i=2$) מכילה את $(x,y)$ ולא את $(z,w)$ או להיפך, בהתאמה.\
  עבור $i=3$, יהיו $H subset.eq X times Y$ פתוחה ו־$(x,y) in H$. תהיי $U times V subset.eq H$ קבוצת הבסיס המכילה את $(x,y)$ ולכן $x in U, y in V$ ו־$X,Y$ הם $T_3$ ולכן קיימות\
  $Z subset.eq X, W subset.eq Y$ פתוחות כך שמתקיים
  $ x in Z subset.eq closure(Z) subset.eq U subset.eq X, quad y in W subset.eq closure(W) subset.eq V subset.eq Y $
  ואז
  $
    (x,y) in Z times W subset.eq closure(Z times W) subset.eq closure(Z) times closure(W) subset.eq U times V subset.eq H
  $
]

= הלמה של אוריסון
#theorem[הלמה של אוריסון][
  יהי $X$ מרחב $T_4$ אזי לכל $C,D subset.eq X$ סגורות, לא ריקות וזרות יש פונקציה רציפה $f:X arrow [0,1]$ כך שמתקיים $f|_C eq.triple 0$ ו־$f|_D eq.triple 1$.
]

#proof[
  הראינו שנורמליות שקולה לכך שלכל סגורה $A$ ולכל פתוחה $U$ המכילה את $A$ קיימת פתוחה $V$ וסגורה $Z$ שניתן לבחור אותה להיות $closure(V)$ כך שמתקיימת שרשרת ההכלות $A subset.eq V subset.eq Z subset.eq U$.\
  מכך ש־$C,D$ סגורות, זרות ולא ריקות ניתן להגדיר $V_1 colon.eq X without D$ פתוחה המכילה את $C_0 colon.eq C$ הסגורה.\
  מהאיפיון לעיל נובע שקיימות סגורה $C_frac(1, 2)$ ופתוחה $V_frac(1, 2)$ כך שמתקיים
  $ C_0 subset.eq V_frac(1, 2) subset.eq C_frac(1, 2) subset.eq V_1 $
  ובאופן אינדוקטיבי לכל $k in NN$ נקבל
  $
    C_0 subset.eq V_frac(1, 2^k) subset.eq C_frac(1, 2^k) subset.eq dots.h.c subset.eq V_frac(2^k-1, 2^k) subset.eq C_frac(2^k-1, 2^k) subset.eq V_1
  $
  כאשר $C_j$ סגורות ו־$V_j$ פתוחות. נגדיר $f:X arrow [0,1]$ על־ידי
  $ f(x) = mycases(inf_(x in V_t){t}, exists t comma space x in V_t, 1, "otherwise") $
  + $f|_D eq.triple 1$ שכן לכל $x in D$ מתקיים $x in.not X without D = V_1$ וכל $V_t subset.eq V_1$ ולכן $x in.not V_t$ לכל $t$ ומכאן $f(x)=1$
  + $f|_C eq.triple 0$ שכן $C = C_0 subset.eq V_frac(1, 2^k)$ לכל $k in NN$ ולכן זה מתקיים לכל $x in C$ ומכאן $f(x)=0$
  + בשביל הרציפות, נשים לב שהקבוצות מהצורה $[0,a)$ ו־$(b,1]$ מהוות תת־בסיס לטופולוגיה הסטנדרטית על $[0,1]$ ולכן מספיק להראות שהמקורות שלהן פתוחים ונשים לב ש־$f^(-1)((b,1])$ פתוחה אם ורק אם $f^(-1)([0,b])$ סגורה.
    + לכל $0<b<=1$ מתקיים $f^(-1)([0,b)) = union.big_(t<b) V_t$ שפתוחה ב־$X$ כי אם $x in V_t$ עבור $t<b$ אז $f(x)<t<b$ ואם $f(x)<b$ אז קיים $t<b$ כך ש־$x in V_t$.
    + לכל $0<=b<1$ מתקיים $f^(-1)([0,b]) = inter.big_(t>b) C_t$ שסגורה ב־$X$ כי אם $f(x)<=b$ אז לכל $t>b$ דיאדי יש $b<s<t$ כך ש־$x in V_s$ ואז $x in V_s subset.eq V_t subset.eq C_t$ ומצד שני אם $x in C_t$ לכל $t>b$ אז לכל $s>b$ דיאדי קיים $b<t<s$ כך ש־$x in C_t subset.eq V_s$ ולכן $f(x)<=s$.
]

+ נוכיח רציפות: הקרניים $[0,a)$ ו־$(b,1]$ מהוות תת־בסיס לטופולוגיה של $[0,1]$, ולכן מספיק להראות שהמקורות שלהן תחת $f$ פתוחים ב־$X$.

  *המקור של $[0,a)$ הוא פתוח:*
  לפי הגדרת האינפימום, $f(x) < a$ אם ורק אם קיים שבר דיאדי $t < a$ שעבורו $x in V_t$. לכן:
  $ f^(-1)([0,a)) = union.big_(t<a) V_t $
  כאיחוד של קבוצות פתוחות, הקבוצה הזו פתוחה ב־$X$.

  *המקור של $(b,1]$ הוא פתוח:*
  נראה שהמשלים שלו, כלומר $f^(-1)([0,b])$, הוא קבוצה סגורה.
  נראה שמתקיים $f^(-1)([0,b]) = inter.big_(t>b) C_t$:
  - אם $f(x) <= b$, אז לכל $t>b$ דיאדי קיים $s$ כך ש־$b < s < t$ ו־$x in V_s$. מכיוון ש־$V_s subset.eq C_t$, מתקיים $x in C_t$.
  - אם $x in C_t$ לכל $t>b$, אזי מכיוון ש־$C_t subset.eq V_s$ (עבור $s>t$), נובע ש־$x in V_s$ לכל $s>b$. לכן האינפימום קטן או שווה ל־$b$, כלומר $f(x) <= b$.
  מכיוון ש־$f^(-1)([0,b])$ היא חיתוך של קבוצות סגורות, היא קבוצה סגורה. המשלים שלה $f^(-1)((b,1])$ הוא קבוצה פתוחה.

= אקסיומות המנייה
#theorem[תנאי מנייתי למרחב נורמלי][
  מרחב טופולוגי רגולרי (או $T_3$) המקיים את אקסיומת המנייה השנייה הוא מרחב נורמלי.
]

#proof[
  נניח כי $cal(B)$ בסיס בן־מנייה לטופולוגיה על $X$ ויהיו $A,B subset.eq X$ קבוצות סגורות וזרות.\
  מהזרות נובע שלכל $a in A$, $X without B$ היא סביבה פתוחה של $a$ ומאיפיון שקול לרגולריות יש קבוצה פתוחה $U_a in cal(B)$ המקיימת $a in U_a subset.eq closure(U_a) subset.eq X without B$. יתר על־כן, ${U_a}_(a in A)$ הוא בן־מנייה (כתת־קבוצה של הבסיס), ולכן קיימת סדרה ${U_n}_(n=1)^infinity subset.eq cal(B)$ כך ש־${U_n}_(n=1)^infinity$ מהווה כיסוי פתוח של $A$ ומתקיים $closure(U_n) inter B = emptyset$.
  באותו אופן, קיימת סדרה ${V_m}_(m=1)^infinity subset.eq cal(B)$ המקיימת ש־${V_m}_(m=1)^infinity$ כיסוי פתוח של $B$ ו־$closure(V_m) inter A = emptyset$.\
  לכל $k in NN$ נגדיר $S_k = U_k without union.big_(i=1)^k closure(V_i)$ ו־$T_k = V_k without union.big_(j=1)^k closure(U_j)$ והן כמובן קבוצות פתוחות. נסמן $O=union.big_(k=1)^infinity S_k$ ו־$P=union.big_(k=1)^infinity T_k$ ואלו קבוצות פתוחות שמפרידות את $A$ ו־$B$: $A subset.eq union.big_(n=1)^infinity U_n$ וכן $A inter closure(V_m) = emptyset$ לכל $m$, ולכן $A subset.eq O$, ובאופן דומה $B subset.eq P$.\
  אילו $O, P$ לא היו זרות היו $S_k, T_m$ לא זרות עבור $k<=m$ (בלי הגבלת הכלליות) אז $S_k subset.eq U_k subset.eq closure(U_k)$ אבל מהגדרת $T_m$ הוא זר ל־$closure(U_j)$, בסתירה.
]

#theorem[
  אם $X$ מקיים את אקסיומת המנייה השנייה אזי
  + $X$ מקיים את אקסיומת המנייה הראשונה
  + $X$ ספרבילי
  + $X$ לינדלוף
]

#proof[
  ניקח בסיס $cal(B)$ בן־מנייה של $X$.
  + יהי $x in X$ ויהי $cal(B)_x subset.eq cal(B)$ אוסף כל הקבוצות הבסיסיות שמכילות את $x$. זה בסיס מקומי מתכונת הבסיס.
  + מכל $B in cal(B)$ נבחר $x_B$ ונראה שהאוסף $D colon.eq {x_B}_(B in cal(B))$ הוא צפוף: לכל $y in X$ וכל סביבה פתוחה $y in U$ יש $B in cal(B)$ קבוצה בסיסית כך ש־$y in B subset.eq U$ ולכן $U$ חותכת את $D$ ב־$x_B$ כלומר כל $y in closure(D)$ ולכן $closure(D)=X$.
  + יהי $i in I$ ו־$U_i$ כיסוי פתוח של $X$ ונסמן $cal(C) colon.eq {B in cal(B) bar exists i in I, space B subset.eq U_i}$.\
    לכל $B in cal(C)$ נבחר $i_B in I$ כך ש־$B subset.eq U_i_B$ ונגדיר את קבוצת האינדקסים $J={i_B bar B in cal(C)}$ היא בת־מנייה ונשאר להראות שכיסוי. יהי $x in X$, אז קיים $i in I$ כך ש־$x in U_i$ וקיים $B in cal(B)$ כך ש־$x in B subset.eq U$ ובפרט $B in cal(C)$ ועבור $j = i_B in J$ מתקיים $B subset.eq U_j$ ולכן $x in U_j$.
]

#theorem[
  במרחב מטרי, מנייה שנייה, ספרביליות ולינדלוף שקולים.
]
#proof[
  מהטענה לעיל ראינו שמנייה שנייה גוררת ספרביליות ולינדלוף. לכן מספיק להראות שספרביליות גוררת מנייה שנייה ושלינדלוף גורר ספרביליות.\
  ספרביליות $<==$ מנייה שנייה: תהי $D subset.eq X$ צפופה ובת־מנייה. נגדיר את האוסף הבן־מנייה $cal(B) colon.eq {B(x, 1/n) bar x in D, space n in NN}$ ונראה שהוא בסיס.\
  תהי $U subset.eq X$ פתוחה ו־$y in U$. קיים $epsilon > 0$ כך ש־$B(y,epsilon) subset.eq U$.
  נבחר $n in NN$ שעבורו $2/n < epsilon$. מצפיפות $D$, קיים $x in D$ כך ש־$d(x,y) < 1/n$.
  לכן $y in B(x, 1/n)$, ומאי־שוויון המשולש, לכל $z in B(x, 1/n)$ מתקיים:
  $ d(z,y) <= d(z,x) + d(x,y) < 1/n + 1/n = 2/n < epsilon $
  ולכן $y in B(x, 1/n) subset.eq B(y,epsilon) subset.eq U$.\
  לינדלוף $<==$ ספרביליות:
  לכל $n in NN$, האוסף $cal(U)_n colon.eq {B(x, 1/n) bar x in X}$ הוא כיסוי פתוח של $X$ ומלינדלוף קיים לו תת־כיסוי בן־מנייה.\
  נסמן ב־$D_n$ את קבוצת המרכזים של תת־הכיסוי הזה ונגדיר $D colon.eq union.big_(n in NN) D_n$ וכאיחוד בן־מנייה של בנות מנייה היא בת־מנייה.\
  נראה ש־$D$ צפופה: לכל $y in X$ ולכל $epsilon > 0$, נבחר $n in NN$ כך ש־$1/n < epsilon$.
  מכיוון שהכדורים שמרכזם ב־$D_n$ מכסים את $X$, קיים $x in D_n subset.eq D$ כך ש־$y in B(x, 1/n)$.
  כלומר $d(x,y) < 1/n < epsilon$, ולכן $D$ חותכת כל כדור סביב $y$.
]




= משפט המטריזביליות של אוריסון
#definition[מרחב טופולוגי מטריזבילי][
  מרחב טופולוגי נקרא מטריזבילי אם יש עליו מטריקה המשרה את הטופולוגיה שלו.
]

#theorem[משפט המטריזביליות של אוריסון][
  מרחב טופולוגי המקיים את אקסיומה $T_3$ ואת אקסיומת המנייה השנייה הוא מטריזבילי.
]

#proof[
  ראשית נבחין שמכיוון ש־$X$ הוא $T_3$ ומנייה שנייה מטענה שראינו נובע שהוא נורמלי ונסמן ב־$cal(B)$ את הבסיס בן־מנייה שלו.\
  נראה שבתנאים אלו $X$ הומאומורפי לתת־קבוצה $E subset.eq [0,1]^NN$ שהיא מטריזבילית כתת־מרחב מטריזבילי ומכאן $f:X arrow E$ הומאומורפיזם וכן $E$ מטריזבילי על־ידי המטריקה $d$ אזי $rho (x,y) colon.eq d(f(x), f(y))$ משרה את הטופולוגיה על $X$.
  + לכל $U,V in cal(B)$ לא ריקות המקיימות $overline(U) subset.eq V$ הקבוצות $overline(U), X without V$ סגורות וזרות ולכן מהלמה של אוריסון קיימת $f:X arrow [0,1]$ רציפה המקיימת $f|_closure(U) eq.triple 0$\
    ו־$f|_(X without V) eq.triple 1$ וזה נכון לכל זוג קבוצות ועל־כן ${f_n}_(n in NN)$ סדרת פונקציות כנ"ל בן־מנייה
  + נשים לב ש־${f_n}$ מפרידה נקודות מקבוצות סגורות כי לכל $x in X$ וקבוצה סגורה $C$ שאינה מכילה אותו, מהרגולריות קיימות קבוצות בסיסיות $U,V in cal(B)$ המקיימות $x in U subset.eq closure(U) subset.eq V subset.eq X without C$.הזוג $(U,V)$ הופיע בבנייה מהסעיף הקודם ולכן $f_n$ שהותאמה לו מקיימת $f_n (x) = 0$ (כי $x in closure(U)$) ו־$f_n|_C eq.triple 1$ (כי $C subset.eq X without V$).
  + נגדיר $F:X arrow [0,1]^NN$ על־ידי $x mapsto (f_1 (x), f_2 (x), dots.h)$ ברור שהיא רציפה כי כל קורדינאטה רציפה והיא גם חד־חד ערכית כי אם $x!=y in X$ מכך ש־$X$ הוא $T_3$ אז בפרט ${y}$ סגורה ולכן קיים $m in NN$ עבורו $f_m (x) =0$ ו־$f_m (y) = 1$ ומכאן שהקורדינאטה ה־$m$ שונה ולכן $F(x)!=F(y)$.\
    נשאר להראות שגם ההופכית רציפה. תהיי $U$ פתוחה ו־$x in U$ אז מהסעיף הקודם קיים $k_x in NN$ כך שמתקיים $f_k_x (x) = 0$ ו־$f_k_x |_(X without U) = 1$.\
    מתקיים $f^(-1)_k_x ([0,1)) subset.eq U$ ואם ניקח את $pi_i$ להיות ההטלה על הקורדינאטה ה־$i$ אזי $f_i = pi_i compose F$ כלומר $f_i^(-1) = F^(-1) compose pi_i^(-1)$ ומכאן נסיק
    $
      U = union.big_(x in U) f^(-1)_k_x ([0,1)) = union.big_(x in U) F^(-1) compose pi^(-1)_k_x([0,1)) ==> F(U) = union.big_(x in U) pi^(-1)_k_x ([0,1)) inter F(X)
    $
    אבל טופולוגיית המכפלה מוגדרת על־ידי התת־בסיס שקבוצותיו הן $pi^(-1)$ ולכן $F(U)$ פתוחה.
]

= קשירות
#claim[
  אם $X$ לא קשיר אז קיימת פונקציה רציפה ולא קבועה $f:X arrow {0,1}$ עם הטופולוגיה הדיסקרטית.
]
#theorem[
  אם $X$ קשיר ו־$f:X arrow Y$ רציפה ועל אז $Y$ קשיר.
]

#proof[
  אחרת, $Y=U union V$ עבור $U,V$ פתוחות, זרות ולא ריקות ולכן $X=f^(-1)(U) union f^(-1)(V)$ ומרציפות אלו קבוצות פתוחות ו־$f$ על אז הן לא ריקות וזרות בסתירה.
]

#corollary[
  + אם $X$ קשיר ו־$f:X arrow Y$ רציפה אז $f(X)$ קשירה.
  + אם $X tilde.equiv Y$ אז $X$ קשיר אם ורק אם $Y$ קשיר.
]

#proof[
  + $f|_A : A arrow f(X)$ רציפה ועל ומהטענה לעיל המסקנה נובעת.
  + נובע מהטענה הקודמת שכן הומיאומורפיזם מספק פונקציות רציפות ועל מ־$X$ ל־$Y$ ולהיפך.
]

#theorem[
  תת־קבוצה של $RR$ בטופולוגיה הסטנדרטית היא קשירה אם ורק אם היא קטע.
]

#proof[
  $<==$ תהיי $A subset.eq RR$ תת־קבוצה קשירה. לכל $a,b in A$ ולכל $a<c<b$ מתקיים כי $c in A$ כי אחרת $A=[(-infinity, c) inter A] union [(c, infinity) inter A]$ בסתירה לקשירות ולכן $A$ הוא קטע שקצוותיו הם $inf_(a in A) {a}, sup_(a in A) {a}$ קטע פתוח/סגור/חצי סגור.\
  $==>$ נוכיח שכל קטע מהצורה $[a,b]$ הוא קשיר; נניח בשלילה כי $[a,b] = U union V$ עבור $U,V$ פתוחות ובלי הגבלת הכלליות $a in U$.\
  נסמן $m colon.eq sup {x bar a<=x<=b, [a,x] subset.eq U}$. מתכונות הסופרמום מתקיים $a<m$ שכן אחרת $U={a}$ בסתירה לפתיחותה ו־$m in.not U$ כי אחרת בשביל לשמור על הפתיחות בהכרח $m=b$ ואז $V=emptyset$ בסתירה להגדרת הקשירות ועל־כן $m in V$ אבל מהגדרת הסופרמום נובע שבכל סביבה של $m in V$ קיים משמאל איבר שאינו\
  ב־$V$ אבל זו סתירה לפתיחות של $V$ ועל־כן $[a,b]$ קשיר.\
  בהינתן קטע כללי $I$, אם בשלילה $I=U union V$ אז נבחר $a in U$ ו־$b in V$ ואז $[a,b] = (U inter [a,b]) union (V inter [a,b])$ בסתירה.
]

#theorem[
  + אם $A subset.eq X$ קשירה אז $closure(A) subset.eq X$ קשיר
  + למת כוכב – אם ${Y_alpha}_(alpha in I)$ קשירות ב־$X$ ויש $beta in I$ כך שלכל $alpha in I$, $Y_alpha inter Y_beta !=emptyset$ אזי $union.big_(alpha in I) Y_alpha$ קשיר.
]

#proof[
  + כי אם $g:closure(A) arrow {0,1}$ רציפה ועל ומרציפות ${0,1} subset.eq g(closure(A)) subset.eq closure(g(A))$ ולכן $g(A)={0,1}$ כי בטופולוגיה הדיסקרטית כל קבוצה היא סגורה בסתירה לקשירות $X$.
  + תהיי $g:union.big_(alpha in I) Y_alpha arrow {0,1}$ רציפה. לכל $alpha in I$ מתקיים ש־$g|_Y_alpha$ רציפה וקבועה ובלי הגבלת הכלליות $g|_Y_beta eq.triple 0$ ומכיוון שלכל $alpha in I$, $Y_alpha inter Y_beta !=emptyset$ נקבל שגם $g|_Y_alpha eq.triple 0$ ולכן $g$ קבועה.
]

#theorem[
  יהי ${X_alpha}_(alpha in I)$ אוסף של מרחבים ויהי $product_(alpha in I) X_alpha$ מרחב המכפלה שלהם עם טופולוגיית המכפלה. אזי $product_(alpha in I) X_alpha$ קשירה אם ורק אם $X_alpha$ קשיר לכל $alpha in I$.
]

// #proof[
//   הכיוון הראשון נובע מכך שלכל $alpha in I$, $pi_alpha : X arrow X_alpha$ רציפה וממסקנה לעיל נובע ש־$X_alpha$ קשיר.\
//   בכיוון השני, נראה קודם למכפלה סופית: יהיו $X,Y$ מרחבים טופולוגיים לא ריקים וקשירים ויהיו $x in X, y in Y$ ונגדיר $X times Y = ({x} times Y) union union.big_(z in Y) X times {z}$.\
//   ${x} times X$ קשיר כי ${x} times Y tilde.equiv Y$ ו־$X times {z}$ קשיר לכל $z in Y$ כי $X times {z} tilde.equiv X$. כמו כן, כל הקבוצות באיחוד חותכות באופן לא ריק את ${x} times Y$ ולכן מלמת כוכב האיחוד קשיר ובאינדוקציה הטענה נובעת לכל מכפלה סופית.\
//   יהיו ${X_alpha}_(alpha in I)$ קשירים לא ריקים ונראה שגם המכפלה שלהם קשירה. ניקח $y = (y_alpha)_(alpha in I) in X$ שקיים מאקסיומת הבחירה ולכן $J subset.eq I$ סופית נגדיר
//   $ X_j = product_(alpha in J) X_alpha times product_(alpha in I without J) {y_alpha} $
//   מתקיים ש־$X_j tilde.equiv product_(alpha in J) X_alpha$ ולכן $X_j$ קשיר.\
//   מכך ש־$y in X_j$ לכל $J subset.eq I$ סופית ו־${y}=X_emptyset$ אז גם $X_emptyset inter X_j != emptyset$  ומלמת כוכב $A=union.big_(J subset.eq I \
//   abs(J)<infinity) X_j subset.eq X$ קשירה ולכן גם $closure(A) subset.eq X$ קשירה ונראה$closure(A)=X$.\
//   ניקח $U subset.eq X$ קבוצה בסיסית לא ריקה ביחס לטופולוגיית המכפלה, כלומר $U = product_(alpha in J) V_alpha times product_(alpha in I without J) X_alpha$ עבור $J subset.eq I$ סופית ו־$emptyset != V_alpha subset.eq X_alpha$ פתוחות.\
//   אז $U inter X_j = product_(alpha in J) V_alpha times product_(alpha in I without J) {y_alpha} != emptyset$ ובפרט $U inter A !=emptyset$ ולכן $closure(A)=X$.
// ]

#proof[
  הכיוון הראשון מיידי: ההטלות $pi_alpha : X arrow X_alpha$ רציפות, ותמונה רציפה של מרחב קשיר היא קשירה.\
  בכיוון השני, ראשית נוכיח למכפלה סופית: $X times Y$ קשיר כי הוא איחוד המרחבים הקשירים $(X times {y}) union ({x} times Y)$ (שהרי הם הומיאומורפיים ל־$X,Y$) הנחתכים בנקודה המשותפת $(x,y)$. באינדוקציה, הטענה נכונה לכל מכפלה סופית.\
  למכפלה כללית: נקבע נקודה $y = (y_alpha) in X$. נגדיר את $A subset.eq X$ כאוסף כל הנקודות ששונות מ־$y$ רק במספר סופי של קואורדינטות.
  כלומר, $A$ היא איחוד של תתי־מרחבים, שכל אחד מהם מתיר רק למספר סופי של קואורדינטות להשתנות (ושאר הקואורדינטות מקובעות ל־$y_alpha$).
  כל תת־מרחב כזה הומיאומורפי למכפלה סופית של מרחבים קשירים, ולכן קשיר.
  מכיוון שכל תתי־המרחבים האלו מכילים את הנקודה המשותפת $y$, מלמת הכוכב נובע ש־$A$ קשירה. מכאן שגם הסגור שלה $closure(A)$ קשיר.\
  נותר להראות ש־$closure(A) = X$ אז תהי $U$ קבוצה בסיסית פתוחה ולא ריקה בטופולוגיית המכפלה. מההגדרה, $U$ מגבילה רק סט סופי של קואורדינטות (נסמנו $J$).\
  נבנה נקודה $z in U$ כך: בקואורדינטות מתוך $J$, נבחר ערכים מתאימים מתוך $U$ (כך ש־$z in U$). בשאר הקואורדינטות, נציב $z_alpha = y_alpha$.
  מכיוון ש־$z$ שונה מ־$y$ רק בקואורדינטות שב־$J$ (שהיא קבוצה סופית), מתקיים גם $z in A$.
  לכן $U inter A != emptyset$. כלומר, $A$ צפופה, ולכן $X = closure(A)$ והוא מרחב קשיר.
]

#theorem[
  יהי $X$ מרחב טופולוגי ו־$y in X$.
  + $C_y$ קשיר
  + $C_y$ סגור
  + לכל $x in X$ מתקיים $C_x=C_y$ או $C_x inter C_y = emptyset$
]

#proof[
  + נובע ישירות מלמת כוכב
  + נובע מהיות רכיב הקשירות מקסימלי ביחס להכלה ומכך ש־$closure(C_y)$ קשירה גם כן
  + אם $C_x inter C_y != emptyset$ אז מלמת כוכב $C_x union C_y$ קשירה ולכן מהגדרת רכיב הקשירות כמקסימלי ביחס להכלה $C_x = C_x union C_y = C_y$. המקרה השני מיידי.
]

#exercise[
  אם $X$ מרחב טופולוגי קשיר ונניח ש־$2<=abs(X)<2^(aleph_0)$ אז $X$ לא מטריזבילי.
]

#proof[
  נניח בשלילה שהוא כן מטריזבילי ותהיי $d$ המטריקה המושרית. מכך ש־$abs(X)>=2$ יש $x!=y in X$ עם $d(x,y)=r>0$.\
  נגדיר $f:X arrow RR$ על־ידי $f(z)=d(z,x)$ שרציפה מרציפות המטריקה ומתקיים $f(x)=0, f(y)=r$.\
  מקשירות $X$ נובע ש־$f(X)$ קשיר אבל קבוצה קשירה ב־$RR$ אם ורק אם היא קטע ולכן עם משפט ערך הביניים $[0,r] subset.eq f(X)$.\
  אבל $[0,r]$ בעוצמת הרצף ומכיוון ש־$abs(X)<2^(aleph_0)$ אז בוודאי ש־$abs(f(X))<2^(aleph_0)$ וזאת סתירה.
]

#exercise[
  יהי $X$ מרחב $T_4$ עם $2<=abs(X)<2^(aleph_0)$ ונוכיח ש־$X$ לא קשיר.
]

#proof[
  מכיוון ש־$2<=abs(X)$ יש $x!=y in X$ ומכיוון שהוא $T_4$ הוא גם $T_1$ ולכן ${x},{y}$ סגורות וזרות.\
  מהלמה של אוריסון יש $f:X arrow [0,1]$ כך ש־$f|_{x} = 0, f|_{y} = 1$ אבל ממשפט ערך הביניים ומכך ש־$f$ רציפה נקבל ש־$f(X)=[0,1]$ בסתירה לשיקולי עוצמות.
]

#exercise[
  אם $X$ מרחב $T_3$ ו־$2<=abs(X)<=aleph_0$ אז $X$ לא קשיר.
]

#proof[
  מרחב סופי הוא תמיד לינדלוף ולכן נובע ש־$X$ הוא $T_4$ ומכיוון ש־$2<=abs(X)$ נובע שיש $x!=y in X$ ומכיוון ש־$T_4$ אז גם $T_1$ ולכן ${x}, {y}$ סגורות וזרות.\
  מהלמה של אוריסון יש $f:X arrow [0,1]$ רציפה כך ש־$f|_{x} = 0, f|_{y} = 1$ ומכך ש־$f$ רציפה ממשפט ערך הביניים נקבל ש־$f(X)=[0,1]$ בסתירה לשיקולי עוצמות.
]

= קשירות מסילתית
#theorem[
  אם $X$ קשיר מסילתית אז הוא קשיר.
]

#proof[
  יהיו $x,y in X$ ותהיי $gamma$ מסילה מ־$x$ ל־$y$ ולכן $gamma :[0,1] arrow im(gamma)$ היא רציפה ועל ועל־כן $im(gamma)$ קשירה ומכילה את $x,y$ ולכן $y in C_x$.
]

#corollary[
  רכיבי הקשירות המסילתית הם קשירים.
]

#theorem[
  אם $X$  קשיר מסילתית ו־$f:X arrow Y$ רציפה ועל אז גם $Y$ קשיר מסילתית.
]

#proof[
  לכל מסילה $gamma : [0,1] arrow X$ גם $f compose gamma : [0,1] arrow Y$ היא מסילה.\
  יהיו $y,z in Y$ ו־$f$ על ולכן יש $x,w in X$ כך ש־$f(x)=y, f(w)=z$ אז אם $gamma$ מסילה ב־$X$ מ־$x$ ל־$w$ אזי $f compose gamma$ היא מסילה ב־$Y$ מ־$y$ ל־$z$.
]

#corollary[
  אם $X$ קשיר מסילתית ו־$f:X arrow Y$ רציפה אז $f(X)$ קשירה מסילתית.
]

#theorem[
  יהי ${X_alpha}_(alpha in I)$ מרחבים טופולוגיים לא ריקים. אז $X = product_(alpha in I) X_alpha$ (עם טופולוגיית המכפלה) קשיר מסילתית אם ורק אם $X_alpha$ קשיר מסילתית לכל $alpha in I$.
]

#proof[
  $<==$ אם $X$ קשיר מסילתית אז פונקציית ההטלה $pi_alpha : X arrow X_alpha$ רציפות ולכן מהטענה לעיל $X_alpha$ קשיר מסילתית.\
  $==>$ יהיו $y = (y_alpha)_(alpha in I), z = (z_alpha)_(alpha in I) in X$.
  לכל $alpha in I$ תהיי $gamma_alpha : [0,1] arrow X_alpha$ מסילה מ־$y_alpha$ ל־$z_alpha$ ולכן $gamma: [0,1] arrow X$ המוגדרת על־ידי $gamma(t)=(gamma_alpha (t))_(alpha in I)$ רציפה כהרכבת רציפות ומתקיים $gamma(1)=z, gamma(0)=y$.
]

#theorem[
  אם $X$ קשיר מסילתית מקומית אז רכיבי הקשירות המסילתית שלו פתוחים.
]

#proof[
  יהי $y in X$ ו־$V$ רכיב הקשירות המסילתית של $y$ ויהי $x in V$.\
  מאחר ש־$X$ קשיר מסילתית מקומית קיימת $x in U_x subset.eq X$ פתוחה וקשירה מסילתית ואז לכל $z in U_x$ מתקיים $y~x~z$ ולכן $y~z$ כלומר $U_x subset.eq V$ ומכאן $V$ פתוחה.
]

#theorem[
  אם $X$ קשיר וקשיר מסילתית מקומית אז הוא קשיר מסילתית.
]

#proof[
  אחרת, יהי $V$ רכיב קשירות מסילתית ו־$U$ איחוד של שאר רכיבי הקשירות המסילתית. אז $U,V$ זרות, פתוחות ולא ריקות ו־$X = U union V$ בסתירה לקשירות $X$.
]

#corollary[
  אם $X$ קשיר מסילתית מקומית אז הוא קשיר מקומית (כי כל קבוצה קשירה מסילתית היא קשירה).
]

#theorem[
  לכל $n>1$, $RR tilde.equiv.not RR^n$.
]

#proof[
  נניח בשלילה שהם הומיאומורפים ולכן יש $f:RR^n arrow RR$ הומיאומורפיזם ונתבונן בצמצום $f|_(RR^n without {0}) : RR^n without {0} arrow RR without {f(0)}$.\
  צמצום של פונקציה רציפה הוא פונקציה רציפה ולכן אם התחום קשיר גם הטווח צריך להיות קשיר אבל $RR^n without {f(0)}$ קשיר עבור $n>1$ (כי עבור $n>1$ יש למרחב לפחות שני מימדים, מה שמאפשר תמיד לחבר כל שתי נקודות על ידי מסילת קווים ישרים שעוקפת את הנקודה החסרה, ולכן הוא קשיר מסילתית) בעוד $RR without {f(0)}$ לא קשיר (כי ב־$RR$ קבוצה היא קשירה אם ורק אם היא קטע ופה יש לנו חור).
]

#exercise[
  יהיו $X,Y$ מרחבים טופולוגיים קשירים (או קשירים מסילתית) ו־$A subset.neq X, B subset.neq Y$ ונוכיח ש־$X times Y without A times B$ קשיר (או קשיר מסילתית).
]

#proof[
  נקבע $x_0 in X without A, y_0 in Y without B$ ויהי $(x,y) in X times Y without A times B$ אזי $x in X without A$ או $y in Y without B$ ובלי הגבלת הכלליות $x in.not A$.\
  אז ${x} times Y, X times {y_0}$ קשירים (מסילתית) כי $X times {y_0} tilde.equiv X, {x} times Y tilde.equiv Y$ והם נחתכים בידיוק ב־$(x,y_0)$ ולכן מלמת כוכב $({x} times Y) union {X times {y_0}}$ קשיר (מסילתית) ומכיל את $(x,y), (x_0, y_0)$ ולכן רכיב הקשירות (מסילתית) של $(x_0, y_0)$ מכיל את $(x,y)$ ולכן יש רכיב קשירות (מסילתית) יחיד ולכן כל המרחב הוא רכיב הקשירות (מסילתית) של $(x_0, y_0)$ וקיבלנו שהמרחב קשיר (מסילתית).
]

#exercise[
  יהי $X$ מרחב טופולוגי אזי $X times X tilde.equiv.not RR$.
]

#proof[
  נניח בשלילה שכן ויהי $f:X times X arrow RR$ הומיאומורפיזם ונקבע $x_0 in X$.\
  $RR$ קשיר ולכן גם $X times X$ ולכן גם $X = pi_X (X times X)$ קשיר כתמונה של פונקציה רציפה.\
  מכאן שגם $X times X without {(x_0, x_0)} tilde.equiv RR without {f(x_0)}$ אז הראשון קשיר והשני לא קשיר וזאת סתירה.
]

= קומפקטיות
#theorem[תנאי שקול לקומפקטיות עם תכונת החיתוך הסופי][
  מרחב טופולוגי $X$ הוא קומפקטי אם ורק אם כל אוסף של קבוצות סגורות המקיים את תכונת החיתוך הסופי מקיים שגם החיתוך של האוסף כולו לא ריק.
]

#proof[
  $<==$ נניח ש־${U_a}_(a in I)$ הוא אוסף של סגורות המקיים את תכונת הכיסוי הסופי ונניח בשלילה שהחיתוך של האוסף כולו הוא ריק ולכן ${X without U_a}_(a in I)$ הוא אוסף של פתוחות ומתקיים
  $ union.big_(a in I) X without U_a = X without inter.big_(a in I) U_a = X without emptyset = X $
  כלומר זה כיסוי פתוח של $X$ ומהקומפקטיות יש תת־כיסוי סופי ולכן
  $ X = union.big_(i=1)^m X without U_i = X without inter.big_(i=1)^m U_i $
  אבל אז $inter.big_(i=1)^m U_i = emptyset$ בסתירה לכך שהוא מקיים את תכונת הכיסוי הסופי.\
  $==>$ נניח בשלילה שלא קומפקטי ויהי ${U_a}_(a in I)$ כיסוי פתוח של $X$ כלומר $X = union.big_(a in I) U_a$ ונסתכל על ${X without U_a}_(a in I)$ שהוא אוסף של סגורות המקיים את תכונת החיתוך הסופי ושהחיתוך של כל האוסף לא ריק.\
  מכאן שלכל $m$ מתקיים
  $
    union.big_(i=1)^m X without U_i = X without inter.big_(i=1)^m U_i != emptyset, quad inter.big_(i in I) X without U_a != emptyset
  $
  אבל
  $ inter.big_(a in I) X without U_a = X without union.big_(a in I) U_a = emptyset $
]

#theorem[
  אם $X$ קומפקטי ו־$f:X arrow Y$ רציפה ועל אז $Y$ קומפקטי.
]

#proof[
  יהי $Y = union.big_(alpha in I) V_alpha$ כיסוי פתוח של $Y$ ולכן $X=union.big_(alpha in I) f^(-1)(V_alpha)$ כיסוי פתוח של $X$ (מרציפות $f$). מקומפקטיות יש $J subset.eq I$ סופית כך ש־$X=union.big_(alpha in J) f^(-1)(V_alpha)$.\
  $f$ על ולכן לכל $y in Y$ יש $x in X$ כך ש־$f(x)=y$ ויש $alpha in J$ כך ש־$x in f^(-1)(V_alpha)$ ולכן $y in V_alpha$ ועל־כן $Y=union.big_(alpha in J) V_alpha$ כיסוי סופי של $Y$.
]

#corollary[תמונת פונקציה רציפה על מרחב קומפקטי היא קומפקטית][
  יהי $X$ מרחב טופולוגי קומפקטי ו־$f:X arrow Y$ רציפה אזי גם $f(X)$ קומפקטי.
]

#proof[
  כי $f|_A : A arrow f(A)$ רציפה ועל והמסקנה נובעת מהטענה לעיל.
]

#theorem[קבוצה סגורה במרחב קומפקטי היא קומפקטית][
  קבוצה  סגורה במרחב קומפקטי היא קומפקטית בטופולוגיה המושרית עליה.
]

#proof[
  יהי $A subset.eq union.big_(alpha in I) U_alpha$ כיסוי פתוח של $A$ כאשר $U_alpha$ פתוחות ב־$X$ ולכן $X=union.big_(alpha in I) U_alpha union A^c$ וזה כיסוי פתוח של $X$ ומקומופקטיות יש $J subset.eq I$ סופית כך שמתקיים $A subset.eq X = union.big_(alpha in J) U_alpha union A^c$ ולכן $A subset.eq union.big_(alpha in J) U_alpha$.
]

#theorem[קבוצה קומפקטית במרחב האוסדרוף היא סגורה][
  קבוצה קומפקטית במרחב האוסדרוף היא סגורה.
]

#proof[
  נניח ש־$A subset.eq X$ קומפקטית במרחב האוסדרוף ונראה ש־$X without A$ פתוחה.\
  תהיי $x in X without A$, מכיוון ש־$X$ האוסדרוף נובע שלכל $a in A$ קיימות פתוחות, זרות ולא ריקות $U_a, V_a$ כך ש־$a in V_a, x in U_a$ ולכאן האוסף ${V_a inter A}_(a in A)$ הוא כיסוי פתוח של $A$ ומקומפקטיות $A$ יש לו תת־כיסוי סופי ${V_a_i inter A}_(i=1)^n$.\
  נגדיר $U = inter.big_(i=1)^n U_a_i$ והיא סביבה פתוחה של $x$ כחיתוך סופי של פתוחות שמוכלת ב־$X without A$ וכל $U_i$ זרה ל־$V_i$ שמעידה על פתיחות $A^c$ ולכן $A$ סגורה.
]

#lemma[
  אם $X$ האוסדרוף אז $X$ קומפקטי מקומית אם ורק אם לכל $x in X$ יש סביבה פתוחה $U$ כך ש־$closure(U)$ קומפקטי.
]

#proof[
  הכיוון $==>$ הוא מהגדרה, בכיוון $<==$ יהי $x in X$ ויהיו $E$ סביבה קומפקטית של $x$ ו־$U$ פתוחה כך ש־$x in U subset.eq E$. מכך ש־$X$ הוא מרחב האוסדרוף נובע ש־$E$ סגורה ולכן $closure(U) subset.eq E$ ו־$closure(U)$ סגור ב־$E$ ולכן קומפקטי.
]

#exercise[
  אם $X,Y$ מרחבים טופולוגיים כאשר $Y$ קומפקטי ו־$pi_X$ ההטלה על $X$ אז $pi$ סגורה.
]

#proof[
  תהיי $C subset.eq X times Y$ סגורה ונראה ש־$X without pi(C) = pi(C)^c$ פתוחה.\
  מתקיים $x in pi(C)^c$ אם ורק אם לכל $y in Y$ מתקיים $(x,y) in.not C$ אז יהי $x_0 in pi(C)^c$ ולכן ${x_0} times Y subset.eq (X times Y) without C$.\
  לכל $y in Y$ קיימות מהגדרת טופולוגיית המכפלה וסגירות $C$ סביבות $x_0 in U_y subset.eq X, y in V_y subset.eq Y$ פתוחות כך ש־$U_y times V_y subset.eq C^c$ ולכן ${V_y}_(y in Y)$ כיסוי פתוח של $Y$ ומקומופקטיות יש לו תת־כיסוי סופי ${V_y_n}_(n=1)^N$ ונגדיר $U colon.eq inter.big_(n=1)^N U_y_n$ והיא סביבה פתוחה של $x_0$ כחיתוך סופי של פתוחות.\
  נטען ש־$U times V subset.eq C^c$ שכן אם $(x,y) in U times Y$ אז קיים $n in [N]$ כך ש־$y in V_y_n$ ו־$x in U subset.eq U_y_n$ ולכן $(x,y) in U_y_n times V_y_n subset.eq C^c$ ומכאן $U subset.eq pi_x (C)^c$.
]

#exercise[
  יהי $X$ מרחב האוסדרוף קומפקטי ו־$f:X arrow X$ רציפה, נוכיח שקיים $emptyset != C subset.eq X$ סגורה עבורה $f(C)=C$.
]

#proof[
  לכל $n in NN$ נגדיר $C_n = f^n (X)$ והיא רציפה כהרכבת רציפות ו־$X$ קומפקטית ולכן $C_n subset.eq X$ קומפקטית ומכיוון ש־$X$ האוסדרוף $C_n$ סגורה.\
  מתקיים $emptyset != C_(n+1) = f^(n+1) (X) = f(f^n (X)) subset.eq f^n (X) = C_n$ ולכן ${C_n}_(n in NN)$ הוא אוסף יורד של סגורות לא ריקות.\
  אם $F subset.eq NN$ סופית אזי ומתקיים $emptyset != C_(max F) subset.eq inter.big_(n in F) C_n$ ולכן האוסף מקיים את תכונת החיתוך הסופי ומקומפקטיות $X$ נובע $C colon.eq inter.big_(n in NN)C_n != emptyset$ קבוצה סגורה ולא ריקה, נטען ש־$f(C)=C$:\
  $subset.eq$ כי
  $
    f(C) = f(inter.big_(n in NN) C_n) subset.eq inter.big_(n in NN) f(C_n) = inter.big_(n in NN) f(f^n (X)) = inter.big_(n in NN) C_(n+1) subset.eq C
  $
  $supset.eq$ כי אם $c_0 in C$ אז $Y = f^(-1)(c_0)$ ו־$X$ האוסדרוף ולכן ${c_0}$ סגורה ומרציפות $f$, $Y$ סגורה.\
  יהי $n in NN$ אזי $c_0 in C_(n+1) = f(C_n)$ ולכן קיים $x_n in C_n$ כך ש־$f(x_n) = c_0$ ולכן $x_n in Y inter C_n$ ו־${Y inter C_n}_(n in NN)$ אוסף יורד של סגורות לא ריקות וכמקודם מקיים את תכונת החיתוך הסופי ומקומופקטיות $emptyset != inter.big_(n in NN) Y inter C_n = Y inter C$  ולכן קיים $x in Y inter C$ עבורו $f(x)=c_0$ ולכן $x in C$ כלומר $c_0 in f(C)$.
]

#exercise[
  נניח ש־$f:X arrow Y$ רציפה, פתוחה ועל ו־$Y$ האוסדרוף ו־$X$ קומפקטית מקומית. תהיי $K subset.eq Y$ קומפקטית ונוכיח שקיימת $C subset.eq X$ קומפקטית כך ש־$f(C)=K$.
]

#proof[
  יהי $x in f^(-1)(K)$ ומכך ש־$X$ קומפקטית מקומית יש פתוחה $U_x$ וקומפקטית $C_x$ כך ש־$x in U_x subset.eq C_x subset.eq X$.\
  $f$ פתוחה ולכן ${f(U_x)}_(x in f^(-1)(K))$ כיסוי פתוח של $K$ ומקומפקטיות $K$ קיים לה תת־כיסוי סופי $K subset.eq union.big_(n=1)^N f(U_x_n)$ ונגדיר $C colon.eq union.big_(n=1)^N f^(-1)(K) inter C_x_n$.\
  $C$ קומפקטית כי $Y$ האוסדרוף ו־$K$ סגורה ולכן מרציפות $f^(-1)(K) subset.eq X$ סגורה ולכן $f^(-1)(K) inter C_x_n$ סגורה ב־$C_x_n$ ומקומפקטיות של $C_x_n$ נובע ש־$C$ איחוד סופי של קומפקטיות ועל־כן קומפקטית.\
  מתקיים $C subset.eq f^(-1)(K)$ ולכן $f(C) subset.eq K$ אז צריך להראות רק את ההכלה השנייה.\
  יהי $y in K$ ולכן קיים $n in [N]$ עם $y in f(U_x_n)$ ויש $x in U_x_n$ עם $f(x)=y$ ובפרט $x in f^(-1)(K)$ ו־$x in U_x_n subset.eq C_x_n subset.eq C$ ולכן $x in f^(-1)(K) inter C_x_n$.

]

= מרחב האוסדרוף קומפקטי הוא נורמלי
#theorem[משפט האוסדרוף קומפקטי הוא נורמלי][
  אם $X$ מרחב האוסדרוף קומפקטי אז הוא נורמלי.
]

#proof[
  תהיינה $A,B subset.eq X$ סגורות וזרות.\
  מכך ש־$X$ האוסדרוף נובע שלכל $a in A, b in B$ קיימות $V_(a,b), U_(a,b)$ פתוחות וזרות עבורן $a in U_(a,b), b in V_(a,b)$.\
  לכל $b in B$ האוסף ${U_(a,b) inter A}_(a in A)$ הוא כיסוי פתוח של $A$ ומכך ש־$A$ קומפקטי נובע שיש תת־כיסוי סופי מהצורה ${U_(a_i, b) inter A}_(i=1)^n$.\
  נגדיר $tilde(U)_b = union.big_(i=1)^n U_(a_i, b) without B$ וזו קבוצה פתוחה וזרה ל־$B$ ונגדיר $tilde(V)_b = inter.big_(i=1)^n V_(a_i, b)$ והיא פתוחה כחיתוך סופי של פתוחות ויתר על־כן מכך ש־$V_(a_i, b) inter U_(a_i, b) = emptyset$ נקבל ש־$tilde(U)_b inter tilde(V)_b = emptyset$ אז הן פתוחות וזרות ומפרידות את $A$ מ־$b$.\
  אז האוסף ${tilde(V)_b inter B}_(b in B)$ מהווה כיסוי פתוח של $B$ ומקומפקטיות $B$ כקבוצה סגורה במרחב קומפקטי יש תת־כיסוי סופי ${tilde(V)_b_j inter B}_(j=1)^m$.\
  נגדיר $V = union.big_(i=1)^n tilde(V)_b_i, U = inter.big_(j=1)^m tilde(U)_b_j$ הן פתוחות, זרות ולא ריקות והן מפרידות את $A,B$ בהתאמה.
]

= מרחב האוסדרוף קומפקטי הוא מטריזבילי אם ורק אם הוא מטריזבילי מקומית
#theorem[
  $X$ מרחב האוסדרוף קומפקטי הוא מטרזיבילי אם ורק אם הוא מטריזבילי מקומית.
]

#proof[
  $<==$ אם $X$ הוא מרחב מטריזבילי, אז הוא מטריזבילי מקומית כי לכל $x in X$, אפשר פשוט לקחת את כל המרחב $X$ בתור הסביבה הפתוחה המטריזבילית שלו.\
  $==>$ נניח ש־$X$ מטריזבילי מקומית ונראה שהוא מטריזבילי.\
  מכיוון ש־$X$ קומפקטי והאוסדרוף אז הוא נורמלי ובפרט רגולרי.\
  מהמטריזביליות המקומית, לכל $x in X$ יש סביבה פתוחה $U_x in tau$ שהיא תת־מרחב מטריזבילי ומהרגולריות יש $V_x$ סביבה פתוחה המקיימת  $x in V_x subset.eq closure(V_x) subset.eq U_x$.\
  $closure(V_x)$ היא קבוצה סגורה בתוך מרחב קומפקטי ולכן קומפקטית ומטריזבילית כתת־מרחב של מרחב מטריזבילי $U_x$.\
  כל מרחב שהוא גם קומפקטי וגם מטריזבילי הוא בהכרח בעל בסיס בן־מנייה (כי המטריקה מאפשר לנו להגדיר כדורים ברדיוס $frac(1, n)$ זה כיסוי בן־מנייה ומהקומפקטיות יש לו תת־כיסוי סופי ואיחוד בן־מנייה של קבוצות סופיות הוא בן־מנייה) ולכן המרחב מקיים את אקסיומת המנייה השנייה ועל־כן ל־$closure(V_x)$ יש בסיס בן־מנייה, נסמן ב־$cal(B)_x$.\
  מכיוון ש־${V_x}_(x in X)$ הוא כיסוי פתוח של $X$, מקומפקטיות $X$ יש $x_1, dots.h, x_n$ נקודות כך ש־$X = union.big_(i=1)^n V_x_i$ וניקח $cal(B) = union.big_(i=1)^n cal(B)_x_i$ ושוב זה איחוד סופי של קבוצות בנות־מנייה ולכן $cal(B)$ בן־מנייה, נראה שהוא גם בסיס: אם $W subset.eq X$ ו־$y in W$ אז $y i V_x_i$ עבור $i in [n]$.\
  אז גם $W inter V_x_i$ פתוחה ב־$V_x_i$ ולכן יש $B in cal(B)_x_i$ ובפרט $B in cal(B)$ המקיים $y in B subset.eq W inter V_x_i subset.eq W$.\
  אז $X$ מרחב רגולרי עם בסיס בן־מנייה ולכן ממשפט המטריזציה של אוריסון הוא בהכרח מטריזבלי.
]

= משפט טיכונוף
#theorem[משפט טיכונוף][
  מכפלה כלשהי של מרחבים טופולוגיים קומפקטיים היא קומפקטית בטופולוגיית המכפלה.
]

#proof[
  נניח בשלילה שמרחב המכפלה אינו קומפקטי ולכן יש כיסוי פתוח $cal(O)$ שאין לו תת־כיסוי סופי.\
  נבנה איבר $x$ בטופולוגיית המכפלה שמקיים שכל קבוצת בסיס של טופולוגיית המכפלה שמכילה את $x$ אינה ניתנת לכיסוי על־ידי מספר סופי של איברי $cal(O)$, זאת כמובן סתירה כי מהיות $cal(O)$ כיסוי נובע שיש קבוצת בסיס $O in cal(O)$ שמכילה את $x$ ולכן $O$ היא סביבה של $x$ שמכוסה על־ידי עצמה וזו סתירה לתכונה.

  #proposition[
    יהיו $X_1, X_2$ מרחבים טופולוגיים ונניח כי $X_1$ קומפקטי ו־$cal(O)$ כיסוי פתוח של $X_1 times X_2$.\
    אזי קיימת $x_1 in X_1$ כך שלכל סביבה פתוחה $x_1 in U subset X_1$ הקבוצה $U times X_2$ אינה מכוסה סופית על־ידי $cal(O)$.
  ]

  #proof[
    נניח בשלילה שאין $x_1$ כזאת ולכן לכל $x in X_1$ קיימת סביבה פתוחה $x in U_x$ כך ש־$U_x times X_2$ מכוסה סופית על־ידי איברי $cal(O)$.\
    מכאן ש־${U_x}_(x in X_1)$ הוא כיסוי פתוח של $X_1$ ומקומפקטיות $X_1$ יש לו תת־כיסוי סופי ${U_x_i}_(i=1)^n$ ומתקיים $X_1 times X_2 = union.big_(i=1)^n U_x_i times X_2$.\
    מהנחת השלילה נובע שכל $U_x_i times X_2$ מכוסה בסופית על־ידי $cal(O)$ ולכן $X_1 times X_2$ מכוסה סופית על־ידי $cal(O)$ בסתירה להנחה שאין תת־כיסוי סופי.
  ]

  #proposition[
    יהיו $X_1,X_2$ מרחבים טופולוגיים קומפקטיים ויהי $cal(O)$ כיסוי פתוח של $X_1 times X_2$, יהיו $x_1 in X_1, x_2 in X_2$ כבטענה הקודמת עם $x_1 in U subset X_1, x_2 in V subset X_2$.\
    אז $U times V$ אינה מכוסה סופית על־ידי $cal(O)$.
  ]

  #proof[
    נניח בשלילה שאין $x_2$ כזאת ולכן לכל $y in X_2$ קיימת סביבה פתוחה $y in V_y$ וסביבה פתוחה $x_1 in U_y$ המתאימה ל־$y$ כך ש־$U_y times V_y$ מכוסה סופית על־ידי $cal(O)$ ולכן ${V_y}_(y in X_2)$ הוא כיסוי פתוח של $X_2$ ומקומפקטיות יש לו תת־כיסוי סופי ${V_y_j}_(j=1)^m$.\
    נגדיר $U = inter.big_(j=1)^m U_y_j$ ואז $U times X_2 = union.big_(j=1)^m U times V_y_j subset union.big_(j=1)^m U_y_j times V_y_j$ אבל מההנחה בשלילה נובע שכל $U_y_j times V_y_j$ מכוסה סופית על־ידי $cal(O)$ ולכן $U times X_2$ מכוסה סופית על־ידי $cal(O)$ בסתירה לטענה הקודמת.
  ]

  #corollary[משפט טיכונוף למכפלה סופית][
    מכפלה סופית של מרחבים טופולוגיים קומפקטיים היא קומפקטית בטופולוגיית המכפלה.
  ]

  #proof[
    באינדוקציה עבור $n=2$ מתקיים כי אם $cal(O)$ כיסוי פתוח של $X_1 times X_2$ כאשר שניהם קומפקטיים ובשלילה אין לו תת־כיסוי סופי אז מהטענה לעיל יש $(x_1, x_2) in X_1 times X_2$ כך שלכל סביבה פתוחה $x_1 in U subset X_1$ ו־$x_2 in V subset X_2$ הקבוצה $U times V$ אינה מכוסה סופית על־ידי $cal(O)$ בסתירה להיות $cal(O)$ כיסוי.
  ]

  #proposition[
    יהיו $X_1, X_2, X_3$ מרחבים טופולוגיים עם $X_2$ קומפקטי ו־$cal(O)$ כיסוי פתוח של המכפלה. נניח שקיים $x_1 in X_1$ כך שלכל סביבה פתוחה $x_1 in U subset X_1$ המכפלה לא מכוסה סופית על־ידי $cal(O)$. אז קיימת $x_2 in X_2$ כך שלכל סביבה פתוחה $x_1 in U subset X_1, x_2 in V subset X_2$ הקבוצה $U times V times X_3$ אינה מכוסה סופית על־ידי $cal(O)$.
  ]

  #proof[
    נניח בשלילה שאין $x_2$ כזאת ולכן לכל $y in X_2$ יש סביבה פתוחה $y in V_y$ ו־$x_1 in U_y$ כך ש־$U_y times V_y times X_3$ מכוסה סופית על־ידי $cal(O)$.\
    האוסף ${V_y}_(y in X_2)$ הוא כיסוי פתוח של $X_2$ ומקומפקטיות יש תת־כיסוי סופי ${V_y_j}_(j=1)^m$ אז נגדיר $U = inter.big_(j=1)^m U_y_j$ ומתקיים
    $
      U times X_2 times X_3 = union.big_(j=1)^m U times V_y_j times X_3 subset union.big_(j=1)^m U_y_j times V_y_j times X_3
    $
    מההנחה בשלילה נובע שכל $U_y_j times V_y_j times X_3$ מכוסה סופית על־ידי $cal(O)$ ולכן $U times X_2 times X_3$ מכוסה סופית על־ידי $cal(O)$ בסתירה לטענה הראשונה.
  ]

  #corollary[משפט טיכונוף למכפלה בת־מנייה][
    אם ${X_i}_(i in NN)$ אוסף של מרחבים טופולוגיים קומפקטיים אז $product_(i in NN) X_i$ קומפקטי בטופולוגיית המכפלה.
  ]

  #proof[
    יהי $cal(O)$ כיסוי פתוח של מרחב המכפלה ונניח בשלילה שאין לו תת־כיסוי סופי. נסמן $Y_j colon.eq product_(k<=i in NN) X_i$ ונבנה את $x colon.eq (x_1, x_2, dots.h)$ באינדוקציה.\
    $x_1$: נתבונן ב־$X_1 times Y_2$ והטענה הראשונה קובעת שיש $x_1 in X_1$ כך שלכל סביבה פתוחה $x_1 in U_1 subset X_1$ הקבוצה $U_1 times Y_2$ אינה מכוסה סופית על־ידי $cal(O)$.\
    $x_2$: נתבונן ב־$X_1 times X_2 times Y_3$ והטענה השלישית קובעת שיש $x_2 in X_2$ כך שלכל סביבה פתוחה $x_2 in U_2 subset X_2$ ולכל סביבה פתוחה $x_1 in U_1 subset X_1$ הקבוצה $U_1 times U_2 times Y_3$ אינה מכוסה סופית על־ידי $cal(O)$.\
    $x_n$: נתבונן ב־$X_1 times X_2 times dots.h.c times X_(n-1) times X_n times Y_(n+1)$ ומהנחת האינדוקציה יש $(x_1, x_2, dots.h, x_(n-1)) in X_1 times X_2 times dots.h.c times X_(n-1)$ כך שלכל אוסף סביבות פתוחות $x_i in U_i subset X_i$, הקבוצה $product_(i=1)^(n-1) U_i times Y_n$ אינה מכוסה סופית על־ידי $cal(O)$ אבל מהטענה השלישית נובע שיש $x_n in X_n$ כך שלכל סביבה פתוחה $x_n in U_n subset X_n$ הקבוצה $product_(i=1)^(n-1) U_i times X_n times Y_n$ אינה מכוסה סופית על־ידי $cal(O)$.\
    נשים לב שבטופולוגיית המכפלה סביבה של $x$ היא מהצורה $product_(i in NN) W_i$ כאשר $W_i = X_i$ לכל $i$ למעט מספר סופי של אינדקסים ונסמן ב־$N$ את האינדקס המקיים שלכל $N<n$ מתקיים $W_n = X_n$ ונקבל שהקבוצה הפתוחה $product_(i=1)^N W_i times product_(i=N+1)^infinity X_i$ לא מכוסה סופית על־ידי $cal(O)$ וזו סתירה
  ]

  #corollary[משפט טיכונוף למכפלה כללית][
    אם ${X_alpha}_(alpha in I)$ מכפלה של מרחבים קומפקטיים אז המכפלה $product_(alpha in I) X_alpha$ היא קומפקטית בטופולוגיית המכפלה.
  ]

  #proof[
    נניח את אקסיומת הבחירה השקולה למשפט הסדר הטוב ולכן קיים סדר טוב על קבוצת האינדקסים $I$ ויהי $alpha in I$.\
    נניח שלכל $beta in I$ המקיים $beta < alpha$ הגדרנו את $x_beta in X_beta$ כך שלכל סביבות פתוחות $x_beta in U_beta subset X_beta$ על כל $beta<alpha$ הקבוצה $product_(beta < alpha) U_beta times product_(alpha<=beta) X_beta$ אינה מכוסה סופית על־ידי $cal(O)$.\
    מהטענה השלישית נקבל שיש $x_alpha in X_alpha$ כך שלכל סביבה פתוחה $x_alpha in U_alpha subset X_alpha$ הקבוצה $product_(beta<alpha) U_beta times X_alpha times product_(alpha < beta) X_beta$ אינה מכוסה סופית על־ידי $cal(O)$.\
    אז $x colon.eq (x_alpha)_(alpha in I)$ מוגדר וכמו במקרה של מכפלות בנות־מנייה כל סביבבה של $x$ לא מכוסה סופית על־ידי $cal(O)$ וזאת סתירה.
  ]
]

= החבורה היסודית של המעגל איזומורפית לחבורת השלמים
#theorem[
  $pi_1 (S^1, 1) tilde.equiv ZZ$ (כלומר החבורה היסודית של המעגל איזומורפית לחבורת השלמים).
]

#proof[
  נשתמש בהעתקת הכיסוי $p: RR arrow S^1$ המוגדרת $p(s)=e^(2pi i s)$.
  נגדיר העתקה $phi.alt : ZZ arrow pi_1 (S^1, 1)$ על־ידי $phi.alt(n) = [p compose tilde(f)_n]$ כאשר $tilde(f)_n (s) = n s$ היא המסילה הישרה ב־$RR$ מ־$0$ ל־$n$.
  + הומומורפיזם: הרמת השרשור היא שרשור ההרמות. ההרמה הראשונה מסתיימת ב־$n$ ומכיוון ש־$p$ מחזורית בשלמים, ההרמה השנייה היא פשוט $tilde(f)_m$ מוזזת ב־$n$, ולכן היא מסתיימת ב־$n+m$. קיבלנו מסילה ב־$RR$ מ־$0$ ל־$n+m$. אבל $RR$ פשוט קשר (מקמירות) ולכן היא הומוטופית למסילה הישרה $tilde(f)_(n+m)$, ולכן בהטלה חזרה ל־$S^1$ נקבל
    $ phi.alt(n) * phi.alt(m) = [p compose tilde(f)_(n+m)] = phi.alt(n+m) $
  + חד־חד־ערכיות: נניח $phi.alt(n) = phi.alt(m)$. כלומר, הלולאות ב־$S^1$ הומוטופיות.  ממשפט הרמה להומוטופיות, גם ההרמות שלהן ב־$RR$ ($tilde(f)_n$ ו־$tilde(f)_m$) הומוטופיות כמסילות. אבל הומוטופיות משמרות נקודות קצה ולכן שתי ההרמות מסתיימות באותה נקודה כלומר $n=m$.
  + על: תהי $[f] in pi_1 (S^1, 1)$. מכיוון ש־$p$ העתקת כיסוי, קיימת ל־$f$ הרמה יחידה $tilde(f)$ המתחילה ב־$0$.
    בגלל ש־$f$ לולאה, $p(tilde(f)(1)) = f(1) = 1$, ולכן נקודת הסיום היא בהכרח שלם: $tilde(f)(1) = n in ZZ$.
    $RR$ קמור ולכן $tilde(f)$ הומוטופית למסילה הישרה $tilde(f)_n$. בהטלה חזרה ל־$S^1$ מקבלים בדיוק $[f] = [p compose tilde(f)_n] = phi.alt(n)$.
]

= המשפט היסודי של האלגברה
#theorem[
  לכל פולינום $p in CC[x]$ שאינו קבוע יש שורש ב־$CC$.
]

#proof[
  יהי $p(z) = z^n + a_1 z^(n-1)+ dots.h.c a_(n-1) z + a_n$, בלי הגבלת הכלליות $abs(p)>0$ פולינום ונראה שאם לא קיים שורש אז $p$ קבוע (כלומר $n=0$).\
  נגדיר לולאות $f_r : I arrow S^1 subset.eq CC$ על־ידי $f_r (s) = frac(frac(p(r e^(2pi i s)), p(r)), norm(frac(p(r e^(2pi i s)), p(r))))$ ומתקיים $f_r (0) = f_r (1) = 1$ וזו הומוטופיה בין $f_0 (s) = 1$ לבין $f_r (s)$.\
  יהי $r in CC$ גדול מספיק כך שיתקיים $max{1, sum_(i=1)^n a_i} < r$ ונתבונן במעגל ברדיוס $r$ אז לכל $z$ במעגל מתקיים עבור $t in [0,1]$
  $
    abs(t(sum_(i=1)^n a_i z^(n-i)))<= abs(sum_(i=1)^n a_i z^(n-i)) <= sum_(i=1)^n a_i r^(n-i) <= r^(n-1) sum_(i=1)^n a_i < r^(n-1) dot.op r = r^n = abs(z)^n
  $
  נגדיר $p_t (z) = z^n + t(sum_(i=1)^n a_i z^(n-i))$ עבור $t in [0,1]$ ומאי־שיוויון המשולש ומה שמצאנו לעיל נובע
  $ abs(z^n) = abs(p_t (z) - t(sum_(i=1)^n a_i z^(n-i))) <= abs(p_t (z)) + abs(t sum_(i=1)^n a_i z^(n-i)) $
  כלומר
  $ abs(p_t (z)) >= abs(z^n) - abs(t (sum_(i=1)^n a_i z^(n-i))) > 0 $
  נגדיר $g_t (s) = frac(frac(p_t (r e^(2pi i s)), p_t (r)), norm(frac(p_t (r e^(2pi i s)), p_t (r))))$  עבור $t in [0,1]$ ואז
  $
    p_0 (z) = z^n ==> g_0 (s) = e^(2pi i s n) \
    p_1 (z) = p(z) ==> g_1 (s) = f_r (s)
  $
  אז זו הומוטופיה בין הלולאה הקבועה $g_0 (s) = e^(2pi i s n)$ לבין $f_r (s)$.\
  נובע אם־כך $e^(2pi i s n) = g_0 (s) ~ f_r (s)$ וגם $f_r (s) tilde f_0 (s) = 1$ ולכן $e^(2pi i s n) ~ 1$ אבל הלולאה $e^(2pi i s n)$ מקיפה $n$ פעמים את מעגל היחידה והלולאה השנייה קבועה.\
  ראינו שהחבורה היסודית של המעגל איזומורפית ל־$ZZ$ בהתאם למספר הסיבובים סביב מעגל היחידה ולכן $n=0$.
]

= משפט נקודת השבת של בראואר – היה במועד א'
#theorem[
  יהי $DD = {z in CC bar abs(z)<=1}$ דיסק היחידה. לכל העתקה רציפה מהצורה $f:DD arrow DD$ קיימת נקודת שבת יחידה.
]

#proof[
  ראשית נראה שאם $f:DD^n arrow DD^n$ רציפה ללא נקודות שבת אז $S^(n-1)$ הוא רטרקט של $DD^n$ וזאת מכיוון שלכל $x in DD^n$ מתקיים $f(x)!=x$ והישר היחיד שעובר ב־$x$ וב־$f(x)$ חותך את $S^(n-1)$ בשתי נקודות אז נגדיר $h(x)$ להיות נקודת החיתוך הקרובה יותר ל־$x$ מאשר ל־$f(x)$. ניתן לכתוב $h(x)=x+t(x)(x-f(x))$ כאשר $t:DD^n arrow DD^n$ רציפה ולכן $h$ רציפה ($t(x)$ היא הפיתרון החיובי למשוואה $norm(x+t(x-f(x)))=1$).\
  כעת, אם ל־$g:DD^2 arrow DD^2$ אין נקודת שבת מהלמה נקבל ש־$S^1$ הוא רטרקט של $DD^2$ ולכן $i_* : pi_1 (S^1, 1) arrow pi_1 (DD^2,1)$ הוא הומומורפיזם חד־חד ערכי אבל הראשונה איזומורפית ל־$ZZ$ ומצד שני $pi_1(DD^2,1) tilde.equiv pi_1 (DD^2,0)={[e_0]}$ כי כל מסילה $gamma$ מאפס לאפס ב־$DD^2$ היא הומוטופיה $H(t,s)=s gamma(t)$ מעידה על־כך ש־$gamma~e_0$.
]

= $RR^2 tilde.equiv.not RR^3$
#corollary[
  $RR^2 tilde.equiv.not RR^3$.
]

#proof[ ראינו שאם המרחבים הומיאומורפיים אז החבורות היסודיות איזומורפיות.\
  נניח בשלילה שקיים $f:RR^2 arrow RR^3$ הומאומורפיזם ולכן $f : RR^2 without {(0,0)} arrow RR^3 without {f(0,0)}$ הומיאומורפיזם.\
  כל זוג לולאות ב־$RR^3 without {f(0,0)}$ הומוטופיות ולכן $pi(RR^3 without {f(0,0)})$ טריוויאלית (כנסג עיוות ל־$S^2$ שהוא מרחב פשוט קשר).\
  לעומת זאת, ב־$RR^2 without {(0,0)}$ הלולאה שמקיפה את הראשית אינה הומוטופית ללולאה הקבועה הוא נסג עיוות ל־$S^1$ (על־ידי $z mapsto frac(z, norm(z))$) ולכן $pi(RR^2 without {(0,0)})$ אינה טריוויאלית (שכן לכל $x_0 in RR^2$ מתקיים $ZZ tilde.equiv pi_1 (S^1) tilde.equiv pi_1 (RR^2 without {x_0})$).
]

= ניסוחים שקולים חשובים
#theorem[איפיון שקול לסגור][
  $ closure(A) = {x in X bar forall E "neighborhood of" x, E inter A !=emptyset} $
  במילים אחרות
  $ closure(A) = A union {x in X bar x "is an accumulation point of" A} $
  בפרט נובע מכך ש־$A$ סגורה אם ורק אם היא כוללת את כל נקודות ההצטברות שלה.
]

#theorem[איפיון שקול לצפיפות][
  $Z subset.eq X$ צפופה ב־$X$ אם ורק אם לכל $U subset.eq X$ פתוחה ולא ריקה מתקיים $Z inter U != emptyset$.
]

#theorem[איפיון שקול לשפה][
  יהי $x in X$, אז $x in boundary(A)$ אם ורק אם לכל סביבה $x in E$ מתקיים $E inter A != emptyset$ וגם $E inter A^c != emptyset$.
]

= דברים מהתרגולים
#exercise[
  אם $A subset.eq B subset.eq X$ כאשר $X$ מרחב טופולוגי אזי $A^circle.small subset.eq B^circle.small$ ו־$closure(A) subset.eq closure(B)$.
]

#exercise[
  יהיו $X,Y$ מרחבים טופולוגיים ותהי $p: X arrow Y$ רציפה, על וסגורה. אם $X$ נורמלי, אזי $Y$ נורמלי.
]

#proof[
  יהיו $A,B subset.eq Y$ קבוצות סגורות וזרות. מרציפות $p$, המקורות $p^(-1)(A), p^(-1)(B)$ הן קבוצות סגורות וזרות ב־$X$.\
  מנורמליות $X$, קיימות קבוצות פתוחות וזרות $U', V' subset.eq X$ המכילות אותן ונגדיר
  $ U = Y without p(X without U') quad , quad V = Y without p(X without V') $
  ברור ש־$U$ פתוחה כי $p$ סגורה ו־$X without U^prime$ סגורה ולכן התמונה שלהן תחת $p$ סגורה ומכאן $U$ פתוחה וכנ"ל $V$ ומתקיים (ובאופן אנלוגי גם ל־$V$)
  $
    y in U <==> y in.not p(X without U') <==> p^(-1)(y) inter (X without U') = emptyset <==> p^(-1)(y) subset.eq U'
  $
  מכיוון ש־$p^(-1)(A) subset.eq U'$, אז לכל $a in A$ מתקיים $p^(-1)(a) subset.eq U'$, ולכן מהתכונה לעיל $a in U$. קיבלנו $A subset.eq U$ (ובאופן דומה $B subset.eq V$).\
  נניח בשלילה שקיים $y in U inter V$ אבל אז $p^(-1)(y) subset.eq U^prime inter V^prime = emptyset$ וזאת בסתירה להיות $p$ על.
]

#exercise[
  יהיו $X,Y$ מרחבים טופולוגיים, $Y$ מרחב האוסדורף, ו־$f,g : X arrow Y$ פונקציות רציפות. אזי הקבוצה $E = {x in X bar f(x)=g(x)}$ סגורה ב־$X$.
]

#proof[
  נגדיר $h: X arrow Y times Y$ על־ידי $h(x) = (f(x), g(x))$ וזו פונקציה רציפה.\
  מכיוון ש־$Y$ האוסדרוף נובע ש־$Delta_Y$ סגורה ב־$Y times Y$ ומתקיים
  $
    x in E <==> f(x) = g(x) <==> (f(x), g(x)) in Delta_Y <==> h(x) in Delta_Y <==> x in h^(-1)(Delta_Y)
  $
  אז $E=h^(-1)(Delta_Y)$ ו־$h$ רציפה ולכן $E$ סגורה.
]

#exercise[
  נניח ש־$X,Y$ מרחבים טופולוגיים כאשר $Y$ האוסדרוף, $A subset.eq X$ צפופה ו־$f,g: X arrow Y$ רציפות כך ש־$f|_A eq.triple g|_A$ אזי $f eq.triple g$.
]

#proof[
  נגדיר $E colon.eq {x in X bar f(x)=g(x)} subset.eq X$, נראה ש־$E = X$.\
  $A subset.eq E$ אז מספיק שנראה ש־$E$ סגורה כי אז $X = closure(A) subset.eq E subset.eq X$.\
  נגדיר את הפונקציה הרציפה $h:X arrow Y times Y$ על־ידי $h(x)=(f(x), g(x))$, מתקיים
  $ h^(-1)(Delta_Y) = {x in X bar g(x)=f(x)} = E $
  אבל $Y$ האוסדרוף ולכן $Delta_Y$ סגורה ומרציפות גם $E$ סגורה.
]

#exercise[הומיאומורפיזם בחינם אין כסף][
  תהי $f: X arrow Y$ פונקציה רציפה, חד־חד־ערכית ועל. אם $X$ מרחב קומפקטי ו־$Y$ מרחב האוסדורף, אזי $f$ היא הומיאומורפיזם.
]

#proof[
  $f$ הפיכה ולכן $f^(-1)$ מוגדרת היטב, נראה ש־$f$ העתקה סגורה ונקבל הומיאומורפיזם מההגדרות השקולות שראינו.\
  אם $C subset.eq X$ סגורה ו־$X$ קומפקטי אז $C$ קומפקטית, פונקציה רציפה שולחת קבוצות קומפקטיות לקומפקטיות ולכן $f(C)$ קומפקטית ב־$Y$ אבל $Y$ האוסדרוף וקומפקטית בהאוסדרוף היא סגורה, אז $f$ העתקה סגורה.
]

#exercise[סגירות הגרף][
  תהי $f: X arrow Y$ פונקציה רציפה. אם $Y$ הוא מרחב האוסדורף, אזי גרף הפונקציה $Gamma_f = {(x, f(x)) bar x in X}$ הוא קבוצה סגורה במרחב המכפלה $X times Y$.
]<in_haoussrof_function_graph_is_closed>

#proof[
  נגדיר $h: X times Y arrow Y times Y$ על־ידי $h(x,y) = (f(x), y)$ והיא רציפה כי היא רציפה בכל קורדינאטה.\
  מכיוון ש־$Y$ מרחב האוסדורף, האלכסון שלו $Delta_Y = {(y,y) bar y in Y}$ הוא קבוצה סגורה במרחב $Y times Y$.
  מתקיים
  $ h^(-1)(Delta_Y) = {(x,y) in X times Y bar h(x,y) in Delta_Y} = {(x,y) in X times Y bar f(x) = y} $
  קיבלנו בדיוק את תנאי הגדרת הגרף, כלומר $h^(-1)(Delta_Y) = Gamma_f$. $h$ רציפה ו־$Delta_Y$ סגורה ולכן $Gamma_f$ סגורה.
]

#pagebreak()

#exercise[
  יהי $Y$ האוסדרוף קומפקטי ותהיי $f:X arrow Y$ פונקציה. $f$ רציפה אם ורק אם $Gamma_f = {(x, f(x)) bar x in X}$ סגורה.
]

#proof[
  הכיוון הראשון זה @in_haoussrof_function_graph_is_closed, בכיוון השני אם $C subset.eq Y$ סגורה אז $ f^(-1)(C) = {x in X bar f(x) in C} = pi_X (Gamma_f inter X times C) $
  אבל $Gamma_f inter X times C$ חיתוך של סגורות ולכן $f$ מושכת אחורה סגורה לסגורה כלומר רציפה.
]

#theorem[משפט בורסוק־אולם][
  תהיי $f:SS^2 arrow RR^2$ רציפה אזי קיים $x in SS^2$ עבורו $f(x)=f(-x)$.

  #theorem[טענת עזר למשפט בורסוק־אולם][
    תהיי $f:SS^2 arrow SS^1$ רציפה אזי קיים $x in SS^2$ כך ש־$s(-x)!=-s(x)$.
  ]

]

// = מיפוי משפטים לא בנאליים שהופיעו במבחנים
// מה בנאלי? טיכונוף, שקילויות לקומפקטיות במרחב מטרי, משפט המטריזביליות של אוריסון, הלמה של אוריסון.
// #set table(stroke: (_, y) => if y > 0 { (top: 0.5pt) })
// #table(
//   columns: (3fr, 1fr),
//   align: center,
//   table.header([ *משפט* ], [ *כמה פעמים הופיע* ]),
//   [ תת־קבוצה של $RR$ קשירה אם ורק אם היא קטע ], [ 1 ],
//   [ מרחב האוסדרוף קומפקטי הוא נורמלי ], [ 2 ],
//   [ למת ההרמה ], [ 1 ],
//   [ איפיון שקול לסגור – $closure(A) = {x in X bar forall E "neighborhood of" x, E inter A !=emptyset}$ ], [2],
//   [ משפט ערך הביניים ], [1],
//   [ מרחב האוסדרוף קומפקטי הוא מרטיזבילי אם ורק אם הוא ממנייה שנייה], [1],
//   [אקסיומת המנייה השנייה גוררת לינדלוף, מנייה ראשונה וספרבילי], [2],
//   [מרחב רגולרי עם אקסיומת המנייה השנייה הוא מרחב נורמלי], [1],
//   [רכיב קשירות הוא סגור], [1],
// )

= שאלות טובות ממבחנים
// #example[משפט ההמשכה של טיצה][
//   יהי $X$ מרחב טופולוגי נורמלי ותהיי $A subset.eq X$ תת־קבוצה סגורה.\
//   כל פונקציה רציפה וחסומה $f_0: A arrow RR$ ניתנת להמשכה לפונקציה רציפה $F:X arrow RR$ כך ש־$F|_A eq.triple f_0$.
// ]

// #proof[
//   כדי לפשט את ההוכחה, נוכיח  למקרה הפרטי שבו הפונקציה ממקיימת $abs(f_0(x))<=1$, וממנו אפשר להרחב לכל פונקציה רציפה חסומה כללית.\
//   נגדיר
//   $ A_1 colon.eq f_0^(-1)([-1, -frac(1, 3)]), quad B_1 colon.eq f_0^(-1)([frac(1, 3), 1]) $
//   $f_0$ רציפה ו־$[-1, -frac(1, 3)]$ ו־$[frac(1, 3), 1]$ הן קבוצות סגורות וזרות ב־$RR$ ולכן המקורות $A_1$ ו־$B_1$ הן קבוצות סגורות ב־$A$ ובפרט הן סגורות ב־$X$ ומהזרות של הקטעים נובע כי $A_1 inter B_1 = emptyset$ מהגדרת $f_0$ כפונקציה.\
//   מכך ש־$X$ נורמלי, ו־$A_1, B_1$ סגורות ב־$X$ הלמה של אוריסון מבטיחה קיום של $g_1 : X arrow [-frac(1, 3), frac(1, 3)]$ המקיימת
//   $ g_1 |_A_1 eq.triple -frac(1, 3), quad g_1 |_B_1 eq.triple frac(1, 3), quad abs(g)<=frac(1, 3) $
//   אם נגדיר $f_1 =f_0 - g_1$ אז $abs(f_1)|_A <= frac(2, 3)$.\
//   נמשיך באינדוקציה, בהינתן $f_(n-1)$ המוגדרת על $A$ נגדיר
//   $
//     A_n colon.eq f_(n-1)^(-1) ([-frac(1, 3) (frac(2, 3))^(n-1), -frac(1, 9) (frac(2, 3))^(n-1)]) \
//     B_n colon.eq f_(n-1)^(-1) ([frac(1, 9)(frac(2, 3))^(n-1), frac(1, 3) (frac(2, 3))^(n-1)])
//   $
//   ושוב מהלמה של אוריסון קיימת $g_n : X arrow RR$ המקיימת $ g_n |_A_n eq.triple -frac(1, 3)(frac(2, 3))^(n-1), quad g_n |_B_n eq.triple frac(1, 3)(frac(2, 3))^(n-1), quad abs(g_n)<= frac(1, 3)(frac(2, 3))^(n-1) $
//   נגדיר אם כך את $F = sum_(n=1)^infinity g_n (x)$ והיא מתכנסת במידה שווה ממבחן ה־$M$ של ויירשטראס, רציפה כסכום אינסופי של פונקיות רציפות ומההתכנסות במידה שווה בפרט רציפה ומהגדרה $F|_A = f$ (מהדעיכה של הטור) ו־$abs(F)<=1$.
// ]

#example[ממבחן של שאול, מועד א' 2023][
  יהי $X$ מרחב $T_4$ קשיר ולא ריק שהוא סופי או בן־מנייה. נוכיח ש־$X$ כולל נקודה אחת בלבד.
]

#proof[
  נניח שלא ככה ולכן $abs(X)>=2$ ויהיו $x!=y in X$.\
  מכך ש־$X$ הוא $T_4$ בהכרח נובע כי הוא $T_1$ ולכן ${x},{y}$ קבוצות סגורות.\
  מהלמה של אוריסון קיימת $g:X arrow [0,1]$ רציפה המקיימת $g|_{x} eq.triple 0$ ו־$g|_{y} eq.triple 1$ אבל $f$ רציפה ו־$X$ קשיר ועל־כן $f(X)$ מרחב קשיר המקיים $f(X) subset.eq [0,1]$
  ומכך ש־$X$ לכל היותר בן־מנייה נובע ש־$f(X)$ לכל היותר בן־מנייה.\
  ממשפט ערך הביניים נובע נקבל כי $f(X) = [0,1]$ אבל $[0,1]$ לא בן־מנייה וזאת סתירה.
]

#example[שאלה 5 א' מועד א' 2024][
  יהי $X$ מרחב טופולוגי $T_4$ ויהיו $C_i subset.eq X$ עבור $1<=i<=n$ סגורות וזרות בזוגות. הראו כי לכל בחירה של $a_i in RR$, $1<=i<=n$ קיימת העתקה רציפה $f:X arrow RR$ כך שלכל $i$ מתקיים $f|_C_i eq.triple a_i$.
]

#proof[
  הקבוצות זרות וסגורות ואיחוד סופי של סגורות הוא סגור אז לכל $k in [n]$ נגדיר $A_k = C_k, B_k = union.big_(n!=k) C_n$.\
  מהנורמליות עם הלמה של אוריסון נקבל $g_k |_A_k eq.triple 1$,$g_k |_B_k eq.triple 0$ ומהזרות נובע ש־$f(x)=sum_(k=1)^n a_k g_k (x)$ מקיימת את הנדרש.
]


#example[
  יהיו $X,Y$ מרחבים טופולוגיים כך ש־$Y$ הוא $T_4$ ותהיי $f:X arrow Y$ פונקציה כך שלכל פונקציה רציפה $phi : Y arrow RR$ מתקיים ש־$phi compose f$ רציפה, נוכיח ש־$f$ רציפה.
]

#proof[
  נניח בשלילה ש־$f$ לא רציפה ולכן יש $A subset.eq Y$ סגורה כך ש־$f^(-1)(A)$ לא סגורה וניקח סגורה $B subset.eq Y$ שזרה ל־$A$. כל תנאי הלמה של אוריסון מתקיימים ולכן יש $g:Y arrow [0,1]$ רציפה המקיימת $g|_A eq.triple 0, g|_B eq.triple 1$. $g$ רציפה ולכן מההנחה $g compose f$ רציפה ולכן
  $ (g compose f)^(-1)(0) = f^(-1)(g^(-1)(0)) = f^(-1)(A) $
  אבל ההרכבה רציפה ולכן $f^(-1)(A)$ סגורה.
]

#example[
  תהיי $f:X arrow Y$ העתקה רציפה בין מרחבים טופולוגיים ותהיי $f_* : pi_1 (X,x) arrow pi_1 (Y, f(x))$.\
  נפריך את שתי הטענות הבאות:
  + אם $f$ חד־חד ערכית אז $f_*$ חד־חד ערכית
  + אם $f$ על אז $f_*$ על
]

#proof[
  + נבחר $X=S^1$ ולכן $pi_1 (X, x_0) tilde.equiv ZZ$ ואת $X=RR^2$ ולכן $pi_1 (Y,y_0) = {0}$.\
    נגדיר $f:X arrow Y$ כהעתקת השיכון והיא רציפה וחד־חד ערכית (שיכנו את המעגל בתוך מעגל היחידה הסטנדרטי).\
    מצד שני, $f_* : pi_1 (X,x_0) arrow pi_1 (Y,y_0)$ כלומר $f_* : ZZ arrow {0}$ ולכן $f_* (n) = 0$ לכל $n in ZZ$ ובפרט לא חד־חד ערכית.
  + נבחר $X=[0,1]$ ולכן $pi_1 (X,x_0) = {0}$ ו־$Y=S^1$ ולכן $pi_1 (Y, y_0) tilde.equiv ZZ$.\
    נגדיר $f:X arrow Y$ על־ידי $f(t)=(cos(2pi t), sin(2pi t))$ ברור שהיא העתקה רציפה ועל.\
    מצד שני, $f_* : pi_1 (X,x_0) arrow pi_1 (Y,y_0)$ כלומר $f_* : {0} arrow ZZ$ היא אך־ורק $f_* (0) = 0$ ולכן ההעתקה לא על.
]
