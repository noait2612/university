#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 08 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נניח כי $(X, cal(A))$ מרחב מדיד וכי $T : X arrow.r X$ מדידה.\
הגדרנו מידה על $X$ להיות $T$־אינווריאנטיות אם $T_* mu = mu$.\
מידה $T$־אינווריאנטיות $mu$ תיקרא ארגודית אם לכל $A$ מדידה המקיימת $T^(-1)(A) = A$ הקבוצה $A$ היא $mu$־טריוויאלית, כלומר $mu(A)=0$ או $mu(A^c)=0$.

#subquestion()
תהיי $A$ מדידה ונגדיר
$ A_1 = A, space A_(n+1) = T^(-1)(A_n) $
נראה כי $liminf A_n, limsup A_n$ הן $T$־אינווריאנטיות.


#proof[]

#question()
בשאלה הזאת נוכיח את המשפט הבא: יהי $X$ מרחב מדיד ו־$T: X arrow.r X$ מדידה. אז כל שתי מידות הסתברות $T$־אינווריאנטיות ארגודיות שונות הן סינגולריות אחת לשנייה.\
נניח לשם הפשטות ש־$T$ הפיכה ו־$T^(-1)$ מדידה גם־כן.

#subquestion()
יהיו $nu, mu$ שתי מידות הסתברות $T$־אינווריאנטיות.\
נכתוב את הפירוק לפי משפט לבג־רדון־ניקודים של $nu$ לפי $mu$ להיות $nu = nu_a + nu_s$.\
נראה כי $nu_a, nu_s$ גם הן $T$־אינווריאנטיות.

#proof[
  ראשית מהפירוק לפי משפט לבג־רדון־ניקודים מתקיים $nu_a lt.double mu$ וכן $nu_s perp mu$.\
  $nu, mu$ הן מידות $T$־אינווריאנטיות, כלומר
  $
    T_* mu = mu, space T_* nu = nu ==> space forall A in cal(A), space mu(T^(1)(A))=mu(A), space nu(T^(-1)(A))=nu(A)
  $
  נניח כי $mu(A)=0$ ולכן $mu(T^(-1)(A))=0$, אבל $nu_a lt.double mu$, היא רציפה בהחלט ומתקיים $T_* nu_a (A) = nu_a (T^(-1)(A))=0$, כלומר $T_* nu_a lt.double mu$.\
  מהיות $nu_s perp mu$, אז קיימת קבוצה מדידה $A$ כך שמתקיים
  $ nu_s (A^c) =0 = mu(A) $ ולכן בפרט
  $ T_* nu_s ((T^(-1)A)^c)= nu_s (A^c)=0, space mu(T^(-1)(A))=mu(A)=0 $
  כלומר $T_*nu_s perp mu$.\
  אבל $T_*$ היא לינארית, כלומר
  $ T_* nu = T_* nu_a + T_* nu_s $
  הערה בנוגע ללינאריות: אפשר לראות את ההוכחה ממש מהגדרה, אבל דחיפה קדימה של מידה היא לינארית בגלל שמידות הן לינארית על קבוצות ו־$T$ מדידה והדחיפה קדימה של מידה פועלת על מקורות, ומידות עצמן הן פונקציות לינאריות על אינדיקטורים. אז $T$ לינארית.\
  אבל $nu$ היא $T$־אינווריאנטיות, כלומר
  $ nu=T_* nu = T_* nu_a + T_* nu_s $
  נבחין כי ממה שמצאנו, $T_*nu_s perp mu, T_* nu_a lt.double mu$ מקיימים את תנאי משפט לבג־רדון־ניקודים, ומהיות משפט זה מביא לנו יחידות לפירוק נסיק כי
  $ T_* nu_a = nu_a, space T_* nu_s = nu_s $
  כלומר גם הן $T$־אינווריאנטיות.
]

#subquestion()
נסיק כי אם $nu$ ארגודית אז או ש־$nu=nu_a$ או $nu=nu_s$.

#proof[
  נניח כי $nu$ ארגודית, כלומר לכל $A$ מדידה המקיימת $T^(-1)(A)=A$ הקבוצה $A$ היא $nu$־טריוויאלית, כלומר $nu(A)=0 or nu(A^c)=0$.\
  מהיות $nu_a lt.double mu, nu_s perp mu$ נובע כי קיימת $A$ מדידה כך ש־$nu_a (A^c)=0=nu_s (A)$.\
  לכן מתקיים
  $
    nu(A) = nu_a (A) + nu_s (A) = 0 + nu_s (X) = nu_s (X) \
    nu(A^c) = nu_a (A^c) + nu_s (A^c) = nu_a (X) + 0
  $
  $nu$ ארגודית ונסתכל על $A$, מתקיים $nu(A)=0 or nu(A)=1$ (כי מידות הסתברות ומהגדרת הארגודית), וראינו $nu(A)=nu_s (X)$ אז בהכרח מתקיים
  $ nu_s (X) =0 or nu_s (X) = 1 $
  כלומר
  $ nu(A) = nu_s (X), space nu(A^c)=nu_a (X) $
]

#subquestion()
נניח כי $mu$ ארגודית וכן $nu=nu_a$ ונגדיר את $h$ להיות נגזרת רדון־ניקודים $(dif nu_a)/(dif mu)$.\
נראה כי $integral_A h dif mu = integral_A h compose T dif mu$ לכל $A$ מדידה ונסיק כי $mu h = h compose T$־כמעט בכל מקום.

#proof[#todo]

#subquestion()
נראה כי $mu h = 1$־כמעט תמיד ונסיק כי $nu=mu$.

#proof[#todo]

#question()
#subquestion()
יהיו $f,g in L^1 (RR)$ פונקציות אינטגרביליות לבג המחזירות ערכים אי־שליליים.\
נסמן את המידות שניתנות מאינטגרציה של פונקציות אלו
$ mu(E) = integral_E f dif lambda, wide nu(E) = integral_E g dif lambda $
נמצא תנאי מספיק והכרחי לכך ש־$mu perp nu$.

#proof[
  נסמן $mu perp nu$ אם ורק אם קיימות $A, B in RR$ מדידות וזרות כך ש־$mu(A^c)=nu(B^c)=0$.\
  נבחין שנובע מכך שמהיות $A,B$ זרות, אז $A subset.eq B^c$ ולן $0 = nu(B^c)>=nu(A) ==> nu(A)=0$, ולכן נוכל לקחת את $B$ להיות $A^c$.\
  כלומר ההגדרה שראינו למידות סינגולריות שקולה ללהגיד שקיימת $A$ מדידה כך ש־$mu(A)=0=nu(A^c)$, נשתמש בהגדרה הזאת כי היא נוחה יותר.\
  נטען שזה מתקיים אם ורק אם $f(x) dot.op g(x)= 0$ $lambda$־כמעט לכל $x in RR$.\
  נניח $f dot.op g = 0$ $lambda$־כמעט לכל $x in RR$ ונראה ש־$mu perp nu$: נגדיר את הקבוצות
  $ A colon.eq {x in RR bar f(x) > 0}, space B colon.eq { x in RR bar g(x) > 0} $
  מהיות $f dot.op g = 0$ $lambda$־כמעט תמיד, נובע כי $lambda(A inter B) = 0$. \
  נסתכל על $A, A^c$:
  $ nu(A)=integral_A g dif lambda = integral_(A inter B) g dif lambda + integral_(A without B) g dif lambda $
  אבל $lambda(A inter B) = 0$ ולכן המחובר הראשון הוא אפס, אבל גם המחובר השני הוא אפס כי בקבוצה $A without B$ מתקיים $g(x)=0$ לכל $x$.\
  בנוסף
  $ mu(A^c)=integral_(A^c) f dif lambda $
  אבל מהגדרת $A$, $f(x)=0$ לכל $x in A^c$, כלומר $mu(A^c)=0$ (כי הפונקציה אי־שלילית).\
  כלומר $nu(A)=0=mu(A^c)$ וזה בידיוק אומר $mu perp nu$ מהגדרה.\
  בכיוון השני, נניח ש־$mu perp nu$ ולכן יש $E$ מדידה כך ש־$mu(E)=0=nu(A^c)$, ולכן מהגדרות
  $
    mu(E) = integral_E f dif lambda = 0 \
    nu(E^c) = integral_(E^c) g dif lambda =0
  $
  מהראשון אנחנו מקבלים ש־$f(x)=0$ $lambda$־כמעט לכל $x in E$ ומהשני אנחנו מקבלים ש־$g(x)=0$ $lambda$־כמעט לכל $x in E^c$ ונבחן את המכפלה שלהם עבור $RR = E union E^c$:\
  עבור $x in E$, $f(x)=0$ $lambda$־כמעט תמיד ולכן $f(x)g(x)=0$ כמעט־תמיד.\
  עבור $x in E^c$, $g(x)=0$ $lambda$־כמעט תמיד ולכן $f(x)g(x)=0$ כמעט־תמיד.\
  וקיבלנו ש־$f(x)g(x)=0$ $lambda$־כמעט לכל $x in RR$.
]

#question()
יהיו $mu, nu_1, nu_2, dots.h$ מידות חיוביות על $X$ ונגדיר $nu=sum_(j=1)^infinity nu_j$.

#subquestion()
נוכיח שאם $nu_j perp mu$ לכל $j>=1$ אזי $nu perp mu$.

#proof[
  בדומה למה שראינו בשאלה הקודמת, מהיות $nu_j perp mu$ לכל $j$ נובע שקיימת $A_j$ מדידה כך ש־$mu(A_j)=nu(A_j^c)=0$.\
  נגדיר $A= inter.big_(j=1)^infinity A_j$ ועלינו להראות ש־$nu(A)=0$: נבחין שלכל $j$ מתקיים $A subset.eq A_j$ על־כן מתקיים ממונוטוניות המידה $nu_j (A)<=nu_j (A_j)$ וידוע גם $nu_j (A_j)=0$ ולך $nu_j (A)=0$, אז לכל $j$ מתקיים $0<=nu_j (A)<=0$ ולכן
  $ nu(A) = sum_(j=1)^infinity nu_j (A) = sum_(j=1)^infinity 0 = 0 $
  עוד צריך להראות כי $nu(A^c)=0$: נבחין
  $ A^c = (inter.big_(j=1)^infinity A_j) = union.big_(j=1)^infinity A_j^c $
  אבל מ־$sigma$־אדטיביות של המידה מתקיים
  $ mu(A^c)= mu(union.big_(j=1)^infinity A_j^c)<= sum_(j=1)^infinity mu(A_j^c)=sum_(j=1)^infinity 0 = 0 $
  אבל $mu$ מידה חיובית ולכן $mu(A^c)=0$.\
  אז $A = inter.big_(j=1)^infinity A_j$ מקיימת $mu(A^c)=0 = nu(A)$, כלומר $mu perp nu$.
]

#subquestion()
אם $nu_j lt.double mu$ לכל $j>=1$ אז $nu lt.double mu$.

#proof[
  יהי $A in cal(A)$ מדידה כך ש־$mu(A)=0$.\
  מהיות $nu_j lt.double mu$ לכל $j>=1$, נובע כי $nu_j (A)=0$ לכל $j>=1$ ולכן מהגדרת המידה נקבל
  $ nu(A) = sum_(j=1)^infinity nu_j (A) = sum_(j=1)^infinity 0 = 0 $
  כלומר $nu lt.double mu$.
]
