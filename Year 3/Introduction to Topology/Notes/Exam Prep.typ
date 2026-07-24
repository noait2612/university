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
  בכיוון הראשון, אם כל יחידון הוא סגור אז לכל $x,y in X$ הקבוצה $X without {x}$ פתוחה ומקיימת את הנדרש.\
  בכיוון השני, יהי $x in X$. לכל $y in X without {x}$ יש $U_y$ פתוחה המכילה את $y$ ולא את $x$ ולכן $X without {x} = union.big_(y in X without {x}) U_y$ זה איחוד של פתוחות ולכן פתוחה ו־${x}$ סגורה.
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
  בכיוון הראשון, תהיי $x in X$ ותהיי $x in U$ סביבה של $x$. $U$ פתוחה ולכן $F=U^c$ היא סגורה ו־$x in.not F$ ומהרגולריות קיימות שתי קבוצות פתוחות וזרות $V,W$ כך ש־$x in V$ ו־$F subset.eq W$.\
  מתקיים $V subset.eq W^c$ כאשר $W^c$ סגורה ולכן $closure(V) subset.eq closure(X without W) = X without W$. אבל $F subset.eq W$ ולכן $X without W subset.eq X without F = U$ אז $x in V subset.eq closure(V) subset.eq U$.\
  בכיוון השני, תהיי $x in X$ ו־$F subset.eq X$ סגורה כך ש־$x in.not F$ ולכן $x in U = X without F$ שהיא פתוחה. מההנחה קיימת $V$ כך ש־$x in V subset.eq closure(V) subset.eq U$ ונסמן $W = X without closure(V)$ שפתוחה כמשלימה של סגורה וכן $F subset.eq W$ ואלו שתי פתוחות זרות ($V,W$) שמפרידות בין $x$ ל־$F$ וקיבלנו רגולריות.
]

#theorem[איפיון שקול למרחב נורמלי][
  מרחב טופולוגי הוא נורמלי אם ורק אם לכל קבוצה סגורה $A$, לכל פתוחה $U$ שמכילה
  את $A$ קיימת פתוחה $V$ שמכילה את $A$ כך שמתקיים $A subset.eq V subset.eq closure(V) subset.eq U$.
]

#proof[
  בכיוון הראשון נניח כי $X$ מרחב טופולוגי נורמלי ותהיי $A$ סגורה ו־$A subset.eq U$ פתוחה ולכן $X without U$ סגורה וזה ל־$A$. מהנחת הנורמליות, קיימות $V,W$ פתוחות וזרות שעבורן $A subset.eq V$ ו־$X without U subset.eq W$ ומכאן $ A subset.eq V subset.eq closure(V) subset.eq X without W subset.eq U $
  כאשר ההכלה השלישית נובעת מכך ש־$closure(V), W$ זרות שכן $V,W$ פתוחות וזרות (כי $X without W$סגורה וכן $V subset.eq X without W$ מהזרות ומהגדרת הסגור $closure(V) subset.eq X without W$).\
  בכיוון השני נניח את הטענה ויהיו $A,B$ סגורות וזרות. אז $A subset.eq X without B$ ו־$X without B$ פתוחה ולכן היא פתוחה שמכילה את $A$.\
  מההנחה נובע שקיימת $V$ פתוחה כך ש־$A subset.eq V subset.eq closure(V) subset.eq X without B$ אבל $B subset.eq X without closure(V)$ ולכן הקבוצות $V, X without closure(V)$ פתוחות וזרות שמפרידות את $A,B$.
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

= אקסיומות המנייה
#theorem[תנאי מנייתי למרחב נורמלי][
  מרחב טופולוגי רגולרי (או $T_3$) המקיים את אקסיומת המנייה השנייה הוא מרחב נורמלי.
]

#proof[
  נניח כי $cal(B)$ בסיס בן־מנייה לטופולוגיה על $X$ ויהיו $A,B subset.eq$ קבוצות סגורות וזרות.\
  מהזרות נובע שלכל $a in A$, $X without B$ היא סביבה פתוחה של $a$ ומאיפיון שקול לרגולריות יש קבוצה פתוחה $U_a in cal(B)$ המקיימת $a in U_a subset.eq closure(U_a) subset.eq X without B$ ויתר על־כן ${U_a}_(a in A)$ הוא בן־מנייה ולכן קיימת סדרה ${a_n}_(n=1)^infinity subset.eq A$ כך ש־${U_a_n}_(n=1)^infinity$ כיסוי פתוח של $A$ ו־$closure(U_a_n) inter B = emptyset$.
  באותו אופן קיימת סדרה ${b_m}_(m=1)^infinity subset.eq B$ המקיימת ש־${V_b_m}_(m=1)^infinity$ כיסוי פתוח של $B$ ו־$closure(V_b_m) inter A = emptyset$.\
  לכל $k in NN$ נגדיר $S_k = U_k without union.big_(i=1)^k closure(V_i)$ ו־$T_k = V_k without union.big_(j=1)^k closure(U_j)$ והן כמובן קבוצות פתוחות. נסמן $P=union.big_(k=1)^infinity T_k$ ו־$O=union.big_(k=1)^infinity S_k$ ואלו קבוצות פתוחות שמפרידות את $A$ ו־$B$ שכן $A subset.eq union.big_(n=1)^infinity U_a_n$ וכן $A inter closure(V_b_m) = emptyset$ ולכן $A subset.eq O$ ובאופן דומה $P subset.eq P$. נשאר להראות ש־$O inter P = emptyset$ ואכן כך כי אם בשלילה היה $t in O inter P$ אז היו אינדקסים $k,m$ כך ש־$t in S_k inter T_m$ ובלי הגבלת הכלליות $k<=m$.  מכך ש־$t in S_k$ נקבל $t in U_a_k$ ומכיוון ש־$U_a_k subset.eq closure(U_a_k)$ אז $t in closure(U_a_k)$ אבל מכך ש־$t in T_m$ נובע $x in V_b_m$ וגם $t in.not closure(U_a_j)$ לכל $i in [m]$ ובפרט $t in.not closure(U_a_k)$ וזאת סתירה.
]

#theorem[
  אם $X$ מקיים את אקסיומת המנייה השנייה אזי
  + $X$ מקיים את אקסיומת המנייה הראשונה
  + $X$ ספרבילי
  + $X$ לינדלוף
]

#proof[
  ניקח בסיס $cal(B)$ בן־מנייה של $X$.
  + יהי $x in X$ ויהי $cal(B)_x subset.eq cal(B)$ אוסף כל הקבוצות הבסיסיות שמכילות את $x$. זה בסיס מקומי מתכונת ה בסיס.
  + מכל $B in cal(B)$ נבחר $x_B$ ונראה שהאוסף $D colon.eq {x_B}_(B in cal(B))$ הוא צפוף: לכל $y in X$ וכל סביבה פתוחה $y in U$ יש $B in cal(B)$ קבוצה בסיסית כך ש־$y in B subset.eq U$ ולכן $U$ חותכת את $D$ ב־$x_B$ כלומר כל $y in closure(D)$ ולכן $closure(D)=X$.
  + יהי $i in I$ ו־$U_i$ כיסוי פתוח של $X$ ונסמן $cal(C) colon.eq {B in cal(B) bar exists i in I, space B subset.eq U_i}$.\
    לכל $B in cal(C)$ נבחר $i_B in I$ כך ש־$B subset.eq U_i_B$ ונגדיר את קבוצת האינדקסים $J={i_B bar B in cal(C)}$ היא בת־מנייה ונשאר להראות שכיסוי. יהי $x in X$, אז קיים $i in I$ כך ש־$x in U_i$ וקיים $B in cal(B)$ כך ש־$x in B subset.eq U$ ובפרט $B in cal(C)$ ועבור $j = i_B in J$ מתקיים $B subset.eq U_j$ ולכן $x in U_j$.
]

#theorem[
  במרחב מטרי, מנייה שנייה, ספרביליות ולינדלוף שקולים.
]

#proof[
  מהטענה לעיל מספיק להראות שספרביליות גורר שיש בסיס בן־מנייה ושגם לינדלוף גורר שיש בסיס בן־מנייה.\
  בשביל הראשון, תהיי $D subset.eq X$ צפופה ובת־מנייה. נגדיר $cal(B) colon.eq {B(x,q) bar x in D, space q in QQ_plus}$ והוא בן־מנייה, צריך להראות שבסיס.\
  תהיי $U subset.eq X$ פתוחה ו־$y in U$. מהגדרת הטופולוגיה, קיים $epsilon > 0$ עבורו $B(y,epsilon) subset.eq U$ ומצפיפות קיים $x in D inter B(y, frac(epsilon, 4))$. נבחר רציונלי $frac(epsilon, 4) < q< frac(epsilon, 2)$ ברור כי $B(x,q) in cal(B)$ ומתקיים גם $y in B(x,q) subset.eq B(y,epsilon)$ ואם $z in B(x,q)$ אז מאי־שיוויון המשולש
  $ d(y,z) <= d(z,x) + d(x,y) < q + frac(epsilon, 4) < epsilon $
  בשביל השני. נסכל על $U_n colon.eq {B(x, frac(1, n)) bar x in X}$ וזה כיסוי פתוח של $X$ ומהיותו לינדלוף קיים לו תת־כיסוי בן־מנייה $U_n^prime$ אז נגדיר $cal(B) colon.eq union.big_(n in NN) U_n^prime$.\
  זה אוסף בן־מנייה של פתוחות. תהיי $U subset.eq X$ פתוחה ו־$y in U$, אז מהגדרת הטופולוגיה יש $epsilon > 0$ כך ש־$B(y,epsilon) subset.eq U$. יהי $n in NN$ שעבורו $frac(1, n) < frac(epsilon, 2)$ ומכיוון ש־$U_n^prime$ כיסוי קיים $B(x, frac(1, n))$ כך ש־$y in B(x, frac(1, n))$ ומאי־שיוויון המשולש נקבל $y in B(x, frac(1, n)) subset.eq B(y,epsilon)$ שכן עבור $z in B(x, frac(1, n))$ מתקיים
  $ d(z,y) <= d(z,x) + d(x,y) < frac(2, n) < epsilon $
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
  ושוב מהאיפיון קיימות סגורות $C_frac(1, 4), C_frac(3, 4)$ ופתוחות $V_frac(1, 4), V_frac(3, 4)$ כך שמתקיים
  $
    C_0 subset.eq V_frac(1, 4) subset.eq C_frac(1, 4) subset.eq V_frac(1, 2) subset.eq C_frac(1, 2) subset.eq V_frac(3, 4) subset.eq C_frac(3, 4) subset.eq V_1
  $
  ובאופן אינדוקטיבי לכל $k in NN$ נקבל
  $
    C_0 subset.eq V_frac(1, 2^k) subset.eq C_frac(1, 2^k) subset.eq dots.h.c subset.eq V_frac(2^k-1, 2^k) subset.eq C_frac(2^k-1, 2^k) subset.eq V_1
  $
  כאשר $C_j$ סגורות ו־$V_j$ פתוחות. נגדיר $f:X arrow [0,1]$ על־ידי
  $ f(x) = mycases(inf_(x in V_t){t}, exists t comma space x in V_t, 1, "otherwise") $
  + $f|_D eq.triple 1$ שכן לכל $x in D$ מתקיים $x in.not X without D = V_1$ וכל $V_t subset.eq V_1$ ולכן $x in.not V_t$ לכל $t$ ומכאן $f(x)=1$
  + $f|_C eq.triple 0$ שכן $C = C_0 subset.eq V_frac(1, 2^k)$ לכל $k in NN$ ולכן זה מתקיים לכל $x in C$ ומכאן $f(x)=0$
  + בשביל הרציפות נראה ש־$f$ רציפה לקבוצות תת־הבסיס ${[0,b) bar 0<=b<=1} union {(b,1] bar 0<=b<=1}$ של הטופולוגיה הסטנדרטית של $[0,1]$. אז נראה כי $f^(-1)([0,b)), f^(-1)((b,1])$ פתוחות
    + $f^(-1)([0,b))$ פתוחה כי $f^(-1)([0,b)) = union.big_(t<b) V_t$ שכן $V_t$ פתוחה לכל $t$. בכיוון הראשון, אם $x in f^(-1)([0,b))$ אז מהגדרה $f(x)<b<=1$ ולכן קיים $t_0$ המקיים $f(x)<t_0 < b$ כלומר $x in V_t_0 subset.eq union.big_(t<b) V_t$. מצד שני, אם $x in union.big_(t<b) V_t$ אז יש $t_0 < b$ כך ש־$x in V_t_0$ ולכן $f(x)<=t_0 < b$ מהגדרת $f$ ולכן $x in f^(-1)([0,b))$.
    + אם נראה שהמשלים של $f^(-1)((b,1])$ זה $f^(-1)([0,b]) = inter.big_(b<t) C_t$, מסגירות $C_t$ נסיים.\
      ואכן, $b=1$ גורר $f^(-1)((b,1]) = emptyset$ שזאת סגורה ולכן נניח $0<=b<1$. מצד אחד, אם $x in f^(-1)([0,b])$ אז $f(x)<=b<1$ ולכן $x in V_t$ לכל $b<t$ אבל תמיד $V_t subset.eq C_t$ ולכן $x in C_t$ לכל $b<t$ כלומר $x in inter.big_(b<t) C_t$. מצד שני, אם $x in.not f^(-1)([0,b])$ אז $b<f(x)$ ולכן קיימים $t_1, t_2$ כך ש־$b<t_1 < t_2 < f(x)$ אבל אז $x in.not V_t_2 subset.eq C_t_1$ ומכך שגם $b<t_1$ נוכל להסיק כי $x in.not inter.big_(b<t) C_t$.
]

#remark[
  אפשר להראות ש־$X$ הוא $T_6$ אם ורק אם לכל $C subset.eq X$ סגורה יש $f:X arrow [0,1]$ עם $C=f^(-1)({0})$ ולכן בפרט אם $X$ הוא $T_6$ אז גם כל תת־מרחב שלו הוא $T_6$ ובפרט מהכיוון ההפוך של הלמה הוא $T_4$ ולכן $T_6 ==> T_5$.
]

= משפט המטריזביליות של אוריסון
#definition[מרחב טופולוגי מטריזבילי][
  מרחב טופולוגי נקרא מטריזבילי אם יש עליו מטריקה המשרה את הטופולוגיה שלו.
]

#theorem[משפט המטריזביליות של אוריסון][
  מרחב טופולוגי המקיים את אקסיומה $T_3$ ואת אקסיומת המנייה השנייה הוא מטריזבילי.
]

#proof[
  נראה שבתנאים אלו $X$ הומאומורפי לתת־קבוצה $E subset.eq [0,1]^NN$ שהיא מטריזבילית כתת־מרחב מטריזבילי ומכאן $f:X arrow E$ הומאומורפיזם וכן $E$ מטריזבילי על־ידי המטריקה $d$ אזי $rho (x,y) colon.eq d(f(x), f(y))$ משרה את הטופולוגיה על $X$.
  + מכך ש־$X$ מקיים את אקסיומת המנייה השנייה יש $cal(B)$ בסיס בן־מנייה של $X$.\
    לכל $U,V in cal(B)$ לא ריקות המקיימות $overline(U) subset.eq V$ הקבוצות $overline(U), X without V$ סגורות וזרות ולכן מהלמה של אוריסון קיימת $f:X arrow [0,1]$ רציפה המקיימת $f|_closure(U) eq.triple 0$ ו־$f|_(X without V) eq.triple 1$ וזה נכון לכל זוג קבוצות ועל־כן ${f_n}_(n in NN)$ סדרת פונקציות כנ"ל בן־מנייה
  + #lemma[
      לכל $x in X$ ולכל $C subset.eq X$ סגורה כך ש־$x in.not C$ קיים $n in NN$ כך שמתקיים $f_n (x) = 0$ ו־$f_n|_C eq.triple 1$.
    ]
    #proof[
      מהנתון $x in X without C$ ו־$X$ הוא $T_3$ ולכן יש פתוחה $V in cal(B)$ כך שמתקיים $x in V subset.eq closure(V) subset.eq X without C$ ו־$closure(V), C$ סגורות וזרות ולכן מהלמה של אוריסון קיים $n in NN$ כך ש־$f_n : X arrow [0,1]$ רציפה ומקיימת $f_n |_closure(V) eq.triple 0$ ו־$f_n |_C = 1$ אבל $x in closure(V)$ וכן $C subset.eq X without V$ ולכן הלמה נובעת.
    ]
  + נגדיר $F:X arrow [0,1]^NN$ על־ידי $x mapsto (f_1 (x), f_2 (x), dots.h)$ ברור שהיא רציפה כי כל קורדינאטה רציפה והיא גם חד־חד ערכית כי אם $x!=y in X$ מכך ש־$X$ הוא $T_3$ אז בפרט ${y}$ סגורה ולכן קיים $m in NN$ עבורו $f_m (x) =0$ ו־$f_m (y) = 1$ ומכאן שהקורדינאטה ה־$m$ שונה ולכן $F(x)!=F(y)$.\
    נשאר להראות שגם ההופכית רציפה. תהיי $U$ פתוחה ו־$x in U$ אז מהלמה קיים $k_x in NN$ כך שמתקיים $f_k_x (x) = 0$ ו־$f_k_x |_(X without U) = 1$.\
    מתקיים $f^(-1)_k_x ([0,1)) subset.eq U$ ואם ניקח את $pi_i$ להיות ההטלה על הקורדינאטה ה־$i$ אזי $f_i = pi_i compose F$ כלומר $f_i^(-1) = F^(-1) compose pi_i^(-1)$ ומכאן נסיק
    $
      U = union.big_(x in U) f^(-1)_k_x ([0,1)) = union.big_(x in U) F^(-1) compose pi^(-1)_k_x([0,1)) ==> F(U) = union.big_(x in U) pi^(-1)_k_x ([0,1)) inter F(X)
    $
    אבל טופולוגיית המכפלה מוגדרת על־ידי התת־בסיס שקבוצותיו הן $pi^(-1)$ ולכן $F(U)$ פתוחה.
]

= תת־קבוצה של $RR$ בטופולוגיה הסטנדרטית היא קשירה אם ורק אם היא קטע
#theorem[
  תת־קבוצה של $RR$ בטופולוגיה הסטנדרטית היא קשירה אם ורק אם היא קטע.
]

#proof[
  בכיוון הראשון תהיי $A subset.eq RR$ תת־קבוצה קשירה. לכל $a,b in A$ ולכל $a<c<b$ מתקיים כי $c in A$ כי אחרת $A=[(-infinity, c) inter A] union [(c, infinity) inter A]$ בסתירה לקשירות ולכן $A$ הוא קטע שקצוותיו הם $inf_(a in A) {a}, sup_(a in A) {a}$ קטע פתוח/סגור/חצי סגור.\
  בכיוון השני, נוכיח שכל קטע מהצורה $[a,b]$ הוא קשיר; נניח בשלילה כי $[a,b] = U union V$ עבור $U,V$ פתוחות ובלי הגבלת הכלליות $a in U$.\
  נתבונן בקבוצה $S colon.eq {x bar a<=x<=b, [a,x] subset.eq U}$ ונסמן $m colon.eq sup(S)$.\
  מתקיים $a<m$ שכן אחרת $U={a}$ בסתירה לפיתוחתה ו־$m in.not U$ כי אחרת בשביל לשמור על הפתיחות בהכרח $m=b$ ואז $V=emptyset$ בסתירה להגדרת הקשירות ועל־כן $m in V$.\
  מהגדרת $m$ כסופרמום נובע שבכל סביבה של $m in V$ קיים משמאל איבר שאינו ב־$V$ אבל זו סתירה לפתיחות של $V$ ועל־כן $[a,b]$ קשיר.\
  בהינתן קטע כללי $I$, אם בשלילה $I=U union V$ אז נבחר $a in U$ ו־$b in V$ ואז $[a,b] = (U inter [a,b]) union (V inter [a,b])$ בסתירה.
]
= מכפלה (בטופולוגיית המכפלה) של מרחבים היא קשירה אם ורק אם היא כל אחד מהמרחבים קשיר
#theorem[
  יהי ${X_alpha}_(alpha in I)$ אוסף של מרחבים ויהי $product_(alpha in I) X_alpha$ מרחב המכפלה שלהם עם טופולוגיית המכפלה.\
  אזי $product_(alpha in I) X_alpha$ קשירה אם ורק אם לכל $alpha in I$, $X_alpha$ קשיר.
]

#proof[
  הוכחנו את הטענה שאם $X$ מרחב קשיר אז כל פונקציה רציפה $f:X arrow {0,1}$ היא קבועה.\
  $==>$ אם קיים $Beta in I$ כך שהמרחב $X_beta$ לא קשירה אזי $X_beta = U union V$ ל־$U,V$ פתוחות, לא ריקות וזרות ב־$X_beta$.\
  בטופולוגיית המכפלה $pi_beta^(-1) (U), pi_beta^(-1)(V)$ הן פתוחות וזרות ולכן גם מתקיים $product_(alpha in I) X_alpha = pi_beta^(-1)(U) union pi_beta^(-1)(V)$ כלומר מרחב המכפלה אינו קשיר.\
  $<==$ ראשית, הטענה נכונה למכפלה של שני מרחבים קשירים ולכן באינדוקציה נכונה לכל מכפלה סופית: $X,Y$ קשירים ואם בשלילה $X times Y$ לא קשיר ולכן קיימת $f:X times Y arrow {0,1}$ שאינה קבועה ולכן יש $(x_0, y_0), (x_1, y_1)$ כן שמתקיים $f(x_0, y_0) = 0, f(x_1, y_1) = 1$.\
  נסתכל על $X^prime = X times {y_1}$ ו־$Y^prime = {x_0} times Y$ ו־$X^prime tilde.equiv X, Y^prime tilde.equiv Y$ עם ההעתקת $x mapsto (x, y_1)$ ו־$y mapsto (x_0, y)$ ולכן גם $X^prime, Y^prime$ מרחבים קשירים ושוב כל פונקציה רציפה מהם ל־${0,1}$ היא קבועה. מכך ש־$x_1 in X$ ו־$y_0 in Y$ ניתן להסיק כי
  $ f|_(X^prime) eq.triple f(X, y_1) = 1, f|_(Y^prime) eq.triple f(x_1, Y) = 0 $
  אבל $(x_0, y_1) in X^prime inter Y^prime$ ולכן מלמת כוכב $X^prime union Y^prime$ קשיר אז לא תיתכן פונקציה רציפה שאינה קבועה במרחב זה וזאת סתירה.\
  בשביל מכפלה כלשהי: מאקסיומת הבחירה המכפלה לא ריקה ויהי $x = (x_alpha)_(alpha in I) in product_(alpha in I) X_alpha$. לכל $J subset.eq I$ קבוצת אינדקסים סופית נגדיר
  $ X_J = product_(alpha in J) X_alpha times product_(alpha in I without J) {x_alpha} $
  כל $X_j$ הוא קשיר כי הוא קבוע בקורדינאטות ה־$I without J$ ולכן הומיאומורפי למכפלה $product_(alpha in J) X_alpha$ והראינו שמכפלות סופיות של מרחבים קשירים הן קשירות.\
  עבור ${X_J}_(J "is finite")$ מתקיים $inter.big_(J "is finite") X_j != emptyset$ כי $x in X_j$ לכל $J$ ולכן מלמת כוכב $union.big_(J "is finite") X_j$ קשיר ומספיק להראות כי הקבוצה הנ"ל צפופה במכפלה.\
  אבל קבוצת בסיס בטופולוגיית המכפלה היא מהצורה $product_(alpha in I without K) X_alpha times product_(alpha in K) V_k$ ל־$K subset.eq I$ קבוצה סופית כלשהי של אינדקסים ול־$V_alpha$ בפתוחה ב־$X_alpha$ עבור $alpha in K$ אז אם נבחר את $K$ האינדקסים המתאימים בוקטור שהגדרנו, האיחוד נחתך.
]

= מכפלה (בטופולוגיית המכפלה) של מרחבים היא קשירה מסילתית אם ורק אם היא כל אחד מהמרחבים קשיר מסילתית
#theorem[
  יהי ${X_alpha}_(alpha in I)$ אוסף של מרחבים ויהי $product_(alpha in I) X_alpha$ מרחב המכפלה שלהם עם טופולוגיית המכפלה.\
  אזי $product_(alpha in I) X_alpha$ קשירה מסילתית אם ורק אם לכל $alpha in I$, $X_alpha$ קשיר מסילתית.
]

#proof[
  $==>$ נניח כי $product_(alpha in I)$ קשיר מסילתית. לכל $beta in I$ ההטלה $pi_beta$ רציפה ומכאן שבהינתן זוג נקודות ב־$X_beta$ נוכל להרכיב את ההטלה על המסילות שמוגדרת במרחב המכפלה ולקבל את המסילה הדרושה ל־$X_beta$.\
  $<==$ נניח שכל $X_alpha$ קשיר מסילתית ויהיו $(p_alpha)_(alpha in I), (q_alpha)_(alpha in I)$ איברים במכפלה. לכל $alpha in I$ יש מסילה $g_beta : [0,1] arrow X_beta$ המחברת את $p_beta, q_beta$.\
  נגדיר $g:[0,1] arrow product_(alpha in I) X_alpha$ על־ידי $t mapsto (g_alpha (t))_(alpha in I)$ והיא רציפה בכל קורדינאטה ועל־כן רציפה ומתקיים $g(0)=(p_alpha)_(alpha in I), g(1)=(q_alpha)_(alpha in I)$.
]

= קשירות וקשירות מסליתית מקומית גוררים קשירות מסילתית
#theorem[
  אם $X$ קשיר וקשיר מסילתית מקומית אז הוא קשיר מסילתית.
]

#proof[
  לכל $x in X$ נסמן את הסביבה הקשירה מסילתית של $x$ ב־$U_x$.\
  יהי $y in X$ ותהיי $A$ רכיב הקשירות המסילתית של $y$. לכל $a in A$ יש סביבה קשירה מסילתית $U_a$ ולכן $A$ פתוחה.\
  מתקיים $display(X without A = union.big_(x in X without A) U_x)$ ולכן $X=A union (X without A)$ כאיחוד זר של פתוחות ולכן בהכרח אחת מהן ריקה (מקשירות). אבל $y in A$ ולכן $X without A = emptyset$ אז $A=X$.
]

= תנאים שקולים לקומפקטיות במרחבים מטריים (לא בחומר)
#theorem[
  יהי $(X,d)$ מרחב מטרי. אז הבאים שקולים
  + $X$ קומפקטי
  + $X$ קומפקטי סדרתית
  + $X$ שלם וחסום לחלוטין
]

#proof[
  $2 <== 1$ תהיי ${x_n}_(n=1)^infinity subset.eq X$ סדרה ונניח בשלילה שלא קיימת לה תת־סדרה  מתכנסת וללא הגבלת הכלליות האיברים שונים זה מזה.\
  לכל $n in NN$ קיימת $U_n$ פתוחה כך ש־$x_n in U_n$ ומכך ש־$X$ מרחב מטרי ניתן להניח שמדובר בקבוצה בעלת רדיוס מספיק קטן כך שלכל $k !=n$ מתקיים $x_k in.not U_n$ כי אם לא הייתה קבוצה כזאת עבור $x_n$ כלשהו, אז $x_n$ הייתלה נקודת הצטברות של הסדרה כלומר גבול של תת־סדרה כלשהי בניגוד להנחה שאין תת־סדרה מתכנסת.\
  נגדיר $U_0 = X without {x_n}_(n=1)^infinity$ וזו קבוצה פתוחה כי אם היה $y in X without {x_n}_(n=1)^infinity$ שכל סביבה שלו מכילה $x_n$ כלשהו אז $y$ הייתלה נקודת הצטברות ושוב בסתירה להנחה.\
  מכאן שהאוסף ${U_n}_(n=1)^infinity union {U_0}$ הוא כיסוי פתוח של $X$ ומקומפקטיות $X$ נובע שיש תת־כיסוי סופי מהצורה ${U_i}_(i=1)^m$ אבל תת־כיסוי זה מכיל רק מספר סופי מהאיברי הסדרה ולכן לא ייתכן שזה תת־כיסוי ל־$X$ ולכן סתירה.\
  $3 <== 2$ תהיי ${x_n}_(n=1)^infinity subset.eq X$ סדרת קושי ומהקומפקטיות הסדרתית יש תת־סדרה ${x_n_k}_(k=1)^infinity$ מתכנסת ל־$X_0 in X$ אבל זאת סדרת קושי ולכן גבול של תת־סדרה הוא גבול של כל הסדרה ולכן המרחב שלם.\
  המרחב חסום לחלוטין כי אם לא, יש $epsilon > 0$ שעבורו לא ניתן לכסות את $X$ במספר סופי של כדורים ברדיוס $epsilon$. נקבע $x_1 in X$ ונבחר $x_2 in X without B(x_1, epsilon)$ וכן הלאה אז $x_k in X without union.big_(i=1)^(k-1) B(x_i, epsilon)$ (יש אוסף כזה מהנחת השלילה). אז ${x_k}_(k=1)^infinity$ תת־סדרה שהמרחק בין כל זוג איברים שונים בה הוא לפחות $epsilon$ ולא יכולה להיות לה תת־סדרה מתכנסת בסתירה לקומפקטיות הסדרתית של $X$.\
  $2 <== 3$  תהיי ${x_n}_(n=1)^infinity subset.eq X$ סדרה. מכך ש־$X$ חסום לחלוטין נובע שעבור $epsilon = 1$ קיים אוסף סופי של כדורים פתוחים ברדיוס $1$ המהווים כיסוי של $X$ ולכן קיים $B_1$ כדור פתוח המכיל אינסוף מאיברי הסדרה, כלומר יש תת־סדרה ${x_n^1}_(n=1)^infinity subset.eq B_1$ ומכך ש־$X$ חסום לחלוטין נובע שגם עבור $epsilon = frac(1, 2)$ קיים ל־$X$ כיסוי של כדורים פתוחים ברדיוס $frac(1, 2)$ ולכן קיים כדור $B_frac(1, 2)$ שנחתך עם $B_1$ כך שיש תת־סדרה (של התת־סדרה) המקיימת ${x_n^2}_(n=1)^infinity subset.eq B_1 inter B_frac(1, 2)$. \
  באופן איטרטיבי נקבל שלכל $k in NN$  קיים $B_frac(1, k)$ כדור המקיים ${x_n^k}_(n=1)^infinity subset.eq inter.big_(i=1)^(k-1) B_frac(1, i)$ אבל הקוטר של כל קבוצה מאיברי החיתוך היא לכל היותר $frac(2, k)$.\
  לכל כדור $B_frac(1, k)$ נבחר נציג $x_n^k$ ונקבל סדרה שהיא סדרת קושי ו־$X$ שלם אז היא מתכנסת, מכאן ש־$X$ קומפקטי סדרתית.\
  $1 <== 2$ נשתמש ב@Lebesgues_number_lemma. יהי ${U_alpha}_(alpha in I)$ כיסוי פתוח של $X$ קומפקטי סדרתית ויהי $epsilon$ מספר לבג של הכיסוי.\
  נתבונן ב־$cal(B) = {B(x, epsilon) bar x in X}$ וזה כיסוי פתוח של המרחב ונניח בשלילה שלא קיים לו תת־כיסוי סופי. נקבע $x_1 in X$ ולכל $k in NN$ נגדיר $x_k in X without union.big_(i=1)^(k-1) B(x_i, epsilon)$ ונקבל סדרה ${x_k}_(k=1)6infinity$ שהמרחק ב ין כל שני איברים שונים בה גדול מ־$frac(epsilon, 2)$ אבל לא ייתכן שיש לה תת־סדרה מתכנסת וזאת סתירה.
]

#definition[מספר לבג של הכיסוי][
  יהי $X$ מרחב מטרי ויהי $cal(U)$ כיסוי פתוח של $X$. נאמר כי $epsilon > 0$ הוא מספר לבג של הכיסוי אם לכל $x in X$ יש $U in cal(U)$ כך ש־$B(x, epsilon) subset.eq U$.
]

#lemma[
  אם $X$ מרחב מטרי קומפקטי סדרתית אז לכל כיסוי פתוח שלו יש מספר לבג.
]<Lebesgues_number_lemma>

#proof[
  יהי $cal(U)$ כיסוי פתוח של $X$ ונניח בשלילה שאין לו מספר לבג ולכן לכל $n in NN$ קיימת $x_n in X$ וכדור פתוח $B(x_n, frac(1, n))$ שאינו מוכל באף־אחד מאיברי הכיסוי.\
  נתבונן בסדרה ${x_n}_(N=1)^infinity$ מהקומפקטיות הסדרתית נובע שקיימת תת־סדרה מתכנסת ${x_n_k}_(k=1)^infinity arrow x_0 in X$ ומהיות $cal(U)$ כיסוי נובע שקיימת $U in cal(U)$ כך ש־$x in U$. מכך ש־$U$ פתוחה נובע שקיים $0<r$ כך ש־$x_0 in B (x_0, r) subset.eq U$.\
  נבחר $k in NN$ גדול מספיק כך שיתקיים $d(x_0, x_n_k) < frac(r, 2)$ וגם $frac(1, n_k) < frac(r, 2)$ ונקבל $B(x_n_k, frac(1, n_k)) subset.eq B (x_0, r) subset.eq U in cal(U)$ וזאת סתירה.
]

= מרחב האוסדרוף קומפקטי הוא נורמלי
#theorem[משפט האוסדרוף קומפקטי הוא נורמלי][
  אם $X$ מרחב האוסדרוף קומפקטי אז הוא נורמלי.
]

#proof[
  תהיינה $A,B subset.eq X$ סגורות וזרות.\
  מכך ש־$X$ האוסדרוף נוע שלכל $a in A, b in B$ קיימות $V_(a,b), U_(a,b)$ פתוחות וזרות עבורן $a in U_(a,b), b in V_(a,b)$.\
  לכל $b in B$ האוסף ${U_(a,b) inter A}_(a in A)$ הוא כיסוי פתוח של $A$ ומכך ש־$A$ קומפקטי נובע שיש תת־כיסוי סופי מהצורה ${U_(a_i, b) inter A}_(i=1)^n$.\
  נגדיר $tilde(U)_b = union.big_(i=1)^n U_(a_i, b) without B$ וזו קבוצה פתוחה וזרה ל־$B$ ונגדיר $tilde(V)_b = inter.big_(i=1)^n V_(a_i, b)$ והיא פתוחה כחיתוך סופי של פתוחות ויתר על־כן $tilde(U)_b inter tilde(V)_b = emptyset$ אז הן פתוחות וזרות ומפרידות את $A$ מ־$b$.\
  אז האוסף ${tilde(V)_b inter B}_(b in B)$ מהווה כיסוי פתוח של $B$ ושוב מקומפקטיות $B$ כקבוצה סגורה במרחב קומפקטי יש תת־כיסוי סופי ${tilde(V)_b_j inter B}_(j=1)^m$.\
  נגדיר $V = union.big_(i=1)^n tilde(V)_b_i, U = inter.big_(j=1)^m tilde(U)b_j$ הן פתוחות, זרות ולא ריקות והן מפרידות את $A,B$ בהתאמה.
]

= קומפקטיפיקציית הנקודה (לא בחומר)
#definition[הקומפקטיפיקציה החד־נקודתית][
  יהי $(X, tau)$ מרחב טופולוגי ונגדיר את קומפקטיפיקציה החד־נקודתית של $X$ באופן הבא: נסמן ב־$\"infinity\"$ נקודה כלשהי שאינה ב־$X$ ונגדיר $hat(X)=X union {infinity}$ עם הטופולוגיה
  $ hat(tau) = tau union {hat(X) without C bar C subset.eq X "compact"} $
]

#theorem[
  + $hat(tau)$ טופולוגיה
  + $(hat(X), hat(tau))$ מרחב קומפקטי
  + אם $(X, tau)$ קומפקטי מקומית והאוסדרוף אז $(hat(X), hat(tau))$ האוסדרוף
]

#proof[
  + $emptyset in hat(tau)$ כי היא קומפקטית וסגורה ו־$hat(X)=hat(X) without emptyset$ ולכן $hat(X)$. למה זה סגור לאיחוד ארביטררי וחיתוך סופי?
  + יהי $cal(O)$ כיסוי פתוח של $hat(X)$ ולכן יש בו לפחות קבוצה אחת מהצורה $X without C$ ל־$C subset.eq X$ קומפקטית ב־$X$. מתקיים $hat(X) = C union (hat(X) without C$ ואת $C$ ניתן לכסות סופית על־ידי איברים מ־$cal(O)$ מ הקומפקטיות ו־$hat(X) without C$ פתוחה וב־$cal(O)$ אז יש תת־כיסוי סופי של $cal(O)$.
  + יהיו $x,y in hat(X)$. אם $x,y in X$ אז סיימנו כי $X$ האוסדרוף. אחרת, בלי הגבלת הכלליות $x in X$ ו־$y in infinity$. מקומפקטיות מקומית של $X$ קיימת סביבה קומפקטית $x in U subset.eq X$ ולכן  $hat(X) without U$ פתוחה ועם הפנים של $U$ נקבל הפרדה של $x,y$
]

#remark[
  אם $X$ לא קומפקטי אזי $hat(X) = closure(X)$ ואם $X$ קומפקטי אזי $closure(X)=X$ ב־$hat(X)$ ואז $infinity$ נקודה מבודדת.
]

= משפט הקטגוריה של בייר (לא בחומר)
#definition[קבוצה דלילה][
  במרחב טופולוגי $X$ קבוצה $A subset.eq X$ נקראת דלילה אם $X without closure(A)$ צפופה ב־$X$ (באופן שקול, $(closure(A))^circle.small = emptyset$).
]
#definition[קטגוריה ראשונה, קטגוריה שנייה][
  אומרים שקבוצה $A subset.eq X$ היא מקטגוריה ראשונה אם היא איחוד בן־מנייה לכל היותר של קבוצות דלילות. אחרת אומרים שהיא מקטגוריה שנייה.
]

#theorem[משפט הקטגוריה של בייר][
  יהי $X$ מרחב  מטרי שלם או קומפקטי האוסדרוף. אם $A_n subset.eq X$ דלילה לכל $n in NN$ אזי $display(X without union.big_(n in NN) A_n)$ צפוף ב־$X$.
]

#proof[
  יהי ${A_n}_(n in NN)$ אוסף של קבוצות דלילות ובלי הגבלת הכלליות כולן סגורות.\
  בשביל הצפיפות די להראות שלכל קבוצה פתוחה ולא ריקה $U subset.eq X$ מתקיים $(X without union.big_(n in NN) A_n) inter U != emptyset$ מהניסוח השקול.\
  $X$ קומפקטי האוסדרוף ולכן נורמלי (ואם הוא מטרי אז הוא נורמלי).\
  $A_1$ דלילה וסגורה ולכן $U_1 colon.eq U inter (X without A_1) != emptyset$ וזו קבוצה פתוחה ונבחר $a_1 in U_1$.\
  $X$ נורמלי ולכן קיימת $V_1$ פתוחה המקיימת $a_1 in V_1 subset.eq closure(V_1) subset.eq U_1$ ומכך ש־$U_1 inter A_1 = emptyset$ ו־$closure(V_1) subset.eq U_1$ נובע $closure(V_1) inter A_1 = emptyset$.\
  נמשיך אינדוקטיבי ונקבל אוסף פתוחות ${V_j}_(j=1)^n$ המקיימות $closure(V_j) subset.eq V_(j-1)$ וגם $closure(V_n) inter (union.big_(j=1)^n A_j) = emptyset$.\
  לכן ${closure(V_n)}_(n in NN)$ הוא אוסף של סגורות המקיים את תכונת החיתוך הסופי ומקומפקטיות $X$ נובע שהחיתוך כולו אינו ריק (עבור שלמים זה מהנחת השלמות).\
  אז יהי $a in inter.big_(n in NN) closure(V_n) subset.eq U$ ומתקיים $a in.not union.big_(n in NN) A_n$ ולכן $a in (X without union.big_(n in NN) A_n) inter U$, כנדרש.
]

#remark[
  במקרה המטרי כשאנחנו בוחרים את $V_n$ נקפיד שהרדיוס שלה קטן מ־$frac(1, n)$ ואז משפט קנטור מבטיח שהחיתוך לא ריק.
]

#corollary[
  כל מרחב טופולוגי קומפקטי האוסדרוף או מרחב מטרי שלם הם מקטגורייה שנייה.
]

#proof[
  אחרת, הם היו מקטגוריה ראשונה אז כל אחד מהם היה איחוד בן־מנייה של דלילות כלשהן והיינו מקבלים $x without union.big_(n in NN) A_n = emptyset$.
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
  אז $X$ מרחב רגולרי ע בסיס בן־מנייה ולכן ממשפט המטריזציה של אוריסון הוא בהכרח מטריזבלי.
]

= החבורה היסודית של המעגל איזומורפית לחבורת השלמים
#theorem[
  $pi_1 (S^1, 1) tilde.equiv ZZ$ (כלומר החבורה היסודית של המעגל איזומורפית לחבורת השלמים).
]

#proof[
  נקבע $(1,0) in S^1$ וראינו כי $RR$ מהווה מרחב כיסוי של $S^1$ על־ידי ההעתקה $p(s)=e^(2pi i s)$ כאשר נזכור שלכל $m in ZZ$ נזכור ש־$p$ היא מחזורית במחזור של $1$ ולכן אינרוואנטית להזזות במספרים שלמים (עבור $m in ZZ$, $p(x+m)=p(x)$).\
  נגדיר $phi.alt : ZZ arrow pi_1 (S^1, (1,0))$ על־ידי $phi.alt(n) = [p compose tilde(f)_n]$ כאשר $tilde(f)_n : I arrow RR$ היא מסילה המתחילה ב־$0$ ונגמרת ב־$n$.\
  $phi.alt$ מוגדרת היטב כי אם  $tilde(f_n), tilde(f)_n^prime : I arrow RR$ מסילות בין $0$ ל־$n$ אז מכך ש־$RR$ קמור נובע כי $tilde(f)_n tilde tilde(f)_n^prime$.\
  + $phi.alt$ הומומורפיזם – נטען שמתקיים
    $
      phi.alt(n+m) = [p compose tilde(f)_(n+m)] = [p compose tilde(f)_n star tilde(f)_m ] = [p compose tilde(f)_n] star [p compose tilde(f)_(m)] = phi.alt(n) star phi.alt(m)
    $
    לא טריוויאלי שמתקיים $p compose tilde(f)_(n+m) ~ p compose tilde(f)_n star tilde(f)_(m)$.\
    נגדיר ${tau_k : RR arrow RR bar tau_k (x) = x + k}_(k in ZZ)$ ואז $tau_m compose tilde(f)_n : I arrow RR$ היא מסילה בין $m$ לבין $n+m$ ואז $tilde(f)_(m) star (tau_m compose tilde(f)_n) : I arrow RR$ מסילה בין $0$ לבין $n+m$ ואז אכן $tilde(f)_(m) star (tau_m compose tilde(f)_n) tilde tilde(f)_(n+m)$ ועל־כן $p compose tilde(f)_(m) star (tau_m compose tilde(f)_n) ~ p compose tilde(f)_(n+m)$.\
    אבל מתקיים גם $p compose tau_m compose tilde(f)_n ~ p compose tilde(f)_n$ כי אלו שתי מסילות באורך $n$ מהאינווריאנטיות של $p$ להזזה בשלמים.
  + $phi.alt$ על כי אם $f in pi_1 (S^1, (1,0))$ אז מכך ש־$RR$ מרחב כיסוי של $S^1$ יש הרמה יחידה $tilde(f) : I arrow RR$ המתאימה ל־$f$ אבל אז
    $ e^(2pi i tilde(f)(1)) = p compose tilde(f)(1) = f(1) = (1,0) $
    ולכן $tilde(f)(1) in ZZ$ ומכאן $phi.alt(tilde(f)(1)) = [p compose tilde(f)]=[f]$.
  + $phi.alt$ חד־חד ערכית כי אם $n,m in NN$ עבורם $phi.alt(n)=phi.alt(m)$ אז המסילות $tilde(f)_n, tilde(f)_m : I arrow RR$ מקיימות מההנחה
    $ [p compose tilde(f)_n] = phi.alt(n) = phi.alt(m) = [p compose tilde(f)_m] $
    אם נגדיר $F: I times I arrow S^1$ הומוטפיה על־ידי
    $ F(0,s) = p compose tilde(f)_n (s), quad F(1,s) = p compose tilde(f)_m (s) $
    יינבע $p compose tilde(f)_n tilde compose tilde(f)_m$.\
    אבל $RR$ מרחב כיסוי של $S^1$ ולכן קיימת הרמה יחידה להומוטופיה $tilde(F) : I times I arrow RR$ המקיימת $p compose tilde(F) = F$ ומיחידות ההרמה  נובע $tilde(f)_n tilde tilde(f)_m$ כלומר $n=m$
]

= המשפט היסודי של האלגברה
#theorem[
  לכל פולינום $p in CC[x]$ שאינו קבוע יש שורש ב־$CC$.
]

#proof[
  יהי $p(z) = z^n + a_1 z^(n-1)+ dots.h.c a_(n-1) z + a_n$ פולינום ונראה שאם לא קיים שורש אז $p$ קבוע.\
  נגדיר לולאות $f_r : I arrow S^1 subset.eq CC$ על־ידי $f_r (s) = frac(frac(p(r e^(2pi i s)), p(r)), norm(frac(p(r e^(2pi i s)), p(r))))$ ומתקיים $f_r (0) = f_r (1) = 1$ וזו הומוטופיה בין $f_0 (s) = 1$ לבין כאל $f_r (s)$.\
  יהי $r in CC$ גדול מספיק כך שיתקיים $max{1, sum_(i=1)^n a_i} < r$ ונתבונן במעגל ברדיוס $r$ אז לכל $z$ במעגל מתקיים עבור $t in [0,1]$
  $
    abs(t(sum_(i=1)^n a_i z^(n-i)))<= abs(sum_(i=1)^n a_i z^(n-i)) <= sum_(i=1)^n a_i r^(n-i) <= r^(n-1) sum_(i=1)^n a_i < r^(n-1) dot.op r = r^n = abs(z)^n
  $
  נגדיר $p_t (z) = z^n + t(sum_(i=1)^n a_i z^(n-i))$ עבור $t in [0,1]$ ומאי־שיוויון המשולש ומה שמצאנו לעיל נובע
  $ abs(z^n) = abs(p_t (z) - t(sum_(i=1)^n a_i z^(n-i))) <= abs(p_t (z)) + abs(t sum_(i=1)^n a_i z^(n-1)) $
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

= משפט נקודת השבת של בראואר
#theorem[
  יהי $DD = {z in CC bar abs(z)<=1}$ דיסק היחידה. לכל העתקה רציפה מהצורה $f:DD arrow DD$ קיימת נקודת שבת יחידה.
]

#proof[
  נניח בשלילה כי $f(z)!=z$ לכל $z in DD$ ולכן לזוג $(z, f(z))$ קיים ישר יחיד שראשיתו ב־$f(z)$ וחוצה את $z$.\
  נגדיר $r:DD arrow S^1$ רציפה כך ש־$(z)$ היא נקודת החיתוך של הישר הזה עם המגל $S^1$ ובפרט לכל $z in S^1$ מתקיים $r(z)=z$.\
  תהיי $f_0 : [0,1] arrow S^1$ לולאה שמקיפה את $S^1$ עם בסיס $x_0 in DD$ ונתבונן בלולאות $f_t (s) = (1-t) f_0 (s) + t x_0$.\
  $DD$ קמורה ולכן זו הומוטופיה בין $f_0$ לבין הלולאה הקבועה $C_x_0 : [0,1] arrow {x_0} in DD$.\
  מרציפות $r$ נובע ${r compose f_t (s)}$ הומוטופיה בין $r compose f_0$ לבין $r compose C_x_0$ אבל $f_0 (s) in S^1$ ולכן $r compose f_0 = f_0$ ומצד שני $r compose C_x_0$ היא הלולאה הקבועה $r(x_0)$ וזאת סתירה.
]

= משפט זייפרד – ואן־קמפן

= מיפוי משפטים לא בנאליים שהופיעו במבחנים
מה בנאלי? טיכונוף, שקילויות לקומפקטיות במרחב מטרי, משפט המטריזביליות של אוריסון, הלמה של אוריסון.
#set table(stroke: (_, y) => if y > 0 { (top: 0.5pt) })
#table(
  columns: (3fr, 1fr),
  align: center,
  table.header([ *משפט* ], [ *כמה פעמים הופיע* ]),
  [ תת־קבוצה של $RR$ קשירה אם ורק אם היא קטע ], [ 1 ],
  [ מרחב האוסדרוף קומפקטי הוא נורמלי ], [ 2 ],
  [ למת ההרמה ], [ 1 ],
  [ איפיון שקול לסגור – $closure(A) = {x in X bar forall E "neighborhood of" x, E inter A !=emptyset}$ ], [1],
  [ משפט ערך הביניים ], [1],
  [ מרחב האוסדרוף קומפקטי הוא מרטיזבילי אם ורק אם הוא ממנייה שנייה], [1],
  [אקסיומת המנייה השנייה גוררת לינדלוף, מנייה ראשונה וספרבילי], [2],
  [מרחב רגולרי עם אקסיומת המנייה השנייה הוא מרחב נורמלי], [1],
)

= שיט שכדאי לזכור
+ זהות מקבוצות $(E times F) without(C times D) = ((E without C) times F) union (E times (F without D))$
+ מרחב מטרי שבו כל קבוצה פתוחה היא סגורה הוא דיסקרטי (ראינו באינפי3, )

= שאלות טובות ממבחנים
#example[משפט ההמשכה של טיצה][
  יהי $X$ מרחב טופולוגי נורמלי ותהיי $A subset.eq X$ תת־קבוצה סגורה.\
  כל פונקציה רציפה וחסומה $f_0: A arrow RR$ ניתנת להמשכה לפונקציה רציפה $F:X arrow RR$ כך ש־$F|_A eq.triple f_0$.
]

#proof[
  כדי לפשט את ההוכחה, נוכיח  למקרה הפרטי שבו הפונקציה ממקיימת $abs(f_0(x))<=1$, וממנו אפשר להרחב לכל פונקציה רציפה חסומה כללית.\
  נגדיר
  $ A_1 colon.eq f_0^(-1)([-1, -frac(1, 3)]), quad B_1 colon.eq f_0^(-1)([frac(1, 3), 1]) $
  $f_0$ רציפה ו־$[-1, -frac(1, 3)]$ ו־$[frac(1, 3), 1]$ הן קבוצות סגורות וזרות ב־$RR$ ולכן המקורות $A_1$ ו־$B_1$ הן קבוצות סגורות ב־$A$ ובפרט הן סגורות ב־$X$ ומהזרות של הקטעים נובע כי $A_1 inter B_1 = emptyset$ מהגדרת $f_0$ כפונקציה.\
  מכך ש־$X$ נורמלי, ו־$A_1, B_1$ סגורות ב־$X$ הלמה של אוריסון מבטיחה קיום של $g_1 : X arrow [-frac(1, 3), frac(1, 3)]$ המקיימת
  $ g_1 |_A_1 eq.triple -frac(1, 3), quad g_1 |_B_1 eq.triple frac(1, 3), quad abs(g)<=frac(1, 3) $
  אם נגדיר $f_1 =f_0 - g_1$ אז $abs(f_1)|_A <= frac(2, 3)$.\
  נמשיך באינדוקציה, בהינתן $f_(n-1)$ המוגדרת על $A$ נגדיר
  $
    A_n colon.eq f_(n-1)^(-1) ([-frac(1, 3) (frac(2, 3))^(n-1), -frac(1, 9) (frac(2, 3))^(n-1)]) \
    B_n colon.eq f_(n-1)^(-1) ([frac(1, 9)(frac(2, 3))^(n-1), frac(1, 3) (frac(2, 3))^(n-1)])
  $
  ושוב מהלמה של אוריסון קיימת $g_n : X arrow RR$ המקיימת $ g_n |_A_n eq.triple -frac(1, 3)(frac(2, 3))^(n-1), quad g_n |_B_n eq.triple frac(1, 3)(frac(2, 3))^(n-1), quad abs(g_n)<= frac(1, 3)(frac(2, 3))^(n-1) $
  נגדיר אם כך את $F = sum_(n=1)^infinity g_n (x)$ והיא מתכנסת במידה שווה ממבחן ה־$M$ של ויירשטראס, רציפה כסכום אינסופי של פונקיות רציפות ומההתכנסות במידה שווה בפרט רציפה ומהגדרה $F|_A = f$ (מהדעיכה של הטור) ו־$abs(F)<=1$.
]

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
  סקיצה: הקבוצות זרות וסגורות ואיחוד סופי של סגורות הוא סגור אז לכל $k in [n]$ נגדיר $A_k = C_k, B_k = union.big_(n!=k) C_n$ ומהנורמליות עם הלמה של אוריסון נקבל $g_k |_A_k eq.triple 1, g_k |_B_k eq.triple 0$.\
  מהזרות נובע ש־$f(x)=sum_(k=1)^n a_k g_k (x)$ מקיימת את הנדרש.
]

#pagebreak()

#example[מבחן של שאול, מועד ב' 2023][
  יהי $X$ מרחב מטרי שלם אינסופי ללא נקודות מבודדות. הוכיחו כי $X$ לא בן־מנייה.
]

#proof[
  נניח ש־$X$ הוא בן־מנייה, כלומר אפשר לסדר את כל האיברים שלו בסדרה $X = {x_1, x_2, x_3, dots.h}$.\
  נבנה באינדוקציה סדרה של כדורים סגורים $B_1 supset B_2 supset B_3 supset dots$ כך שיתקיימו שלושה תנאים לכל $n in NN$
  + $B_n subset.eq B_(n-1)$ (הכדורים מקוננים)
  + הכדור $B_n$ לא מכיל את הנקודה $x_n$ (כלומר $x_n in.not B_n$)
  + רדיוס הכדור $B_n$ קטן מ־$frac(1, n)$ (כדי להבטיח התכנסות לאפס)
  בהינתן שכבר בנינו את $B_(n-1)$, הפנים שלו (הכדור הפתוח) אינו ריק. מכיוון שאין ב־$X$ נקודות מבודדות, כל קבוצה פתוחה לא ריקה מכילה אינסוף נקודות. לכן, הפנים של $B_(n-1)$ מכיל נקודות נוספות מלבד $x_n$.נוכל לבחור נקודה $y_n != x_n$ בתוך הפנים של $B_(n-1)$, ולצייר סביבה כדור סגור קטן מספיק $B_n$ שיישאר בתוך $B_(n-1)$ אבל הרדיוס שלו יבטיח ש־$x_n$ יישאר בחוץ, ושיהיה קטן מ־$frac(1, n)$.\
  $X$ מרחב מטרי שלם ויש לנו סדרת כדורים סגורים מקוננים שהרדיוסים שלהם שואפים ל־$0$ והחיתוך שלהם לא ריק. כלומר, קיימת ויחידה
  $y in union.big_(n=1)^infinity B_n$.\
  מצד אחד, $y in X$, ולכן היא חייבת להיות שווה לאיזשהו איבר בסדרה המקורית נניח $y = x_k$.מצד שני, $y$ נמצאת בתוך כל הכדורים, ובפרט היא חייבת להיות בתוך $B_k$.\
  אבל בשלב ה־$k$ של הבנייה, דאגנו במפורש ש־$x_k in.not B_k$. מכאן ש־$y != x_k$ וזאת סתירה ולכן $X$ לא בן־מנייה.
]

#remark[
  ההוכחה שאליה התכוון המשורר היא עם משפט בייר שירד מהחומר.\
  נניח בשלילה שהוא כן בן־מנייה ונכתוב $X={x_1, x_2, dots.c}$.\
  מכיוון של־$X$ אין נקודות מבודדות נובע ש־${x}$ דלילה כי $closure({x}) = {x}$ כי מההגדרה השקולה $closure({x}) = {x} union {{x} "כל הנקודות הגבוליות של"}$ ומכך ש־${x}$ ללא נקודות מבודדות נובע $closure({x}) = {x} union emptyset = {x}$ אבל בפרט נובע מכך שהפנים של ${x}$ ריק (אין נקודות שיש להן כדור פתוח שמוכל כולו בקבוצה כי הכדור יכיל עוד אינסוף נקודות) ועל־כן ${x}$ קבוצה דלילה.\
  זה נכון לכל $x in X$ שהנחנו שבן־מנייה ולכן $X without union.big_(n in NN) {x_n} = X without union.big_(x in X) {x} = emptyset$ צפוף ב־$X$ ממשפט הקטגוריה של בייר אבל זאת כמובן סתירה.
]

= שאלות שאני צריכה לחזור עליהן
+ שאלה 4א' 2024 מועד א'
+ שאלה 5 2022 מועד א'
+ שאלה 5 2022 מועד ב'
+ מבחני 2019
