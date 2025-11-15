#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 04 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהי $(X, cal(A), mu)$ מרחב מידה.

#subquestion()
נוכיח כי אם לכל $(f_n)_(n=1)^infinity$ סדרת פונקציות מדידות המתכנסת במידה לפונקציה מדידה $f$ אזי קיימת לה תת־סדרה המתכנסת ל־$f$ כמעט־תמיד.

#proof[
  נאמר ש־$f_n arrow.r f$ במידה אם לכל $epsilon > 0$ מתקיים $mu({x bar abs(f_n (x)- f(x))>=epsilon}) arrow.r 0$.\
  נעבוד לפי ההדרכה, ניקח $epsilon_k = 1/k$ ומההתכנסות במידה קיים $n_k$ אינדקס כך שלכל $m>=n_k$ מתקיים
  $ mu({x in X bar abs(f_m (x)-f(x))>=epsilon_k})>1/2^k $
  ניקח אינדקסים כך ש־$n_(k+1) > n_k$ בצורה הבאה: עבור $k=1$ ניקח את $n_1$ ועבור $n_(k+1) > max(n_k, N_(k+1))$ כאשר $N_(k+1)$ הוא האינדקס שנקבל מההתכנסות עבור $epsilon_(k+1)$.\
  כלומר, $(f_n_k)_(k=1)^infinity$ כך שלכל $k<=1$ מתקיים $mu(E_k)<1/2^k$ כאשר $E_k colon.eq {x in X bar abs(f_n_k (x)-f(x))>=1/k}$.\
  מתקיים
  $ sum_(k=1)^infinity mu(E_k) < sum_(k=1)^infinity 1/2^k $
  כאשר זה האחרון הוא טור מתכנס ולכן מהלמה של בורל־קנטלי נקבל $mu(lim_(n arrow.r infinity) sup E_k)=0$.\
  אם $x_0 in.not lim_(n arrow.r infinity) sup E_k$ אז $x_0$ שייכת למספר סופי של איברים ב־$E_k$, ולכן קיים $K_0$ אינדקס מקסימלי שמכיל אותה ולכל $k>=K_0$ מתקיים $x_0 in.not E_k$, כלומר
  $ abs(f_n_k (x) - f(x))<1/k $
  כלומר $f_n_k (x) arrow.r f(x)$ לכל $x$ מחוץ לקבוצה ממידה אפס, כלומר $(f_n_k)_(k=1)^infinity$ כמעט בכל מקום.
]

#subquestion()
נסיק כי אם סדרת פונקציות $f_n$ מתכנסת כמעט תמיד ל־$g_1$ וב־$L^1$ ל־$g_2$ אזי $g_1 = g_2$ כמעט תמיד.

#proof[
  מהסעיף הקודם נובע של־$f_n$ יש תת־סדרה המתכנסת ל־$g_1$ כמעט תמיד, כלומר $f_n arrow.r g_1$.\
  נרצה להראות שהתכנסות ב־$L^1$ גוררת התכנסות במידה:
  יהי $epsilon > 0$, מההתכנסות ב־$L^1$ נובע
  $ mu({x in X bar abs(f_n (x)-f(x))>=epsilon})<=_"אי־שיוויון מרקוב" 1/epsilon integral abs(f_n - f) d mu arrow.r 0 $
  אז התכנסות ב־$L^1$ גוררת התכנסות במידה ובסעיף הקודם ראינו שזה גורר שיש לה תת־סדרה המתכנסת ל־$g_2$ כמעט תמיד, כלומר $f_n_k arrow.r g_2$ כמעט תמיד.\
  מכיוון ש־$f_n arrow.r g_1$ לפי הנתון, בפרט מתקיים $f_n_k arrow.r g_1$ ממשפט הירושה.\
  מהיות $f_n_k arrow.r g_1$ נובע כי קיים $N_1 in X$ שזו קבוצה ממידה אפס כך שמתקיים $lim_(k arrow.r infinity) f_n_k (x) = g_1 (x)$ לכל $x in X without N_1$.\
  באופן דומה, יש $N_2 in X$ קבוצה ממידה אפס כך שמתקיים $lim_(k arrow.r infinity) f_n_k (x) = g_2 (x)$ לכל $x in X without N_2$.\
  ניקח $N= N_1 union N_2$אז איחודם הוא גם קבוצה ממידה אפס (מלינאריות) ולכן לכל $x in X without N$ מתקיים $x in X without N_1$ או $x in X without N_2$, כלומר
  $ g_1 (x) = lim_(k arrow.r infinity) f_n_k (x) = g_2 (x) $
  כלומר $g_1 = g_2$ עד כדי קבוצה ממידה אפס, כלומר כמעט תמיד.
]

#subquestion()
נניח ש־$X$ מרחב מידה סופי ונוכיח כי אם $f_n arrow.r f$ כמעט תמיד אז $f_n arrow.r f$ במידה.

#proof[
  נניח ש־$X$ מרחב ממידה סופית. \
  מההנחה ש־$f_n arrow.r f$ נגדיר $A = {x in X bar f_n (x) arrow.r f(x)}$ אז נובע ש־$mu(X without A)=0$.\
  יהי $epsilon>0$, נרצה להראות ש־$mu({x in X bar abs(f_n (x)-f(x))>=epsilon}) arrow.r 0$.\
  לכל $n in NN$ נגדיר $B_n = {x in X bar abs(f_n (x)-f(x))>=epsilon}$.\
  מהיות $f_n arrow.r f$  כמעט תמיד, נובע שלכל $x in A$ מתקיים $f_n (x) arrow.r f(x)$, כלומר יש $n>=N$ כך ש־$x in.not B_n$ כמעט לכל $x in A$.\
  $ mu(B_n) = mu(B_n inter A) + mu(B_n inter (X without A)) = mu(B_n inter A) + 0 $
  נבחן את $mu(B_n inter A)$ כאשר $n arrow.r infinity$.\
  עבור $n$ גדול מספיק, כמעט לכל $x in A$ מתקיים $abs(f_n (x) - f(x))<epsilon$
  #todo
]

#question()
יהי $(X, cal(A), mu)$ מרחב מידה. ונניח כי $f, f_n$ פונקציות אי־שליליות כך ש־$f_n arrow.r f$ במידה. \
נראה כי $integral f d mu <= lim inf integral f_n d mu$
#proof[
  ראשית ניזכר שמהגדרת האינפימה, יש סדרת אינדקסים $(n_k)_(k=1)^infinity$ כך שמתקיים
  $ lim_(k arrow.r infinity) integral_X f_n_k d mu = liminf_(n arrow.r infinity) integral_X f_n d mu $
  וכמובן שכאשר הגבול קיים, $liminf = lim = limsup$.\
  כעת,   $f_n arrow.r f$ במידה משמע לכל $epsilon > 0$ מתקיים $mu({x bar abs(f_n (x) - f(x))>=epsilon}) arrow.r 0$ ובפרט בשאלה הקודמת ראינו שהתכנסות במידה גוררת קיום של תת־סדרה המתכנסת כמעט תמיד, כלומר לסדרה $(f_(n_k))$ יש תת־סדרה $(f_n_k_ell)_(ell=1)^infinity$ כך שמתקיים $f_n_k_ell (x) arrow.r f(x)$  כמעט תמיד.\
  כעת נשתמש בלמה של פאטו ונקבל
  $
    integral_X f d mu <= liminf_(ell arrow.r infinity) integral_X f_n_k_ell d mu = lim_(k arrow.r infinity) integral_X f_n_k d mu = liminf_(n arrow.r infinity) integral_X f_n d mu
  $

]

#question()
יהי $(X, cal(A), mu)$ מרחב מידה.\
נוכיח כי לכל $f:X arrow.r [0,infinity]$ מדידה ואינטגרבילית ולכל $epsilon > 0$ קיים $delta>0$ כך שלכל $E in cal(A)$ עם $mu(E)<delta$ מתקיים $integral_E abs(f) d mu < epsilon$.

#proof[
  יהי $epsilon>0$,  נשים לב שמתקיים
  $ lim_(M arrow.r infinity) integral_{x in X bar f(x) > M} f d mu = 0 $
  שכן מהיות האינטגרל סופי נובע כי קבוצת הנקודות שבהן $f$ שואפת/הינה אינסוף היא קבוצה ממידה אפס.\
  בפרט ניתן לבחור $M$ כזה כך שיתקיים
  $ integral_{x in X bar f(x) > M} f d mu < epsilon/2 $
  יהי $E in cal(A)$ מדידה, מלינאריות האינטגרל מתקיים
  $
    integral_E f d mu = integral_(E inter {x in X bar f(x) <=M}) f d mu + integral_(E inter {x in X bar f(x) >M}) f d mu <= integral_(E inter {x in X bar f(x) <=M}) f d mu + epsilon/2 \
    <=_"מונוטוניות האינטגרל" integral_(E inter {x in X bar f(x) <=M}) M d mu + epsilon/2 <=_"מונוטוניות האינטגרל והמידה" M dot.op mu(E) + epsilon/2
  $
  אז נבחר $delta = epsilon/(2M)$ ותהיי $E in cal(A)$ כך שמתקיים $mu(E)<delta$, אז עם מה שמצאנו מתקיים
  $ integral_E f d mu <= M dot.op mu(E) + epsilon/2 < M dot.op epsilon/(2M) + epsilon/2 = epsilon $
]

#question()
יהי $X$ מרחב מטרי קומפקטי מקומית. בהינתן $E!=emptyset$ נגדיר
$ d_E (x) colon.eq inf {d(x,y) bar Y in E} $

#subquestion()
נראה כי לכל $E$ כזו, $d_E : X arrow.r [0,infinity)$ היא רציפה.

#proof[
  כדי ש־$d_E$ תהיה רציפה ב־$x_0 in X$ עלינו להראות שלכל $epsilon > 0$ יש $delta>0$ כך שמתקיים
  $ d(x,x_0) < delta ==> abs(d_E (x)-d_E (x_0))<epsilon $
  יהיו $x_0, x in X$, אז לכל $y in E$ מתקיים
  $d_E (x_0) <= d(x_0, y)$
  ומאי־שיוויון המשולש
  $
    d(x,y) <= d(x,x_0) + d(x_0, y) <==> inf_(y in E) {d(x,y)}<=d(x,x_0) + inf_(y in E) {d(x_0,y)} \
    <==> d_E (x) <= d(x,x_0) + d_E (x_0) <==> d_E (x) - d_E (x_0) <= d(x,x_0)
  $
  מהסימטריות של המטריקה נחליף תפקידים בין $x, x_0$ ונקבל
  $ d_E (x_0) - d_E (x) <= d(x, x_0) $
  כלומר
  $ abs(d_E (x) - d_E (x_0))<=d(x,x_0) $
  זה נכון לכל $x,x_0 in X$ וזה בידיוק אומר ש־$d_E$ היא ליפשיצית עם קבוע ליפשיציות $1$ ופונקציה ליפשיצית היא רציפה עבור $delta=epsilon > 0$.
]

#subquestion()
תהיי $K subset X$ תת־קבוצה קומפקטית ו־$U$ קבוצה פתוחה המכילה אותה.\
נביע באמצעות פונקציות מהצורה $d_E$ פונקציה רציפה $f$ המקיימת $f bar_K = 1$ ו־$f bar_(U^c) = 0$.

#solution[
  אנחנו במרחב מטרי ולכן מהיות $K$ קומפקטית נובע כי היא סגורה, ולכן $K^c$ פתוחה.\
  באופן זהה, מהיות $U$ פתוחה אז $U^c$ סגורה.\
  ניזכר שבמרחב מטרי המרחק תמיד מתקבל מהסגירות והחסימות ולכן
  $ delta_0 = d(K, U^c) = {inf(d(x,y)) bar x in K, y in U^c} > 0 $
  עבור $x in U^c$ מתקיים $d_(U^c)(x)=0$ ואם $x in U$ מתקיים $d_(U^c) (x) > 0$.\
  עבור $x in K$, מהקומפקטיות מתקיים $d_K (x) = 0$ ולכל $x in X without K$ מתקיים $d_K (x) > 0$.\
  אנחנו רוצים שלכל $x in K$ יתקיים $f(x)=1$ ולכל $x in U$ יתקיים $f(x)=0$.\
  מיותר לציין שאם $x in K$ אז $x in.not U^c$ כי $x in K subset U$, ונחלק למקרים:
  $
    cases(
      x in K ==> d_K (x) = 0"," space d_(U^c)(x) < 0,
      x in U^c ==> d_K (x) > 0"," space d_(U^c) (x) = 0,
      x in.not K union U^c ==> d_K (x) > 0"," space d_(U^c) (x) > 0,
    )
  $
  כדי שיתקיימו התנאים שלנו, נגדיר
  $ f(x) = (d_(U^c) (x))/(d_(U^c) (x)+d_K (x)) $
  ראשית זו הרכבה של פונקציות רציפות ולכן רציף ובפרט מהפיצול למקרים שראינו לעיל נובע כי המכנה לעולם לא מתאפס ולכן רציפה ומוגדרת היטב.\
  נשאר להראות ש־$f bar_K = 1, f bar_(U^c) = 0$.\
  ואכן, אם $x in K$ מתקיים $f(x) = (d_(U^c) (x))/(d_(U^c) (x)+0)=1$ ואם $x in U^c$ מתקיים $f(x)=0/(0+d_K (x))=0$.
]
