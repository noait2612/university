#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 09 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהיו $(X, cal(A), nu)$ מרחב מידה $sigma$־סופי עם הפירוק $X = union.big.dot_n X_n$ כאשר $nu(X_n)<infinity$ ונגדיר
$ mu(E) colon.eq sum_(n=1)^infinity nu(E inter X_n)/(2^n (nu(X_n)+1)) $
בהרצאה הראינו כי $mu$ סופית ו־$mu lt.double nu$.

#subquestion()
נראה כי $mu$ ו־$nu$ שקולות, כלומר נראה שגם $nu lt.double mu$.

#proof[
  עלינו להראות שלכל $E in cal(A)$, $mu(E) = 0 ==> nu(E)=0$.\
  אז תהיי $A in cal(A)$ כך שמתקיים $mu(E)=0$, כלומר
  $ mu(E) = sum_(n=1)^infinity nu(E inter X_n)/(2^n (nu(X_n)+1)) = 0 $
  ראשית נבחין שיש לנו סכום של ערכים אי־שליליים ולכן הוא אפס אם ורק אם כל המחוברים היינם אפס, כלומר לכל $n in NN$
  $ nu(E inter X_n)/(2^n (nu(X_n)+1)) = 0 $
  נשים לב שהמכנה הוא מונוטוני עולה ממש כי $2^n>=2$ ובפרט $2^n >= 2^(n-1)$ לכל $n in NN$ ונתון כי $nu(X_n)>=0$ אז הדרך היחידה שהשבר שלנו ייתאפס זה אם ורק אם המונה הוא אפס, כלומר לכל $n in NN$ צריך להתקיים
  $ (star) space nu(E inter X_n)=0 $
  ומתקיים אם כך
  $
    nu(E) = nu(E inter X) =_("־סופיות"sigma) nu(E inter (union.big.dot_(n=1)^infinity X_n)) = nu(union.big.dot_(n=1)^infinity (E inter X_n)) =_"אדטיביות המידה" sum_(n=1)^infinity nu(E inter X_n)=_((star)) sum_(n=1)^infinity 0 = 0
  $
  כלומר מתקיים $nu(E)=0$ ולכן $nu lt.double mu$ וקיבלנו שהמידות שקולות.
]

#subquestion()
נחשב את נגזרות רדון־ניקודים $(dif nu)/(dif mu), (dif mu)/(dif nu)$.

#solution[
  נתחיל מלמצוא את נגזרת רדון־ניקודים $(dif mu)/(dif nu)$, כאשר $h = (dif mu)/(dif nu)$ היא הפונקציה המדידה היחידה (עד־כדי $nu$־כמעט תמיד) המקיימת
  $ mu(E) = integral_E h dif nu $
  ראשית נשים לב
  $ nu(E inter X_n) = integral_E bb(1)_(X_n) dif nu $
  ולכן
  $
    mu(E) = sum_(n=1)^infinity 1/(2^n (nu(X_n)+1)) dot.op integral_E bb(1)_(X_n) dif nu = integral_E underbrace(sum_(n=1)^infinity bb(1)_(X_n)/(2^n (nu(X_n)+1)), colon.eq h) dif nu
  $
  מותר לשנות את סדר האינטגרציה והסכום בגלל שהטור מתכנס בהחלט.\
  אז מצאנו פונקציה $h=sum_(n=1)^infinity bb(1)_(X_n)/(2^n (nu(X_n)+1))$ המקיימת $mu(E) = integral_E h dif nu$ ולכן מיחידות נגזרת רדון־ניקודים נקבל
  $ (dif mu)/(dif nu) (x) = sum_(n=1)^infinity (bb(1)_(X_n) (x))/(2^n (nu(X_n)+1)) $
  עבור $(dif nu)/(dif mu)$ נשתמש בגלל השרשרת שכן המידות שקולות והמרחב $sigma$־סופי
  $ (dif nu)/(dif mu) = ((dif mu)/(dif nu))^(-1) = 1/((dif mu)/(dif nu)) $
  ולכן
  $ (dif nu)/(dif mu) (x) = sum_(n=1)^infinity bb(1)_(X_n) (x)(2^n (nu(X_n)+1)) $
]

#question()

#question()

#question()
#subquestion()
נניח כי $nu, mu$ מידון רדון על מרחב טופולוגי קומפקטי מקומי $sigma$־קומפקטי.\
הראו כי אם לכל $U$ פתוחה מתקיים $nu(U)=mu(U)$ אז $mu=nu$.

#proof[
  יש לנו רגולריות פנימית שלכל $U$ פתוחה מתקיים
  $
    mu(U) = sup {mu(K) bar K subset U, "קומפקטית" K} \
    nu(U) = sup {nu(K) bar K subset U, "קומפקטית" K}
  $
  תהיי $K subset X$ קומפקטית, אבל $X$ האוסדרוף ולכן קבוצות קומפקטיות הן סגורות, כלומר
  $ mu(K) = inf{mu(U) bar "פתוחה" U, K subset U} $
  מהנתון שלכל $mu(U)=nu(U)$ נובע כי
  $ mu(K) = inf{mu(U) bar K subset U} = inf{nu(U) bar K subset U} = nu(K) $
  ולכן $mu$ ו־$nu$ מסכימות על קבוצות קומפקטיות.\
  מהיות $X$ מרחב $sigma$־קומפקטי נובע שכל קבוצה פתוחה יכולה להיכתב על־ידי איחוד בן־מנייה של קבוצות קומפקטיות ומהרגולריות הפנימית נקבל
  $ mu(U) = sup{mu(K) bar K subset U, "קומפקטית" K} $
  אבל לכל $K$ קומפקטי, $mu(K)=nu(K)$ ולכן $mu(U)=nu(U)$.\
  אז בפרט לכל $A$ קבוצת בורל
  $ mu(A) = inf{mu(U) bar A subset U, "פתוחה" U} = inf{nu(U) bar A subset U, "פתוחה" U} = nu(A) $
  כלומר $nu=mu$.
]

#subquestion()
נניח כי $f: RR^n arrow.r RR^n$ היא פונקציה דיפרנציאבילית עם נגזרות חלקיות רציפות, חד־חד ערכית ועל ועם $det(D_x f) !=0$.\
נסמן ב־$lambda_f$ את $f_*lambda$ כאשר $lambda$ מידת לבג.\
נראה כי $f_*lambda lt.double lambda$ ונחשב את נגזרת רדון־ניקודים $(dif f_*lambda)/(dif lambda)$.

#proof[
  נעזר בהנחייה וננחש את $h$:
  $ h(y) colon.eq abs(det D f^(-1) (y)) $
  כי לפי כל הנתונים $f$ היא דיפאומורפיזם ולכן זה מוגדר היטב וקיים והנחה טובה למשפט החלפת משתנה, אז נגדיר
  $ mu_h (A) = integral_A h dif lambda $
  ואם נראה שמתקיים $mu_h = f_*lambda$ נקבל כי $f_*lambda lt.double lambda$.\
  תהיי $B subset.eq RR^n$ כדור פתוח, אז מדחיפה קדימה של המידה
  $ f_*lambda (B) = lambda(f^(-1)(B)) $
  אבל כמו שאמרנו $f$ היא דיפאומורפיזם ולכן אם נפעיל את משפט החלפת משתנה על ההעתקה
  $ f^(-1) : B arrow.r f^(-1)(B) $
  נקבל
  $ lambda(f^(-1)(B))=integral_B abs(det D f^(-1) (y)) dif lambda = integral_B h dif lambda = mu_h (B) $
  כלומר $f_*lambda (B) = mu_h (B)$ לכל כדור פתוח $B$.\
  אבל כל $U subset.eq RR^n$ פתוחה יכולה להיכתב בתור איחוד בן־מנייה זר של כדורים פתוחים ולכן מאדטיביות המידה
  $
    f_*lambda (U) = f_*lambda(union.big.dot_(k=1)^infinity B_k) = sum_(k=1)^infinity f_*lambda (B_k) = sum_(k=1)^infinity mu_h (B_k) = mu_h (U)
  $
  אז לכל $U$ פתוחה
  $ f_*lambda (U) = integral_U h dif lambda $
  כלומר $f_*lambda$ ו־$mu_h$ מסכימות על קבוצות פתוחות ולכן הן מסכימות על קבוצות בורל, כלומר
  $ f_*lambda = h dif lambda $
  כלומר לכל $A subset RR^n$ מדידה מתקיים
  $ f_*lambda(A) = integral_A h(x)dif lambda $
  אבל אם $A$ ממידה אפס
  $ integral_A h dif lambda = 0 $
  לכל $h$ שכן אינטגרציה היא ביחס למידה!
  אז
  $ f_*lambda(A) = 0 ==> f_*lambda lt.double lambda $
]
