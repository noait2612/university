#import "../../../src/article.typ": *
#show: article.with(
  title: [  פתרון מבחן 2023 א' --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#let Leb = math.op("Leb")
#question()
תהיי $mu$ מידת בורל על $RR$ ונניח שקיימת $F:RR arrow.r RR$ כך שלכל $a < b in RR$ מתקיים $mu((a,b])=F(b)-F(a)$.

#subquestion()
נוכיח כי $F$ רציפה מימין.

#proof[
  עלינו להראות שלכל $x_0 in RR$ מתקיים
  $ lim_(x arrow.r x_0^plus) F(x) = F(x_0) $
  ובאופן שקול
  $ lim_(x arrow.r x_0^plus) F(x)-F(x_0)= 0 $
  תהיי ${x_n}_(n=1)^infinity$ כך ש־$x_n > x_0$ ו־$x_n arrow.b x_0$ ולכן מתקיים
  $ mu((x_0, x_n])=F(x_n) - F(x_0) $
  אז נגדיר $E_n colon.eq (x_0, x_n]$ ונקבל $E_1 supset.eq E_2 supset.eq dots.h$ ומתקיים $inter_(n=1)^infinity E_n = inter_(n=1)^infinity (x_0, x_n] = emptyset$.\
  $mu$ היא מידת בורל על $RR$ וסופית על קטעים חסומים (כי קטע חסום וסגור ב־$RR$ הוא קומפקטי) ולכן $mu(E_1) < infinity$ וממונוטוניות המידה לחיתוכים
  $ lim_(n arrow.r infinity) mu(E_n) = mu(inter.big_(n=1)^infinity E_n)=mu(emptyset) = 0 $
  כלומר
  $ lim_(n arrow.r infinity) (F(x_n)-F(x_0))=0 $
]

#subquestion()
יהי $x_0 in RR$ ונניח כי $lim_(x arrow.r x_0^plus)-lim_(x arrow.r x_0^minus)=a>0$ ובפרט ששני הגבולות קיימים.\
נבחן מה זה אומר על $mu$.

#proof[
  זה אומר ש־$mu({x_0})=a$.\
  מסעיף א' נובע כי $F$ רציפה מימין ולכן הביטוי הוא $F(x_0)-F(x_0^minus)=a$.\
  ניקח ${x_n}_(n=1)^infinity$ כך ש־$x_n < x_0$ וכן $x_n arrow.t x_0$ ואם נסתכל על $(x_n, x_0]$ נקבל
  $ mu((x_n, x_0])=F(x_0)-F(x_n) $
  אבל כאשר $n arrow.r infinity$ מתקיים $(x_1, x_0] supset.eq (x_2, x_0] supset.eq dots.h.c$ כלומר $inter_(n=1)^infinity (x_n, x_0]={x_0}$.\
  הפעם ממונוטוניות המידה כלפי מעלה
  $
    mu({x_n})= lim_(n arrow.r infinity) mu((x_n, x_0]) \
    mu({x_n})=lim_(n arrow.r infinity) (F(x_0)-F(x_n)) \
    mu({x_0})=F(x_0)-lim_(n arrow.r infinity) F(x_n) = F(x_0) - F(x_0^minus) = a
  $
]

#subquestion()
נניח ש־$mu$ רציפה בהחלט ביחס למידת לבג ונראה ש־$F$ גזירה כמעט בכל מקום ולכן $a<b in RR$ מתקיים
$ F(b)-F(a) = integral_a^b F'(t) dif t $

#proof[
  נסמן ב־$lambda$ את מידת לבג, אז מהנתון $mu lt.double lambda$.\
  $mu$ מידת בורל על $RR$ ולכן היא $sigma$־סופית ולכן קיימת לפי משפט רדון־ניקודים־לבג $f=(dif mu)/(dif lambda)$ כך שלכל קבוצה מדידה $E$ מתקיים
  $ mu(E) = integral_E f(t) dif lambda (t) $
  כלומר
  $ integral_a^x f(t) dif t = F(x)-F(a) = mu((a,x]) $
  ו־$f in L^1$ ולכן לפי משפט הגזירה של לבג מתקיים כמעט לכל $x$
  $ F'(x) = dif/(dif x) = integral_a^x f(t) dif t = f(x) $
  כלומר
  $ F(b)-F(a)=integral_a^b f'(t) dif t $
]

#question()
יהי $(X, cal(A), mu)$ מרחב מידה ותהיי ${f_n}_(n=1)^infinity$ סדרת פונקציות מדידות.

#subquestion()
נוכיח שלא בהכרח שמתקיים $integral_X limsup_(n arrow.r infinity) f_n dif mu >= limsup_(n arrow.r infinity) integral_X f_n dif mu$.

#proof[
  הלמה של פאטו אומרת שמתקיים
  $ integral liminf_(n arrow.r infinity) f_n dif mu <= liminf_(n arrow.r infinity) integral f_n dif mu $
  שכן אם נגדיר לכל $k in NN$, $g_k colon.eq inf_(n in NN \
  n>=k) {f_n}$ אז נקבל ${g_k}_(k=1)^infinity$ סדרה מונוטונית עולה ואי־שלילית.\
  ממשפט ההתכנסות המונוטונית
  $ integral_X lim_(k arrow.r infinity) g_k dif mu = lim_(k arrow.r infinity) integral_X g_k dif mu $
  ומהגדרה
  $
    lim_(k arrow.r infinity) g_k = lim_(k arrow.r infinity) inf_(n in NN\
    n>=k) {f_n} = liminf_(n arrow.r infinity) f_n
  $
  וביחד
  $ (star) space integral_X lim_(n arrow.r infinity) f_n dif mu = lim_(k arrow.r infinity) integral_X g_k dif mu $
  מצד שני
  $
    forall k in NN, g_k <= f_k ==>_"מונוטוניות האינטגרל" a_k colon.eq integral_X g_k dif mu <= integral_X f_k dif mu eq.colon b_k
  $
  ומ־$(star)$ נובע כי $lim_(k arrow.r infinity) a_k$ קיים ונקבל
  $
    integral_X liminf_(n arrow.r infinity) f_n dif mu =_((star)) lim_(k arrow.r infinity) integral_X g_k dif mu = lim_(k arrow.r infinity) a_k <=liminf_(k arrow.r infinity) b_k = liminf_(k arrow.r infinity) integral_X f_k dif mu
  $
  *למה הטענה לא נכונה עם $sup$:* נסתכל על $RR$ עם מידת לבג ונגדיר $f_n (x) = bb(1)_([n, n+1])(x)$.\
  אז עבור כל $x in X$ קיים $n in NN$ כך ש־$n>x$ ובפרט נובע מכך $f_n (x) = 0$ ועל־כן
  $ limsup_(n arrow.r infinity) f_n (x) = 0 $
  אבל
  $ integral f_n dif x = (n+1)-n = 1 ==> limsup integral f_n dif mu = 1 $
  אבל
  $ 1 lt.eq.not 0 $
]

#subquestion()
נניח ש־$f_in in L^1 (mu)$ לכל $n in NN$ ובנוסף $f_n arrow.r f$ במידה שווה.

#sub_subquestion()
נוכיח כי אם $mu(X)<infinity$ אזי $f in L^1 (mu)$ ומתקיים $f_n arrow.r^(L^1 (mu)) f$.

#proof[
  מההתכנסות במידה שווה נובע שלכל $epsilon > 0$ יש $N in NN$ כך שלכל $n>N$ ולכל $x$ מתקיים
  $ abs(f_n (x) - f(x))<epsilon $
  בפרט זה נכון עבור $epsilon = 1$ ומתקיים
  $
    abs(f(x)) = abs(f(x) - f_N (x) + f_N (x)) =_"אי־שיוויון המשולש" abs(f(x)-f_N (x)) + abs(f_N (x)) < 1 + abs(f_N (x))
  $
  וממונטוניות האינטגרל
  $
    integral_X abs(f) dif mu < integral_X 1 dif mu + integral_X abs(f_N) dif mu = mu(X) + integral_X abs(f_N) dif mu<infinity
  $
  שכן $mu(X) < infinity$ מההנחה ו־$f_N in L^1 (mu)$ מהנתון ולכן יש לנו סכום סופי ועל־כן $f in L^1 (mu)$.\
  בשביל $f_n arrow.r^(L^1 (mu)) f$ נשים לב שמתקיים
  $
    integral_X abs(f_n - f) dif mu <=_"התכנסות במידה שווה" integral_X epsilon/mu(X) dif mu = epsilon/mu(X) integral_X 1 dif mu = epsilon/mu(X) mu(X) = epsilon
    ==> f_n arrow.r^(L^1 (mu)) f
  $
]

#sub_subquestion()
נמצא דוגמה נגדית במקרה ש־$mu(X)=infinity$.

#proof[
  ניקח את $X=RR$ עם מידת לבג ואז $lambda(RR) = infinity$ ואם ניקח $f_n (x)=1/n bb(1)_([0,n]) (x)$ נקבל $f_n arrow.r 0$ במידה שווה ומתקיים
  $ integral_RR abs(f_n - 0) dif lambda = integral_0^n 1/n dif x = 1/n dot.op n = 1 != 0 $
]

#question()
#subquestion()
יהי $(X, cal(A), mu)$ מרחב מידה ותהיי ${f_n}_(n=1)^infinity$ סדרת פונקציות מדידות המתכנסות במידה לפונקציה $f: X arrow.r RR$.\
נוכיח כי אם קיימת $g:X arrow.r RR$ כך ש־$f_n arrow.r g$ במידה, אזי $f=g$ כמעט־תמיד.

#proof[
  מכך ש־$f_n arrow.r f$ במידה נובע כי לכל $epsilon_0 > 0$ מתקיים
  $ mu({x in X bar abs(f_n (x) - f(x))>=epsilon_0}) stretch(arrow.r)_(n arrow.r infinity) 0 $
  ונניח כי קיימת $g: X arrow.r RR$ כך שמתקיים $f_n arrow.r g$ במידה גם־כן, כלומר לכל $epsilon_1 > 0$
  $ mu({x in X bar abs(f_n (x) - g(x))>=epsilon_1}) stretch(arrow.r)_(n arrow.r infinity) 0 $
  נניח ש־$f!=g$ על קבוצה ממידה חיובית, כלומר
  $ N colon.eq {x in X bar g(x) != f(x)}, wide mu(N) >0 $
  בפרט, נוכל להגדיר
  $ N = union.big_(k=1)^infinity { x in X bar abs(f(x)-g(x)) > 1/k} $
  היות ו־$mu(N)>0$ נובע כי לפחות אחד מאיברי האיחוד עם מידה חיובית.\
  נבחר $epsilon = 1/k$ ולכן קיים $E subset.eq N$ כך ש־$mu(E) > 0$ ולכל $x in E$ מתקיים
  $ abs(f(x)-g(x)) > epsilon = 1/k $
  מתקיים
  $
    abs(f(x)-g(x))=abs(f(x)-f_n (x) + f_n (x) - g(x))<=_"אי־שיוויון המשולש" abs(f(x) - f_n (x))+abs(f_n (x) - g(x))
  $
  אבל $abs(f(x)-g(x))<epsilon$ ולכן בפרט
  $ {abs(f-g) > epsilon} subset.eq {abs(f-f_n) > epsilon/2} union {abs(f_n - g) > epsilon/2} $
  ואם ניקח מידה על כל האגפים, ממונוטוניות המידה נקבל
  $ 0<mu({abs(f-g)>epsilon})=alpha <= mu({abs(f-f_n)>epsilon/2}) + mu({abs(f_n - g) > epsilon/2}) $
  אבל כאשר $n arrow.r infinity$, שני הביטויים באגף ימין שואפים ל־$0$ שכן $f_n arrow.r f, f_n arrow.r g$ במידה ולכן
  $ alpha<=0+0=0 $
  אבל הנחנו ש־$alpha>0$ ולכן זאת סתירה ועל־כן $mu(N)=0$, כלומר $f=g$ כמעט־תמיד.
]

#question()
תהיי $T: RR^n arrow.r RR^n$ העתקה לינארית ונגדיר מידה $mu_T$ על $RR^n$ על־ידי
$ mu(A)=lambda(T^(-1)(A)) $

#subquestion()
נוכיח שלכל פנוקציה מדידה $g:RR^n arrow.r RR$ מתקיים $integral g dif mu_T = integral g compose T dif lambda$.

#proof[
  תהיי $g = bb(1)_(E)$ פונקציה מציינת לקבוצה מדידה $E$, אזי
  $ integral g dif mu_T = integral bb(1)_(E) dif mu_T = mu_T (E) = lambda(T^(-1)(E)) $
  מצד שני, $(g compose T)(x) = 1$ אם $T(x) in E$ כלומר $x in T^(-1)(E)$, אז $g compose T=bb(1)_(T^(-1)(E))$ ונקבל
  $ integral g compose T dif lambda = integral bb(1)_(T^(-1)(E)) dif lambda = lambda(T^(-1)(E)) $
  אז הטענה נכונה לאינדיקטורים.\
  תהיי $g = sum_(i=1)^k alpha_i bb(1)_(E_i)$ פונקציה פשוטה על סדרת קבוצות מדידות, אזי מלינאריות האינטגרל ומהמקרה הקודם
  $
    integral sum_(i=1)^k alpha_i bb(1)_(E_i) dif mu_T = sum_(i=1)^k alpha_i integral bb(1)_(E_i) dif mu_T = sum_(i=1)^k alpha_i lambda(T^(-1)(E_i))= integral sum_(i=1)^k alpha_i (bb(1)_(E_i) compose T) dif lambda = integral g compose T dif lambda
  $
  כעת נשאר להראות עבור פונקציות אי־שליליות ומדידות (כמובן אם לא אי־שלילי אפשר לחלק לחלק האי־שלילי ולחלק השלילי ולפעול בהתאם)
  אז תהיי $g>=0$ ולכן קיימת סדרת פונקציות פשוטות ${s_n}_(n=1)^infinity$ כך ש־$s_n arrow.t g$ ובפרט $s_n compose T arrow.t g compose T$, אז ממשפט ההתכנסות המונוטונית על שני האגפים
  $
    integral g dif mu_T = lim_(n arrow.r infinity) s_n dif mu_T = lim_(n arrow.r infinity) integral s_n compose T dif lambda = integral g compose T dif lambda
  $
]

#subquestion()
נמצא תנאי מספיק והכרחי לכך ש־$mu_T lt.double lambda$ ונוכיח כי אם התנאי לא מתקיים אזי $mu_T perp lambda$.

#proof[
  התנאי המדובר זה ש־$det(T)!=0$, כי אז אפשר להשתמש כמו בהחלפת משתנה
  $ lambda(T^(-1)(A))=abs(det(T^(-1))) dot.op lambda(A) ==> mu_T (A) = 1/abs(det(T)) lambda(A) $
  ואז בגלל שהדטרמיננטה לא אפס, $mu_T (A) = 0 <==> lambda(A)=0$, כלומר יש רציפות בהחלט.\
  אבל אם התנאי הזה לא מתקיים, בגלל ש־$T$ העתקה לינארית, אז זה תת־מרחב ממש של $RR^n$ ולכן $S=im(T)$ אז $lambda(S)=0$ ואז $mu_T (S^c) = lambda(emptyset)=0$ וזה מביא לנו תנאי לסינגולריות.\
  היות ורק אחד מהם מתקיים כי המידה שלנו איננה מידת האפס זה מסיים.
]
