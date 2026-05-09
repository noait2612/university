#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 03 --- מבוא לטופולוגיה, 80516 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהיו $X,Y$ מרחבים טופולוגיים. אם $X$ ו־$Y$ הומיאמורפיים נסמן זאת ב־$X tilde.equiv Y$.

#subquestion()
תהיי $X$ קבוצה ויהי $(Y, tau_Y)$ מרחב טופולוגי.\
תהיי $f:X arrow Y$ פונקציה ו־$tau_X = f^*tau_Y$ הטופולוגיה המושרית על $X$ דרך $f$.\
יהי $(Z, tau_Z)$ מרחב טופולוגי נוסף ותהיי $g:(Z, tau_Z) arrow (X, f^*tau_Y)$ פונקציה.\
נוכיח ש־$g$ רציפה אם ורק אם $f compose g : (Z, tau_Z) arrow (Y, tau_Y)$ רציפה.

#proof[
  $<==$ נניח כי $g$ רציפה ומהגדרת הטופולוגיה המושרית מתקיים $tau_X = f^* tau_Y = {f^(-1)(U) bar U in tau_Y}$.\
  $f$ רציפה מהגדרה שכן כל קבוצה פתוחה ב־$Y$ המקור שלה פתוח ב־$X$ ומכיוון שהרכבת של פונקציה רציפות היא רציפה, הפונקציה $f compose g$ רציפה. \
  $==>$ נניח כי $f compose g$ רציפה ותהיי $V in tau_X$ קבוצה פתוחה כלשהי.\
  לפי הגדרת הטופולוגיה המושרית קיימת פתוחה $U in tau_Y$ כך שמתקיים $V=f^(-1)(U)$ אז נחשב
  $ g^(-1)(V) = g^(-1)(f^(-1)(U))= (f compose g)^(-1)(U) $
  אבל $f compose g$ רציפה ו־$U$ פתוחה ב־$Y$ ולכן המקור של $U$ תחת ההרכבה הוא פתוח ב־$Z$, כלומר $(f compose g)^(-1)(U) in tau_Z$ וכן $g^(-1)(V) in tau_Z$ ו־$g$ רציפה.
]

#subquestion()
יהיו $Y$ קבוצה, $(X, tau_X)$ מרחב טופולוגי, $f:X arrow Y$, $tau_Y = f_* tau_X$ הטופולוגיה המושרית על $Y$ דרך $f$, $(Z,tau_Z)$ מרחב טופולוגי נוסף ו־$g:(Y, f_* tau_X) arrow (Z, tau_Z)$.\
נוכיח כי $g$ רציפה אם ורק אם $g compose f:(X, tau_X) arrow (Z. tau_Z)$ רציפה.

#proof[
  בתור התחלה נשים לב שמהגדרה של הטופולוגיה המושרית על $Y$ דרך $f$ נובע כי $f$ רציפה שכן $tau_Y = f_* tau_X = { U subset.eq Y bar f^(-1)(U) in tau_X }$.\
  $<==$ נניח כי $g$ רציפה ושוב מכך ש־$f$ רציפה והרכבה של פונקציות רציפות הוא רציף נקבל $g compose f$ רציפה.\
  $==>$ נניח כי $g compose f$ רציפה. תהיי $V in tau_Z$ פתוחה ומתקיים
  $ (g compose f)^(-1)(V) = f^(-1)(g^(-1)(V)) $
  מההנחה על רציפות המקור של $V$ כפתוחה חייב להיות פתוח ב־$X$, כלומר $f^(-1)(g^(-1)(V)) in tau_X$.\
  מהגדרת הטופולוגיה המושרית $tau_Y$, קבוצה $U subset.eq Y in tau_Y$ אם ורק אם המקור שלה תחת $f$ הוא ב־$tau_X$ ולכן אם נסמן $U=g^(-1)(V)$ הרי ש־$f^(-1)(U) in tau_X$ ולכן בהכרח $U in tau_Y$ כלומר $g^(-1)(V) in tau_Y$ ולכן $g$ רציפה.
]

#subquestion()
יהי $(X, tau)$ מרחב טופולוגי ותהיי $sigma$ טופולוגיה נוספת על $X$.\
נראה ש־$id_X : (X, sigma) arrow (X< tau)$ רציפה אם ורק אם $sigma$ עדינה יותר מ־$tau$ (קרי $tau subset.eq sigma$).\
נסיק גם שהפונקציות
$ id_X^(-1) : (X,tau) arrow (X,sigma) wide id_X : (X, sigma) arrow (X, tau) $
הן רציפות אם ורק אם $tau=sigma$.

#proof[
  נסתכל על $f=id_X$, תהיי $U$ פתוחה אז $id_X^(-1)(U)=U$ ולכן בהכרח $id_X$ רציפה אם ורק אם לכל $U in tau$ מתקיים $id_X^(-1)(U) in sigma$ אם ורק אם לכל $U in tau$ מתקיים $U in sigma$ אם ורק אם $tau subset.eq sigma$.\
  בשביל ההסקה, היות והפונקציה ההופכית של פונקציית הזהות היא פונקציית הזהות בעצמה נובע ש־$id_X^(-1) = id_X : (X, tau) arrow (X, sigma)$.\
  אם־כך, מהחלק הקודם בסעיף נקבל סימטרייה וש־$id_X^(-1)$ רציפה אם ורק אם $sigma subset.eq tau$.\
  מההנחה שלנו שתי הפונקציות רציפות ולכן שתי ההכלות מתקיימות כלומר קיבלנו $tau=sigma$.
]

#question()
תהיי $(X, <=)$ קבוצת סדורה קווית ותהיי $tau = ordTopology(tau)$ טופולוגיית הסדר על $X$.\
נראה שהפונקציה $min:X times X arrow X$ הנתונה על־ידי
$ min(x_1, x_2) = mycases(x_1, x_1 <= x_2, x_2, x_2 <=x_1) $
רציפה.

#proof[
  נשים לב שהבסיס של $tau$ הוא אוסף כל הקטעים הפתוחים
  $ (a,b) = {x in X bar a<x<b} $
  נעזר בהנחייה ונגדיר
  $
    C_1 = {(x_1, x_2) in X times X bar x_1 <= x_2} \
    C_2 = {(x_1, x_2) in X times X bar x_2 <= x_1}
  $
  נראה ש־$C_1, C_2$ סגורות שמכסות את $X$.\
  בשביל זה נראה ש־$C_1$ סגורה כלומר ש־$C_1^c = {(x_1, x_2) bar x_1 > x_2}$ היא איחוד כל המלבנים הפתוחים מהצורה
  + $(x,infinity) times (-infinity, x)$ עבור $x in X$
  + $(x,infinity) times (-infinity,y)$ עבור $x, y in X$ עם $x<y$ ושאין $z in X$ המקיים $x<z<y$
  יהי $(x_1, x_2) in C_1^c$ כלומר $x_1 > x_2$, אנחנו רוצים מלבן פתוח $U times V$ כך שמתקיים
  $ (x_1, x_2) in U times V subset.eq {(y_1, y_2) bar y_1 > y_2} $
  נחלק לשני מקרים
  + אם קיים $x_1 > z > x_2$ אז נוכל להגדיר $U=(z,infinity), V = (-infinity, z)$ ונקבל $x_1 in U, x_2 in V$.\
    לכל $(y_1, y_2) in U times V$ מתקיים $y_1 > z$ וגם $z>y_2$ ולכן מטרנזטיביות $y_1 > y_2$ ו־$U times V subset.eq C_1^c$
  + אם לא קיים $z$ כך ש־$x_1 > z > x_2$ אז נגדיר $U=(x_2, infinity), V = (-infinity, x_1)$ ונקבל $x_1 in U, x_2 in V$.\
    מההנחה, לכל $(y_1, y_2) in U times V$ מתקיים ש־$y_1 in (x_2, infinity)$ כלומר $y_1 > x_2$ ומההנחה שלנו מכיוון שאין $z$ בין ל־$x_1, x_2$ נובע כי $y_1 >= x_2$ ומהלך זהה נקבל גם$y_2 < x_2$ ובסך־הכל $y_1 >= x_1 > x_2 >= y_2$ ולכן מטרנזטיביות $y_1 > y_2$ כלומר $U times V subset.eq C_1^c$.
  אז $C_1^c$ היא איחוד כל המלבנים הפתוחים ואיחוד של פתוחות הוא פתוח ולכן $C_1^c$ פתוחה ו־$C_1$ היא קבוצה סגורה וממהלך זהה נקבל שגם $C_2$ סגורה.\
  נשאר להראות ש־$C_1, C_2$ מכסות את $X$ ולכן נשתמש בהדבקה סגורה: \
  מהגדרת הסדר הקווי נובע שלכל זוג מתקיים $x_1 <= x_2$ או $x_2 <= x_2$ ולכן $X times X = C_1 union C_2$ וזה לא איחוד זר כי $C_1 inter C_2 = {(x_1, x_2) bar x_1 = x_2}$.\
  נגדיר $f_1 : C_1 arrow X, f_2 : C_2 arrow X$ על־ידי
  $ f_1 (x_1, x_2) = x_1 wide f_2 (x_1, x_2) = x_2 $
  במילים אחרות $f_1, f_2$  הן פונקציות ההטלה ולכן הן פונקציות רציפות ובפרט עבור כל $x_1 in C_1 inter C_2$ מתקיים ש־$f_1, f_2$ מזדהות.\
  נשים לב ש־$min(x, y)|_(C_2) = f_2$ וכן $min(x, y)|_(C_1) = f_1$ ולכן מהדבקה סגורה נובע ש־$min(x, y)$ רציפה על כל המרחב.
]

#question()
#subquestion()
נראה שאם $X_1 tilde.equiv Y_1$ ו־$X_2 tilde.equiv Y_2$ אזי $X_1 times X_2 tilde.equiv Y_1 times Y_2$.

#proof[
  מכך ש־$X_1 tilde.equiv Y_1$ אז קיימת $f:X_1 arrow Y_1$ שהיא הומיאומורפיזם כלומר חד־חד ערכית, על ורציפה עם $f^(-1)$ רציפה ובאופן דומה גם קיימת \
  $g:X_2 arrow Y_2$ שהיא הומיאומורפיזם.\
  נגדיר $h: X_1 times X_2 arrow Y_1 times Y_2$ על־ידי $h(x_1,x_2) = (f(x_1), g(x_2))$ ונראה פורמלית ש־$h$ אכן הומיאומורפיזם:
  + חד־חד ערכיות:
    $
      h(x_1, x_2) = h(x^prime_1 x^prime_2) <==> (f(x_1), g(x_2)) = (f(x^prime_1), g(x^prime_2)) <==> f(x_1) = f(x^prime_1) and g(x_2) = g(x^prime_2)
    $
    אבל $f,g$ חד־חד ערכיות ולכן $x_1 = x^prime_1, x_2 = x^prime_2$.
  + על:
    יהי $(y_1, y_2) in Y_1 times Y_2$ ומכך ש־$f,g$ הן על קיימים $x_1 in X_1, x_2 in X_2$ כך ש־$y_1 = f(x_1), y_2 = g(x_2)$ ולכן $h(x_1, x_2) = (y_1,y_2)$
  + רציפות: ראינו שבמכפלה של מרחבים טופולוגיים העתקה היא רציפה אם בכל קורדינאטה שלה היא רציפה ואכן $f,g$ רציפות
  + הופכית רציפה
    $ h^(-1)(y_1, y_2) = (f^(-1)(y_1), g^(-1)(y_2)) $
    וזאת רציפה באותו אופן בכל קורדינאטה כי $f^(-1), g^(-1)$ רציפות.
  אז $h$ היא הומיאומורפיזם ו־$X_1 times X_2 tilde.equiv Y_1 times Y_2$.
]

#subquestion()
ניתן דוגמה מרחבים $X,Y$ ולפונקציה $f:X arrow Y$ רציפה, חד־חד ערכית ועל אבל כך ש־$f^(-1)$ לא רציפה.

#proof[
  ניקח $X=[0,1)$ ו־$Y=S^1 subset.eq RR^2$ ונגדיר $f:[0,1) arrow RR^2$ על־ידי $f(t)=(cos(2pi t), sin(2pi t))$ והיא רציפה בכל קורדינאטה ולכן $f$ רציפה.\
  בנוסף, מכך ש־$t in [0,1)$ נובע מהגדרת מעגל היחידה ש־$f$ היא פונקציה על והיא חד־חד ערכית מהמחזוריות של $cos(2pi t), sin(2pi t)$ בקטע זה.\
  נשים לב ש־$f^(-1)$ לא רציפה בנקודה $(1,0)$ שכן אם נתקרב אליה על המעגל מצד אחד $t arrow 0$ ומצד שני $t arrow 1$ ו־$1 in.not [0,1)$.
]

#question()
יהיו ${(X_i, tau_i)}_(i in I)$ מרחבים טופולוגיים. יהי $X=product_(i in I) X_i$ ונסמן את ההטלות $pi_i : X arrow X_i$, טופולוגיית המכפלה על $X$ ב־$prodTopology(tau)$ ואת טופולוגיית התיבה על $X$ ב־$boxTopology(tau)$.

#subquestion()
יהי $(Y, tau_Y)$ מרחב טופולוגי ותהיי $f:Y arrow (X, prodTopology(tau))$ פונקציה.
נוכיח כי $f$ רציפה אם ורק אם לכל $i in I$ הפונקציה $pi_i compose f: Y arrow X_i$ היא רציפה.

#proof[
  הגדרנו את טופולוגיית המכפלה להיות הטופולוגיה המושרית מהבסיס
  $
    cal(B)_italic("prod") = {product_(i in I) U_i bar forall i in I, space U_i in tau_i, space U_i subset.eq X_i, space abs({beta in I bar U_beta != X_beta}) < infinity, space U_i = X_i "for almost every i"} \
    = {product_(i in I) U_i bar forall i in I, space U_i in tau_i, space U_i subset.eq X_i, space exists J subset I, s.t. space abs(J)<infinity and forall j in J, U_j = X_j}
  $
  $<==$ נניח ש־$f$ רציפה ויהי $i in I$.\
  מהגדרת טופולוגיית המכפלה, ההטלה $pi_i : X arrow X_i$ היא פונקציה רציפה ומכיוון שהרכבת פונקציות רציפות היא רציפה נובע כי $pi compose f : Y arrow X_i$ היא רציפה וזה נכון לכל $i in I$.\
  $==>$ נניח שלכל $i in I$ הפונקציה $pi_i compose f$ רציפה. עלינו להראות ש־$f$ רציפה.\
  אם כך, מספיק להראות שהמקור של כל קבוצה בסיסית פתוחה הוא פתוח ב־$Y$.\
  נסמן ב־$J subset I$ את קבוצת האינדקסים הסופית מההגדרה ותהיי $B in cal(B)_italic("prod")$ פתוחה.\
  מהבנייה שראינו בהרצאה של $cal(B)_italic("prod")$ נובע כי ניתן לכתוב את $B$ על־ידי חיתוכים של מקורות תחת הטלות, כלומר
  $B=inter.big_(j in J) pi_j^(-1)(U_j)$ ונחשב את $f^(-1)(B)$
  $
    f^(-1)(B) = f^(-1)(inter.big_(j in J) pi_j^(-1) (U_j))= inter.big_(j in J) f^(-1)(pi_j^(-1) (U_j))=inter.big_(j in J) (pi_j compose f)^(-1)(U_j)
  $
  מההנחה שלנו כל $pi_j compose f$ היא רציפה ולכן לכל $U_j$ פתוחה ב־$X_j$ מתקיים ש־$(pi_j compose f)^(-1)(U_j)$ פתוחה ב־$Y$.\
  אבל $J$ היא תת־קבוצה סופית אז $f^(-1)(B)$ זה חיתוך סופי של קבוצות פתוחות ולכן הוא פתוח ב־$Y$ והמקור של כל קבוצה בסיסית תחת $f$ הוא פתוחה ולכן $f$ רציפה.
]

#subquestion()
נניח ש־$I$ אינסופית וש־$abs(X_i)>=2$ לכל $i in I$ ונראה ש־$(X, prodTopology(tau))$ אינו דיסקרטי.

#proof[
  עלינו להראות ש־$prodTopology(tau) != cal(P)(X)$ ולכן מהספיק להראות שקיימת $U in cal(P)(X)$ כך ש־$U in.not prodTopology(tau)$ כלומר  מספיק שנראה שקיים $x in X$ כך ש־${x} in.not prodTopology(tau)$.\
  נניח בשלילה ש־${x} in prodTopology(tau)$. מהגדרת טופולוגיית המכפלה, כל קבוצה פתוחה (שאינה ריקה) מכילה קבוצה פתוחה בסיסית מהצורה
  $B = product_(i in I) U_i$ כך שלכל $i in I$ מתקיים $U_i in tau_i$ פתוחה ו־$J subset I$ סופית כך שלכל $j in J$ מתקיים $U_j = X_j$.\
  מכך ש־$B subset {x}$ ו־$B$ איננה ריקה חייב להתקיים $B={x}$ אבל גם לכל $j in J$ מתקיים $X_j = {x_j}$ אבל נתון ש־$abs(X_i)>=2$ לכל $i in I$ וזאת סתירה לכך ש־$abs(X_i)=1$.\
  אז היחידון ${x}$ לא פתוח ולכן הטופולוגיה לא יכולה להיות דיסקרטית.
]

#subquestion()
נסמן ב־$boxTopology(tau)$ את טופולוגיית הקופסאות על $X$ ונוכיח שאם $X_i$ דיסקרטי לכל $i in I$ אזי $(X, boxTopology(tau))$ הוא דיסקרטי.

#proof[
  הגדרנו את טופולוגיית הקופסה להיות הטופולוגיה הנוצרת על־ידי הבסיס $cal(B)_italic("box") colon.eq {product_(i in I) U_i bar U_i in tau_i}$ .\
  יהי $x in X$ ונראה ש־${x} in boxTopology(tau)$.\
  מהגדרת $X$ ניתן לכתוב את היחידון שלו על־ידי ${x} = product_(i in I) {x_i}$.\
  מהנתון, כל $(X_i, tau_i)$ הוא דיסקרטי ובמרחב דיסקרטי כל כל קבוצה היא גם סגורה וגם פתוחה ולכן לכל $i in I$ מתקיים ש־${x_i} in tau_i$.\
  מהגדרת $cal(B)_italic("box")$ נובע כי ${x} = product_(i in I) {x_i} in cal(B)_italic("box") subset.eq boxTopology(tau)$.\
  אז כל יחידון הוא פתוח וכל $U subset.eq X$ יכול להיות מיוצג על־ידי איחוד של יחידונים ולכן כל $U$ כזאת היא פתוחה ולכן $(X, boxTopology(tau))$ הוא דיסקרטי.
]

#subquestion()
נוכיח ש־$prodTopology(tau)=boxTopology(tau)$ אם ורק אם מספר האינדקסים $i$ שעבורם הטופולוגיה על $X_i$ אינה הטופולוגיה הטריוויאלית הוא סופי.

#proof[
  ראשית נסמן ב־$K = {i in I bar tau_i != {emptyset, X_i}}$ את קבוצת האינדקסים שעבורם הטופולוגיה על $X_i$ אינה הטופולוגיה הטריוויאלית.\
  ממה שראינו בהרצאה תמיד מתקיים $prodTopology(tau) subset.eq boxTopology(tau)$ ולכן נשאר רק להראות ש־$boxTopology(tau) subset.eq prodTopology(tau)$ אם ורק אם $K$ סופית.\
  $==>$ נניח כי $K$ סופית ותהיי $B in cal(B)_italic("box")$ קבוצה בסיסית לא ריקה כך ש־$B = product_(i in I) U_i$ עם $U_i in tau_i$ לכל $i in I$.\
  מכך ש־$I$ אינסופית, עבור כל $i in.not K$ נקבל ש־$tau_i$ היא טריוויאלית, אבל $U_i != emptyset$ ולכן $U_i = X_i$.\
  לכן ${i in I bar U_i != X_i} subset.eq K$ אבל $K$ סופית ולכן יש מספר סופי של אינדקסים שבהם $U_i != X_i$ ולכן $B in cal(B)_italic("prod")$ מהגדרה ו־$boxTopology(tau) subset.eq prodTopology(tau)$.\
  $<==$ נניח כי $boxTopology(tau) = prodTopology(tau)$ אבל $K$ אינסופית.\
  לכל $i in K$ הטופולוגיה $tau_i$ היא לא הטופולוגיה הטריוויאלית ולכן קיימת $U_i in tau_i$ כך ש־$U_i != emptyset$ וגם $U_i != X_i$.\
  לכל $i in.not K$ נגדיר $U_i = X_i$ ונתבונן ב־$B = product_(i in I) U_i$ ולכן $B$ היא קבוצה פתוחה ולא ריקה בטופולוגיית הקופסה ומההנחה היא גם פתוחה בטופולוגיית המכפלה ולכן היא חייבת להכיל גם קבוצה בסיסית לא ריקה של טופולוגיית המכפלה, כלומר קיים $V = product_(i in I) V_i$ כך ש־$V in cal(B)_italic("prod")$ עם $V subset.eq B$.\
  כלומר לכל $i in I$ מתקיים $V_i subset.eq U_i$ אבל $V$ היא קבוצת בסיס של טופולוגיית המכפלה ולכן $V_i=X_i$ לכל האינדקסים פרט למספר סופי ולכל השאר מתקיים $X_i subset.eq U_i$ כלומר $U_i = X_i$ אבל זו סתירה לבנייה שלנו על $K$ שהיא קבוצה אינסופית ונקבל ש־$U_i = X_i$ כמעט לכל $i in I$ וזאת סתירה ולכן $K$ סופית.
]

#question()
יהיו ${(X_n, d_n)}_(n in NN)$ מרחבים מטרים ויהי $X = product_(n in NN) X_n$.\
לכל $n in NN$ נגדיר את המטריקה
$ hat(d)_n (a,b) = min(d_n (a,b), 1) $
נראה שהמטריקה
$ d((a_n)_(n in NN), (b_n)_(n in NN)) = sum_(n in NN) 1/2^n hat(d)_n (a_n, b_n) $
על $X$ משרה את טופולוגיית המכפלה.

#proof[
  נסמן ב־$tau_d$ את הטופולוגיה המושרית מהמטריקה $d$ ועלינו להראות $prodTopology(tau) = tau_d$ כלומר $prodTopology(tau) subset.eq tau_d$ ו־$tau_d subset.eq prodTopology(tau)$.\
  $(subset.eq)$ מספיק שנראה שלכל $U in prodTopology(tau)$ ו־$a in U$ קיים $B_d (a,epsilon) subset.eq U$.\
  תהיי $U=product_(n in NN) U_n$ בסיסית בטופולוגיית המכפלה שמכילה את $a=(a_n)_(n in NN)$ ויהי $J subset NN$ קבוצת האינדקסים הסופית מהגדרת הבסיס עבורם $U_n = X_n$ לכל $n in.not J$ ו־$U_n$ פתוחה ב־$X_n$ עבור $n in J$.\
  לכל $n in J$ מכך ש־$U_n$ פתוחה ב־$X_n$ ו־$a_n in U_n$ נובע שקיים $epsilon_n > 0$ כך ש־$B_(d_n) (a_n, epsilon_n) subset.eq U_n$ ולכן בלי הגבלת הכלליות נניח $epsilon_n <=1$.\
  נבחר $epsilon = min_(n in J) epsilon_n/2^n$ ומכך ש־$J$ סופית נובע כי $epsilon > 0$.\
  ניקח $b=(b_n)_(n in NN) in B_d (a, epsilon)$ כלומר $d(a,b)<epsilon$ ולכן לכל $n in J$ נקבל
  $ 1/2^n hat(d)_n (a_n, b_n) <= d(a,b) < epsilon <= epsilon_n/2^n ==> hat(d)_n (a_n, b_n) < epsilon_n <=1 $
  ולכן בהכרח מתקיים $hat(d)(a_n, b_n) = d_n (a_n, b_n) < epsilon$ כלומר $b_n in U_n$ לכל $n in J$ ועבור $n in.not J$ מתקיים $b_n in X_n=U_n$ ולכן $b in U$ וסיימנו.\
  $(supset.eq)$ מספיק שנראה שלכל כדור $B_d (a, epsilon)$ קיימת בסיסית פתוחה $U in prodTopology(tau)$ כך ש־$a in U subset.eq B_d (a,epsilon)$.\
  אז יהי $B_d (a,epsilon)$ כזה ולכן מכך שהטור $sum_n 1/2^n$ מתכנס נובע שקיים $N$ כך שמתקיים
  $ sum_(n=N+1)^infinity 1/2^n < epsilon/2 $
  ונגדיר את $U_n$ בצורה הבאה:
  $ U_n = mycases(B_(d_n) (a_n comma epsilon/(2N)), n<=N, X_n, n>N) $
  לבסוף נגדיר $U = product_(n in NN) U_n$.\
  מכיוון ש־$U_n != X_n$ למספר סופי של אינדקסים $U$ היא אכן בסיסית פתוחה תחת טופולוגיית המכפלה ו־$a in U$.\
  יהי $b in U$ ונחשב
  $ d(a,b) = sum_(n=1)^N 1/2^n hat(d)_n(a_n, b_n) + sum_(n=N+1)^infinity 1/2^n hat(d)_n (a_n,b_n) $
  בשביל המחובר הראשון בסכום מכך ש־$n<=N$ ומכך ש־$b in U$ מתקיים $d_n (a_n, b_n) < epsilon/(2N)$ וכן $hat(d)_n <= d_n$ אז
  $ sum_(n=1)^N 1/2^n hat(d)_n(a_n, b_n) <= sum_(n=1)^N epsilon/(2N) = epsilon/2 $
  מצד שני, עבור $n>N$ מכך ש־$hat(d)_n <=1$ לכל שאר הצמדים נקבל
  $ sum_(n=N+1)^infinity 1/2^n hat(d)_n (a_n, b_n) <= sum_(n=N+1)^infinity 1/2^n < epsilon/2 $
  ולכן $d(a,b) < epsilon/2 + epsilon/2 = epsilon$ ולכן $b in B_d (a, epsilon)$ כלומר $U subset.eq B_d (a,epsilon)$.

]

#question()
נוכיח ש־${(x,y) in RR^2 bar x^2+y^2<=1} tilde.equiv {(x,y) in RR^2 bar max(abs(x), abs(y))<=1}$
כאשר הטופולוגיה על כל אחת מהקבוצות היא הטופולוגיה המושרית מ־$RR^2$.

#proof[
  עלינו למצוא פונקציה שהיא הומיאומורפיזם.\
  נגדיר
  $
    D = {(x,y) in RR^2 bar x^2+y^2<=1} \
    S = {(x,y) in RR^2 bar max{abs(x), abs(y)}<=1}
  $
  כאשר $D$ דיסק היחידה הסגור ו־$D$ ריבוע היחידה הסגור, אנחנו צריכים לבנות $f:D arrow S$ שהיא הומיאומורפיזם, כלומר $f$ צריכה לשמור את המרחק של נקודה מהראשית פר כל נורמה ובפרט שתשמור על זווית.\
  ניקח $v=(x,y) in RR^2$ ו־$norm(v)_2=sqrt(x^2+y^2)$ כלומר
  $ D = {v in RR^2 bar norm(v)_2 <=1} $
  ו־$norm(v)_infinity = max(abs(x), abs(y))$ כלומר
  $ S={v in RR^2 bar norm(v)_infinity <=1} $
  טבעי להגדיר אם־כך
  $ f(v)= mycases(norm(v)_2 / norm(v)_infinity v, v!= (0,0), (0,0), v = (0,0)) $
  היא מוגדרת היטב: לכל $v!=(0,0) in D$ מתקיים $norm(v)_2 <=1$ ואכן
  $
    (star) space norm(f(v))_infinity = norm(norm(v)_2 / norm(v)_infinity v)_infinity = norm(v)_2 / norm(v)_infinity norm(v)_infinity = norm(v)_2
  $
  כלומר $f(v) in S$.\
  כדי להראות שהיא חד־חד ערכית ועל, נגדיר את ההופכית שלה ישירות $g:S arrow D$ על־ידי
  $ g(w) = mycases(norm(v)_infinity / norm(v)_2 w, w!= (0,0), (0,0), w = (0,0)) $
  כדי להראות שהיא הופכית צריך להראות ש־$g(f(v))=v$ לכל $v!=(0,0)$ ו־$f(g(w))=w$ לכל $w!=(0,0)$ (בראשית זה טריוויאלי).\
  נסמן $w=f(v)=norm(v)_2 / norm(v)_infinity v$ ומ־$(star)$ נובע ש־$norm(w)_infinity = norm(v)_2$  אז רק נשאר לחשב את $norm(w)_2$
  $
    norm(w)_2 = norm(norm(v)_2 / norm(v)_infinity v)_2 = norm(v)_2 / norm(v)_infinity norm(v)_2 = norm(v)_2^2 / norm(v)_infinity
  $
  אז
  $
    g(w)=norm(w)_infinity / norm(w)_2 w = norm(v)_2 / (norm(v)_2^2 / norm(v)_infinity) (norm(v)_2 / norm(v)_infinity v) = (norm(v)_2 norm(v)_infinity)/norm(v)_2^2 norm(v)_2 / norm(v)_infinity v = v
  $
  כלומר אכן $g(f(v))=v$ ומהסימטרייה של ההגדרות שלנו נקבל שגם $f(g(w))=w$ ולכן $f$ היא העתקה חד־חד ערכית ועל ו־$g=f^(-1)$.\
  נוכיח רציפות עבור $f$, הרציפות עבור $g$ זהה: ברור שעבור $v!=(0,0)$ יש לנו רציפות כי העתקות הנורמות הן רציפות ולכן גם מנה שלהן רציפה וגם כפל בסקלר הוא רציף ולכן $f$ רציפה על $D without {(0,0)}$.\
  נשאר להראות רציפות בראשית: מ־$(star)$ מתקיים $norm(f(v))_infinity = norm(v)_2$ לכל $v != (0,0)$ אז כאשר $v arrow (0,0)$ גם $norm(v)_2 arrow 0$ כלומר $norm(f(v))_infinity arrow 0$ כלומר $f(v) arrow (0,0)$ ולכן $f$ רציפה בראשית.\
  אז $f$ רציפה, חד־חד ערכית ועל עם הופכית רציפה ולכן היא הומיאומורפיזם ונקבל ש־${(x,y) in RR^2 bar x^2+y^2<=1} tilde.equiv {(x,y) in RR^2 bar max(abs(x), abs(y))<=1}$.
]
