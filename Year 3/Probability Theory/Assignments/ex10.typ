#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 10 --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי $(Y_i)_(i=1)^infinity$ סדרה של משתנים מקריים בלתי־תלויים ושווי התפלגות כך ש־$Y_i ~ Unif([0,1])$ לכל $i$.\
נגדיר סדרה נוספת של משתנים מקריים $(X_n)_(n=1)^infinity$ על־ידי $X_i = Y_i Y_(i+1)$.

#subquestion()
נחשב את תוחלת $X_i$ לכל $i$.

#solution[
  נתון כי $(Y_i)_(i=1)^infinity$ היא סדרה של משתנים מקריים בלתי־תלויים ולכן
  $ EE(X_i) = EE(Y_i Y_(i+1)) = EE(Y_i) EE(Y_(i+1)) $
  כאשר ראינו כבר בהרצאה את התוחלת של משתנה מקרי אחיד על $[0,1]$:
  $ EE(Y_i) = integral_0^1 y dot.op f(y) dif y = integral_0^1 y dot.op 1 dif y = [y^2/2]_(y=0)^(y=1) = 1/2 $
  ולכן
  $ EE(X_i) = 1/2 dot.op 1/2 = 1/4 $
]

#subquestion()
נחשב את השונות של $X_i$ לכל $i$.

#solution[
  שוב מהיות $Y_i$ בלתי־תלויים מטענה שראינו גם בהפעלה של פונקציה רציפה עליהם האי־תלות נשמרת ולכן גם $Y_i^2, Y_(i+1)^2$ הם בלתי־תלויים ונקבל
  $ Var(X_i) = EE(X_i^2)-EE(X_i)^2 = EE(Y_i^2 Y_(i+1)^2) - EE(Y_i Y_(i+1))^2 = EE(Y_i^2)EE(Y_(i+1)^2)-(1/4)^2 $
  כאשר את $EE(Y_i^2)$ נחשב על־ידי טענה 8.31 – תוחלת של פונקציה של משתנה מקרי ונקבל
  $ EE(Y_i^2) = integral_0^1 y^2 dif y = [y^3/3]_(y=0)^(y=1) = 1/3 $
  ולכן
  $ Var(X_i) = (1/3)^2 - (1/4)^2 = 1/9 - 1/16 = 7/144 $
  בשביל השונות המשותפת עלינו להבחין ש־$X_i, X_(i+1)$ בעלי שונות משותפת כי הם שניהם מסתמכים על $Y_(i+1)$ כלומר לכל $i$ מתקיים ש־$X_i, X_(i+1)$ תלויים ולכל $j!=i+1$ מתקיים $X_i, X_j$ שהם בלתי־תלויים. ונחשב:
  $ Cov(X_i, X_(i+1)) = EE(X_i X_(i+1))-EE(X_i)EE(X_(i+1)) = EE(X_i X_(i+1)) - 1/16 $
  ונכתוב
  $ X_i X_(i+1) = (Y_i Y_(i+1))(Y_(i+1) Y_(i+2))=Y_i Y_(i+1)^2 Y_(i+2) $
  ולכן מהיות המשתנים המקריים בלתי־תלויים (כזכור הפעלת הפונקציה משמרת את האי־תלות)
  $ EE(X_i X_(i+1)) = EE(Y_i Y_(i+1)^2 Y_(i+2)) = EE(Y_i) EE(Y_(i+1)^2) EE(Y_(i+2)) = 1/2 dot.op 1/3 dot.op 1/2 = 1/12 $
  ולכן
  $ Cov(X_i, X_(i+1)) = 1/12 - 1/16 = 1/48 $
]

#subquestion()
נוכיח כי סדרת הממוצעים מקיימת $ 1/n sum_(i=1)^n X_i arrow.r^d EE(X_i) $

#proof[#todo]

#question()
נניח כי $X,Y ~ Exp(1)$ בלתי־תלויים ונחשב את הצפיפות של $X-Y$.

#solution[
  ניזכר
  $ f_X (x) =mycases(e^(-x), x>=0, 0, x<0) wide f_Y (y) = mycases(e^(-y), y>=0, 0, y<0) $
  ומהיות $X,Y$ בלתי־תלויים נובע מאבחנה 8.52 כי מתקיים
  $ f_(X,Y) = f_X f_Y = mycases(e^(-(x+y)), x and y >= 0, 0, x or y< 0) $
  פונקציית הצפיפות של $D=X-Y$ תהיה
  $ PP(X-Y<=d) = integral.double_(x-y<=d) e^(-(x+y)) dif A $
  נשתמש במשפט פוביני כדי לענות על דרישת השאלה.\
  נתחיל מהמקרה של $d>=0$.\
  *קודם אינטגרל לפי $x$ ואז לפי $y$:* בקטע זה נסתכל על $x-y<=d$ כ־$0<=x<=y+d$ עבור $y$ מקובע, ולכן
  $
    F_D (d) = integral_0^infinity integral_0^(y+d) e^(-x)e^(-y) dif x dif y = integral_0^infinity e^(-y) [-e^(-x)]_(x=0)^(x=y+d) dif y = integral_0^infinity e^(-y)(1-e^(-(y+d)))=integral_0^infinity e^(-y)-e^(-2y+d) dif y \
    = [-e^(-y)+e^(-d)/2 e^(-2y)]_(y=0)^(y=infinity) = (0+0)-(-1+1/2 e^(-d)) = 1-1/2e^(-d)
  $
  *קודם אינטגרל לפי $y$ ואז לפי $x$:* בקטע זה נסתכל על $x-y<=d$ בתור $y>=x-d$ שכן $y>=0$ אז החסם התחתון יהיה $max(0, x-d)$ ובגלל שאנחנו במקרה בו $d>=0$ אז יש שני מקרים
  + אם $0<=x<=d$ אז $y>=0$
  + אם $x>d$ אז $y>=x-d$
  ונקבל שני אינטגרלים
  $
    F_D (d) = integral_0^d integral_0^infinity e^(-x)e^(-y) dif y dif x + integral_d^infinity integral_(x-d)^infinity e^(-x) e^(-y) dif y dif x
  $
  עבור האינטגרל הראשון
  $ integral_0^d e^(-x) [-e^(-y)]_(y=0)^(y=infinity) dif x = integral_0^d e^(-x) dif x = 1-e^(-d) $
  ועבור האינטגרל השני
  $
    integral_d^infinity e^(-x)[-e^(-y)]_(y=x-d)^(y=infinity) dif x = integral_d^infinity e^(-x)(e^(-(x-d))) dif x = e^d integral_d^infinity e^(-2x) dif x = e^d [e^(-2x)/(-2)]_(x=d)^(x=infinity) = e^d (0+1/2e^(-2d)) = 1/2e^(-d)
  $
  כלומר
  $ F_D (d) = (1-e^(-d))+1/2e^(-d) = 1-1/2 e^(-d) $
  עכשיו צריך לעבור למקרה בו $d<0$.\
  *קודם אינטגרל לפי $x$ ואז לפני $y$:* נסמן $d=-abs(d)$ והתנאי $x-y<=-abs(d)$ אומר $x<=y-abs
  d$ ובגלל ש־$x>=0$ אז $y-abs(d)>=0$ כלומר \
  $y>=abs(d)$ ונחשב את האינטגרל
  $
    F_D (d) = integral_(abs(d))^infinity integral_0^(y-abs(d)) e^(-x)e^(-y) dif x dif y = integral_abs(d)^infinity e^(-y) [-e^(-x)]_(x=0)^(x=y-abs(d)) dif y = integral_abs(d)^infinity e^(-y)-e^abs(d)e^(-2y) dif y = [-e^(-y)+e^abs(d)/2 e^(-2y)]_(y=abs(d))^(y=infinity) \
    = 1/2e^(-abs(d))=1/2 e^d
  $
  *קודם אינטגרל לפי $y$ ואז לפי $x$:* נשים לב שהתנאי $x-y<=d$ גורר $y>=x-d$ אבל $d$ שלילי ולכן $y>=x-d>x>=0$ ולכן מכל החישובים ממקודם
  $
    F_D (d) = integral_0^infinity integral_(x-d)^infinity e^(-y) e^(-x) dif y dif x = integral_0^infinity e^d e^(-2x) dif x =1/2 e^d
  $
  כמובן שמשפט פוביני שירת אותנו כנדרש כי האינטגרלים בכל החלפה התקבלו כזהים.\
  ובסך־הכל
  $ F_D (d) = mycases(1/2 e^d, d<0, 1-1/2 e^(-d), d>=0) $
  ושוב מהאבחנה אודות פונקציית צפיפות כנגזרת של פונקציית התפלגות מצטברת
  $ f_D (d) = mycases(1/2e^d, d<0, 1/2 e^(-d), d>=0) = 1/2 e^(-abs(d)) $
]

#question()
תהיי $a_n = omega(n)$ (כלומר $a_n/n stretch(arrow.r)_(n arrow.r infinity) infinity$), יהי $lambda>0$ ותהיי $X_n ~ Exp(lambda)$ סדרה של משתנים מקריים בלתי־תלויים שווי התפלגות.\
נוכיח בעזרת אי־שיוויון צ'רנוף כי $ PP(sum_(i=1)^n X_i >=a_n) stretch(arrow.r)_(n arrow.r infinity) 0 $

#proof[
  נתזכר את אי־שיוויון צ'רנוף: יהי $X$ משתנה מקרי בעל מומנט מעריכי. אז לכל $t>0$ עבורו $M_X (t)$ מוגדרת ולכל $a in RR$ מתקיים
  $ PP(X>=a)<=M_X (t) e^(-t a) $
  ראינו כי אם $X~Exp(lambda)$ אז עבור $t<lambda$ נקבל
  $ M_X (t) = lambda/(lambda -t) $
  מהאי־תלות הנתונה נובע כי אם נסמן $S_n = sum_(i=1)^n X_i$ אז
  $ M_(S_n) (t) = product_(i=1)^n M_(X_i) (t) = [M_X (t)]^n = (lambda/(lambda-t))^n $
  אז
  $ PP(S_n >= a_n)<=e^(-t a_n) (lambda/(lambda-t))^n $
  היות וצד ימין אי־שלילי ניקח לוגריתם ונקבל מימין
  $ -t a_n+ n ln(lambda/(lambda-t))=-t a_n + n ln(1/(1-t/lambda)) =-t a_n -n ln(1-t/lambda) $
  נגזור לפי $t$ ונקבל
  $
    -a_n - n dot.op 1/(1-t/lambda) dot.op (-1/lambda) = 0 <==> = -a_n+n/(lambda-t) = 0 <==> lambda -t = a_n/n <==> t = lambda-n/a_n
  $
  אבל $a_n = omega(n)$ ולכן $n/a_n stretch(arrow.r)_(n arrow.r infinity) 0$ אז $t arrow.r lambda$, אז
  $
    -t a_n + n ln(lambda/(lambda-t)) = (lambda-n/a_n) a_n + n ln(lambda/(n/a_n))=-lambda a_n + n - n ln(n/(lambda a_n))=-lambda a_n+n+n ln((lambda a_n)/n)= \
    n(-lambda a_n/n +1 +ln(lambda a_n/n))
  $
  אבל $a_n/n stretch(arrow.r)_(n arrow.r infinity) infinity$ ולכן מאריתמטיקה של גבולות נקבל  $ n(-lambda a_n/n +1 +ln(lambda a_n/n)) stretch(arrow.r)_(n arrow.r infinity) - infinity $
  כלומר
  $ PP(S_n >= a_n)<=e^(-t a_n) (lambda/(lambda-t))^n stretch(arrow.r)_(n arrow.r infinity) 0 $
]

#question()
יהיו ${X_(i,j)}_(i,j in NN union {0})$ קבוצה של משתנים מקריים בלתי־תלויים ושווי התפלגות כך ש־$X_(i,j)~Exp(4)$.\
לכל $i, j in NN$ נגדיר $Y_(i,j)=X_(i-1,j)+X_(i+1,j)+X_(i,j-1)+X_(i, j+1)$.\
נוכיח כי
$ (sum_(i,j=1)^n Y_(i,j))/n^2 stretch(arrow.r)_(n arrow.r infinity) 1 $

#proof[
  ניזכר
  $ X_(i,j)~Exp(4) ==> EE(X_(i,j))=1/lambda = 1/4 $
  ולכן מלינארית התוחלת
  $ EE(Y_(i,j))=EE(X_(i-1,j))+EE(X_(i+1,j))+EE(X_(i,j-1))+EE(X_(i,j+1))=4 dot.op 1/4 = 1 $
  וכן
  $ Var(X_(i,j))=1/lambda^2 = 1/16 ==> Var(Y_(i,j))=4 dot.op 1/16 = 1/4 $
  לא ניתן להשתמש בחוק החלש של המספרים הגדולים שכן $Y_(i,j)$ חלקם תלויים! \
  נסמן $S_n = sum_(i=1)^n sum_(j=1)^n Y_(i,j)$ ואנחנו רוצים לחשב את $Var(S_n)$ כאשר ממה שחישבנו לעיל נובע כי $EE(S_n)=n^2$ עם לינאריות התוחלת.\
  ניזכר כי
  $ Cov(X, Y)= EE((X- EE(X))(Y-EE(Y))) $
  אז אם נגדיר
  $ accent(X, hat) colon.eq X-EE(X), space accent(Y, hat) colon.eq Y-EE(Y) $
  אז
  $ Cov(X, Y)=EE(accent(X, hat) accent(Y, hat)) $
  מקושי־שוורץ ההסתברותי נקבל
  $ Cov(X, Y)=EE(accent(X, hat)accent(Y, hat))<=sqrt(EE(accent(X, hat)^2) EE(accent(Y, hat)^2)) $
  אבל
  $ EE(accent(X, hat)^2)=EE(X-EE(X)^2)=Var(X) $
  ולכן בפרט
  $ abs(Cov(X, Y))<=sqrt(Var(X)Var(Y)) $
  במקרה שלנו נקבל כי לכל $(i,j), (a,b)$ נקבל כי
  $ abs(Cov(Y_(i,j), Y_(a,b)))<=sqrt(1/4 dot.op 1/4) = 1/4 $
  ולכן נוכל לבחור $C=max abs(Cov(Y_(i,j), Y_(a,b)))$.\
  כעת נשים לב שיש מספר סופי של זוגות שעבורם יש לנו תלות (שכן צריך שיהיה אינדקס אחד משותף לפחות ביניהם) ולכן יש $K+1$ זוגות שלהם השונות המשותפת איננה אפס, אז מהגדרת השונות
  $ Var(S_n)=sum_((i,j))(sum_((a,b)) Cov(Y_(i,j), Y_(a,b)))=sum_(i,j=1)^n (K+1) C = n^2 dot.op accent(C, hat) $
  כאשר $accent(C, hat)$ הוא קבוע (כי כפלנו קבועים).\
  אז אם אקח
  $
    M_n = S_n/n^2 ==> Var(M_n)=Var(S_n/n^2)=_"כיול ריבועי" 1/n^4 Var(S_n) <= (n^2 dot.op accent(C, hat))/n^4 = accent(C, hat)/n^2 stretch(arrow.r)_(n arrow.r infinity) 0
  $
  אז מאי־שיוויון צ'בישב לכל $epsilon>0$
  $ PP(abs(S_n/n^2-1))<=Var(M_n)/epsilon^2 <= accent(C, hat)/(n^2 epsilon^2) stretch(arrow.r)_(n arrow.r infinity) 0 $
  אבל זה בידיוק אומר
  $ (sum_(i,j=1)^n Y_(i,j))/n^2 stretch(arrow.r)_(n arrow.r infinity) 1 $
  כנדרש.
]

#question()
תהיי ${X_i}_(i in NN)$ סדרת משתנים מקריים שווי התפלגות ובלתי־תלויים המקיימים $X_i~Ber(1/2)$ ויהי $U~Unif([0,1])$.\
נראה כי
$ sum_(i=1)^infinity 2^(-i) X_i =^d U $

#proof[
  נגדיר
  $ S = sum_(i=1)^infinity 2^(-i) X_i wide S_n = sum_(i=1)^n 2^(-i) X_i $
  אנחנו צריכים להראות
  $ forall t in [0,1], space PP(S<=t)=t $
  נשים לב
  $ 0<=S-S_n=sum_(i=n+1)^infinity 2^(-i) X_i <= sum_(i=n+1)^infinity 2^(-i) = 2^(-n) $
  נשים לב שמימין יש לנו זנב של טור גיאומטרי, אז
  $
    sum_(i=n+1)^infinity 2^(-i) = 2^(-n+1) sum_(k=0)^infinity (1/2)^k = 2^(-n+1) dot.op 1/(1-1/2) = 2^(-(n+1)) dot.op 2 = 2^(-n)
  $
  אז בפרט כאשר $n arrow.r infinity$ נובע כי $S_n stretch(arrow.tr)_(n arrow.r infinity) S$ וההתכנסות היא כמעט־תמיד.\
  כעת לכל $i$ מתקיים $X_i in {0,1}$ כי $X_i ~ Ber(1/2)$ ולכן ערכי $S_n$ הם מתוך הקבוצה ${k/2^n bar k in {0, 1, dots.h, 2^n-1}}$.\
  כעת לכל וקטור $(x_1, dots.h, x_n) in {0,1}^n$ מתקיים מהאי־תלות
  $ PP(X_1 = x_1, dots.h, X_n = x_n)=(1/2)^n $
  כלומר
  $ PP(S_n = k/2^n)=2^(-n) $
  יהי $t in [0,1]$ אז
  $ k/2^n<=t <==> k<=2^n t $
  כאשר $k in {0, 1, dots.h, 2^n-1}$
  כלומר אנחנו סופרים כמה מספרים טבעיים מהרשימה לעיל נמצאים בקטע $[0,2^n t]$ ולכן במקרה שלנו יש\
  $floor(2^n t)+1$ מספרים טבעיים כאלו, כלומר
  $ PP(S_n<=t) = (floor(2^n t)+1)/2^n $
  אז מההתכנסות כמעט־תמיד
  $
    PP(S<=t) = lim_(n arrow.r infinity) PP(S_n<=t)=lim_(n arrow.r infinity) (floor(2^n t)+1)/2^n = t ==> PP(S<=t)=t
  $
  נשים לב כי מהיות $U~Unif([0,1])$ נובע כי לכל $t in [0,1]$
  $ F_U (t) = t $
  כלומר
  $S=^d U$, כנדרש.
]

#question()
יהי $X~Unif([-pi/2, pi/2])$ ויהי $Y=tan(X)$. \
נחשב את פונקציית ההתפלגות המצטברת ואת פונקציית הצפיפות של $Y$.

#solution[
  ראשית מהיות $X~Unif([-pi/2, pi/2])$ נקבל מהגדרה 8.19 של התפלגות אחידה
  $
    f_X (t)=mycases(1/pi, t in [-pi/2, pi/2], 0, "אחרת") \
    space F_X (t) = mycases(0, t<-pi/2, (t+pi/2)/(pi), -pi/2<=t<=pi/2, 1, t>pi/2)
  $
  ואנחנו רוצים את
  $ F_Y (y) = PP(Y<=y) = PP(tan(X)<=y) $
  בקטע $(-pi/2, pi/2)$ הפונקציה $tan(x)$ היא מונוטונית עולה ממש ורציפה ולכן בלי לפגוע בסימן נקבל
  $ tan(X)<=y <==> X<=arctan(y) $
  אז מהחישוב של $F_X (t)$ לעיל נקבל
  $ F_Y (y) = (arctan(y)+pi/2)/pi $
  וכמובן לכל $y in RR$ מתקיים $arctan(y) in (-pi/2, pi/2)$ ולכן הביטוי לעיל מוגדר היטב, אז
  $ F_Y (y)=PP(Y<=y) = (arctan(y)+pi/2)/pi $
  ואנחנו יודעים ש־$X~Unif([-pi/2, pi/2])$
  בשביל הפונקציית צפיפות אפשר להשתמש באבחנה 8.14 שנגזרת של פונקציית ההסתברות המצטברת היא פונקציית צפיפות והפונקציה שלנו גזירה לכל $y in RR$ ולכן
  $ f_Y (y) = 1/(pi (1+y^2)) $
]

#question()
תהיי ${X_n}_(n in NN)$ סדרת משתנים מקריים בלתי־תלויים בעלי התפלגות אחידה על $[0,1]$.

#subquestion()
נוכיח כי למשתנה המקרי $1/X_n$ אין תוחלת לאף $n$.

#proof[
  מהיות $X_n~Unif([0,1])$ נובע כי $f(x)=1$ עבור $0<=x<=1$ ו־$0$ אחרת.\
  נגדיר $Y=g(X) = 1/X$ ואז מטענה 8.31 של תוחלת פונקציה של משתנה מקרי נקבל
  $ EE(Y)=integral_(-infinity)^infinity g(x) f_x (x) dif x = integral_0^1 1/x dot.op 1 dif x $
  אבל זה אינטגרל לא אמיתי, אז
  $
    EE(Y)=EE(1/X)=lim_(a arrow.r 0^plus) integral_a^1 1/x dif x = lim_(a arrow.r 0^plus)_a^1 = lim_(a arrow.r 0^plus) (ln(1)-ln(a))=infinity
  $
  אז אין תוחלת.
]

#subquestion()
נוכיח שסדרת הממוצעים מקיימת $1/n sum_(i=1)^n 1/X_i stretch(arrow.r)_(n arrow.r infinity) infinity$ כלומר עבור כל $M in RR$ מתקיים
$ PP(1/n sum_(i=1)^n 1/X_i >= M) stretch(arrow.r)_(n arrow.r infinity) 1 $

#proof[
  #todo
]
