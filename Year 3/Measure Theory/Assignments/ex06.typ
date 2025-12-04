#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 06 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
בתרגול $5$ דיברנו על קבוצת השליש האמצעי של קנטור $C subset RR$ המוגדרת על־ידי $inter.big_(n=1)^infinity C_n$ כאשר
$ C_0 = [0,1], wide C_(n+1) = C_n/3 union.big (2/3 + C_n/3) $
מכאן נובע שלכל $n$ נוכל לרשום את $C_n$ כאיחוד זר של קטעים סגורים מאורך $1/3^n$ ונקרא לקבוצת קטעים זו $cal(T)_n$.\
נזכור גם שהפיתוח הטרינרי (פיתוח בבסיס $3$) של כל מספר $x in C$ הוא מהצורה
$ sum_(k=1)^infinity a_k/3^k, space forall k, space a_k in {0,2} $

#subquestion()
נגדיר
$ E_0 = {0}, wide E_n = {sum_(k=1)^n a_k/3^k bar a_k in {0,2}} $
ונוכיח כי לכל $n$
$ E_(n+1) = E_n/3 union.big (2/3 + E_n/3) $
עוד נסיק כי אם לכל $n$, $E_n$ היא קבוצת הקצוות השמאליים של הקטעים ב־$cal(T)_n$ שאיחודים הוא $C_n$.

#proof[
  זוהי בעצם נוסחת נסיגה:\
  יהי $x in E_(n+1)$ ולכן $x = sum_(k=1)^(n+1) a_k/3^k$ עבור $a_k in {0,2}$.\
  אם $a_1 = 0$ אז $x=sum_(k=2)^(n+1) a_k/3^k = 1/3 sum_(k=1)^n a_(k+1)/3^k$ כאשר $sum_(k=1)^n a_(k+1)/3^k in E_n$ ולכן $x in E_n/3$.\
  אם $a_1=2$ אז $x=2/3+ sum_(k=2)^(n+1) a_k/3^k = 2/3 + 1/3 sum_(k=1)^n a_(k+1)/3^k$ ושוב באותו אופן נקבל $x in 2/3 + E_n/3$ ולכן קיבלנו את ההכלה $ E_(n+1) subset.eq E_n/3 union (2/3 + E_n/3) $
  נראה את ההכלה בכיוון השני: יהי $y=sum_(k=1)^n b_k/3^k$ עם $b_k in {0,2}$ ולכן
  $ y/3 = sum_(k=1)^n b_k/3^(k+1) = sum_(k=1)^(n+1) a_k/3^k $
  עבור $a_1=0, a_(k+1) = b_k$ כלומר $y/3 in E_(n+1)$ ובאופן דומה
  $ 2/3 + y/3 = sum_(k=1)^(n=1) a_k/3^k $
  עם $a_1=2$ ו־$a_(k+1)=b_k$ ולכן $2/3 + y/3 in E_(n+1)$ וקיבלנו גם את ההכלה השנייה.\
  נראה כעת $E_n subset C_n$ לכל $n$: באינדוקציה, עבור $E_0 subset.eq C_0$ והנחת האינדוקציה $E_n subset C_n$, אז
  $ E_(n+1) = E_n/3 union (2/3 + E_n/3) subset C_n/3 union (2/3 + C_n/3) = C_(n+1) $
  $E_n$ היא קבוצת הקצוות השמאליים של הקטעים ב־$cal(T)_n$ שכן $C_n$ הוא איחוד זר של קטעים סגורים מאורך $1/3^n$ אבל $E_n$ מכילה בידיוק $2^n$ נקודות מהנוסחת נסיגה.\
  בהתאם מתרגול $6$, $P_n = E_n, Omega = cal(T)_n$
]

#pagebreak()

#subquestion()
יהי $n in NN$ ו־$t = sum_(k=1)^n b_k/3^k in E_n$ ונניח כי $T in cal(T)_n$ הוא הקטע ש־$t$ הוא הקצה השמאלי שלו. \
עבור $m>n$, נמצא כמה איברים $sum_(k=1)^m a_k/3^k in E_m$ מקיימים $a_k=b_k$ לכל $1<=k<=n$ ונסיק כי מספר זה שווה ל־$abs(T inter E_m)$.

#proof[
  יהי $t = sum_(k=1)^n b_k/3^k in E_n$. הקטע $T in cal(T)_n$ שהקצה השמאלי שלו הוא $t$ הוא $T=[t,t+1/3^n]$.
  #todo
]

#subquestion()
לכל $n in NN$ נגדיר את הפונקציונל $Lambda_n$ על $C_C (RR)$ על־ידי $Lambda_n f = 1/2^n sum_(x in E_n) f(x)$.\
נראה כי לכל $f in C_C (RR)$ הסדרה $Lambda_n f$ מתכנסת.

#proof[
  נקבע $x = sum_(k=1)^n a_k/3^k in E_n$ ולכן עבור $m>=n$, נקודה ב־$E_m$ שהיא עם $n$ ספרות ראשונות אותו הדבר כמו $x$ היא מהצורה
  $ y=sum_(k=1)^n a_k/3^k + sum_(k=n+1)^m a_k/3^k $
  כלומר הזנב $R=sum_(k=n+1)^m a_k/3^k$ מכיל את שאר הספרות בפיתוח, בפרט זה טור אי־שלילי ולכן
  $ 0<=R<=sum_(k=n+1)^infinity 2/3^k =_"תור הנדסי" 2/3^(n+1) dot.op 1/(1-1/3) = 2/3^(n+1) dot.op 3/2 = 1/3^n $
  בפרט זה אומר שכל $y in E_m$ כאשר $n$ הספרות הראשונות של $y$ מזדהות עם הספרות של $x$ מקיימות
  $ y in [x,x+1/3^n] $
  וכמובן
  $ [x,x+1/3^n] stretch(arrow.r)_(n arrow.r infinity) [x,x] $
  אז אם נסמן ב־$D_m$ את קבוצת הנקודות הללו, מתקיים
  $ Lambda_m f = 1/2^m sum_(y in E_m) f(y) = 1/2^n sum_(x in E_n) (1/2^(m-n) sum_(y in D_m) f(y)) $
  $f in C_C (RR)$ ולכן רציפה במידה שווה. יהי $epsilon > 0$ ונבחר $delta>0$ כך ש־$abs(f(u)-f(v))<epsilon$ עבור $abs(u-v)<delta$ ונקבע $N$ עבורו $3^(-N) < delta$.\
  אז לכל $n>=N$, לכל $x in E_n$, כל $D_m subset.eq [x,x+3^(-n)] subset.eq [x,x+delta)$
  ולכן לכל $y in D_m$ מתקיים
  $ abs(f(y)-f(x))<epsilon ==> abs(1/2^(m-n) sum_(y in D_m) f(y) - f(x))<epsilon $
  ולכן גם
  $
    abs(Lambda_m f - Lambda_n f) = abs(1/2^n sum_(x in E_n) ( 1/2^(m-n) sum_(y in D_m) f(y)-f(x)))<=1/2^n sum_(x in E_n) epsilon = epsilon
  $
  כלומר מצאנו סדרת קושי ולכן מתכנסת.
]

#subquestion()
נגדיר את $Lambda f colon.eq lim_(n arrow.r infinity) Lambda_n f$.\
נוודא שזהו פונקציונל לינארי חיובי ונגדיר את $mu$ להיות המידה על $RR$ המייצגת את $Lambda$ לפי משפט ההצגה של ריס. נמצא את $supp(mu)$ ונחשב את $mu([2/9, 1/3])$.

#proof[#todo]

#subquestion()
נגדיר $phi_0 (x) = x/3, phi_2 (x) = 2/3 + x/3$ ונראה כי
$ mu = 1/2 (phi_0)_*mu + 1/2(phi_2)_* mu $
כאשר $(phi_i)_*mu$ היא הדחיפה קדימה של $mu$ לפי $phi_i$.

#proof[#todo]

#question()
יהי $X$ מרחב האוסדרוף קומפקטי מקומית ו־$sigma$־קומפקטי ונניח כי $phi: C_C (X) arrow.r CC$ פונקציונל לינארי חיובי.\
נסמן $M$ ו־$mu$ ה־$sigma$־אלגברה ומידה שקיומם נובע ממשפט ההצגה של ריז.

#subquestion()
נראה כי אם $E in cal(M)$ ו־$epsilon>0$, אז קיימת $F$ סגורה ו־$V$ פתוחה כך שמתקיים
$ F subset.eq E subset.eq V, wide mu(v without F)<epsilon $

#proof[
  תהיי $E in cal(M)$ ויהי $epsilon>0$.\
  $mu$ מידת רדון ולכן מקיימת רגולריות חיצונית, כלומר קיימת $V$ פתוחה עם $E subset.eq V$ כך שמתקיים
  $ mu(V) < mu(E) + epsilon/3 $
  $X$ הוא $sigma$־קומפקטי, כלומר הוא איחוד בן־מנייה של קבוצות קומפקטיות, בפרט נקבל
  $ K_1 subset.eq K_2 subset.eq dots.h.c $
  כך שכל $K_n$ קומפקטי ומתקיים $display(X = union.big_(n=1)^infinity K_n)$ ולכן בפרט ניתן לכתוב $display(E = union.big_(n=1)^infinity (E inter K_n))$ וזה כמובן איחוד עולה ולכן מרציפות המידה
  $ mu(E) = lim_(n arrow.r infinity) mu(E inter K_n) $
  נקבע $N$ כך שמתקיים
  $ mu(E) - mu(E inter K_N) < epsilon/3 $
  מכך ש־$E inter K_N subset.eq K_N$ ו־$mu(K_N) < infinity$ מהקומפקטיות, אז מהרגולריות פנימית של קבוצות ממידה סופית יש $F subset.eq E inter K_N$  כאשר $F$ קומפקטית ומתקיים
  $ mu((E inter K_N) without F)<epsilon/3 $
  $F$ קומפקטית ולכן סגורה ומצאנו $F subset.eq E subset.eq V$, נשאר לחשב את $mu(V without F)$:
  $ mu(V without F) = mu((V without E) union (E without F))<= mu(V without E) + mu(E without F) $
  נחשב כל מידה בנפרד
  $ V = E union.dot (V without E) ==> mu(V)=mu(E) + mu(V without E) ==> mu(V without E) = mu(V)-mu(E) < epsilon/3 $
  באופן דומה
  $
    E without F = E without (E inter K_N) union (E inter K_N) without F \
    ==> mu(E without F)<=mu(E without (E inter K_N))+mu((E inter K_N) without F) = mu(E)-mu(E inter K_N)+mu((E inter K_N) without F) < epsilon/3 + epsilon/3 = (2 epsilon)/3
  $
  כלומר
  $ mu(V without F)<=mu(V without E) + mu(E without F) < epsilon/3 + (2 epsilon)/3 = epsilon $
]

#pagebreak()

#subquestion()
נראה כי אם $E in cal(M)$ אז יש $A,B subset.eq X$ כך ש־$A$ היא $F_sigma$ ו־$B$ היא $G_sigma$ ($F_sigma$ איחוד של אוסף בן־מנייה של קבוצות סגורות; $G_sigma$ חיתוך בן־מנייה של קבוצות פתוחות) המקיימות $ A subset E subset B, wide mu(B without A) = 0 $

#proof[
  לכל $n in NN$ נגדיר $A_n subset E subset B_n$ כבסעיף הקודם המקיימות
  $ mu(B_n without A_n) <= 1/n $
  ונגדיר
  $ A = union.big_(n=1)^infinity A_n, wide B = inter.big_(n=1)^infinity B_n $
  ומהגדרת $mu$ כמידת רדון ומרציפות המידה
  $ mu(B without A) = lim_(n arrow.r infinity) mu(B_n without A_n) = 0 $
]

#question()
בהינתן $X$ מרחב האוסדרוף קומפקטי, נסמן ב־$P(X)$ את קבוצת מידות ההסתברות על $(X, cal(B)(X))$.\
לכל $f in C(X)$ נגדיר את $norm(f)_infinity = max_(x in X) abs(f(x))$.\
תהיי ${f_n}_(n=1)^infinity$ סדרה צפופה של פונקציות ב־$C(X)$.\
ראינו שהפונקציה $d : P(X) times P(X) arrow.r RR$ המוגדרת על־ידי
$ d(mu, v) = sum_(n=1)^infinity 1/(2^n norm(f_n)_infinity) abs(integral f_n d nu - integral f_n d mu) $
מהווה מטריקה.

#subquestion()
נזכיר כי נאמר $mu_n harpoon.rt^(*) mu$ ובמילים ש־$mu_n$ מתכנסת בטופולוגיה החלשה־$*$ ל־$mu$ אם לכל $f in C(X)$ מתקיים
$ integral f d mu_n stretch(arrow.r)_(n arrow.r infinity) integral f d mu $
נראה כי התכנסות חלשה־$*$ שקולה להתכנסות במטריקה $d$.

#proof[בכיוון הראשון, נניח $d(mu_k, mu) arrow.r 0$ ונראה כי $mu_k harpoon.rt^(*) mu$.\
  יהיו $epsilon > 0, f in C(X)$. מהצפיפות של ${f_n}_(n=1)^infinity$ ב־$C(X)$ נובע שיש $f_m$ כך שמתקיים $norm(f-f_m)_infinity < epsilon/3$.\
  כעת, לכל $nu in P(X)$ מתקיים $integral(f-f_m)d mu <= norm(f-f_m)_infinity$: נבחין שמתקיים
  $
    (star) abs(integral (f-f_m) d mu) <= integral abs(f-f_m) d mu, wide (star star) abs((f-f_m)(x))<=norm(f-f_m)_infinity
  $
  כאשר $(star)$ הוא אי־שיוויון האינטגרלי ו־$(star star)$ מהגדרה, ומשילובם נקבל
  $
    integral abs(f-f_m) d mu <= integral norm(f-f_m)_infinity d mu = norm(f-f_m)_infinity integral 1 d mu =_"מידת הסתברות" norm(f-f_m) dot.op nu(X) = norm(f-f_m)_infinity dot.op 1 = norm(f-f_m)_infinity \
    ==> abs(integral (f-f_m) d mu) <= norm(f-f_m)_infinity
  $
  אז לכל $k$ נקבל
  $
    abs(integral f d mu_k - integral f d mu) <= abs(integral(f-f_m) d mu_k) + abs(integral f_m d mu_k - integral f_m d mu) + abs(integral (f_m - f) d mu) \
    <= 2 norm(f-f_m)_infinity + abs(integral f_m d mu_k - integral f_m d mu) \
    <=_"מהמטריקה" 2 norm(f-f_m)_infinity + 2^m norm(f_m)_infinity d (mu_k, mu)
  $
  אבל מההנחה $d(mu_k, mu) arrow.r 0$ ולכן יש $K$ כך שלכל $k>=K$ מתקיים
  $ 2^m norm(f_m)_infinity d (mu_k, mu)<epsilon/3 $
  ולכן
  $
    abs(integral f d mu_k - integral f d mu)<= 2 norm(f-f_m)_infinity + 2^m norm(f_m)_infinity d (mu_k, mu) < (2 epsilon)/3 +epsilon/3 = epsilon
  $
  ולכן $integral f d mu_k arrow.r f d mu$ לכל $f in C(X)$, כלומר $mu_n harpoon.rt^(*) mu$.\
  מהצד השני, אם נניח $mu_n harpoon.rt^(*) mu$, אז עבור $n$ מקובע מתקיים
  $ abs(integral f_n d mu_k - integral f_n d mu) stretch(arrow.r)_(k arrow.r infinity) 0 $
  נגדיר
  $ t_(n,k) colon.eq 1/(2^n norm(f_n)_infinity) abs(integral f_n d mu_k - integral f_n d mu) $
  אז לכל $n$ מקובע, $t_(n,k) stretch(arrow.r)_(k arrow.r infinity) 0$ ובפרט
  $ t_(n,k) <= (2 norm(f_n)_infinity)/(2^n norm(f_n)_infinity) = 2/2^n $
  אז בפרט הטור $ d(mu_k, mu) = sum_(n=1)^infinity t_(n,k) stretch(arrow.r)_(k arrow.r infinity) sum_(n=1)^infinity 0 = 0 $
  כלומר $d(mu_k, mu) arrow.r 0$.
]

#subquestion()
נשים לב שכל $x in X$ משרה מידת הסתברות טבעית והיא $lambda_x$. \
נראה כי ההעתקה $X arrow.r P(X)$ הנתונה על־ידי $x mapsto delta_x$ היא רציפה.

#proof[
  יהיו $x_0 in X, {x_n}_(n=1)^infinity subset.eq X$ כך ש־$x_n arrow.r x_0$ ונרצה להראות $delta_(x_n) arrow.r delta_(x_0)$.\
  מהסעיף הקודם מספיק להראות ש־$delta_(x_n) harpoon.rt^(*) d_x$
  תהיי $f in C(X)$ ולכן $ integral f d delta_(x_n) = f(x_n) $
  $f$ רציפה ולכן אם $x_n arrow.r x_0$ אז $f(x_n) arrow.r f(x_0)$ ולכן $integral f d delta_(x_n) arrow.r integral f d delta_(x_0)$ ולכן היא מתכנסת גם ב־$d$ וקיבלנו רציפות.
]
#question()
נניח כי $X$ מרחב האוסדרוף קומפקטי מקומית.

#subquestion()
נראה כי $P(X)$ קמורה, כלומר שלכל $mu, nu in P(X)$ ו־$t in [0,1]$ המידה $t mu + (1-t) nu in P(X)$.

#proof[
  תהיינה $mu, nu in P(X)$ ויהי $t in [0,1]$ ונסמן $lambda = t mu + (1-t)nu$ ונראה ש־$lambda in P(X)$:
  $ lambda(X)=t mu(X)+(1-t)nu(X) = t dot.op 1 + (1-t) dot.op 1 = 1 $
  כמובן ש־$lambda$ אי־שלילית כי אם $A$ מדידה, מהיות $t, (1-t) >=0$ אז
  $ lambda(A) = lambda underbrace(mu(A), >=0)+(1-t)underbrace(nu(A), >=0) >=0 $
  אנחנו גם צריכים להראות ש־$lambda$ היא עדיין מידת רדון, אבל זה נובע מכך שאם נסמן $cal(M)(X)$ כקבוצת כל מידות רדון על $X$ נקבל שזה מרחב וקטורי: הרי שחיבור של מידות הוא עדיין מידה ומהגדרת אינפימה וסופרמה על סכום משמר רגולריות פנימית וחיצונית: נראה לחיצונית, לפנימית זה באופן דומה
  $ (mu + nu)(A) = inf_(U supset A) (mu(U)+nu(U)) = inf_(U supset A) (mu + nu)(U) $
  נשאר רק להראות סגירות לכפל בסקלר $alpha in RR$: אם $0<=alpha$ זה נובע מהחיבור, אם $alpha<0$ זה גם פשוט נובע מהגדרה של אינפימה וסופרמה $ inf alpha mu(U) = alpha sup mu(U), wide
  sup alpha mu(U) = alpha inf mu(U) $
  אז $cal(M)(X)$ זה מרחב וקטורי ולכן גם $lambda$ מידת רדון.
]

#subquestion()
נניח כי $T : X arrow.r X$ רציפה ונראה כי אם יש שתי מידות הסתברות $T$־אינווריאנטיות $mu, nu$ שונות, אז יש אינסוף כאלו.

#proof[
  נניח שיש $mu, nu$ שהן $T$־אינווריאנטיות, כלומר לכל $E in cal(B)(X)$ מתקיים
  $ mu(E) = mu(T^(-1)(E)), wide nu(E) = nu(T^(-1)(E)) $
  מהסעיף הקודם, עבור $t in [0,1]$, אם נגדיר $lambda colon.eq mu t + (1-t)nu in P(X)$ ומתקיים
  $ lambda(T^(-1)(E)) = t mu(T^(-1)(E)) + (1-t)nu(T^(-1)(E)) = t mu(E) + (1-t)nu(E) = lambda(E) $
  ולכן $lambda$ גם היא $T$־אינווריאנטיות,   בפרט נקבל $ abs({lambda_t colon.eq mu t + (1-t)nu bar t in [0,1] })=2^(aleph_0) $
  כלומר, יש אינסוף מידות כאלו.
]

#subquestion()
ניקח $X=[0,1]$ עם הטופולוגיה הסטנדרטית ואת $T(x)=x^2$.\
נתאר את כל מידות ההסתברות ה־$T$־אינווריאנטיות.

#proof[
  יהי $epsilon in (0,1]$ ונסמן $E=[0,epsilon]$ ותהיי $mu$ מידת הסתברות שהיא $T$־אינווריאנטית.\
  באינדוקציה על $n$ עבור $n=1$ זה בסיס האינדוקציה ונניח כי הטענה נכונה עבור $n$ ונראה עבור $n+1$
  $
    mu(T^(-(n+1))(E)) = mu(T^(-1)(T^(-n)(E)))=_(F colon.eq T^(-n)(E)) mu(T^(-1)(F)) =_"בסיס האינדוקציה" mu(F)=mu(T^(-n)(E))=_"הנחת האינדוקציה"mu(E)
  $
  כעת, מהגדרת $T$ נקבל
  $ mu(E)=mu(T^(-1)(E))=mu(T^(-n)(E))=mu([0,epsilon^(1/2^n)]) stretch(arrow.r)_(n arrow.r infinity) mu([0,1])=1 $
  כלומר אלו בידיוק $mu in {delta_0, delta_1}$ (שכן לא קיים עוד $x in X$ כך ש־$T(x)=x^2=x$).
]
