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

#proof[תזכורת  $ liminf_(n arrow.r infinity) A_n = union.big_(k=1)^infinity inter.big_(n>=k) A_n, space limsup_(n arrow.r infinity) inter.big_(k=1)^infinity union.big_(n>=k) A_n $
  נראה רק עבור $liminf$, עבור $limsup$ ההוכחה זהה רק ההכלות מתחלפות בהתאם להגדרה.\
  ראשית נראה שלכל ${E_i}_{i in I} subset X$ עבור קבוצת אינדקסים כלשהי $I$ מתקיים
  $ T^(-1)(inter.big_(i in I) E_i) = inter.big_(i in I) T^(-1)(E_i) $
  שכן אם $x in X$, מתקיים
  $
    x in T^(-1)(inter.big_(i in I) E_i) <==> T(x) in inter.big_(i in I) E_i <==> forall i in I, T(x) in E_i <==> forall i in I, x in T^(-1)(E_i) <==> x in inter.big_(i in I) T^(-1)(E_i)
  $
  באופן דומה גם מתקיים
  $ T^(-1)(union.big_(i in I) E_i) = union.big_(i in I) T^(-1)(E_i) $
  שכן אם $x in X$, מתקיים
  $
    x in T^(-1)(union.big_(i in I) E_i) <==> T(x) in union.big_(i in I) E_i <==> exists i in I, T(x) in E_i <==> exists i in I, x in T^(-1)(E_i) <==> x in union.big_(i in I) E_i
  $
  אז נקבל אם כך
  $
    T^(-1)(liminf A_n) = T^(-1) (union.big_(k=1)^infinity inter.big_(n>=k) A_n) = union.big_(k=1)^infinity T^(-1)(inter.big_(k>=n) A_n) = union.big_(k=1)^infinity inter.big_(n>=k) T^(-1)(A_n)
  $
  מהגדרה הסדרה, $A_(n+1) = T^(-1)(A_n)$ עבור $n>=2$ ולכן
  $
    T^(-1)(liminf A_n) = union.big_(k=1)^infinity inter.big_(n>=k) A_(n+1) =_(m=n+1) union.big_(k=1)^infinity inter.big_(m>=k+1) A_m = union.big_(k=2)^infinity inter.big_(m>=k) A_m
  $
  נשאר למה להסביר למה $k=1$ לא משנה את האיחוד: נגדיר
  $ B_k colon.eq inter.big_(m>=k) A_m $
  ולכן כמובן $B_1 subset.eq B_2 subset.eq B_3 subset.eq dots.h.c$ וההזה של האינדקס לא משנה את האיחוד, שכן $B_1 subset.eq B_2$.\
  נחדד כי $B_1 subset.eq B_2 subset.eq dots.h.c$ שכן אם ניקח $x in B_1$, אז $x in A_m$ לכל $m>=1$ ולכן בפרט $x in A_m$ לכל $m>=2$, כלומר $x in B_2$ ולכן $B_1 subset.eq B_2$ וההוכחה הכללית זהה.
]

#subquestion()
נניח כי $mu$ מידת הסתברות ארגודית. \
נראה כי אם $T^(-1)(A)=A$ עד־כדי קבוצה ממידה אפס, כלומר
$ mu(T^(-1)(A) Delta A) = mu(T^(-1)(A) without A union A without T^(-1)(A))=0 $
אז $mu(A)=0$ או $mu(A)=1$.

#proof[
  נניח כי $T^(-1)(A)=A$ עד־כדי קבוצה ממידה אפס ולכן $T^(-1)(A), T^(-2)(A), T^(-3)(A)$ הן כמעט אותן הקבוצות עד־כדי קבוצה ממידה אפס ולכן נגדיר
  $ B colon.eq inter.big_(n=0)^infinity T^(-n) (A) $
  כלומר $B$ הן כל הנקודות שנשארת במקום ונטען כי $mu(A Delta B)=0$ שכן מהיות $mu$ אינוווריאנטית, לכל $n in NN$
  $ mu(T^(-n-1)A Delta T^(-n) A)= mu(T^(-1) A Delta A) =0 $
  יהי $x in A without B$, אז $x in.not T^(-n) (A)$ ולכן $A without B subset union.big_(n=1)^infinity (A without T^(-n) (A))$ וממונוטוניות המידה $mu(A without B) <= sum_(n=0)^infinity mu(A without T^(-n)(A))$, אבל לכל $n$ מתקיים $mu(A without T^(-n)(A))<=mu(A Delta T^(-n)(A))=0$ ולכן $mu(A without B) = 0$.\
  מצד שני, $B subset T^(-0)(A) = A$ ולכן $B without A=emptyset$ ו־$mu(emptyset)=0$.\
  לכן מתקיים $mu(A Delta B)=mu(A without B)+mu(B without A) = 0$.\
  נשים לב שגם מתקיים
  $
    T^(-1)(B) = T^(-1) (inter.big_(n=0)^infinity T^(-n) A)=inter.big_(n=0)^infinity T^(-(n+1)A)= inter.big_(m=1)^infinity T^(-m) A = B
  $
  כלומר גם $B$ אינוווריאנטית.\
  אז $mu(A Delta B)=0, mu(A)=mu(B) ==> mu(A) = 0 or mu(A)=1$ שזה בידיוק מה שהתבקשנו להראות.
]

#subquestion()
נאמר על פונקציה $f : X arrow.r RR$ שהיא $T$־אינווריאנטיות אם $f = f compose T$.\
נראה כי מידה $T$־אינווריאנטיות היא ארגודית אם ורק אם כל הפונקציות ה־$T$־אינווריאנטיות המדידות שוות לפונקציה קבועה כלשהי כמעט־בכל מקום.

#proof[
  נניח כי ארגודית, אז תהיי $f: X arrow.r RR$ פונקציה $T$־אינווריאנטיות מדידה ולכל $t in RR$ נגדיר
  $ A_t colon.eq {x bar f(x) > t} $
  מהיות $f$ מדידה נובע כי $A_t in cal(A)$, ומהיות $f = f compose T$ אז
  $ x in A_t <==> f(x) > t <==> f(T x) > t <==> T x in A_t <==> x in T^(-1) (A_t) $
  $mu$ כמעט־תמיד ולכן $mu(A_t Delta T^(-1)(A_t))=0$, ומהארגודיות נובע $mu(A_t)=0 or mu(A_t)=1$ לכל $t$.\
  אז נגדיר $c colon.eq inf { t bar mu(A_t)=0}$
  ואז אם $t<c$ נקבל $mu(A_t)=1$ ואם $t>c$ אז $mu(A_t)=0$, כלומר $f(x) = c$ כמעט תמיד.\
  בכיוון השני, תהיי $A in cal(A)$ כך שיתקיים $T^(-1)A=A (mod mu)$ ונסתכל על $f = bb(1)_(A)$, נקבל
  $ f compose T = bb(1)_(T^(-1)(A)) = bb(1)_(A) = f $
  וזה קורא $mu$־כמעט תמיד ולכן $f$ היא פונקציה $T$־אינווריאנטית מדידה.\
  מההנחה, קיים $c in RR$ כך ש־$bb(1)_(A)=c$, $mu$־כמעט תמיד ומהגדרת האינידקטור $c in {1,0}$, כלומר $mu(A)=0 or mu(A)=1$.\
  אבל זה נכון לכל $A in cal(A)$, כלומר קיבלנו ארגודית.
]

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

#proof[
  מהיות $nu$ $T$־אינווריאנטית נקבל $nu(A)=nu(T^(-1)A)$ לכל $A$ מדידה כלומר
  $ integral_A h dif mu = integral_(T^(-1)A) h dif mu $
  אבל $mu$ היא $T$־אינווריאנטית ולכן $integral_(T^(-1)A) h dif mu = integral_A h compose T dif mu$ לכל $A$ מדידה: כי אם ניקח $h = bb(1)_(B)$ עבור $B$ מדידה כלשהי, אזי
  $ integral_(T^(-1)A) bb(1)_(B) dif mu = mu(T^(-1)A inter B) $
  אבל
  $ T^(-1) A inter B = T^(-1) (A) inter B = T^(-1) (A inter T(B)) $
  אבל מה־$T$־אינווריאנטיות
  $ mu(T^(-1)(A inter T(B))) = mu(A inter T(B)) $
  אבל
  $
    integral_A bb(1)_(B) compose T dif mu = integral_A bb(1)_(T^(-1) B) dif mu = mu(A inter T(B)) ==> integral_(T^(-1) A) bb(1)_(B) dif mu = integral_A bb(1)_(B) compose T dif mu
  $
  ומלינארית האינטגרל זה נכון גם עבור פונקציות פשוטות ואם ניקח פונקציה כללית אי־שלילית מדידה $h$ כך ש־$h_k arrow.tr h$ ממשפט ההתכנסות המונוטונית
  $
    integral_(T^(-1) A) h_k dif mu = integral_A h_k compose T dif mu ==> integral_(T^(-1) A) h dif mu = integral_A h compose T dif mu
  $
  ובשביל פונקציה שאיננה אי־שלילית נסתכל על החלק החיובי והשלילי בנפרד.\
  אבל השיוויון
  $ integral_A h dif mu = integral_A h compose T dif mu $
  לכל $A in cal(A)$ גורר ש־$h=h compose T$ $mu$־כמעט תמיד וזה נובע ישירות מיחידות נגזרת רדון־ניקודים.\
  אבל מכאן נובע מהיות $mu$ ארגודית ומהשאלה הקודמת נובע כי $h = c$ עבור $c in RR$ $mu$־כמעט תמיד.\
  אבל $nu$ היא מידת הסתברות ולכן $ 1 = nu(X)=integral_X h dif mu = c mu(X)= c $
  ולכן $h=1$ $mu$־כמעט תמיד.
]

#subquestion()
נראה כי $h=1$ $mu$־כמעט תמיד ונסיק כי $nu=mu$.

#proof[מהארגודיות ומהשאלה הקודמת נובע שיש $c>=0$ כך ש־$h=c$ $mu$־כמעט תמיד ומהיות $nu$ מידת הסתברות
  $ 1 = nu(X)=integral_X h dif mu ==> 1 = integral_X c dif mu = c mu(X) $
  אבל גם $mu$ זו גם מידת הסתברות ולכן $mu(X)=1$ כלומר $c=1$ ולכן לכל $A$ מדידה
  $ nu(A)=integral_A h dif mu = integral_A 1 dif mu = mu(A) $
]

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
