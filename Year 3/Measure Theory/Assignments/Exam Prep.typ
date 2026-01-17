#import "../../../src/article.typ": *
#show: article.with(
  title: [ הכנה למבחן מועד א' --- משפטים והוכחות נבחרים --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#theorem("משפט ההתכנסות המונוטונית")[
  יהי $(X, cal(A), mu)$ מרחב מידה ותהיי ${f_n bar X arrow.r [0, infinity]}_(n=1)^infinity$ סדרת פונקציות מדידות.\
  אם ${f_n}_(n=1)^infinity$ סדרה מונוטונית עולה, אזי הפונקציה $ f colon.eq lim_(n arrow.r infinity) f_n = sup_(n in NN) {f_n} $
  מקיימת
  $
    forall A in cal(A) wide integral_A f dif mu = lim_(n arrow.r infinity) integral_A f_n dif mu ==>
    forall A in cal(A) wide integral_A lim_(n arrow.r infinity) f_n dif mu = lim_(n arrow.r infinity) integral_A f_n dif mu
  $
]

#proof[
  נוכיח עבור $A=X$ (עבור $A subset X$ ההוכחה זהה) וראינו כי $f= sup_(n in NN) {f_n}$ מדידה.\
  ${f_n}_(n=1)^infinity$ מונוטונית עולה ולכן קיים $alpha in [0,infinity]$ כך ש־$alpha=lim_(n arrow.r infinity) integral_X f_n dif mu$ ונרצה להראות
  $ alpha <=_((1)) integral_X f dif mu <=_((2)) alpha ==> alpha = integral_X f dif mu $
  $(1)$ נכון כי מתקיים
  $ forall n in NN space 0<=f_n <= sup_(n in NN) {f_n} = f ==> 0<= f_n <=f $
  וממונוטוניות האינטגרל
  $ forall n in NN space 0<=integral_X f_n dif mu <=integral_X f dif mu $
  בפרט בלקיחת גבול נקבל $alpha <= integral_X f dif mu$.\
  עבור $(2)$ : תהיי $s: X arrow.r [0,infinity)$ פונקציה פשוטה כלשהי המקיימת $0<=s<=f$ ולכן יש ${A_i}_(i=1)^k$ חלוקה כלשהי של $X$ כך שניתן לכתוב $s=sum_(i=1)^k alpha_i bb(1)_(A_i)$.\
  יהי $x in X$ ויהי $c in (0,1)$, נסמן
  $ forall n in NN, space E_n colon.eq {x in X bar c dot.op s(x) <= f_n (x)} $
  מהיות $f(x) = lim_(n arrow.r infinity) f_n (x)$ מתקיים $f(x)=0$ (ואז $f eq.triple 0$) או $f(x) != 0$ ולכן בהכרח $f(x)>0$.\
  במקרה הראשון
  $ 0<= c dot.op s(x) <= f_n (x) <= f(x) =0 $
  ואז $x in E_n$ לכל $n$ וסיימנו.\
  אחרת, קיים $n_0 in NN$ כך שלכל $n > n_0$ מתקיים $f_n (x) > c dot.op s(x)$ ולכן ${E_n}_(n=1)^infinity$ סדרה עולה ביחס להכלה $(star)$ ממונטוניות ${f_n}$ ולכן $lim_(n arrow.r infinity) E_n = union.big_(n=1)^infinity E_n = X$ ונקבל
  $
    alpha = lim_(n arrow.r infinity) integral_X f_n dif mu >=_("מונוטוניות ביחס להכלה") lim_(n arrow.r infinity) integral_(E_n) f_n dif mu >=_("מונוטוניות") lim_(n arrow.r infinity) integral_(E_n) c dot.op s dif mu = c dot.op lim_(n arrow.r infinity) integral_(E_n) s dif mu = c dot.op lim_(n arrow.r infinity) sum_(i=1)^k alpha_i mu(E_n inter A_i)
  $
  אז מ־$(star)$ נובע
  $ forall i in [k], space forall n,m in NN, space n<=m ==> A_i inter E_n subset.eq A_i inter E_m $
  ולכן גם ${A_i inter E_n}_(n=1)^infinity$ סדרה עולה גם היא ו־${A_i}$ חלוקה של $X$ אז
  $
    forall i in [k], space union.big_(n=1)^infinity A_i inter E_n = A_i inter (union.big_(n=1)^infinity E_n) = A_i inter X = A_i
  $
  אז מרציפות המידה לאיחודים עולים נקבל $mu(A_i inter E_n) stretch(arrow.r)_(n arrow.r infinity) mu(A_i)$ ומכאן
  $
    alpha>= c dot.op lim_(n arrow.r infinity) sum_(i=1)^k alpha_i mu(A_i inter E_n) = c dot.op sum_(i=1)^k alpha_i lim_(n arrow.r infinity) mu(A_i inter E_n)
    = c dot.op sum_(i=1)^k alpha_i mu(A_i) = c dot.op integral_X s dif mu
  $
  מהיות $c in (0,1)$ שרירותי נובע $alpha>=integral_X s dif mu$ לכל $0<=s<=f$ פשוטה אבל מהגדרת אינטגרל של פונקציה אי־שלילית נקבל $alpha >= integral_X f dif mu$.
]

#theorem("החלפת סדר אינטגרציה וסכום")[
  יהי $(X, cal(A), mu)$ מרחב מידה. אם ${f_n bar X arrow.r [0,infinity]}_(n=1)^infinity$ סדרת פונקציות מדידות, אזי
  $ integral_X sum_(n=1)^infinity f_n dif mu = sum_(n=1)^infinity integral_X f_n dif mu $
]

#proof[
  באינדוקציה על $N in NN$.\
  מקרה בסיס הוא אדטיביות האינטגרל עבור $N=2$ (עבור $N=1$ הטענה טריוויאלית): תהיינה $s,t : X arrow.r [0,infinity]$ פונקציות פשוטות כלשהן כאשר
  $ s = sum_(i=1)^n alpha_i bb(1)_(A_i) wide t = sum_(j=1)^m beta_j bb(1)_(B_j) $
  עבור ${A_i}_(i=1)^n, {B_j}_(j=1)^m$ הן חלוקות של $X$ ומתקיים
  + ${A_i inter B_j}_((i,j) in [n times m])$ חלוקה של $X$
  + לכל $j in [m]$ מתקיים $union.big.dot_(i=1)^n A_i inter B_j = B_j$ כי ${A_i}_(i=1)^n$ חלוקה של $X$
  + לכל $i in [n]$ מתקיים $union.big.dot_(j=1)^m A_i inter B_j = A_i$ כי ${B_j}_(j=1)^m$ חלוקה של $X$
  מאדטיביות סופית של מידה נקבל
  $ sum_(j=1)^m mu(A_i inter B_j) =^((star)) mu(A_i) wide sum_(i=1)^n mu(A_i inter B_j) =^((star star)) mu(B_j) $
  אבל גם $s+t$ היא פונקציה פשוטה שכן
  $ s+t=sum_(i=1)^n sum_(j=1)^m (alpha_i + beta_j) bb(1)_(A_i inter B_j) $
  ולכן
  $
    integral_X (s+t) dif mu = sum_(i=1)^n sum_(j=1)^m (alpha_i + beta_j) dot.op mu(A_i inter B_j)= sum_(i=1)^n alpha_i dot.op sum_(j=1)^m mu(A_j inter B_j) + sum_(j=1)^m beta_j dot.op sum_(i=1)^n mu(A_i inter B_j) \
    =_((star), (star star)) sum_(i=1)^n alpha_i dot.op mu(A_i) + sum_(j=1)^m B_j dot.op mu(B_j) = integral_X s dif mu + integral_X t dif mu
  $
  אז הטענה נכונה עבור פונקציות פשוטות.\
  תהיינה $f_1, f_2 in {f_n bar X arrow.r [0,infinity]}_(n=1)^infinity$ מדידות ותהיינה ${s_n}_(n=1)^infinity, {t_n}_(n=1)^infinity$ סדרות עולות של פונקציות פשוטות כך שמתקיים
  $ s_n stretch(arrow.r)_(n arrow.r infinity) f_1 wide t_n stretch(arrow.r)_(n arrow.r infinity) f_2 $
  נקודתית ומאריתמטיקה של גבולות נקבל $s_n + t_n stretch(arrow.r)_(n arrow.r infinity) f_1+f_2$ כאשר זו התכנסות עולה לכן לפי משפט ההתכנסות המונוטונית
  $
    integral_X (f_1+g_2) dif mu = lim_(n arrow.r infinity) integral_X (s_n+t_n) dif mu = lim_(n arrow.r infinity) (integral_X s_n dif mu + integral_X t_n dif mu) = lim_(n arrow.r infinity) integral_X s_n dif mu + lim_(n arrow.r infinity) integral_X t_n dif mu \
    = integral_X f_1 dif mu + integral_X f_2 dif mu
  $
  וזה מראה את בסיס האינדוקציה.\
  בשביל לסיים את האינדוקציה נשים לב $sum_(n=1)^N f_n stretch(arrow.r)_(N arrow.r infinity) sum_(n=1)^infinity f_n$ נקודתית כאשר הסדרה ${sum_(n=1)^N f_n}_(n=1)^infinity$ היא סדרה מונוטונית עולה ולכן ממשפט ההתכנסות המונוטוניות נקבל את הטענה, כנדרש.
]

#pagebreak()

#theorem("טענה 2.14 ללא שם")[]

#proof[]

#pagebreak()

#theorem("הלמה של פאטו")[
  יהי $(X, cal(A), mu)$ מרחב מידה. אם ${f_n : X arrow.r [0,infinity]}_(n=1)^infinity$ סדרת פונקציות מדידות כלשהי, אזי
  $ integral_X liminf_(n arrow.r infinity) f_n dif mu <= liminf_(n arrow.r infinity) integral_X f_n dif mu $
]

#proof[
  לכל $k in NN$ נסמן $g_k colon.eq inf_(n in NN \
  n=>k) {f_n}$ אזי הסדרה ${g_k}_(k=1)^infinity$ סדרה מונוטונית עולה ואי־שלילית.\
  ממשפט ההתכנסות המונוטונית נקבל
  $ integral_X lim_(k arrow.r infinity) g_k dif mu = lim_(k arrow.r infinity) integral_X g_k dif mu $
  ומתקיים מהגדרה
  $
    lim_(k arrow.r infinity) g_k = lim_(k arrow.r infinity) inf_(n in NN \
    n>=k) {f_n} = liminf_(n arrow.r infinity) f_n
  $
  וביחד
  $ (star) space integral_X liminf_(n arrow.r infinity) f_n dif mu = lim_(k arrow.r infinity) integral_X g_k dif mu $
  מצד שני
  $
    forall k in NN, space g_k = inf_(n in NN \
    n>=k ) {f_n} <= f_k ==> g_k <= f_k
  $
  ממונטוניות האינטגרל נקבל
  $ forall k in NN, space a_k colon.eq integral_X g_k dif mu <= integral_X f_k dif mu eq.colon b_k $
  אז לכל $k in NN$ מתקיים $a_k<=b_k$ וכן מ־$(star)$ נובע כי $lim_(k arrow.r infinity) a_k$ קיים ונקבל
  $
    integral_X liminf_(n arrow.r infinity) f_n dif mu =_((star)) lim_(k arrow.r infinity) integral_X g_k dif mu = lim_(k arrow.r infinity) a_k <= liminf_(k arrow.r infinity) b_k = liminf_(k arrow.r infinity) integral_X f_k dif mu ==> integral_X liminf_(n arrow.r infinity) f_n dif mu <= liminf_(k arrow.r infinity) integral_X f_k dif mu
  $
]

#pagebreak()

#theorem("הלמה של בורל־קנטלי")[
  יהי $(X, cal(A), mu)$ מרחב מידה ותהיי $(E_n)_(n=1)^infinity subset.eq cal(A)$ סדרה של קבוצות מדידות כך שמתקיים
  $ sum_(n=1)^infinity mu(E_n) < infinity $
  אז
  $ mu(limsup_(n arrow.r infinity) E_n)=0 $
]

#proof[
  ממונוטוניות המידה והגדרת החיתוך
  $
    limsup_(n arrow.r infinity) E_n = inter.big_(i=1)^infinity union.big_(j=i)^infinity E_j ==> mu(limsup_(n arrow.r infinity) E_n)=mu(inter.big_(i=1)^infinity union.big_(j=1)^infinity E_j) <=_(forall i in NN) mu(union.big_(j=i)^infinity E_j)<=_"תת־אדטיביות המידה" sum_(j=i)^infinity mu(E_j) < infinity
  $
  כאשר המעבר האחרון נובע מההנחה ומטור זנב ולכן $lim_(i arrow.r infinity) sum_(n=i)^infinity mu(E_n)=0$, כלומר $mu(limsup_(n arrow.r infinity) E_n)<=0$.\
  אבל $mu$ מידה ולכן $0<=mu(limsup_(n arrow.r infinity) E_n)$ כלומר $mu(limsup_(n arrow.r infinity) E_n) = 0$.
]

#pagebreak()

#theorem("אי־שיוויון המשולש האינטגרלי")[
  אם $f in L^1 (mu)$ אזי $abs(integral_X f dif mu)<= integral_X abs(f) dif mu$.
]
#proof[
  $integral_X f dif mu in CC$ ולכן קיים $alpha in CC$ עם $abs(alpha)=1$ עבורו מתקיים $alpha integral_X f dif mu = abs(integral_X f dif mu) in RR$:\
  שכן אם נסמן $z=integral_X f dif mu$ אז אם $z=0$ אז $alpha z = abs(z) in RR$ לכל $alpha in CC$ עם $abs(alpha)=1$ כי נקבל ש־$0=0$.\
  אחרת, אם $z!=0$ אז קיים $theta in RR$ כך ש־$z = abs(z) dot.op e^(i theta)$ וניקח $alpha = e^(-i theta)$ ונקבל
  $ alpha z = e^(-i theta) dot.op (abs(z) e^(i theta)) = abs(z)(e^(-i theta) dot.op e^(i theta)))=abs(z) in RR $
  ולכן יש $alpha in CC$ המקיים זאת.\
  נקבל אם־כך
  $
    abs(integral_X f dif mu) & =alpha integral_X f dif mu \
                             & = underbrace(integral_X alpha f dif mu, in RR) \
                             & =integral_X re(alpha f) dif mu + cancel(i integral_X im(alpha f) dif mu) \
                             & = integral_X re(alpha f) dif mu \
                             & <= integral_X abs(re(alpha f)) dif mu \
                             & <= integral_X abs(alpha f) dif mu = integral_X abs(f) dif mu
  $
]

#pagebreak()

#theorem("משפט ההתכנסות הנשלטת")[
  #definition("סדרת פונקציות נשלטת")[
    תהיי $X$ קבוצה ותהיי ${f_n bar X arrow.r RR}_(n=1)^infinity$ סדרת פונקציות כלשהי ותהיי $g:X arrow.r RR$ פונקציה.\
    נאמר שהסדרה ${f_n}_(n=1)^infinity$ נשלטת על־ידי הפונקציה $g$  מתקיים ורק אם ורק אם לכל $n in NN$ מתקיים $abs(f_n)<=g$.
  ]
  תהיי ${f_n bar X arrow.r CC}_(n=1)^infinity$ סדרת פונקציות מדידות המתכנסת נקודתית לפונקציה $f: X arrow.r CC$.\
  אם קיימת $g in L^1(mu)$ כך שהסדרה ${f_n}_(n=1)^infinity$ נשלטת על־ידי $g$ אזי $f in L^1 (mu)$ ומתקיים
  $ integral_X abs(f_n - f) dif mu stretch(arrow.r)_(n arrow.r infinity) 0 $
  ובפרט
  $ integral_X f dif mu = lim_(n arrow.r infinity) integral_X f_n dif mu $
]
#proof[
  ראשית מכך ש־$abs(f_n)<=g$ לכל $n in NN$ נובע כי ${f_n}_(n=1)^infinity subset.eq L^1 (mu)$ וגם מתקיים $abs(f)<=g$ אז $f in L^1 (mu)$.\
  בפרט מתקיים לכל $n in NN$ ש־$abs(f-f_n)<=2g$ אז נגדיר $h_n colon.eq 2g-abs(f-f_n)$ ומהלמה של פאטו עבור סדרת הפונקציות ${h_n}_(n=1)^infinity$ נקבל
  $
    (star) space integral_X liminf_(n arrow.r infinity) h_n dif mu <= liminf_(n arrow.r infinity) integral_X h_n dif mu
  $
  וכן $h_n stretch(arrow.r)_(n arrow.r infinity) 2g$ נקודתית, אז בפרט $2g(x) = liminf_(n arrow.r infinity) h_n (x)$ לכל $x in X$, אז יינבע מכך
  $
    integral_X 2g dif mu = integral_X liminf_(n arrow.r infinity) h_n dif mu <=_((star)) liminf_(n arrow.r infinity) integral_X h_n dif mu = liminf_(n arrow.r infinity) integral_X (2g-abs(f-f_n)) dif mu
  $
  מכאן מתקיים
  $
    integral_X 2g dif mu <= liminf_(n arrow.r infinity) integral_X (2g-abs(f-f_n)) dif mu =_("לינאריות האינטגרל") liminf_(n arrow.r infinity)(integral_X 2g dif mu - integral_X abs(f-f_n) dif mu) \
    = liminf_(n arrow.r infinity) integral_X 2g dif mu + liminf_(n arrow.r infinity) (-integral_X abs(f-f_n) dif mu) =_(liminf_(n arrow.r infinity) (-a_n) = - limsup_(n arrow.r infinity) a_n) integral_X 2g dif mu - limsup_(n arrow.r infinity) integral_X abs(f-f_n) dif mu
  $
  כלומר
  $ integral_X 2g dif mu <= integral_X 2 g dif mu - limsup_(n arrow.r infinity) integral_X abs(f-f_n) dif mu $
  אבל $g in L^1 (mu)$ אי־שלילית ולכן $integral_X 2 g dif mu < infinity$ ולכן ניתן להחסיר ולקבל $limsup_(n arrow.r infinity) integral_X abs(f-f_n) dif mu = 0$ ובפרט מאי־שיוויון המשולש האינטגרלי
  $
    abs(integral_X f dif mu - integral_X f_n dif mu) = abs(integral_X (f-f_n) dif mu)<= integral_X abs(f-f_n) dif mu stretch(arrow.r)_(n arrow.r infinity) 0
  $
]

#pagebreak()

#theorem("תנאים שקולים לפונקציה אפסה כמעט־תמיד")[
  + אם $f : X arrow.r [0,infinity]$ מדידה עם $integral_X f dif mu =0$ אם ורק אם $f=_mu 0$
  + אם $f : X arrow.r CC$ מדידה ולכל $E in cal(A)$ מתקיים $integral_E f dif mu =0$ אזי $f=_mu 0$
]

#proof[
  + ההנחה ש־$integral_X f dif mu =0$ גוררת ש־$mu({x in X bar f(x) >=1/n})=0$ חכח $n in NN$ ולכן $f=0$, $mu$־כמעט תמיד
]
