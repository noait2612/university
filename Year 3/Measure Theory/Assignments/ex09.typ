#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 09 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)
#let inv = math.op("inv")

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
יהי $(X, cal(A), mu)$ מרחב מידה ותהיי $T:X arrow.r X$ העתקה משמרת מידה (כלומר $mu=T_*mu$).\
נניח כי $f in L^1$ ונגדיר $sigma$־אלגברה $inv(T) subset.eq cal(A)$ על־ידי
$ inv(T) colon.eq { E bar T^(-1)(E)=E} $
נזכיר את ההגדרה של התוחלת המותנית: תהיי $f in L^1$, בהינתן $cal(N) subset cal(A)$ $sigma$־אלגברה, נגדיר את $EE[f bar cal(N)]$ להיות הפונקציה היחידה המדידה לפי $cal(N)$ עד־כדי שיוויון כמעט־תמיד המקיימת לכל $G in cal(N)$
$ integral_G EE[f bar cal(N)] dif mu = integral_G f dif mu $
ונעיר בנוסף כי הקיום והיחידות של פונקציה זו ניתן על־ידי חישוב הנגזרת $(dif mu_f)/(dif mu)$ במרחב המדיד $(X, cal(N))$.

#subquestion()
נראה כי $EE[f bar inv(T)]$ היא $T$־אינווריאנטית.

#proof[
  נגנדיר
  $ g colon.eq EE[f bar inv(T)] $
  ונרצה להראות שכמעט־תמיד מתקיים $g compose T = g$.\
  $g$ היא $inv(T)$־מדידה לכל $B subset RR$ מתקיים
  $ {x bar g(x) in B} in inv(T) $
  שכן קבוצות ב־$inv(T)$ הן $T^(-1)$־אינווריאנטיות, כלומר
  $ {x bar g(T x) in B}=T^(-1) { x bar g(x) in B} in inv(T) $
  כלומר $g compose T$ היא $inv(T)$־מדידה.\
  תהיי $G in inv(T)$, מהיות $T$ משמרת מידה
  $ integral_G g compose T dif mu = integral_(T^(-1)(G)) g dif mu = integral_G g dif mu = integral_G f dif mu $
  מהגדרת התוחלת המותנית ולכן $g compose T = g$ כמעט־תמיד.0
]

#subquestion()
נניח כי $T$ הפיכה וכי $T^(-1)$  מדידה גם היא ונראה שכל $N$ ממידה אפס מוכלת בקבוצה אינווריאנטית ממידה אפס.

#proof[
  עלינו להראות שאם $N in cal(A)$ מקיימת $mu(N)=0$ אז קיימת $I in cal(A)$ כך שמתקיים
  $ N subset I, space mu(I) = 0, space T^(-1)(I)=I $
  נגדיר
  $ T^k = mycases(T compose dots.h.c compose T, k>0, id, k=0, T^(-1) compose dots.h.c compose T^(-1), k<0) $
  מהיות $T$ ו־$T^(-1)$ מדידות נובע שלכל $k in ZZ$, $T^k (N)$ היא קבוצה מדידה ומהיות $ZZ$ בת־מנייה
  $ I = union.big_(k in ZZ) T^k (N) in cal(A) $
  מהיות $T$ משמרת מידה, לכל $k in ZZ$
  $ mu(T^k (N)) = mu(N) = 0 $
  ומסכימות בת־מנייה
  $ mu(I) <= sum_(k in ZZ) mu(T^k (N))=0 ==> mu(I) = 0 $
  ואכן $I$ הוא $T$־אינווריאנטי, שכן
  $
    T^(-1)(I) = T^(-1)(union.big_(k in ZZ) T^k (N)) = union.big_(k in ZZ) T^(-1)(T^k (N)) = union.big_(k in ZZ) T^(k-1) (N)
  $
  אבל ${k-1 bar k in ZZ} = ZZ$ ולכן בפרט
  $ T^(-1)(I) = union.big_(k in ZZ) T^k (N) = I $
  וקיבלנו ש־$I$ הוא $T$־אינווריאנטי ולכן
  $ N = T^0 (N) subset I $
  כנדרש.
]

#subquestion()
נניח כי $mu$ שלמה ותהיי $overline(inv(T))$ ההשלמה של $inv(T)$.\
נמצא את הקבוצות שנמצאות בה.

#proof[
  קודם כל ההשלמה מוגדרת על־ידי
  $ overline(inv(T)) colon.eq { A in cal(A) bar exists I in inv(T), mu(A Delta I)=0} $
  תהיי $A in overline(inv(T))$ ולכן יש $I in inv(T)$ כך ש־$mu(A Delta I)=0$, אבל $T$ היא משמרת מידה ולכן
  $ mu(T^(-1) A Delta T^(-1) I)=mu(A Delta I)=0 $
  אבל $I$ הוא אינווריאנטי ולכן $T^(-1)I = I$ ולכן
  $ mu(A Delta T^(-1) A)<= mu(A Delta I) + mu(I Delta TT^(-1)A)=0 $
  ולכן כל $A in overline(inv(T))$ מקיים $mu(A Delta T^(-1)A)=0$.\
  אבל אם כך, אם נגדיר כמו בתרגיל 8
  $ A_1 = A, space A_(n+1) = T^(-1)(A_n) $
  לכל $n in NN$ נקבל
  $ mu(A_n Delta A_(n+1)) = 0 $
  ואם נגדיר
  $
    I_minus colon.eq liminf_(n arrow.r infinity) A_n = union.big_(k>=1) inter.big_(n>=k) A_n, wide I_plus colon.eq limsup_(n arrow.r infinity) A_n = inter.big_(k>=1) union.big_(n>=k) A_n
  $
  נקבל
  $ T^(-1)(I_minus) = I_minus, space T^(-1)(I_plus) = I_plus $
  כלומר $I_minus, I_plus$ הם $T$־אינווריאנטיים ולכן $I_minus, I_plus in inv(T)$.\
  ומתקיים גם
  $ mu(A_n Delta I_minus) = mu(A_n Delta I_plus) = 0 $
  כלומר $A in overline(inv(T))$, ולכן
  $ overline(inv(T)) = { A in cal(A) bar mu(A Delta T^(-1) A)=0} $
]

#question()
יהי $(X, cal(A), mu)$ מרחב הסתברות ו־$cal(N) subset cal(A)$ תת־$sigma$־אלגברה.

#subquestion()
נשתכנע (נוכיח) כי $L^2(cal(N)) subset L^2(cal(A))$ מוכל כתת־מרחב סגור ביחס לנורמת $L^2$.

#proof[
  תהיינה $f,g in L^2(cal(N))$ ו־$a,b in RR$ (או $CC$, לא משנה), אז $h=a f + b g$ היא $cal(N)$־מדידה ו־$integral abs(h)^2<infinity$ ולכן $L^2(cal(N)) subset L^2(cal(A))$.\
  בגלל ששני המרחבים מוגדרים על אותה הנורמה
  $ norm(f)_2 = (integral_X abs(f)^2 dif mu)^(1/2) $
  אז יש לנו איזומטריה
  $ norm(f)_(L^2(cal(N))) = norm(f)_(L^2(cal(A))) $
  בשביל הסגירות, תהיי $(f_n)_(n=1)^infinity subset.eq L^2(cal(N))$ כך שמתקיים $f_n arrow.r f in L^2(cal(A))$ ונראה ש־$f in L^2(cal(A))$.\
  בגלל שהתכנסות ב־$L^2$ גוררת התכנסות במידה, ולכן ממה שראינו יש לה תת־סדרה מתכנסת כמעט תמיד, כלומר $f_(n_k) (x) arrow.r f(x)$ כמעט־תמיד וכל $f_(n_k)$ היא $cal(N)$־מדידה אבל ראינו שהתכנסות נקודתית כמעט־תמיד של $cal(N)$־מדידות היא $cal(N)$־מדידה ולכן $f$ היא $cal(N)$־מדידה. \
  אבל גם $f in L^2(cal(A))$ ולכן $norm(f)_2 < infinity$ ולכן $f in L^2(cal(N))$ ולכן קיבלנו את הסגירות.
]

#subquestion()
נניח כי $f in L^2(cal(A))$ ו־$g in L^2(cal(N))$ חיוביות. נגדיר $mu_(f g)$ ו־$mu_f$ להיות מידות האינטגרציה כנגד $f$ ו־$f g$.\
נוכיח כי $mu_(f g) lt.double mu_f$ וכן $(dif mu_(f g))/(dif mu_f) = g$.

#proof[
  לכל $E in cal(A)$ נגדיר
  $ mu_f (E) colon.eq integral_E f dif mu, space mu_(F g) (E) colon.eq integral_E f g dif mu $
  מאי־שיוויון קושי־שוורץ נקבל
  $ integral abs(f g) dif mu <= norm(f)_2 norm(g)_2 < infinity $
  אבל מכך ש־$f in L^2(cal(A))$ נובע כי $integral abs(f)^2 dif mu < infinity$ ובהתאם  גם על $g$ ולכן צד־ימין של אי־השיוויון סופי ולכן $integral abs(f g) dif mu < infinity$, כלומר $f g in L^1(cal(A))$ ו־$mu_f, mu_(f g)$ מידות סופיות וחיוביות.\
  תהיי $E in cal(A)$ המקיימת
  $ mu_f (E) = integral_E f dif mu = 0 $
  ומהיות $f$ חיובית נובע כי $f eq.triple 0$ $mu$־כמעט תמיד על $E$ ולכן
  $ mu_(f g) (E) = integral_E f g dif mu = 0 $
  ולכן $mu_(f g) lt.double mu_f$.\
  בשביל להוכיח כי $(dif mu_(f g))/(dif mu_f) = g$ עלינו להראות שלכל $E in cal(A)$ מתקיים
  $ integral_E g dif mu_f = mu_(f g) (E) $
  ואכן
  $ integral_E g dif mu_f = integral_E g f dif mu = mu_(f g) (E) $
]

#subquestion()
נסביר מדוע $f,g$ הן למעשה ב־$L^1$ ונראה שמתקיים
$ EE[f g bar cal(N)]=g EE[f bar cal(N)] $

#proof[
  נעשה את הטריק על $f$ ובאופן זהה הוא גם על $g$: אנחנו יודעים ש־$(X, cal(A), mu)$ הוא מרחב הסתברות ולכן $mu(X)=1$ ו־$f in L^2(cal(A))$ אז מאי־שיוויון קושי־שוורץ
  $ integral abs(f) dif mu <= (integral abs(f)^2 dif mu)^(1/2) (integral 1^2 dif mu)^(1/2) = norm(f)_2 < infinity $
  אז $f in L^1(A)$ ובאופן זהה גם עבור $g in L^1(cal(N))$.\
  ראשית מהסעיף הקודם מהנימוק ש־$f g in L^1(cal(A))$ נובע כי $EE[f bar cal(N)], EE[f g bar cal(N)]$ הן בכלל מוגדרות היטב.\
  נשים לב כי $EE[f bar cal(N)]$ היא $cal(N)$־מדידה וב־$L^1(cal(N))$ (ראינו).\
  בשביל להראות את השיוויון המבוקש מספיק להראות מהגדרת התוחלת המותנית שלכל $G in cal(N)$ מתקיים
  $ integral_G EE[f bar cal(N)] dif mu = integral_G f g dif mu $
  אז תהיי $G in cal(N)$, מהיות $g bb(1)_(G)$ פונקציה $cal(N)$־מדידה ואינטגרבילית, מכיוון שמתקיים
  $ integral_G EE[f bar cal(N)] dif mu = integral EE[f bar cal(N)] bb(1)_(G) dif mu $
  נקבל
  $ integral_G g EE[f bar cal(N)] dif mu = integral g EE[f bar cal(N)] bb(1)_(G) dif mu $
  וכן
  $ integral_G f g dif mu = integral f g bb(1)_(G) dif mu $
  אבל משמאל נקבל
  $
    integral g EE[f bar cal(N)] bb(1)_(G) dif mu = integral EE[f bar cal(N)] (g bb(1)_(G)) dif mu = integral f (g bb(1)_(G)) dif mu
  $
  כאשר המעבר האחרון נובע מהגדרת התוחלת המותנית שכן $g bb(1)_(G)$ מדידה.
  אבל
  $ integral f (g bb(1)_(G)) dif mu = integral_G f g dif mu $
  כלומר לכל $G in cal(N)$ מיחידות התוחלת המותנית קיבלנו
  $ EE[f g bar cal(N)] = g EE[f bar cal(N)] $
  כנדרש.
]

#pagebreak()

#subquestion()
בעזרת רדון־ניקודים עבור מידות מרוכבות ניתן להגדיר את התוחלת המותנית עבור פונקציות לאו־דווקא חיוביות והוכחת הסעיף הקודם תהיה נכונה גם בלי להניח ש־$f,g$ חיוביות (ההגדרה החדשה תרחיב לינארית את ההגדרה עבור פונקציות חיוביות).\
נסיק כי לכל $f in L^2(cal(A))$ הפונקציה $EE_f = EE[f bar cal(N)]$ היא ההטלה האורתוגונלית של $f$ על $L^2(cal(N))$, כלומר לכל $g in L^2(cal(N))$ מתקיים
$ chevron.l f-EE_f, g chevron.r = 0 $
כאשר $chevron.l phi, psi chevron.r = integral_X phi psi dif mu$.

#proof[
  נגדיר מידה מורכבת על $cal(N)$ על־ידי
  $ nu(E) colon.eq integral_E f dif mu $
  מהיות $f in L^2 in L^1$ נקבל מכך שהמרחב מרחב הסתברות
  $ abs(nu(E))<=integral_E abs(f) dif mu <= norm(f)_1 < infinity $
  מתקיים $nu lt.double mu bar_(cal(N))$ וממשפט רדון־ניקודים קיימת ויחידה $EE_F in L^1(cal(N))$ וכמובן $cal(N)$־מדידה המקיימת
  $ nu(E) = integral_E EE_f dif mu $
  באופן זהה נגדיר
  $ nu_g (E) colon.eq integral_E f g dif mu $
  ומהסעיף הקודם / באופן דומה נקבל
  $ EE[f g bar cal(N)] = g EE(f bar cal(N)) $
  נחשב מכפלה פנימית
  $ chevron.l f-EE_f, g chevron.r = integral_X (f-EE_f)g dif mu = integral f g dif mu - integral EE_f g dif mu $
  אבל $g$ היא $cal(N)$־מדידה ואינטגרבילית ולכן
  $ integral EE_f g dif mu = integral f d dim mu $
  ולכן
  $ chevron.l f-EE_f, g chevron.r = 0 $
  במרחבי הילברט זה בידיוק אומר ש־$EE_f$ זו ההטלה האורותוגונלית של $f$ על $L^2(cal(N))$.

]

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
