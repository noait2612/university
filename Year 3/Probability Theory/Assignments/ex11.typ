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
  וזו בידיוק ההגדרה של התכנסות בהתפלגות.
]

#question()
#subquestion()

#proof[]

#subquestion()

#proof[]

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

#proof[]


#subquestion()

#proof[]

#subquestion()

#proof[]

#subquestion()

#proof[]

#subquestion()

#proof[]

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
  נסתכל על $v_1, v_2, dots.h, v_n$ העמודות של המטריצה $A$.\
  $A$ תהיה *לא* הפיכה אם ורק אם העמודות שלה הן תלויות לינארית, כלומר קיימת עמודה אחת לפחות שיכולה להיכתב כצירוף לינארי של העמודות האחרות.\
  נסתכל על העמודה $v_n$ ועל המרחב שנפרש על־ידי $n-1$ העמודות האחרות, כלומר $V_(n-1) = Span(v_1, v_2, dots.h, v_(n-1))$, מנוסחת התוחלת השלמה
  $ PP(det(A)=0)=EE(PP(v_n in V_(n-1) bar v_1, v_2, dots.h, v_(n-1))) $
]
