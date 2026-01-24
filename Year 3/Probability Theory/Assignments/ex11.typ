#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 11 --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי $lambda > 0$ ויהיו $X_n ~ Bin(lambda/n, n)$. נוכיח כי $X_n stretch(arrow.r)_(n arrow.r infinity)^d Poi(lambda)$.

#proof[
  ראשית ניזכר שעבור $k in {0, dots.h, n}$ מתקיים
  $
    PP(X_n=k) = binom(n, k) (lambda/n)^k (1-lambda/n)^(n-k)=(n dot.op (n-1) dot.op dots.h.c dot.op (n-k+1))/k! (lambda/n)^k (1-lambda/n)^(n) (1-lambda/n)^(-k) \
    = lambda^k/k! (n dot.op (n-1) dot.op dots.h.c dot.op (n-k+1))/n^k (1-lambda/n)^(n) (1-lambda/n)^(-k)
  $
  נבחן מה קורה כאשר $n arrow.r infinity$ לכל איבר במכפלה, כאשר $lambda^k/k!$ נשאר קבוע:
  $
    lim_(n arrow.r infinity) (1-lambda/n)^(n) = e^(-lambda) \
    lim_(n arrow.r infinity) (1-lambda/n)^(-k) = 1 \
    lim_(n arrow.r infinity) (n dot.op (n-1) dot.op dots.h.c dot.op (n-k+1))/n^k = lim_(n arrow.r infinity) product_(j=0)^(k-1) (n-j)/n = lim_(n arrow.r infinity) product_(j=0)^(k-1) (1-j/n) = 1
  $
  כלומר
  $ lim_(n arrow.r infinity) PP(X_n = k) = lambda^k/k! e^(-lambda) $
  אבל ראינו שאם $X~Poi(lambda)$ מתקיים
  $ PP(X=k) = lambda^k/k! e^(-lambda) $
  וזו בידיוק ההגדרה של התכנסות בהתפלגות לפי נקודות הרציפות.
]

#question()
#subquestion()
יהיו $(X_n)_(n=1)^infinity$ סדרה של משתנים מקריים ויהי $c in RR$, נוכיח כי $X_n stretch(arrow.r)_(n arrow.r infinity)^d Y$ עבור $Y=^(a.s.) c$ אם ורק אם לכל $epsilon > 0$ מתקיים
$ PP(abs(X_n-c)<epsilon) stretch(arrow.r)_(n arrow.r infinity) 1 $
#proof[
  $<==$ מההנחה נקבל
  $ F_Y (x)= mycases(0, x<c, 1, x>=c) $
  כלומר יש לנו רציפות לכל $x!=c$.\
  מההגדרת התכנסות בהתפלגות נובע שבכל נקודת רציפות של $F_Y$ מתקיים $F_(X_n) (x) arrow.r_(n arrow.r infinity) F_Y (x)$.\
  בפרט, לכל $epsilon > 0$ נחלק לשני מקרים
  + $c-epsilon<0$ ולכן $F_(X_n) (c-epsilon) arrow.r 0$
  + $c+epsilon>0$ ולכן $F_(X_n) (c+epsilon) arrow.r 1$
  אבל
  $ PP(abs(X_n - c)< epsilon) = F_(X_n) (c+epsilon) - F_(X_n) (c-epsilon ) arrow.r_(n arrow.r infinity) 1-0 = 1 $
  $==>$ בכיוון השני, מההנחה נובע שלכל $epsilon > 0$
  $ PP(c-epsilon<X_n <c+epsilon) arrow.r_(n arrow.r infinity ) 1 $
  כלומר
  $ F_(X_n) (c-epsilon) arrow.r_(n arrow.r infinity) 0 wide F_(X_n) (c+epsilon) arrow.r_(n arrow.r infinity) 1 $
  יהי $x!=c$
  + אם $x<c$ נבחר $epsilon$ כך ש־$x<c-epsilon$ ולכן
    $ F_(X_n) (x) <= F_(X_n) (c-epsilon) arrow.r_(n arrow.r infinity) 0 = F_Y (x) $
  + אם $x>c$ נבחר $epsilon$ כך ש־$x>c+epsilon$ ולכן
    $ F_(X_n) (x) >= F_(X_n) (c+epsilon) arrow.r_(n arrow.r infinity) 1 = F_Y (x) $
  כלומר בכל נקודת רציפות של $F_Y$ מתקיים
  $ F_(X_n) (x) arrow.r_(n arrow.r infinity) F_Y (x) ==> X_n arrow.r_(n arrow.r infinity)^d Y =^(a.s.) c $
]

#subquestion()
תהיי $(X_n)_(n=1)^infinity$ סדרה של משתנים מקריים כך ש־$X_n >=^(a.s.) 0$ לכל $n$ ויהי $X$ משתנה מקרי בדיד כך ש־$supp(X) subset.eq NN union {0}$.\
נוכיח כי $X_n stretch(arrow.r)_(n arrow.r infinity)^d X$ אם ורק  אם לכל $m in NN union {0}$ ולכל $1> epsilon > 0$ מתקיים
$ lim_(n arrow.r infinity) PP(abs(X_n -m)<=epsilon) = PP(X = m) $
#proof[
  ראשית נבחין שאם נקבע $m in NN union {0}$ אז עבור $0<epsilon<1$ אנחנו מקבלים שהקטע $[m-epsilon, m+epsilon]$ מכיל רק את $m$ מבחינת הטבעיים ולכן
  $ {abs(X-m)<=epsilon} = {X = m} $
  שכן $X$ נתמך על $NN union {0}$ והוא משתנה מקרי בדיד.\
  #colbreak()
  $<==$ מהגדרת ההתכנסות בהתפלגות נובע $ PP(a<X_n <=b) arrow.r_(n arrow.r infinity) PP(a<X<=b) $
  כאשר $a,b$ נקודות רציפות של $F_X$.\
  מההערה לעיל ומהיות $m-epsilon, m+epsilon$ נקודות רציפות של $F_X$, כלומר
  $
    PP(abs(X_n-m)<=epsilon)=PP(m-epsilon<=X_n<=m+epsilon) arrow.r_(n arrow.r infinity) PP(m-epsilon<=X<=m+epsilon)=PP(X=m)
  $
  $==>$ מההנחה בכיוון השני נובע עבור $epsilon in (0,1)$
  $ F_(X_n) (k) = PP(X_n<=k) = sum_(m=0)^k PP(abs(X_n-m)<=epsilon) $
  אבל המאורעות ${abs(X_n-m)<=epsilon}$ הם זרים עבור $epsilon<1$ נובע שאם ניקח גבול
  $ F_(X_n) (k) arrow.r_(n arrow.r infinity) sum_(m=0)^k PP(X=m)= F_X (k) $
  כלומר לכל נקודת רציפות של $F_X$ מתקיים
  $ F_(X_n) (k) arrow.r_(n arrow.r infinity) F_X (x) $
  ומהגדרה
  $ X_n arrow.r_(n arrow.r infinity)^d X $
]

#question()
יהיו $X~Exp(2), Y~Unif([1,2])$ משתנים מקריים בלתי־תלויים. נחשב את $EE(X/Y)$.

#solution[
  נבחין ראשית כי $Y>0$ כמעט־תמיד ומהיות $X$ ו־$Y$ בלתי־תלויים נובע כי $X$ ו־$1/Y$ בלתי־תלויים (אי־תלות נשמרת תחת הפעלת פונקציות).
  אז מהגדרת התוחלת למשתנים מקרים בלתי־תלויים
  $ EE(X/Y) = EE(X)EE(1/Y) $
  מהיות $X~Exp(2)$ נובע כי
  $ EE(X) = 1/lambda = 1/2 $
  מהיות $Y~Unif([1,2])$ נובע כי
  $ forall 1<=y<=2, space f_Y (y) = 1 $
  שכן
  $ F_Y (t) = mycases(0, t<1, (t-1)/(2-1) = (t-1), 1<=t<=2, 1, t>2) $
  ואז עם האבחנה שנגזרת פונקציית ההסתברות המצטברת היא פונקציית צפיפות
  ואם־כך לפי הגדרת התוחלת של פונקציה של משתנה מקרי
  $ EE(1/Y)= integral_1^2 1/y dif y = [ln(y)]_(y=1)^(y=2)=ln(2) $
  אז
  $ EE(X/Y) = EE(X)EE(1/Y)= ln(2) dot.op 1/2 $
]

#question()
יהי $X~Unif([0,1])$ ו־$Z~Exp(2)$ בלתי־תלויים ויהי $Y=X+Z$. נחשב את הצפיפות של $Y$.

#solution[
  כידוע
  $ f_X (x) = mycases(1, 0<=x<=1, 0, "אחרת") wide f_Z (z) = mycases(2e^(-2z), z>=0, 0, "אחרת") $
  לפי טענה $8.55$ על צפיפות משותפת של סכום ועם נוסחת הקונבולוציה נקבל
  $ f_Y (y) = integral_(-infinity)^infinity f_X (x) f_Z (y-x) dif x $
  נבחן את תחומי האינטגרציה:
  מהיות $0<=x<=1$ ומכך שצריך להתקיים $y-x>=0$ נקבל $x<=y$ וביחד $x in [0, min(y, 1)]$ ולכן
  $
    f_Y (y) = integral_0^min(y, 1) 2e^(-2(y-x)) dif x = 2e^(-2y) integral_0^min(y, 1) e^(2x) dif x = 2e^(-2y) [1/2 e^(2x)]_(x=0)^(x=min(y, 1)) = e^(-2y)(e^(2min(1, y))-1)
  $
  אם $0<=y<1$ אז $min(1, y)=y$ ונקבל
  $ f_Y (y) = e^(-2y)(e^(2y)-1) = 1-e^(-2y) $
  אם $y>=1$ אז $min(1, y)=1$ ונקבל
  $ f_Y (y) = e^(-2y) (e^2-1) $
  כלומר
  $
    f_Y (y) = mycases(
      1-e^(-2y), 0<=y<1,
      e^(-2y)(e^2-1), y>=1, 0, y<0
    )
  $
]

#question()
#subquestion()
יהיו $omega, tau > 0$ ויהו $X~ cal(N)(0, sigma^2 tau^2), Y ~ cal(N) (0, tau^2)$. אזי $ sigma Y =^d X $
#proof[
  נגדיר $W = sigma Y$ והוא משתנה נורמלי לפי טענה 8.45 שראינו בהרצאה על תכונות של משתנה נורמלית בבחירת $alpha=sigma, beta = 0$ ונקבל
  $ sigma Y ~ cal(N)(0, sigma^2 tau^2) $
  מהנתון אותו $X~cal(N)(0, sigma^2 tau^2)$ נקבל ישר כי $sigma Y =^d X$.
]


#subquestion()
יהיו $X~ cal(N) (0, sigma^2), Y ~ cal(N)(0, tau^2)$ בלתי־תלויים עבור $tau, sigma > 0$ כלשהם. אזי
$ X+Y~cal(N) (0, tau^2 + sigma^2) $
#proof[
  יהי $Z in cal(N)(mu, sigma^2)$ ולפי טענה 8.45 תכונות של משתנה מקרי נורמלי מתקיים
  $ EE(Z) = mu wide Var(Z)=sigma^2 $
  ובמקרה שלנו עם לינאריות התוחלת נקבל
  $ EE(X+Y) = EE(X)+EE(Y)=0 $
  היות והמשתנים בלתי־תלויים אז $Cov(X, Y)=0$ ולכן מסכום של שנויות
  $ Var(X+Y) = sigma^2 + tau^2 $
]

#subquestion()
יהי $mu in RR$ ויהי $Z ~ cal(N)(0, sigma^2)$, נוכיח כי
$ mu+Z ~ cal(N)(mu, sigma^2) $
#proof[
  לפי ההערה בהוכחה של טענה 8.45 מספיק שנראה שהתוחלת היינה $mu$ והשונות היינה $sigma^2$.\
  החלק של השונות הוא ישיר מתכונת האדישות להזזות של השונות שכן $Var(X+t) = Var(X)$ לכל $t in RR$ (כאשר ל־$X$ יש שונות כמובן).\
  עבור התוחלת, מלינאריות התוחלת
  $ EE(mu + Z)=EE(mu)+EE(Z) =_(Z ~ cal(N)(0, sigma^2)) mu + 0 = mu $
]

#subquestion()
יהיו $sigma > 0, mu in RR$ ויהי $Z~cal(N)(0,1)$, נוכיח כי
$ mu + sigma Z ~ cal(N) (mu, sigma^2) $
#proof[
  באופן דומה לסעיף הקודם, מספיק שנראה כי $EE(mu + sigma Z)=mu, Var(mu + sigma Z) = sigma^2$.\
  נתחיל שוב מהשונות כי זה ישיר
  $
    Var(mu + sigma Z) =_"אדישות להזזות" Var(sigma Z) =_"כיול ריבועי" sigma^2 Var(Z) =_(Z ~ cal(N)(0, 1)) sigma^2 dot.op 1 = sigma^2
  $
  בשביל התוחלת
  $ EE(mu+sigma Z) =_"לינאריות" EE(mu) + sigma EE(Z) =_(Z ~ cal(N)(0,1)) mu + sigma dot.op 0 = mu $
]

#subquestion()
יהיו $sigma, tau > 0, mu, nu in RR$ ויהיו $X~ cal(N)(mu, sigma^2), Y~ cal(N)(nu, tau^2), Z~cal(N)(0,1)$ ונמצא $a, b in RR, b>0$ כך שמתקיים
$ X+Y=^d a + b Z $
#proof[
  נובע ישירות מכל הסעיפים הקודמים שכל משתנה נורמלי יכול להיכתב על־ידי צירוף לינארי עם משתנה מקרי נורמלי סטנדרטי
  $ a + b Z $
  עבור $b>0$, ואם כך
  $ X+Y=^d mu + nu + sqrt(sigma^2+nu^2)Z $
  כאשר השורש נובע מהכיול הריבועי של השונות שנצטרך לנרמל ובעצם קיבלנו מכל הסעיפים לעיל הצגה אפינית לסכום של משתנים מקריים מתפלגים נורמלית.
]

#question()
תהיי $(X_n)_(n=1)^infinity$ סדרה של משתנים מקריים כך ש־$X_n ~ Unif([n])$. נוכיח כי מתקיים
$ X_n/n stretch(arrow.r)_(n arrow.r infinity)^d Unif([0,1]) $

#proof[
  נגדיר $Y_n = X_n/n$ אזי
  מהיות ערכי $X_n in {1, 2, dots.h, n}$ נובע כי $Y_n in {1/n, 2/n, dots.h, 1}$ $(star)$.\
  אז לכל $x in RR$ מתקיים
  $ PP(X_n/n <= x) = PP(X_n <= x n) $
  אבל $X_n ~ Unif([n])$ ומ־$(star)$ נובע כי עבור $0<=x<=1$ מתקיים
  $ PP(X_n<=n x) = floor(n x)/n $
  כלומר
  $ F_n (x) =mycases(0, x<0, floor(n x)/n, 0<=x<1, 1, x>=1) $
  אז אם נקבע $x in (0,1)$ ונשאיף את $n$ לאינסוף נקבל
  $ floor(n x)/n arrow.r_(n arrow.r infinity) x $
  כלומר לכל $x in (0,1)$
  $ lim_(n arrow.r infinity) F_n (x) = x $
  כלומר
  $ F(x)=mycases(0, x<0, x, 0<=x<1, 1, x>=1) $
  אבל ההתכנסות הזאת רציפה על כל ערכייה ולכן נסיק
  $ X_n/n arrow.r^d Unif([0,1]) $
]

#question()
לכל $i in [n^2]$ נגדיר $X_i ~ Exp(i)$ כך ש־$X_1, dots.h, X_(n^2)$ בלתי־תלויים ונחשב את
$
  PP(det mat(delim: "[", X_1, X_(n+1), dots.h.c, X_(n^2-n+1); X_2, X_(n+2), dots.h.c, X_(n^2-n+2); dots.v, dots.v, dots.down, dots.v; X_n, X_(2n), dots.h.c, X_(n^2))=0)
$

#solution[
  ראשית $X_i ~ Exp(i)$ ולכן לכל $c in RR$ מתקיים $PP(X_i = c)=0$ מהגדרת המשתנה המקרי הרציף.\
  באינדוקציה על $n$: \
  עבור $n=1$ מתקיים $A=mat(X_1)$ וכן $det mat(delim: "[", X_1)=X_1$ ו־$X_1 ~ Exp(1)$ אז
  $ PP(X_1 = 0) = 0 = integral_0^0 e^(-x) dif x = 0 $
  שכן זו התפלגות רציפה.\
  נניח שהטענה נכונה למטריצות מגודל $(n-1) times (n-1)$ ונפתח את הדטרמיננטה של $A$ לפי העמודה האחרונה
  $ det(A) = sum_(k=1)^n (-1)^(k+n) X_(n^2-n+k) M_k $
  כאשר $M_k$ הוא המינור שמתקבל ממחיקת השורה $k$ והעמודה האחרונה.\
  אז אם נתנה על $ cal(F) = sigma(X_1, dots.h, X_(n^2-n)) $
  כל המינורים $M_k$ הם קבועים והמשתנים $X_(n^2-n+1), dots.h, X_(n^2)$ נשארים בלתי־תלויים, כלומר
  $ det(A)=sum_(k=1)^infinity (-1)^(k+n) M_k X_(n^2-n+k) $
  אבל מהנחת האינדוקציה, תת־המטריצה מסדר $(n-1) times (n-1)$ היא הפיכה בהסתברות $1$ ולכן לא ייתכן שכל המינורים $M_1, dots.h, M_k$ מתאפסים בו זמנית אלא באירוע בהסתברות $0$ כמעט־תמיד, כלומר
  $ PP(M_1, dots.h, M_n = 0) = 0 $
  נשים לב שאם נקבע $k$ כך ש־$M_k != 0$ נקבל
  $ Y = sum_(k=1)^n (-1)^(k+n) M_k X_(n^2-n+k) $
  שכן לא כל המקדמים הם אפס בהסתברות $1$ שכן אחרת ה־$n-1$ עמודות הקודמות היו תלויות לינארית בסתירה להנחה שלנו וכן $Y$ משתנה מקרי לא קבוע רציף בהחלט (אקספוננציאלי) כסכום של משתנים מקריים כאלו.\
  אבל מהגדרת המשתנה המקרי הרציף אנחנו יודעים שמתקיים
  $ PP(Y=0 bar cal(F)) = 0 $
  אבל מנוסחת התוחלת השלמה המותנית
  $ PP(det(A)=0)=EE[PP(det(A) = 0 bar cal(F))] = 0 ==> PP(det(A) =0) = 0 $
  קצת הסתבכתי עם לא לערב תורת המידה עם ההצדקה ללמה במקרה הזה הקבוצה ${A bar det(A) =0 }$ היא ממידה אפס, זה כן נובע אבל (נראה לי) מהעובדה שכשאנחנו מסתכלים על קבוצה ממימד נמוך יותר מהמרחב שאנחנו מדברים עליו הם ממידה אפס (רואים את זה גם באינפי3 על גרף של פונקציה): כי בסופו של יום דטרמיננטה $det: RR^(n^2) arrow.r RR$ היא פולינום לא קבוע כך שהקבוצה
  $ {x in RR^(n^2) bar det(x) = 0} $
  היא בעצם אוסף הפתרונות למשוואה אחת, כלומר ממימד נמוך יותר ועל־כן ממידה אפס ובהתאם עם הסתברות אפס (כי פונקציית הסתברות היא פונקציית מידה) שכן ל־$(X_1, dots.h, X_(n^2))$ יש צפיפות משותפת.
]
