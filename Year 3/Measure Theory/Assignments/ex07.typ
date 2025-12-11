#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 07 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהי $(X, cal(A), mu)$ מרחב מידה. עבור $0<r<1$ נגדיר לכל $f: X arrow.r CC$ מדידה
$
  norm(f)_r = (integral abs(f)^r dif mu)^(1/r)
$
ונגדיר גם$ L^r (mu) = {f:X arrow.r CC bar norm(f)_r < infinity, "מדידה" f} $
נראה כי אם ב־$X$ יש שתי קבוצות זרות מדידות ממידה סופית ששתיהן לא ממידה אפס, אז $norm(dot.op)_r$ לא מקיימת את אי־שיוויון המשולש.

#proof[
  תהיינה $A,B in X$ כך ש־$0<mu(A), mu(B)<infinity$ ו־$A inter B = emptyset$.\
  נגדיר $f = bb(1)_(A)$ ומכך ש־$0<mu(A)<infinity$ נקבל $norm(f)_r < infinity$,
  באופן דומה נגדיר גם $g = bb(1)_(B)()$ ומאותו שיקול $norm(g)_r < infinity$.
  נגדיר $ h = f+g = bb(1)_(A) + bb(1)_(B) =_(A inter B = emptyset) bb(1)_(A union.dot B) $
  אז נחשב
  $
    norm(h)_r^r = integral abs(bb(1)_(A union.dot B))^r dif mu = integral_(A union.dot B) 1 dif mu = mu(A union.dot B) = mu(A)+mu(B) ==> norm(h)_r = (mu(A)+mu(B))^(1/r)
  $
  מצד שני מתקיים
  $
    norm(f)_r^r = integral abs(bb(1)_(A))^r dif mu = integral_A 1^r dif mu = integral_A 1 dif mu = mu(A) ==> norm(f)_r = (mu(A))^(1/r) \
    norm(g)_r^r = integral abs(bb(1)_(B))^r dif mu = integral_B 1^r dif mu = integral_B 1 dif mu = mu(B) ==> norm(g)_r = (mu(B))^(1/r)
  $
  אז אנחנו רוצים לבחון *האם* האי־שיוויון הבא מתקיים (ליתר דיוק, שהוא נופל):
  $ norm(h)_r = norm(f+g)_r <=^? norm(f)_r + norm(g)_r <==> (mu(A)+mu(B))^(1/r) <=^? mu(A)^(1/r)+mu(B)^(1/r) $
  נסמן לנוחות $a = mu(A), b = mu(B)$ ו־$0<a,b$ וכן $p=1/r>1$ (כי $0<r<1$) ונבחן
  $ (a+b)^p <=^? (a^p+b^p) $
  נשים לב שהפונקציה $phi(x)=x^p$ היא פונקציה קמורה, כלומר לכל $t in (0,1)$ מתקיים
  $ phi(t a + (1-t)b)<=t phi(a) + (1-t)phi(b) $
  נחלק את אי־השיוויון שאנחנו בוחנים ב־$b^p !=0$ כמובן
  $
    (a+b)^p <=^? (a^p+b^p) <==> (a+b)^p/b^p <=^? (a^p+b^p)/b^p <==> (a/b + 1)^p <=^? (a/b)^p + 1 <==>_(x=a/b) (x+1)^p <= x^p+1
  $
  נגדיר $psi(x)=(x+1)^p-x^p-1$ זה פולינום ולכן חלק, נגזר
  $ psi'(x) = p(x+1)^(p-1) - p x^(p-1) $
  מכך ש־$p>1$ אז $p-1>0$ ו־$x > 0$ אז $(x+1)^(p-1) > x^(p-1)$ כלומר $psi'(x) > 0$
  ונשים לב
  $ psi(0) = 1^p - 0^p = 0 $
  אז $psi$ היא מונוטונית עולה ממש לכל $x>0$ ונובע מכך
  $ (x+1)^p > x^p+1 $
  בסתירה, כלומר אי־שיוויון המשולש לא מתקיים.
]

#question()
נניח כי $(X, cal(A), mu)$ מרחב מידה $sigma$־סופי  (איחוד בן־מנייה של קבוצות מדידות עם מידה סופית) ו־$1<=s<=t<=infinity$.

#subquestion()
נוכיח כי $L^t (mu) subset.eq L^s (mu)$ אם ורק אם $mu(X)<infinity$.

#proof[
  $==>$ נניח כי $mu(X)<infinity$ ונוכיח $L^t (mu) subset.eq L^s (mu)$.\
  אם $s=t$ סיימנו ולכן נניח שיש שם אי־שיוויון חזק ושכרגע $t<infinity$.\
  תהי $f in L^t (mu)$,  ונסמן $g(x)=1$.\
  נסמן $p=t/s, q = t/(t-s)$ ומההנחות מתקיים $q,p>=1$ ובדיקה מראה שהם צמודים אחד לשנייה
  $1/p + 1/q = s/t + (t-s)/t = (s+t-s)/t = 1$.\
  מאי־שיוויון הולדר
  $
    norm(f)_s = (integral abs(f)^s dif mu)^(1/s) = (integral abs(f)^s dot.op 1 dif mu)^(1/s) <= norm(abs(f)^s)_(t/s)^(1/s) norm(1)_(t/s)^(1/s)
  $
  נבחין
  $
    norm(abs(f)^s)_(t/s) = (integral (abs(f)^s)^(t/s))^(s/t) = (integral abs(f)^t)^(s/t) = norm(f)_s^t \
    norm(1)_(t/s) = mu(X)^((t-s)/t)
  $
  מידת המרחב היא סופית ולכן נסמן $M=mu(X)$ אז מהאי־שיוויון לעיל
  $ norm(f)_s <= (M^((t-s)/t))^(1/s) (norm(f)_t^s)^(1/s) = M^(1/s-1/t) norm(f)_t < infinity ==> f in L^s (mu) $
  אם $t=infinity$ אז $f in L^infinity$ היא $abs(f)<=norm(f)_infinity$ כמעט תמיד (ראינו בהרצאה) אז
  $
    norm(f)_s^s = integral abs(f)^s dif mu <= integral norm(f)_infinity^s dif mu = norm(f)_infinity^s mu(X) < infinity ==> f in L^s (mu)
  $
  $<==$ נניח כי $L^t (mu) subset.eq L^s (mu)$ ונוכיח $mu(X)<infinity$.\
  נניח שלא ככה, כלומר $mu(X)=infinity$. \
  $X$ הוא מרחב מידה $sigma$־סופי ולכן קיימות $E_1, E_2, dots.h$ מדידות כך ש־$0<mu(E_n) < infinity$ ו־$X= union.big_(n=1)^infinity E_n$ (לאו־דווקא שהן זרות בצורה טבעית אלא הזרנו אותן בתהליכים דומים למה שראינו במטלות הראשונות)  ומתקיים כמובן $mu(X)=sum_(n=1)^infinity mu(E_n)$ והסכום מתבדר ואי־שלילי.\
  יהי $N_1 in NN$ כך שמתקיים $sum_(n=1)^(N_1) mu(E_n) >=1$ (יש כזה כי הטור מתבדר, לא סתם מתבדר – שואף לאינסוף) ונגדיר $F_1 = union.big_(n=1)^(N_1) E_n$ וכמובן \
  $1<=mu(F_1)<infinity$ כסכום סופי של מידות סופיות.\
  נמשיך ונגדיר $F_2, F_3, dots.h$ וכן הלאה כך שלכל $k in NN$ מתקיים $1<=mu(F_k)<infinity$ והן זרות אחת לשנייה (איחדנו קבוצות זרות) ונחלק למקרים:\
  אם $t=infinity$ אז $f eq.triple 1 in L^infinity(mu)$ אבל $integral(abs(f)^s dif mu) = mu(X) = infinity$, כלומר $f in.not L^s (mu)$ ולכן $L^infinity (mu) subset.eq.not L^t (mu)$, סתירה.\
  אם $t<infinity$ ושוב נניח כי $s<t$ (אחרת זה שוב סתירה), ונבחר $delta>0$ כך שיתקיים $0<delta<t/s-1$ ולכל $k in NN$ נגדיר
  $b_k colon.eq mu(F_k)^(-1/t) k^((-(1+delta))/t)$
  ונגדיר
  $f colon.eq sum_(k=1)^infinity b_k bb(1)_(F_k)$.\
  נחשב ונקבל מהזרות
  $
    integral abs(f)^t dif mu = integral abs(sum_(k=1)^infinity b_k bb(1)_(F_k))^t dif mu = sum_(k=1)^infinity b_k^t integral_(F_k) 1 dif mu = sum_(k=1)^infinity b_k^t mu(F_k) = sum_(k=1)^infinity (mu(F_k)^(-1/t))^t (k^((-(1+delta))/t))^t mu(F_k) = sum_(k=1)^infinity k^(-(1+delta)) < infinity
  $
  כאשר ההתכנסות היא מהיות $delta+1>0$.\
  כלומר קיבלנו $f in L^t (mu)$, אבל מצד שני
  $
    integral abs(f)^s dif mu = sum_(k=1)^infinity b_k^s integral_(F_k) 1 dif mu = sum_(k=1)^infinity mu(F_k)^(1-s/t) k^(-(s(1+delta))/t) >=_(1-s/t >=0 \
    mu(F_k)>=1) sum_(k=1)^infinity k^(-(s(1+delta))/t) >= infinity
  $
  כאשר ההתבדרות היא מהיות $(s(1+delta))/t <=1$.\
  כלומר, קיבלנו $f in.not L^s (mu)$, אבל הנחנו $L^t (mu) subset.eq L^s (mu)$ וזאת סתירה, כלומר $mu(X)<infinity$.
]

#pagebreak()

#subquestion()
נוכיח כי $L^s (mu) subset.eq L^t (mu)$ אם ורק אם אין ב־$cal(A)$ תתי־קבוצות ממידה קטנה כרצוננו, כלומר קיים $epsilon>0$ כך שאם $mu(A) < epsilon$ עבור $A$ מדידה כלשהי, אז $A$ ממידה אפס.

#proof[
  $<==$ נניח כי $L^s (mu) subset.eq L^t (mu)$ ונראה כי אין ב־$cal(A)$ תתי־קבוצות ממידה קטנה כרצוננו.\
  נניח בשלילה שיש ב־$cal(A)$ תת־קבוצה ממידה קטנה כרצוננו, ולכן לכל $n in NN$ יש קבוצה מדידה $A_n$ כך ש־$0<mu(A_n)<1/n$.\
  מהיות המרחב $sigma$־סופי נוכל לבנות תת־סדרה של $(B_n)_(n=1)^infinity$ שכל איברי הסדרה זרים ומדידים כך שמתקיים $0<mu(B_n) arrow.r 0$.\
  נגדיר
  $ alpha_n colon.eq 1/(n^2 mu(B_n)^(1/s)) $
  ולכן אם נגדיר פונקציה $f$ הנתמכת על $(B_n)_(n=1)^infinity$, כלומר $f=sum_(n=1)^infinity alpha_n bb(1)_(B_n)$ נקבל
  $
    integral abs(f)^s = sum_(n=1)^infinity alpha_n^s mu(B_n) = sum_(n=1)^infinity mu(B_n)/(n^(2) mu(B_n)^(1/s))^s = sum_(n=1)^infinity 1/n^(2s) < infinity
  $
  שזהו טור מתכנס כי $s>=1$. מצד שני
  $
    integral abs(f)^t = sum_(n=1)^infinity alpha_n^t mu(B_n) = sum_(n=1)^infinity mu(B_n)/(n^2 mu(B_n)^(1/s))^t = sum_(n=1)^infinity 1/(n^(2t)mu(B_n)^(t/s-1))
  $
  מהיות $t>s$ אז $t/s - 1 > 0$  ו־$mu(B_n) stretch(arrow.r)_(n arrow.r infinity) 0$
  ואנחנו תמיד יכולים לבנות את $B_n$ כך שיתקיים
  $ mu(B_n_k)^(-(t/s-1)) > n_k^(2t) ==> mu(B_n_k)^(-(t/s-1))/n_k^(2 t) > 1 $
  ולכן הטור במקרה זה מתבדר, וזו סתירה להנחה $L^s (mu) subset.eq L^t (mu)$.\
  $==>$ נניח כי אין ב־$cal(A)$ תתי־קבוצות ממידה קטנה כרצוננו ונוכיח $L^s (mu) subset.eq L^t (mu)$.\
  תהיי $f in L^s (mu)$ ולכל $k in ZZ$ נגדיר
  $ E_k colon.eq {x in X bar 2^k <= abs(f(x))<2^(k+1)} $
  כל $E_k$ כזה מדידה כתמונה של פונקציה ומדידה ומתקיים לכל $i!=j$ ש־$E_i inter E_j = emptyset$ (כי הקטעים $[2^k, 2^(k+1))$ אינם נחתכים)
  $ integral abs(f)^s dif mu = sum_(k in ZZ) integral_(E_k) abs(f)^s dif mu >= sum_(k in ZZ) 2^(k s) mu(E_k) $
  כעת, נטען שיש מספר סופי של $k$־ים עבורם $mu(E_k) > 0$: שכן אם בשלילה לא היה ככה, היה מתקיים
  $ norm(f)_s^s = integral abs(f)^s dif mu >= sum_(k in ZZ) 2^(k s) mu(E_k) $
  אם הייתה כמות שאיננה סופית סופית, אז הסכום מצד ימין היה מתבדר (בין אם בשאיפה לאינסוף ובין אם שאיפה למינוס אינסוף) ואז נקבל $integral abs(f)^s = infinity$ אבל $f in L^s$.\
  אז קיים $M<infinity$ כך שמתקיים $abs(f(x))<=M$ כלומר $f in L^infinity (mu)$ ומהיות $s<=t<=infinity$ נקבל $L^infinity (mu) subset.eq L^t (mu)$ ולכן $f in L^t (mu)$ ונקבל $L^s (mu) subset.eq L^t (mu)$.
]

#question()
יהי $(X, cal(A), mu)$ מרחב מידה. עבור $f:X arrow.r RR$ מדידה נגדיר
$
  esssup f colon.eq inf {alpha bar mu(f^(-1)((alpha, infinity)))=0}, space essinf f colon.eq sup {alpha bar mu(f^(-1)((-infinity, alpha)))=0}
$
עבור $f : X arrow.r CC$ נסמן $norm(f)_infinity = esssup abs(f)$.

#subquestion()
תהיי $f:X arrow.r RR$ מדידה. נסמן ב־$K subset.eq RR$ את התומך של המידה $f_*mu$ המוגדרת על $(RR, cal(B)_RR)$.\
נוכיח כי הסופרמום והאינפימום של $K$ הם בידיוק $esssup f, essinf f$.

#proof[
  נסמן
  $ M colon.eq esssup f = inf {alpha in RR bar mu(f^(-1)(alpha, infinity))=0} $
  יהי $epsilon > 0$, מהגדרת האיפנימום נובע $mu(f^(-1)((M+epsilon, infinity)))=0$ ומהמשיכה קדימה של המידה
  $ (f_*mu)((M+epsilon,infinity))=mu(f^(-1)((M+epsilon, infinity)))=0 $
  מהגדרת התומך מתקיים ש־$(M+epsilon, infinity) subset.eq RR without K$, מהיות $epsilon$ שרירותי נובע שכל הקטע $(M, infinity)$ ב־$RR without K$, כלומר לכל $y in (M,infinity)$, $y in.not K$.\
  מצד שני, כל $x in K$ מקיים $x<=M$ אז $sup K <= M = esssup f$.\
  הכיוון השני הוא סימטרי: נסמן $ T colon.eq essinf f $
  אז לכל $epsilon > 0$ מתקיים $mu(f^(-1)(-infinity, T-epsilon))=0$, אז אף נקודה שקטנה מ־$T-epsilon$ אינה ב־$K$, ולכן $inf K >= T$, אבל לכל $beta>T$ מתקיים $mu(f^(-1)(-infinity, beta))>0$ ולכן $(-infinity, beta) inter K != emptyset$ ולכן $K<=T$ וקיבלנו $inf K = T = essinf f$.
]

#subquestion()
נראה כי לכל $f$ מדידה
$ norm(f)_1 <= mu(X) dot.op norm(f)_infinity $

#proof[
  נסמן $M colon.eq norm(f)_infinity$, אז לכל $epsilon > 0$ מהגדרת ה־$esssup$ נגדיר
  $ A_epsilon colon.eq {x in X bar abs(f(x))> M + epsilon} ==> mu(A_epsilon) = 0 $
  יתר על־כן, נובע מכך שמתקיים $abs(f(x))<=M$ כמעט בכל מקום ולכן ממונוטוניות האינטגרל
  $
    norm(f)_1 = integral_X abs(f) dif mu <= integral_X norm(f)_infinity dif mu = norm(f)_infinity dot.op integral_X 1 dif mu = norm(f)_infinity mu(X)
  $
]

#subquestion()
נניח כי $f_n, f$ פונקציות מדידות כך ש־$norm(f_n - f)_infinity stretch(arrow.r)_(n arrow.r infinity) 0$.\
נראה כי קיימת ל־$f_n$ תת־סדרה המתכנסת נקודתית ל־$f$.

#proof[
  נסמן $M_n colon.eq norm(f_n - f)_infinity$ ומהנתון $M_n stretch(arrow.r)_(n arrow.r infinity) 0$  ומהגדרת $esssup$, אם $M_n < alpha$ אזי $mu({abs(f_n -f)<alpha})=0$.\
  ניקח סדרת אינדקסים $(n_j)_(j>=1)$  כך שמתקיים $m_n_j < 1/j$ לכל $j$ וזה אפשרי מהיות $M_n stretch(arrow.r)_(n arrow.r infinity) 0$ ונגדיר
  $ E_j colon.eq {x in X bar abs(f_n (x) - f(x))>1/j} $
  אז לכל $j$ מתקיים ש־$mu(E_j)=0$ (מהגדרת $esssup$) ונסתכל על $A = union.big_(j=1)^infinity A_j$, זה איחוד בן־מנייה של קבוצות ממידה אפס ולכן $mu(A)=0$.\
  אם $x in.not A$ אז עבור $j$ גדול דיו מתקיים
  $ abs(f_n_j (x) - f(x))<=1/j stretch(arrow.r)_(j arrow.r infinity) 0 $
  כלומר $f_n_j (x) arrow.r f(x)$ לכל $x in.not A$, כלומר לכל $x in X$ למעט בקבוצה ממידה אפס, כלומר קיבלנו $f_n_j arrow.r f$ כמעט בכל מקום/כמעט תמיד.
]

#question()
נניח כי $(X, cal(A), mu)$ מרחב מידה סופי ו־$f:X arrow.r CC$ מדידה.

#subquestion()
נראה כי אם $norm(f)_infinity = 1$ אז הסדרה $a_n = integral_X abs(f)^n dif mu$ מתכנסת.

#proof[
  מהנתון $norm(f)_infinity = 1$ נובע $inf {alpha>=0 bar mu(abs(f)>=alpha)=0}=1$, כלומר מתקיים $mu$־כמעט תמיד לכל $x in X$, $abs(f(x))<=1$, ולכן
  $ a_n = integral_X abs(f)^n dif mu <= integral_X 1 dif mu = mu(X) <_"מרחב מידה סופי" infinity $
  עוד נובע $abs(f)^n <= abs(f)^(n-1) <= abs(f)^(n-2) <= dots.h.c <= abs(f)$ כלומר $a_(n+1)<=a_n$ו  נשים לב גם שלכל $n in NN$ מתקיים $0<=a_n$ כאינטגרל על פונקציה אי־שלילית על מרחב מידה סופי.
  אז $(a_n)_(n=1)^infinity$ מונוטונית יורדת חלש ואי־שלילית ולכן מתכנסת.
]

#subquestion()
נראה כי לכל $f$ עם $0< norm(f)_infinity < infinity$ מתקיים
$ norm(f)_infinity = lim_(n arrow.r infinity) norm(f)_(n+1)^(n+1)/norm(f)_n^n $

#proof[
  נסמן
  $
    L = lim_(n arrow.r infinity) norm(f)_(n+1)^(n+1)/norm(f)_n^n = lim_(n arrow.r infinity) (integral_X abs(f)^(n+1) dif mu)/(integral_X abs(f)^n dif mu), space 0 <M colon.eq norm(f)_infinity < infinity
  $
  נגדיר $g:X arrow.r CC$ על־ידי  $g(x)=f(x)/M$ ועל־ידי נרמול זה נקבל $ norm(g)_infinity=norm(f/M)_infinity = norm(f)_infinity/M = 1, space
  norm(g)_p = integral_X abs(g)^p dif mu = integral_X abs(f/M)^p dif mu = 1/M^p integral_X abs(f)^n dif mu = 1/M^p norm(f)_p^p $
  ולכן
  $
    norm(f)_(n+1)^(n+1)/norm(f)_n^n = (integral_X abs(f)^(n+1) dif mu)/(integral_X abs(f)^n dif mu) = (integral_X abs(M g)^(n+1) dif mu)/(integral_X abs(M g)^n dif mu) = (M^(n+1) integral_X abs(g)^(n+1) dif mu)/(M^n integral_X abs(g)^n dif mu) = M dot.op (integral_X abs(g)^(n+1) dif mu)/(integral_X abs(g)^n dif mu)
  $
  נגדיר
  $ a_n = integral_X abs(g)^n dif mu = norm(g)_n^n $
  מהסעיף הקודם $A = lim_(n arrow.r infinity) a_n$ קיים ומוגדר ומכך ש־$g in L^infinity (mu), norm(g)_infinity$ נקבל
  $ A = lim_(n arrow.r infinity) norm(g)_n^n = lim_(n arrow.r infinity) integral_X abs(g)^n dif mu $
  ו־$A$ אי־שלילי (חסם מלרע),  נשים לב שאנחנו צריכים להצדיק למה זה מוגדר היטב:\
  מהיות $norm(g)_infinity = 1$, אנחנו יודעים שמתקיים $A = mu({x in X bar abs(g(x))=1})$ ומכך ש־$0<norm(f)_infinity < infinity$ אז $mu(A)>0$ ולכן מתקיים   $ lim_(n arrow.r infinity) (integral_X abs(g)^(n+1) dif mu)/(integral_X abs(g)^(n) dif mu) = lim_(n arrow.r infinity) a_(n+1)/a_n = 1 $
  כאשר השיוויון האחרון נובע מזה שהמכנה מתכנס לאותו ערך כמו המונה מנוסחת הזנב.
  נקבל בסך־-הכל עם מה שמצאנו ולקיחת גבול
  $
    lim_(n arrow.r infinity) norm(f)_(n+1)^(n+1)/norm(f)_n^n = lim_(n arrow.r infinity) M dot.op (integral_X abs(g)^(n+1) dif mu)/(integral_X abs(g)^n dif mu) = M dot.op lim_(n arrow.r infinity) a_(n+1)/a_n = M dot.op 1 = M
  $
]
