#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 05 --- מבוא לטופולוגיה, 80516 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהיו $(X, tau_X),(Y, tau_Y)$ מרחבים טופולוגיים ונניח ש־$X$ מקיים את אקסיומת המנייה הראשונה.

#subquestion()
תהיי $A subset.eq X$ ויהי $x in X$. נוכיח ש־$x in closure(A)$ אם ורק אם יש סדרה $(a_n)_(n=1)^infinity subset.eq A$ כך ש־$display(lim_(n arrow.r infinity) a_n = x)$.

#proof[
  $<==$ נניח ש־$x in closure(A)$.\
  מכיוון ש־$X$ מקיים את אקסיומת המנייה הראשונה נובע שעבור $x$ קיים בסיס מקומי בן־מנייה, כלומר יש אוסף פתוחות ${U_alpha}_(alpha in I) subset.eq tau_X$ המקיים
  + לכל $alpha in I$ מתקיים $x in U_alpha$
  + לכל $V in tau_X$ יש $alpha in I$ כך ש־$x in U_alpha subset.eq V$
  מכיוון ש־$x in closure(A)$ נובע ש־$x in F subset.eq X$ לכל $F$ סגורה כך ש־$A subset.eq F$.\
  הגדרנו שסדרה $(a_n)_(n=1)^infinity$ מתכנסת לנקודה $x in X$ ונסמן $display(lim_(n arrow.r infinity) a_n = x)$ אם לכל פתוחה $U$ כך ש־$x in U$ קיים $N in NN$ כך שלכל $n>N$ מתקיים $a_n in U$.\
  נסמן ב־$(V_n)_(n=1)^infinity$ את הבסיס בן־מנייה המקומי של $x$.\
  נגדיר $U_n = inter.big_(i=1)^n V_i$ וקיבלנו $U_1 supset.eq U_2 supset.eq dots.h.c$ סדרת סביבות יורדות ולכל $U_n$ מתקיים $A inter U_n !=emptyset$ שכן $x in closure(A)$.\
  נגדיר את הסדרה $a_n = U_n inter A$ וכמובן $(a_n)_(n=1)^infinity subset.eq A$, נשאר רק להראת ש־$a_n stretch(arrow)_(n arrow infinity) x$.\
  תהיי $W$ פתוחה כך ש־$x in W$, מכך ש־${V_n}_(n=1)^infinity$ הוא בסיס מקומי בן־מנייה נובע שקיים $k in NN$ עבורו $V_k subset.eq W$ (מ־2).\
  מצד שני, לכל $n>=k$ מתקיים $U_n subset.eq U_k subset.eq V_k$ מהבנייה של $(U_n)_(n=1)^infinity$ כסדרות יודות.\
  מכך ש־$a_n in U_n$ נובע שלכל $n>=k$ מתקיים $a_n in V_k subset.eq W$ אז לכל $K>k$ מתקיים $a_K in W$ כלומר $a_n stretch(arrow)_(n arrow infinity) x$. \
  $==>$ נניח שקיימת סדרה $(a_n)_(n=1)^infinity subset.eq A$ כך ש־$display(lim_(n arrow.r infinity) a_n = x)$.\
  תהיי $U$ סביבה פתוחה של $x$ ולכן מהגדרה קיים $N in NN$ כך שלכל $n>N$ מתקיים $a_n in U$.\
  מכך ש־$(a_n)_(n=1)^infinity subset.eq A$ הרי ש־$a_(n+1) in U inter A$ ולכן $U inter A != emptyset$ אבל זה שקול ללהגיד ש־$x in closure(A)$.
]

#subquestion()
תהיי $f:X arrow Y$ פונקציה. נוכיח ש־$f$ רציפה אם ורק אם לכל סדרה $(a_n)_(n=1)^infinity subset.eq X$ כך שקיים הגבול $x = display(lim_(n arrow.r infinity) x_n)$ מתקיים ש־$display(lim_(n arrow.r infinity) f(x_n) = f(x))$ ב־$Y$.

#proof[
  $<==$ נניח ש־$f$ רציפה ולכן לכל $V in tau_Y$ מתקיים ש־$f^(-1)(V) in tau_X$.\
  אז תהיי $V$ סביבה פתוחה של $f(x)$ ולכן $f^(-1)(V) in tau_X$.\
  אם $x_n stretch(arrow)_(n arrow infinity) x$ ו־$f^(-1)(V) in tau_X$ פתוחה נובע מהגדרה שקיים $N in NN$ כך שלכל $n > N$ מתקיים $x_n in f^(-1)(V)$ אבל זה בידיוק אומר $f(x_n) in V$.\
  אז לכל $V$ סביבה פתוחה של $f(x)$ קיים $N$ כך שלכל $n>N$ מתקיים $f(x_n) in V$ אבל זה שקול ללהגיד $display(lim_(n arrow.r infinity) f(x_n) = f(x))$.\
  $==>$ בכיוון השני נניח שלכל סדרה $(a_n)_(n=1)^infinity subset.eq X$ כך שקיים הגבול $display(x = lim_(n arrow.r infinity) x_n)$ מתקיים ש־$display(lim_(n arrow.r infinity) f(x_n) = f(x))$ ב־$Y$.\
  נרצה להשתמש בסעיף הקודם ולכן כדי להראות ש־$f$ רציפה נשתמש בניסוח השקול לקבוצות סגורות: נראה שלכל $A subset.eq X$ מתקיים $f(closure(A)) subset.eq closure(f(A))$.\
  תהיי $y in f(closure(A))$ ולכן קיים $x in closure(A)$ כך ש־$y=f(x)$.\
  מהסעיף הקודם יש $(a_n)_(n=1)^infinity subset.eq A$ כך ש־$a_n stretch(arrow)_(n arrow infinity) x$ ומההנחה נובע ש־$f(a_n) stretch(arrow)_(n arrow infinity) f(x)$.\
  נסתכל על $(f(a_n))_(n=1)^infinity$, כל הסדרה הזאת מוכלת ב־$f(A)$ והיא מתכנסת ל־$f(x)$ אבל מהסעיף הקודם נובע ש־$f(x) in closure(f(A))$.
]

#question()
יהי $(X, tau)$ מרחב טופולוגי ממנייה שנייה ויהי $cal(C)$ בסיס לטופולוגיה של $X$. נוכיח כי $cal(C)$ מכיל בסיס בן־מנייה לטופולוגיה של $X$.

#proof[
  $X$ מרחב טופלוגי ממנייה שנייה ולכן יש בסיס בן־מנייה לטופולוגיה $tau$, נסמנו $cal(B) = union.big_(n in NN) B_n$.\
  מכוון ש־$cal(C)$ הוא בסיס לטופולוגיה, לכל $B_n in cal(B)$ נגדיר אוסף $C_n subset.eq cal(C)$ כך שיתקיים
  $B_n = union.big_(C in C_n) C$.\
  בתרגול ראינו שאם מרחב מקיים את אקסיומת המנייה השנייה הוא מרחב לינדלוף ובפרט נובע גם שכל קבוצה פתוחה $B_n$ אם נסתכל עליה כתת־מרחב היא גם לינדלוף.\
  נסתכל על האוסף $C_n$, הוא כיסוי פתוח של $B_n$ ולכן קיים לו תת־כיסוי בן־מנייה $tilde(C)_n subset.eq C_n$ ומתקיים $B_n = union.big_(C in tilde(C)_n) C$.\
  לבסוף נגדיר $tilde(C) = union.big_(n in NN) tilde(C)_n$ והוא בן־מנייה כאיחוד של קבוצות בנות־מנייה וכל $U$ פתוחה היא איחוד של איברי $cal(B)$ מהיות $cal(B)$ בסיס וכל $B_n$ הוא איחוד של איברי $tilde(C)_n$ שהם ב־$tilde(C)$ כלומר $U$ היא איחוד של איברים מ־$tilde(C)$.
]

#question()
יהי ${X_i}_(i in I)$ אוסף מרחבים טופולוגיים ממנייה ראשונה. יהי $X = product_(i in I) X_i$ מרחב המכפלה עם טופולוגיית המכפלה.\
נוכיח ש־$X$ ממנייה ראשונה אם ורק אם קיים $J subset.eq I$ כך שלכל $j in J$ המרחב $X_j$ טריוויאלי (כלומר הטופולוגיה עליו היא הטופולוגיה הטריוויאלית) וגם $abs(I without J)<=aleph_0$.

#proof[
  נסמן $K= I without J$ אוסף האינדקסים של המרחבים שאינם טריוויאליים.\
  $<==$ תהיי $x in X$ וקיים ל־$x$ בסיס בן־מנייה מקומי ${W_n}_(n in NN)$.\
  לכל $n in NN$ קיימת פתוחה בסיסית $V_n$ כך ש־$x in V_n subset.eq W_n$ ולכל $V_n$ קיימת קבוצה סופית של אינדקסים $S_n subset.eq I$ כך שלכל $i in.not S_n$ מתקיים ש־$pi_i (V_n) = X_i$ מהגדרת טופולוגיית המכפלה.\
  נגדיר $S=union.big_(n in NN) S_n$ בת־מנייה כאיחוד בן־מנייה של קבוצות סופיות ונניח בשלילה שקיים $j in K without S$ ולכן $X_j$ מרחב לא טריוויאלי וקיימת פתוחה $U_j subset.eq X_j$ עבורה מתקיים $x_j in U_j$ ו־$U_j != X_j$.\
  נסתכל על $U = pi_j^(-1)(U_j)$: מכיוון ש־${W_n}_(n in NN)$ בסיס מקומי קיים $n in NN$ כך ש־$W_n subset.eq U$ כלומר $V_n subset.eq U$ ולכן $pi_j (V_n) subset.eq U_j$.\
  אבל $j in.not S$ ולכן $j in.not S_n$ כלומר $pi_j (V_n) = X_j$.\
  קיבלנו $X_j subset.eq U_j$ בסתירה לכך ש־$U_j != X_j$ ולכן $K without S = emptyset$ קרי $K subset.eq S$ ו־$K$ בת־מנייה.\
  $==>$ נניח שכמעט כל המרחבים טריוויאליים, כלומר $abs(K)<=aleph_0$.\
  לכל $i in K$ המרחב $X_i$ מקיים את אקסיומת המנייה הראשונה.\
  תהיי $x=(x_i) in X$ לכל $i in K$ ולכן קיים לו בסיס מקומי בן־מנייה ${V_(i,n)}_(n in NN)$.\
  נגדיר
  $
    cal(B) = { product_(i in I) U_i bar exists S subset.eq K text(" סופית"), space forall i in S, U_i in cal(V)_i text(" וגם ") forall i in.not S, U_i = X_i }
  $
  שהוא כמובן בן־מנייה (כי מספר תתי־הקבוצות הסופיות של קבוצה בת־מנייה הוא בן־מנייה).\
  נשאר להראות שהוא בסיס מקומי: כל פתוחה בסיסית במכפלה המכילה את $x$ מגבילה רק מספר סופי של קורדינאטות $i_1, dots.h, i_m$ ועבור כל קורדינאטה כזו קיים איבר בבסיס המקומי $V_(i,_j, n_j)$ שמוכל בהגבלה כלומר קיימת קבוצה ב־$cal(B)$ שמוכלת בסביבה הפתוחה.
]


#question()
יהי
$ cal(B) = {(a,b) without C bar a<b in RR, space C subset.eq RR, space abs(C)<=aleph_0} $

אוסף של תתי־קבוצות של $RR$.

#subquestion()
נוכיח כי $cal(B)$ הוא בסיס לטופולוגיה על $RR$ ונסמן את הטופולוגיה המושרית ב־$cal(T)$.

#proof[
  כדי להראות ש־$cal(B)$ הוא בסיס לטופולוגיה על $RR$ עלינו להראות כי
  + לכל $x in RR$ קיים $B in cal(B)$ כך ש־$x in B$ (תנאי הכיסוי)
  + לכל $B_1, B_2 in cal(B)$ ולכל $x in B_1 inter B_2$ קיים $B_3 in cal(B)$ כך ש־$x in B_3 subset.eq B_1 inter B_2$ (תנאי החיתוך)
  יהי $x in RR$ ונבחר $a=x-1, b=x+1$ ו־$C = emptyset$.\
  אכן מתקיים $abs(emptyset)<=aleph_0$ ולכן $B=(x-1,x+1) without emptyset = (x-1, x+1) in cal(B)$ ו־$x in (x-1, x+1)$.\
  יהיו $B_1, B_2 in cal(B)$ ו־$x in B_1 inter B_2$.\
  מהגדרת $cal(B)$ קיימות $C_1, C_2 subset.eq RR$ כך ש־$abs(C_1), abs(C_2)<=aleph_0$ ו־$B_1 = (a_1, a_2) without C_1, space B_2 = (a_2, b_2) without C_2$ ולכן
  $
    B_1 inter B_2 = ((a_1, b_1) without C_1) inter ((a_2, b_2) inter C_2) =_"כללי דה־מורגן" ((a_1, b_1) inter (a_2, b_2)) without (C_1 union C_2)
  $
  מכיוון ש־$(a_1, b_1) inter (a_2, b_2)$ הוא גם קטע פתוח $(a_3, b_3)$ שאיננו ריק כי $x$ בחיתוך.\
  יתר על־כן, חיתוך של קבוצות לכל היותר בנות־מנייה הוא בן־מנייה נובע שאם נגדיר $C_3 = C_1 union C_2$ ו־$abs(C_3)<=aleph_0$.\
  נגיד $B_3 = (a_3, b_3) without C_3 in cal(B)$ ונשאר להראות ש־$x in B_3$: מכיוון ש־$x in B_1 inter B_2$ נובע ש־$x in (a_3, b_3)$ ו־$x in.not C_1 union C_2$ ולכן $x in B_3$ ומתקיים $B_3 = B_1 inter B_2$ ובפרט ההכלה הנדרשת מתקיימת.
]

#subquestion()
נוכיח כי $(RR, cal(T))$ הוא מרחב לינדלוף.

#proof[
  הגדרנו ש־$X$ מרחב לינדלוף אם ורק אם לכל כיסוי פתוח ${U_beta}_(beta in Omega) subset.eq tau$ של $X$ יש תת־כיסוי בן־מנייה, קרי יש $Omega_0 subset.eq Omega$ בת־מנייה כך ש־$X=union.big_(beta in Omega_0) U_beta$.\
  בתרגול ראינו שאם $X$ מרחב טופולוגי מטריזבילי אז הבאים שקולים
  + $X$ מקיים את אקסיומת המנייה השנייה
  + $X$ מרחב לינדלוף
  + $X$ ספרבילי
  אז אם נסתכל על $(RR, tau)$ כאשר $tau$ הטופולוגיה הסטנדרטית  (האחת המושרית ממטריקת המרחק מעל $RR$) הוא מרחב לינדלוף.\
  יהי ${U_alpha} subset.eq cal(T)$ כיסוי פתוח של $X$ ולכל לכל $x in RR$ קיימת פתוחה בסיסית $B_x = (a_x, b_x) without C_x$ בכיסוי כך ש־$x in B_x$.\
  נסתכל על האוסף ${(a_x, b_x)}$, זה כיסוי פתוח של $RR$ תחת הטופולוגיה הסטנדרטית ומכיוון ש־$RR$ עם הטופולוגיה הסטנדרטית הוא לינדלוף קיים תת־כיסוי בן־מנייה של קטעים $union.big_(n in NN) (a_n, b_n) = RR$.\
  נשים לב שכשאנחנו מאחדים את כל ה־$B_n = (a_n, b_n) without C_n$ אנחנו מאבדים את הנקודות שנמצאות בתוך $C_n$ אבל כל $C_n$ היא קבוצה בת־מנייה.\
  לכל $c_k in C$ מהגדרת הכיסוי קיים $U_(beta_k)$ בכיסוי כך ש־$c_k in U_(beta_k)$ ולכן נגדיר $U_beta = union.big_(k in NN) U_(beta_k)$ וגם זה אוסף בן־מנייה.\
  אם־כך, נגדיר את $Omega_0 = union.big_(n=1)^infinity (a_n, b_n) union union.big_(k=1)^infinity U_(beta_k)$ ואיחוד בן־מנייה של קבוצות בנות מנייה הוא בן־מנייה ולכן $(X, cal(T))$ הוא מרחב לינדלוף.
]

#subquestion()
נוכיח כי $(RR, cal(T))$ אינו מרחב ספרבילי.

#proof[
  תהיי $D={d_1, d_2, dots.h.} subset.eq RR$ קבוצה בת־מנייה ונראה שהיא אינה צפופה ב־$cal(T)$.\
  מכיוון ש־$RR$ אינו בן־מנייה, קיימת $x in RR$ כך ש־$x in.not D$ ונסתכל על הקבוצה בסיסית $ B=(x-1, x+1) without D $ ברור כי
  $B in cal(B)$ ו־$x in B$ כי $x in (x-1, x+1)$ ו־$x in.not D$.\
  מצד שני, $B inter D = emptyset$ ומצאנו נקודה $x in RR$ שיש לה סביבה פתוחה שאינה מכילה אף איבר מ־$D$ ולכן $x in.not closure(D)$.\
  הראינו שלכל קבוצה בת־מנייה $D$ קיים $x$ כך ש־$x in.not closure(D)$ אבל זה בידיוק אומר שאין קבוצה בת־מנייה צפופה ולכן המרחב לא ספרבילי.
]

#subquestion()
נסיק שהמרחב $(RR, cal(T))$ אינו מטריזבילי.

#proof[
  בתרגול ראינו שאם $X$ מרחב טופולוגי מטריזבילי אז הבאים שקולים
  + $X$ מקיים את אקסיומת המנייה השנייה
  + $X$ מרחב לינדלוף
  + $X$ ספרבילי
  מסעיף ב' $(X, cal(T))$ לינדלוף ומסעיף ג' $(X, cal(T))$ הוא לא מרחב ספרבילי ולכן לו בשלילה היה $(RR, cal(T))$ היה מרחב מטריזבילי היה נובע שהוא גם ספרבילי מה שלא נכון.
]

#question()
יהי $X=ZZ$ עם הטופולוגיה הנוצרת על־ידי $cal(B)={a+d ZZ bar a,d in ZZ, space d!=0}$ (הטופולוגיה של פירסטנברג).

#subquestion()
נוכיח שכל $B in cal(B)$ סגורה.

#proof[
  נראה שכל סדרה חשבונית היא גם קבוצה סגורה: שכן המשלימה של $a ZZ + b$ כלשהי היא הקבוצה
  $ ZZ - (a ZZ + b) = union.big_(b_i = 1, dots.h, abs(a)-1) [a ZZ + (b+b_i)] $
  כלומר איחוד של $abs(a)-1$ סדרות חשבוניות ולכן היא איחוד של קבוצות פתוחות בטופולוגיה ולכן פתוח והמשלים הוא קבוצה פתוחה ולכן $a ZZ + b$ היא גם סגורה.\
]

#subquestion()
נוכיח ש־$X$ רגולרי.

#proof[
  בהרצאה ראינו שמרחב טופולוגי הוא רגולרי אם ורק אם לכל $U$ פתוחה ולכל $x in U$ קיימת $V$ פתוחה כך ש־$x in V subset.eq closure(V) subset.eq U$.\
  תהיי $U$ קבוצה פתוחה כלשהי ויהי $x in U$, מהגדרת הטופולוגיה קיימת $B in cal(B)$ פתוחה בסיסית כך ש־$x in B subset.eq U$ ונבחר $V=B$.\
  בסעיף הקודם הוכחנו שכל $B in cal(B)$ סגורה ולכן מתקיים $closure(B)=B$ וקיבלנו את שרשרת ההכלות
  $ x in V = B = closure(V) subset.eq U $
  כלומר $x in V subset.eq closure(V) subset.eq U$ ומהניסוח השקול המרחב רגולרי.
]

#subquestion()
נסיק ש־$X$ מטריזבילי.

#proof[
  נשתמש במשפט המטריזציה של אוריסון: מרחב טופולוגי $T_3$ המקיים את אקסיומת המנייה השנייה הוא מטריזבילי.\
  אמרנו שמרחב הוא $T_3$ אם הוא מרחב $T_1$ וגם רגולרי.\ רגולריות ראינו בסעיף הקודם, נותר להוכיח $T_1$: בתרגיל הקודם ראינו שהמרחב שלנו הוא $T_2$ ומטענה שראינו בהרצאה נובע שהמרחב הוא גם $T_1$ כי $T_2 ==> T_3$.\
  ולכן המרחב שלנו הוא מרחב $T_3$.\
  מהגדרת הבסיס כל סדרה חשבונית נוצרת על־ידי שניי מספרים שלמים ולכן עוצמת הסדרות החשבוניות מעל השלמים הוא בן־מנייה (כי $ZZ times ZZ$ הוא בן־מנייה) ונובע מכך שלמרחב שלנו יש בסיס בן־מנייה לטופולוגיה כלומר מקיים את אקסיומת המנייה השנייה.\
  ממשפט המטריזציה של אוריסון נובע ש־$X$ מטריזבילי.
]
