#import "../../../src/article.typ": *
#show: article.with(
  title: [ הכנה למבחן --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 3)

#pagebreak()
= אריתמטיקות בסיסיות שאת תמיד שוכחת
בהינתן $z=x + i y, w = a + i b$
+ ערך מוחלט
  $ abs(z)=sqrt(z dot.op overline(z))=sqrt((x+i y) dot.op (x-i y)) = sqrt(x^2+y^2) $
+ חילוק
  $ z/w = (z dot.op overline(w))/(w dot.op overline(w)) = (z dot.op overline(w))/abs(w)^2 $
+ זהות אויילר
  $ e^(i z)=cos(z)+i sin(z) $
+ $ e^(pi i)=(-1) wide e^(2pi i)=1, wide e^(i pi/2)=i $
+ $ cos(z) = (e^(i z)+e^(-i z))/2 $
+ $ sin(z) = (e^(i z)-e^(-i z))/(2i) $
+ $ sinh(z)=-i sin(i z)=(e^z-e^(-z))/2 $
+ $ cosh(z)=cos(i z)=(e^z+e^(-z))/2 $
+ $ abs(e^w)=e^(re(w)) $
= ספרינט על החומר
== גזירות מרוכבת
=== הקדמה
#definition("תחום")[
  נגיד ש־$G subset CC$ היא תחום אם היא קבוצה פתוחה וקשירה. אם $G$ פתוחה אז ניתן לכתוב $G=union.big.dot_(j=1)^N G_j$ כאשר $G_j$ תחום.
]
#definition("גזירות מרוכבת")[
  תהיי $f:U_(z_0) arrow.r CC$, נגיד שהיא $CC$־דיפרנציאבילית ב־$z_0$ אם הגבול הבא קיים וסופי
  $ lim_(z arrow.r z_0) (f(z)-f(z_0))/(z-z_0) = lim_(h arrow.r 0) (f(z+h)-f(z))/h $
  באופן שקול, קיים $a in RR$ כך שהגבול הבא קיים וסופי
  $ lim_(z arrow.r z_0) (f(z)-(f(z_0)+a(z-z_0)))/(z-z_0) $
  כמובן שזה גורר רציפות ב־$z_0$.
]
#definition("פונקציה אנליטית")[
  פונקציה $f$ היא אנליטית ב־$z_0$ אם קיימת סביבה $U_(z_0)$ כך ש־$f$ היא $CC$־דיפרנציאבילית בכל $z in U_(z_0)$.\
  נגיד ש־$f$ היא אנליטית ב־$CC$ אם לכל $z_0 in CC$, $f$ היא אנליטית ב־$z_0$.
]
#definition("פונקציה הולומורפית")[
  פונקציה $f$ היא הולומורפית אם היא אנליטית ב־$CC$.\
  נסמן ב־$Hol(G)$ את אוסף כל הפונקציות האנליטיות ב־$G$.
]

=== טורי חזקות
#theorem("משפט ה־M של ויירשטראס")[
  תהיי $E subset CC$ ו־$f_n : E arrow.r CC$. אם לכל $n$, $abs(f_n)<=M_n$ ו־$sum_(n=1)^infinity M_n < infinity$ אזי הטור $sum_(n=1)^infinity f_n$ מתכנס בהחלט ובמידה שווה ב־$E$
]
#lemma[
  אם $sum_(n=0)^infinity c_n (w-z_0)^n$ מתכנס עבור $w!=z_0$ אז הסכום מתכנס במידה שווה ובהחלט ב־${z bar abs(z-z_0)<q abs w-z_0}$ לכל $q in (0,1)$.
]
#corollary[
  אחד מהבאים מתקיים
  + לכל $z != z_0$ הסכום $sum_(n=0)^infinity c_n (z-z_0)$ מתבדר
  + לכל $z in CC$ הסכום $sum_(n=0)^infinity c_n (z-z_0)$ מתכנס
  + קיימים $z_1, z_2$ כך שהסכום $sum_(n=0)^infinity c_n (z_1-z_0)$ מתבדר והסכום $sum_(n=0)^infinity c_n (z_2-z_0)$ מתכנס
]
#definition("רדיוס התכנסות ונוסחת הדאמר")[
  הגדרנו את רדיוס ההתכנסות $R_C$ להיות הממשי החיובי כך שלכל $z$ המקיים $abs(z-z_0)<R_C$ הסכום מתכנס בהחלט ועבור כל $z$ המקיים $abs(z-z_0)>R_C$ הטור מתבדר (לא ידוע מה קורה כאשר $abs(z-z_0)=R_C$ וכל פעם צריך לבדוק).\
  הגדרנו את נוסחת הדאמר להיות
  $ 1/R_C = limsup_(n arrow.r infinity) abs(c_n)^(1/n) $
]

=== האקספוננט המורכב
#theorem[
  אם $f$ הולומורפית אז $f'=f$ אם ורק אם $f(z)=c dot.op e^z$ עבור $c$ קבוע.
]

#corollary("מסקנות מזהות אויילר")[
  + $e^(i theta) = cos(theta) + i sin(theta), z = abs(z)+e^(i theta) = abs(z)(cos(theta)+i sin(theta)))$
  + $z=x+i y ==> e^z = e^x (cos(y) + i sin(y))$
  + $abs(e^z)=e^x, Arg(e^z)=y$
]

=== הלוגריתם המרוכב ופונקציית הארגומנט
#definition("הענף הראשי של הלגוריתם")[
  $ Log(z) = log(abs(z))+i Arg(z) $
]

#definition("ענף של הארגומנט")[
  יהי $G subset CC$ תחום כך ש־$0 in.not G$. נגדיר ענף של הארגומנט להיות כל $alpha(z)$ שרציפה מעל $G$ כך שלכל $z in G$ מתקיים $alpha(z) in {Arg(z) + 2pi k bar k in ZZ}$.
]

#definition("ענף של הלגוריתם")[
  יהי $G subset CC$ תחום כך ש־$0 in.not G$. נגדיר ענף של הלגוריתם להיות כל פונקציה $ell(z)$ שרציפה מעל $G$ כך שלכל $z in G$ מתקיים $ell(z) in {Log(z)+2pi i k bar k in ZZ}$ או באופן שקול $e^(ell(z))=z$.
]

#remark[
  נשים לב שיכול להיות שעבור $z_1, z_2 in G$ מתקיימים
  $ e^(z_1) = e^(z_2) wide Arg(z_1)=Arg(z_2) wide Log(z_1) = Log(z_2) $
  אבל $z_1 != z_2$! לדוגמה, $z_1 = z_2 + 2 pi k$ (זאת מכיוון ש־$log$ זוכר אורך ולא זווית ו־$Arg$ זוכר זוויות).\
  #link("https://www.desmos.com/calculator/ukhazznn82", "דוגמה של דניאל (אני לחיץ):")
  $ z_1 = abs(-10), z_2 = abs((10(1+i))/sqrt(2)) $
  אכן הזווית של שניהם היא אפס (הם על הציר הממשי) והאורך שלהם אותו הדבר מחוקי לגוריתמים.
]

#proposition("ענף של הלוגריתם הוא הולומורפי")[
  אם $ell$ היא ענף של הלוגריתם מעל תחום $G$ אז $ell in Hol(G)$ ויתר על־כן $ell'(z)=1/z$.
]

#definition("ענף לוגריתמי של פונקציה")[
  תהיי $f in Hol(G)$ ו־$f(z)!=0$ לכל $z in G$, אז נגדיר ענף של $log(f)$ להיות כל פונקציה רציפה $g$ המקיימת $e^(g(z))=f(z)$.\
  בפרט נובע ש־$g$ הולומורפית ו־$g'(z)=(f'(z))/f(z)$
]

#theorem("משפט העתקה הפתוחה")[
  תהיי $f:G arrow.r CC$ פונקציה הולומורפית אז $f$ העתקה פתוחה, כלומר שולחת קבוצות פתוחות לקבוצות פתוחות.
]

#definition("נגזרת לוגריתמית")[
  אם $f:G arrow.r CC$ לא מתאפסת, הנגזרת הלגוריתמית מוגדרת להיות $f'/f$.
]<log_derivative>

#definition[
  יהי $G subset CC$ תחום שיש עליו ענף של הלגוריתם. לכל $sigma in CC$ נגדיר $z^sigma =exp(sigma log(z))$
]

=== משוואות קושי־רימן
#notation[
  תהיי $f:CC arrow CC$ ונסמן $re(f) = u(x,y), im(f) = v(x,y)$ כאשר $u,v : RR^2 arrow.r RR$ ו־$f(x+i y) = u(x,y) + i v(x,y)$.
]
#theorem[
  תהיי $f=u+i v$ פונקציה $CC$־דיפרנציאבילית, אזי
  $ f'=(partial u)/(partial x) + i (partial v)/(partial x) = (partial v)/(partial y) - i (partial u)/(partial y) $
]
#theorem("משוואות קושי־רימן")[
  תהיי $f:CC arrow.r CC$ שהיא $CC$־דיפרנציאבילית ב־$z=x+i y$ אם ורק אם מתקיימות המשוואות הבאות (משוואות קושי־רימן)
  $
    (partial u)/(partial x) (x,y) = (partial v)/(partial y) (x,y) wide (partial u)/(partial y) (x,y) = - (partial v)/(partial x) (x,y)
  $
  ובמקרה זה זה שווה לנגזרת.
]
#theorem[
  יהי $G subset CC$ תחום ו־$f in Hol(G)$, הבאים שקולים
  + $f$ קבועה
  + $f' eq.triple 0$
  + $re(f) = u$ קבוע
  + $im(f) = v$ קבוע
  + $abs(f)$ קבועה
  + $arg(f)$ קבועה (אם $f!=0$)
]

#definition("Wirtinger Operators")[
  $
    partial_z = 1/2 (partial/(partial x) - i partial/(partial y)) wide partial_(overline(z)) = 1/2 (partial/(partial x) + i partial/(partial y))
  $
]

#proposition[
  + $partial_(overline(z)) f = 1/2 (u_x - u_y + i(v_x + u_y))$
  + $f$ הולומורפית אם ורק אם $partial_(overline(z)) f = 0$
  + $overline(partial_z f) = partial_overline(z) overline(f)$
  + $overline(partial_overline(z) f) = partial_z overline(f)$
  + $partial_z (f dot.op g) = (partial_z f) dot.op g + f dot.op (partial_z g)$
  + $partial_overline(z) (f dot.op g) = (partial_overline(z) f) dot.op g + f dot.op (partial_overline(z) g)$
  + $partial_z (f compose g) = ((partial_z f) compose g) dot.op partial_z g + ((partial_overline(z) f) compose g) dot.op partial_z overline(g)$
  + $partial_overline(z) (f compose g) = ((partial_z f) compose g) dot.op partial_overline(z) g + ((partial_overline(z) f) compose g) dot.op partial_overline(z)overline(g)$
]

=== פונקציות הרמוניות
#definition("הלפסליאן")[
  תהיי $u:RR^2 arrow.r RR$ נגדיר את הלפסליאן להיות
  $ Delta u = (partial^2 u)/(partial x^2)+(partial^2 u)/(partial y^2) = 4partial_(z overline(z)) u $
]
#definition("פונקציה הרמונית")[
  נגדיר כי $u : RR^2 arrow.r RR$ היא הרמונית אם היא גזירה פעמיים ומתקיים $Delta u = 0$
]

#theorem[
  אם $f in Hol(G) inter C^2 (G)$ אז $re(f), im(f)$ הן הרמוניות
]

#definition("הרמונית צמודה")[
  תהיינה $u, v in Harm(G)$, הן נקראות הרמוניות צמודות אם $u+i v in Hol(G)$ (כלומר מקיימות את משוואות קושי רימן) ואז $v=overline(u)$ (בפרט, הצמידות היא יחידה).
]

#corollary[
  אם $G$ הוא דיסק או מלבן אז לכל $u in Harm(G)$ יש $tilde(u) in Harm(G)$ כך ש־$u+i tilde(v) in Hol(G)$.
]
#theorem("דרך לחישוב הרמונית צמודה")[
  אם $G$ דיסק או מלבן אז $(x_0, y_0) in G$ ו־$u in Harm(G)$, אז
  $ v(x_0,y_0)=integral_y^(y_0) u_x (x_0, t) dif t - integral_x^(x_0) u_y (t,y) dif t -v(x_0,y_0) $
]
=== העתקות קונפורמיות
#definition("נקודה רגולרית")[
  $t_0 in I$ תקרא רגולרית אם $gamma'(t_0) !=0$.
]
#theorem[
  + אם $f in Hol(G) inter C^1(G)$ ו־$f'(z_0)!=0$ אז $f$ משמרת זוויות בין מסילות כלומר $z_0$ היא נקודה רגולרית.
  + אם $f in C^1 (G)$ ו־$f$ משמרת זוויות בין מסילות עבורן $z_0$ היא נקודה רגולרית אז $f$ היא $CC$־דיפרנציאבילית ו־$f'(z_0) = 0$
]
#definition("העתקה קונפורמית")[
  נגדיר ש־$f$ היא העתקה קונפורמית אם היא משמרת זוויות בין מסילות או באופן שקול אם היא הולומורפית ו־$f'!=0$.\
  בפרט, העתקה קונפורמית היא הפיכה וההופכית שלה היא גם העתקה קונפורמית.
]

#pagebreak()
== אינטגרלים קווים
=== הקדמה
#definition("אורך של מסילה")[
  $ L(f compose gamma) = integral_a^b abs(f'(gamma(t)))abs(gamma'(t)) dif t $
]
#definition(
  "אינטגרל קווי",
)[יהיו $G subset.eq CC$ תחום, $f: G arrow.r CC$ רציפה ו־$gamma$ מסילה $C^1$ שתמונתה מוכלת ב־$G$. האינטגרל המסילתי של $f$ לאורך $gamma$ הוא
  $ integral_gamma f dif gamma colon.eq integral_a^b f(gamma(t))gamma'(t) dif t $]
#definition("מסילה פשוטה")[
  מסילה $gamma$ תיקרא פשוטה אם היא חד־חד ערכית. עקומה תקרא פשוטה אם היא תמונה של מסילה פשוטה.
]
#definition("תחום טוב")[
  תחום $G$ ייקרא תחום טוב אם $G$ חסומה ואם $partial G$ היא איחוד סופי זר של מסילות פשוטות ו־$C^1$ למקוטעין מאורך סופי ונגדיר
  $ integral_(partial G) f(z) dif z = sum_(j=1)^N integral_(Gamma_j) f(z) dif z $
]
#definition("תחום כוכב")[
  תחום $G$ נקרא תחום כוכב אם קיים $z_0$ כך שלכל $z in G$ מתקיים $[z_0, z] in G$.
]
#theorem("האי־שיוויון האהוב עלינו ממרוכבות")[לכל $f in Hol(G), gamma:I arrow.r G$ מתקיים
  $
    abs(integral_gamma f(z) dif z)<=max_gamma abs(f) dot.op L(gamma) colon.eq max_(t in I) abs(f(gamma(t))) dot.op L(gamma)
  $
]
#theorem[
  אם $f_n arrow.r f$ במידה שווה מקומית (במידה שווה בכל קבוצה קומפקטית $K subset G$) ב־$G$ אז לכל $gamma:I arrow.r G$ מתקיים
  $ lim_(n arrow.r infinity) integral_gamma f_n (z) dif z = integral_gamma f(z) dif z $
]
#theorem("קירוב פוליגונלי")[
  תהיי $gamma : I arrow.r G$ כאשר $I=[a,b]$ מסילה רציפה למקוטעין ותהיי $f in Hol(G)$. \
  אז לכל $epsilon > 0$ קיימת חלוקה של $I$, $a=t_0 < t_1 < dots.h.c < t_N = b$ כך שמתקיים
  $ abs(integral_gamma f(z) dif z - integral_(sum_epsilon) f(z) dif z) < epsilon $
  כאשר $sum_epsilon = sum_(k=1)^N [gamma(t_(j-1), gamma(t_j))]$.
]

=== משפט קושי
#theorem("משפט קושי במשולש")[יהי $T$ משולש סגור ו־$G$ סביבה פתוחה של $T$, אזי לכל $f in Hol(G)$ מתקיים
  $ integral_(partial T) f(z) dif z = 0 $]
#theorem("משפט קושי בקבוצה קמורה")[תהיי $K$ קבוצה קמורה חסומה ו־$G$ סביבה פתוחה של $K$, אז לכל $f in Hol(G)$ מתקיים
  $ integral_(partial K) f(z) dif z = 0 $
  _תזכורת (קבוצה קמורה)_: $K subset RR^k$ נקראת קמורה אם לכל $x,y in K$ מתקיים
  $ [x,y] colon.eq {lambda x + (1-lambda)y bar lambda in [0,1]} subset.eq K $
]
#theorem("משפט קושי בתחום טוב")[יהי $G$ תחום טוב אז לכל $f in Hol(G inter C(overline(G)))$ מתקיים
  $ integral_(partial G) f(z) dif z = 0 $
]
=== מסקנות ממשפט קושי
#theorem("נוסחת אינטגרל קושי")[
  יהי $G subset CC$ תחום טוב, $gamma = partial G$ ותהיי $f in Hol(G) inter C(overline(G))$. אזי
  $ integral_gamma f(w)/(w-z) dif w = mycases(2pi i f(z), z in G, 0, z in.not overline(G)) $
  כאשר האינטגרל בצד שמאל נקרא *אינטגרל קושי*.
]
#theorem("נוסחת אינטגרל קושי לנגזרת")[
  תהיי $gamma$ איחוד סופי של מסילות $C^1$ ותהיי $phi in C(gamma)$. נגדיר
  $ F(z) colon.eq 1/(2pi i) integral_gamma phi(w)/(w-z) dif w $
  אז $F in Hol(CC without gamma)$ ויתר על־כן
  $ F^(n) (z) = n!/(2pi i) integral_gamma phi(w)/(w-z)^(n+1) dif w $
]
#corollary("טיילור")[
  אם $f$ הולומורפית אז פיתוח טיילור של $f$ מסביב ל־$z$ מתכנס במידה שווה בדיסק.\
  יתר על־כן, $ f^(n) (z) = n!/(2pi i) integral_({abs(w-z)=rho}) f(w)/(w-z)^(n+1) dif w $
  עבור $rho<dist(z, partial G)$ ומתקיים
  $ f(w) = sum_(n=0)^infinity (f^(n) (z))/n! (w-z)^n wide abs(z-w)<delta $
]
#corollary[
  אם $f$ הולומורפית אזי היא גזירה אינסוף פעמים במובן המורכב.
]
#theorem("משפט מוררה")[
  אם $G$ תחום ו־$f in C(G)$ מקיימת שלכל משולש $T subset G$ מתקיים $integral_(partial T) f(w) dif w = 0$ אז $f in Hol(G)$.
]
#theorem("משפט ויירטשטראס")[
  אם $f_n in Hol(G)$ ונניח $f_n arrow f$ בצורה לוקאלית במידה שווה, אז
  + $f in Hol(G)$
  + לכל $j$, $f_n^(j) arrow.r f^(j)$ בצורה לוקאלית ובמידה שווה ($j^(j)$ זו הנגזרת ה־$j$)
]
#theorem("אי־שיוויון קושי")[
  תהיי $f in Hol(B(z_0, R))$ אז לכל $n in NN$
  $
    abs(f^(n) (z))=n!/(2pi i) integral_({abs(w-z)=rho}) abs(f(w))/abs(w-z)^(n+1) dif w <= abs(n!/(2pi)) (max_(abs(w-z)=R) abs(f))/R^(n+1) dot.op L({abs(z-w)=R})=n!/R^n max_(abs(w-z)) abs(f)
  $
]
#theorem("משפט ליוביל")[
  אם $f in Hol(CC)$ ו־$f$ חסומה, אז $f$ קבועה.
]
#theorem("המשפט היסודי של האלגברה")[
  יהי $p$ פולינום מרוכב מדרגה של לפחות $1$, אז יש לו שורש.
]
#corollary[
  כל פולינום מדרגה $d$ ניתן לכתיבה כמכפלה $p(z)=a_0 product_(j=1)^d (z-z_k)$ עבור $z_k in CC$.
]
#theorem("משפט ערך הממוצע")[
  אם $f in Hol(G)$, $z in G$ ו־$rho<dist(z, partial G)$ אז
  $ f(z) = 1/(2pi) integral_(-pi)^pi f(z+rho e^(i t)) dif t $
  כלומר, $f(a)$ הוא הממוצע של הערכים ב־$partial B(z, rho)$.]
#theorem("עיקרון המקסימום")[
  אם $f in Hol(G) inter C(overline(G))$ ולא קבועה אז $abs(f)$ מקבלת מינימום ומקסימום גלובאליים על השפה של $G$.
]
#theorem("עיקרון פרגמן-לינדלוף")[
  יהי $G subset CC$ תחום לא חסום ו־$f in Hol(G)$ פונקציה חסומה המקיימת $abs(f(z))<=M$ לכל $z in partial G$.\
  אז $abs(f)<=M$ על $G$, כלומר $abs(f)$ חסומה על $G$.
]
#theorem("משפט היחידות 1")[
  יהי $G$ תחום ו־$f in Hol(G)$. נניח שקיים $z_0 in G$ כך שלכל $n in NN$ מתקיים $f^(n) (z_0) = 0$. אזי $f eq.triple 0$.
]
#theorem("טענה שלפני משפט היחידות 2")[
  יהי $G$ תחום ו־$f in Hol(G)$ ונניח שהריבוי של $f$ ב־$z_0$ הוא $m$.\
  אזי $f(z) = g(z) (z-z_0)^m$ עבור $g in Hol(G)$ המקיימת $g(z_0)!=0$.
]
#theorem("משפט היחידות 2")[
  יהי $G$ תחום ו־$f in Hol(G)$ ונניח שקיימת $z_0 in G$ כך ש־${z_n}_(n=1)^infinity subset G$ מקיימת $z_n arrow.r z_0$.\
  אם $f(z_n) = 0$ לכל $n in NN$ אז $f eq.triple 0$.
]


#pagebreak()
== טורי לורן
#definition("טור לורן")[
  טור מהצורה
  $
    sum_(n=-infinity)^infinity c_n (z-z_0)^n = sum_(n=-infinity)^(-1) c_n/(z-z_0)^(-n) +sum_(n=0)^infinity c_n (z-z_0)^n = sum_minus + sum_plus
  $
  ייקרא טור לורן, כאשר הרדיוס התכנסות עבור
  $
    1/R_plus colon.eq limsup_(n arrow.r infinity) abs(c_n)^(1/n) \
    1/R_minus colon.eq limsup_(n arrow.r infinity) abs(c_(-n))^(1/n)
  $
  הוא ${R_minus < abs(z-z_0) < R_plus}$.
]
#theorem[תהיי
  $f in Hol({R_minus}<abs(z-z_0)<R_plus})$, אזי $sum_(n=-infinity)^infinity c_n (z-z_0)^n$ מתכנס לוקאלית במידה שווה ל־$f$ ומתקיים
  $ c_n colon.eq 1/(2pi i) integral_({abs(zeta-z_0)=r}) f(zeta)/(zeta-z_0)^(n+1) dif zeta $
]

=== נקודות סינגולריות
#definition("נקודה סינגולרית אינטגרבילית")[
  $x_0$ נקראת סינגולרית אינטגרבילית של $f:RR arrow.r RR^d$ אם $f$ רציפה על $RR without {x_0}$ ומתקיים
  $ integral_(x_0-epsilon)^(x_0 + epsilon) abs(f(t)) dif t < infinity $
  #remark[נקודה סינגולרית סליקה היא סינגולרית אינטגרבילית.]
]
#definition[
  עבור $a in CC$ נסמן ב־$U_a$ סביבה פתוחה של $z$ וב־$U_a^*$ את הסביבה המנוקבת $U_a without {a}$.
]
#definition("נקודות סינגולריות")[
  תהיי $f in Hol(U_a^*)$. נסווג את הנקודות הסינגולריות של $f$ ב־$z=a$ באופן הבא
  + סליקה – ניתן להמשיך את $f$ לנקודה $a$ כך שתהיה הולומורפית (כלומר, אם $f|_(U_a^*)$ חסומה)
  + קוטב – הנקודה $a$ איננה סינגולריות סליקה וקיים $m>=1$ כך שלפונקציה $(z-a)^m f(z)$ יש סינגולריות סליקה ב־$a$.\
    נגדיר את סדר הקוטב של $f$ ב־$a$ להיות ה־$m$ המינימלי המקיים זאת.
  + עיקרית – הגבול $lim_(z arrow.r a) f(z)$ איננו קיים במובן הרחב
]<singularities>
#theorem[
  $a$ קוטב של $f$ אם ורק אם $lim_(z arrow.r f(z)) = infinity$ (כלומר $lim_(z arrow.r a) abs(f(z))=infinity$).
]
#theorem(
  "הקשר בין טור לורן לבין נקודות סינגולריות",
)[
  נניח $f(z) = sum_(n=-infinity)^infinity c_n (z-a)^n$, אז
  + $a$ קוטב אם ורק אם קיים $m>=1$ כך שלכל $n<-m$ מתקיים $c_n = 0$ (כלומר , טור הלורן מכיל רק מספר סופי של חזקות שליליות )
  + $a$ סינגולרית עיקרית אם ורק אם טור הלורן מכיל אינסוף חזקות שליליות
]
#theorem(
  "משפט קורטוזי־ויירשטראס",
)[אם $a$ סינגולרית עיקרית של הפונקציה $f$, אז $V$, סביבה פתוחה של $a$, הקבוצה $f(V without {a})$ צפופה ב־$CC$ (כלומר $overline(f(V without {a}))=CC$).]

#definition("פונקציה רציונלית")[
  פונקציה $f:CC^* arrow.r CC^*$ היא פונקציה רציונלית אם $f$ ניתנת לכתיבה על־ידי $f(z)=p(z)/q(z)$ ו־$p,q$ פולינומים בלי שורשים משותפים.
]

#definition($infinity"נקודות סינגולריות ב־"$)[
  + נגדיר ש־$f$ אנליטית ב־$infinity$ אם $F$ יש סינגולריות סליקה ב־$0$
  + אם ל־$f$ יש קוטב ב־$infinity$ אז נגדיר של־$F$ יש קוטב ב־$0$
  + אם ל־$f$ יש סינגולרית עיקרית ב־$infinity$ אז ל־$F$ יש סינגולרית עיקרית ב־$0$
]

#definition("פונקציה מרומורפית")[
  תהיי $f:G arrow.r CC^*$ ל־$G subset CC$. נאמר ש־$f$ היא מומורפית אם לכל $a in G$ קיימת סביבה $U_a subset.eq G$ כך ש־$f in Hol(U_a^*)$ וכן $f$ הולומורפית ב־$a$ או ש־$a$ קוטב (באופן שקול, $f$ מומורפית אם היא הולומורפית בכל $CC$ מלבד בקבוצה של קטבים מבודדים).\
  את אוסף הפונקציות המומורפיות נסמן ב־$Mer(G)$ (זהו כמובן שדה).
]

#corollary[
  תהיי $f:CC^* arrow CC^*$
  + אם $f$ הולומורפית ב־$CC union {infinity}$ אז $f$ קבועה
  + אם $f$ הולומורפית ב־$CC$ ויש לה קוטב ב־$infinity$ אז $f$ פולינום
  + אם $f$ הולומורפית ב־$CC^* without {a_1, a_2, dots.h, a_N}$ ולכל $j$, $a_j$ היא קוטב מסדר $j$, אז $f$ פונקציה רציונלית
]
#corollary[
  אם $f in Hol(CC)$ לא רציונלית, אז ל־$f$ יש סינגולרית עיקרית ב־$infinity$.
]

=== שאריות
#definition(
  "שארית בנקודה",
)[יהיו $a in CC$ ו־$f in Hol(U_a^*)$. נקבע $epsilon > 0$ כך ש־${0<abs(z-a)<epsilon} subset U_a^*$ ונגדיר את השארית ב־$a$ להיות
  $ res_f (a) = 1/(2pi i) integral_(abs(z-a)=epsilon) f(z) dif z $
]
#theorem(
  "משפט השארית של קושי",
)[יהי $G subset CC$ תחום טוב, $f in Hol((G without {a_1, a_2, dots.h, a_N} ) inter (overline(G) without {a_1, a_2, dots.h, a_N}))$. אזי
  $ 1/(2pi i) integral_(partial G) f(z) dif z = sum_(j=1)^N res_f (a_j) $]
#proposition[אם $f(z) = (phi(z))/(psi(z))$ מקיימת $psi(a)=0, phi(a) !=0, psi'(a) != 0$ אזי $res_f (a) = (phi(a))/(psi'(a))$.]
#proposition[אם $f in Hol(G without {a})$ ו־$a$ קוטב מסדר $n$, אזי
  $ res_f (a) = (((z-a)^n f(z))^(n-1) (a))/(n-1)! $]

#definition(
  "שארית באינסוף",
)[תהיי $f$ הולומורפית בסביבה של $infinity$ (כלומר $f in Hol({z in CC bar abs(z) > R_0})$ ונגדיר
  $ res_f (infinity) = -1/(2pi i) integral_(abs(z)=R) f(z) dif z space (R>R_0) $]
#proposition[השארית של #link(<log_derivative>, "נגזרת לוגריתמית") היא הסדר של האפס.\
]

=== בחזרה לחישוב אינטגרלים ממשיים
#lemma[אם
  $phi:{im(z)>=0} arrow.r CC$ פונקציה הולומורפית המקיימת
  $ limsup_(R arrow.r infinity) max_({abs(z)=R}) abs(z dot.op phi(z))<infinity $
  אז לכל $lambda > 0$
  $
    lim_(R arrow.r infinity) integral_({
      abs(z)=R, im(z) >0}) e^(i lambda z)phi(z) dif z = 0
  $
]
#pagebreak()

== עקרונות גיאומטריים
=== עקרון הארגומנט
#theorem("עקרון הארגומנט")[
  תהיי $f in Mer(G)$ ו־$G_1 subset.double G$ ($G_1 subset G$ ו־$overline(G) subset.eq G$) תחום טוב.\
  נניח כי על $partial G_1$ ל־$f$ אין קטבים או אפסים, אזי
  $ 1/(2pi i) integral_(partial G_1) f'/f dif z = \#(Z_f inter G_1)-\#(P_f inter G_1) $
  כאשר $Z_f$ האפסים של $f$ ו־$P_f$ הקטבים של $f$ (כולל ריבויים).
]
#lemma("לוגריתם רציף")[
  יהי $I=[a,b] subset RR$ ותהיי $h:I arrow.r CC without {0}$ העתקה רציפה. אז קיימת העתקה $psi:I arrow CC$ כך ש־$e^psi = h$ והיא יחידה עד כדי $2pi i ZZ$.
]

#definition("השינוי של הארגומנט")[
  תהיי $gamma:[a,b] arrow CC$ ונניח ש־$f:gamma arrow CC without {0}$.\
  מהלמה של הלוגריתם הרציף ראינו שקיימת $psi: I arrow CC$ רציפה כך ש־$e^psi = f compose gamma$. נגדיר את השינוי/הגידול של הארגומנט ב־$f$ לאורך $gamma$ להיות
  $ i Delta_gamma f colon.eq Delta_gamma log(f) = psi(b)-psi(a) in 2pi ZZ $
]

=== משפט רושה
#theorem(
  "משפט רושה",
)[תהיינה $f, g in Hol(G)$ ותהיי $H subset.eq G$ כך ש־$overline(H) subset.eq G$ ו־$H$ תחום טוב.\
  נניח שלכל $z in partial H$ מתקיים $abs(g(z))<=abs(f(z))$, אזי
  $ \# (Z_(f+g) inter H)=\# (Z_f inter H) $]<Rouches_theorem>

#corollary("משפט גאוס")[
  תהיי $g(z)=sum_(k=0)^(n-1) a_k z^k$ וניקח $f(z)=a_n z^n$ כאשר $a_n in CC without {0}$. אז ל־$f+g$ יש $n$ אפסים (כולל ריבוי).
]
#corollary("ריבויים בטבעת")[
  בהתאם לתנאי משפט רושה, ובהינתן $A={z in CC bar a < abs(z) < b}$ טבעת, אזי
  $ \#{"zeroes in" a<abs(z)<b}=\# {"zeroes in" abs(z)<b} -\# {"zeroes in" a<abs(z)} $
]<Rouches_theorem_ring>

#theorem("העתקה מקומית")[
  תהיי $f in Hol(G)$ לא קבועה, $z_0 in G$ ו־$w_0 = f(z_0)$. יהי $m$ סדר ההתאפסות של $f-w_0$ בנקודה $z_0$.\
  אז קיים $epsilon_0 > 0$ כך שלכל $0<epsilon<epsilon_0$ יש $delta>0$ כך שלכל $B(w_0, delta)^*$ יש בידיוק $m$ פתרונות שונים למשוואה $f(z)=w$ בכדור $B(z_0, epsilon)$.
]

=== אינדקס ליפוף
#definition("אינדקס ליפוף")[
  תהיי $gamma: I arrow.r CC$ עקומה סגורה, נגדיר את אינדקס הליפוף של $gamma$ להיות
  $ ind_gamma (z) colon.eq 1/(2pi i) integral_gamma 1/(zeta-z) dif zeta $
]
#theorem[
  + הפונקציה $ind_gamma (dot.op) : CC without gamma arrow ZZ$ היא רציפה
  + $ind_gamma (infinity) =lim_(z arrow.r, infinity) ind_gamma (z) = 0$
  + אם $CC without gamma = union.dot Omega_j$ כאשר $Omega_j$ הם הרכיבי קשירות של $CC without gamma$ אזי $ind_gamma (dot.op)|_)(Omega_j)$ סופי ו־$ind_gamma (dot.op)|_(Omega_infinity) = 0$ כאשר $Omega_infinity$ זה הרכיב קשירות הלא חסום.
]

#definition("מעגל מוכלל")[
  תהיי $gamma$ עקומה גזירה ברציפות למקוטעין. נאמר ש־$gamma$ היא מעגל מוכלל אם היא פשוטה וסגורה.
]

#theorem("משפט קושי גרסה מוכללת")[
  אם $G subset CC$ תחום ו־$gamma : I arrow.r G$ מעגל מוכלל המקיים $ind_gamma (z) = 0$ לכל $z in.not overline(G)$ אזי לכל $f in Hol(G)$
  $ integral_gamma f(z) dif z =0 $
]

#corollary[
  לכל $z in G without gamma$ ו־$f in Hol(G)$
  $ 1/(2pi i) integral_gamma f(zeta)/(zeta - z) dif z = ind_gamma (z) dot.op f(z) $
]

=== הלמה של שוורץ
#lemma("הלמה של שוורץ")[
  תהיי $f: DD arrow.r DD$ פונקציה לא קבועה הולומורפית המקיימת $f(0)=0$, אזי
  + $abs(f(z))<abs(z)$
  + $abs(f'(0))<=1$
  + אם קיים $z_0!=0$ כך ש־$abs(f(z_0))=abs(z_0)$ או $abs(f'(0))=1$ אז $f(z) = lambda dot.op z$ עבור $lambda in TT$ כלומר $f$ היא סיבוב
]

#definition($Aut(DD)$)[
  $ Aut(DD) colon.eq {f in Hol(DD), DD "היא חד־חד ערכית ועל" f} $
]

#theorem[
  $f in Aut(DD) <==> f(z) = lambda dot.op (z-a)/(1-z dot.op overline(a))$ עבור $a in DD, abs(lambda)=1$.
]

#theorem("משפט שוורץ-פיק")[
  תהיי $f : DD arrow.r DD$ לא קבועה והולומורפית
  + כל $z_1, z_2 in DD$ מקיימים
    $ abs((f(z_2)-f(z_1))/(1-f(z_2)overline(f(z_1)))) <= abs((z_2-z_1)/(1-z_2 overline(z_1))) $
  + כל $z in DD$ מקיים
    $ abs(f'(z))<=(1-abs(f(z))^2)/(1-abs(z)^2) $
  + אם באחת הנקודות יש שיוויון באחד משני המקרים הקודמים, $f in Aut(DD)$
]

=== משפט ההעתקה של רימן
#definition("תחום פשוט קשר")[
  תחום $G subset CC$ נקרא פשוט קשר אם המשלים של $G$ ב־$hat(CC) = CC union {infinity}$ הוא קשיר.
]

#theorem[
  הבאים שקולים
  + $G$ תחום פשוט קשר
  + האינטגרל של כל פונקציה הולומורפית ב־$G$ לאורך מסילה סגורה וחלקה למקוטעין הוא אפס
  + כל פונקציה הולומורפית ב־$G$ היא נגזרת של פונקציה הולומורפית
  + כל פונקציה הולומורפית ב־$G$ שלא מתאפסת היא בעלת לוגריתם
  + כל פונקציה הולומורפית ב־$G$ שלא מתאפסת היא בעלת שורש
  + לכל מסילה סגורה, חלקה למקוטעין ב־$G$, אינדקס הליפוף של כל נקודה שאיננה ב־$G$ הוא אפס
]

#theorem("משפט ההעתקה של רימן")[
  יהי $G subset CC$ תחום פשוט קשר כך ש־$CC without GG != emptyset$ ו־$a in G$. אז אז קיימת העתקה קונפורמית (פונקציה הולומורפית, חד־חד ערכית ועל שההופכית שלה היא הולומורפית, נקרא ביהולומורפית) יחידה $phi:DD arrow.r G$ המקיימת $phi(0) = a$ ו־$phi'(0) > 0$.
]

#theorem("משפט מונטל")[
  כל משפחה מקומית חסומה של פונקציות הולומורפיות $cal(F)$ המוגדרת על תחום $G$ מגדירה משפחת נורמות, כלומר לכל ${f_n} subset cal(F)$ יש תת־סדרה מתכנסת.
]

#theorem("משפט הורוויץ")[
  תהיי ${f_n}_(n=1)^infinity$ סדרת פונקציות הולומורפיות המתכנסת במידה שווה מקומית בתחום $G$ לפונקציה $f$ שאינה קבועה אפס.\
  אם ל־$f$ יש אפס מסדר $m$ בנקודה $z_0$ אז לכל $epsilon > 0$ מספיק קטן ולכל $n$ מספיק גדול, לפונקציה $f_n$ יש בידיוק $m$ אפסים בדיסק $B(z_0, epsilon)$ (כולל ריבוי). בנוסף, האפסים האלו מתכנסים לנקודה $z_0$ כאשר $n arrow.r infinity$.
]
= דברים שימושים בפתרונות תרגילים
== למצוא כמה פתרונות (כולל ריבויים)
שאלות קלאסיות לשימוש #link(<Rouches_theorem>)[משפט רושה (אני לחיץ)] ו#link(<Rouches_theorem_ring>)[משפט רושה בטבעת (אני לחיץ)]
#example[
  נמצא כמה פתרונות (כולל ריבועיים) יש למשוואות בתחומים הנתונים.
  + $z^7-5z^4+z^2-2=0$ בדיסק היחידה $DD$
  + $z^4+3z=1$ בטבעת ${z bar 1<abs(z)<2}$
  + $e^z=3z^n$ בחצי מישור ${z in CC bar re(z)<1}$ ו־$n in NN$
]

#solution[
  + נגדיר $p(z) = z^7-5z^4+z^2-2$ כאשר $g(z)=-5z^4$ ו־$f(z)=z^4+z^2-2$, על $abs(z)=1$ מתקיים
    $ abs(g(z))=abs(-5z^4)=5 wide abs(f(z))=abs(z^4+z^2-2)=0 $
    אז מתקיים $abs(f(z))<=abs(g(z))$ ול־$g$ יש אפס אחד בראשית בריבוי 4 ולכן ממשפט רושה נקבל שיש למשוואה $4$ פתרונות.
  + מהמסקנה אודות ריבויים בטבעת, נחלק לשתי בדיקות
    $ \#{"zeroes in" 1<abs(z)<2}=\# {"zeroes in" abs(z)<2} -\# {"zeroes in" 1<abs(z)} $
    + על $abs(z)=2$, נכתוב $p(z)=z^4+(3z-1)$ כאשר $g(z)=z^4$ ו־$f(z)=3z-1$ ומתקיים
      $ abs(g(z))=abs(z)^4=16 wide abs(f(z))=abs(3z-1)=5 $
      כלומר $abs(f(z))<abs(g(z))$ ולכן תנאי משפט רושה מתקיימים ולכן ל־$p$ יש את אותה כמות אפסים כמו ל־$g$ ול־$g$ יש אפס אחד בראשית, אבל עם הכפליות יש לו ארבע.
    + על $abs(z)=1$ נכתוב $p(z)=3z+(z^4-1)$ כאשר $g(z)=3z$ ו־$g(z)=z^4-1$ ומתקיים
      $ abs(g(z))=abs(3z)=3 wide abs(f(z))=abs(z^4-1)=0 $
      כלומר $abs(f(z))<abs(g(z))$ ולכן תנאי משפט רושה מתקיימים ולכן ל־$p$ יש את אותה כמות אפסים כמו ל־$g$ ול־$g$ יש אפס אחד בראשית עם ריבוי אחד.
    בסך־הכל קיבלנו $4-1=3$ כלומר $3$ פתרונות למשוואה הנתונה.
  + נגדיר $F(z)=3z^n-e^z$ ונסתכל קודם כל על דיסק היחידה, על $abs(z)=1$ מתקיים
    $ abs(f(z)) = abs(e^z)=e < 3 wide abs(g(z)) = abs(3z^n) = 3^n = 3 $
    ושוב מתנאי משפט רושה מתקיים $abs(f(z)) < abs(g(z))$ ולכן יש להם את אותה כמות אפסים, ול־$g$ יש ריבוי אחד בראשית עם ריבוי $n$. \
    נבחן מה קורה אם $abs(z)>=1$ ו־$re(z) <1$, אז
    $ abs(f(z))=abs(3z^n) >= 3 wide abs(g(z))=abs(e^z)=e^(re(z)) < e < 3 $
    כלומר
    $ abs(3z^n) > abs(e^z) ==> 3z^n-e^z != 0 $
    כלומר אין התאפסויות בתחום הזה בכלל.\
    לסיכום יש לנו $n$ אפסים, קרי $n$ פתרונות.
]

#pagebreak()
== טורי לורן
=== פיתוחים שימושים
+ $ abs(w)<1, space 1/(1-w)= sum_(n=0)^infinity w^n $
+ $ 1/(1+w) = sum_(n=0)^infinity (-1)^n w^n $
+ $ 1/(1-w)^k = sum_(n=0)^infinity binom(n+k-1, k-1)w^n $
+ $ e^z = sum_(n=0)^infinity z^n/n! $
+ $ abs(w)<1, space (1+w) = sum_(n=1)^infinity (-1)^(n+1) w^n/n $
+ $ sin(z)=sum_(n=0)^infinity (-1)^n z^(2n+1)/(2n+1)! $
+ $ cos(z)=sum_(n=0)^infinity (-1)^n z^(2n)/(2n)! $
+ $ abs(w)<1, space (1+w)^k sum_(n=0)^infinity binom(k, n)w^n $
=== How To Guide
נזכור שטור לורן הוא חמדן/זללן, ולכן מתכנס *בכל טבעת* שבו הוא רק יכול.\
אז בגדול זה בכל תחום שבו הוא מוגדר היטב (כלומר, הנקודות הסינגולריות שלו הן הנקודות קפיצה).\
את הנקודות הסינגולריות נקבע לפי המיפויים #link(<singularities>)[(אני לחיץ)].\
לפעמים נרצה לעבור בשיטה של מרים ("שיטת מקדמים לא נקבעים") עם הפונקציות הרציונליות, לדוגמה
$
  z^2/((z-2)(z-4)) = z^2/(z^2-6z+8)=(z^2-6z+8+6z-8)/(z^2-6z+8) = 1 + (-6z+8)/(z^2-6z+8) \
  ==> (-6z+8)/(z^2-6z+8)=A/(z-2) + B/(z-4) = (A(z-4)+B(z-2))/(z^2-6z+8) = (z(A+B)-2(B+2A))/(z^2-6z+8) \
  cases(A+B=6, -2B-4A = -8)
$
פותרים את המערך משוואות, מקבלים פונקציה ומפתחים בהתאם: משתמשים בהגבלות כדי לחסום ולהגיע לטורים ידועים.\
תמיד נרצה להגיע לאחד מהטורים שרשום לעיל כי הם הכי קלים.

#pagebreak()
== כשאתה מבולבל – הרם קושי אל־על
יש לנו 3 מסקנות חזקות מאוד ממשפט קושי
+ #theorem("נוסחת אינטגרל קושי")[
    יהי $G subset CC$ תחום טוב, $gamma = partial G$ ותהיי $f in Hol(G) inter C(overline(G))$. אזי
    $ integral_gamma f(w)/(w-z) dif w = mycases(2pi i f(z), z in G, 0, z in.not overline(G)) $
    כאשר האינטגרל בצד שמאל נקרא *אינטגרל קושי*.
  ]
+ #theorem("נוסחת אינטגרל קושי לנגזרת")[
    תהיי $gamma$ איחוד סופי של מסילות $C^1$ ותהיי $phi in C(gamma)$. נגדיר
    $ F(z) colon.eq 1/(2pi i) integral_gamma phi(w)/(w-z) dif w $
    אז $F in Hol(CC without gamma)$ ויתר על־כן
    $ F^(n) (z) = n!/(2pi i) integral_gamma phi(w)/(w-z)^(n+1) dif w $
  ]
+ #theorem("אי־שיוויון קושי")[
    תהיי $f in Hol(B(z_0, R))$ אז לכל $n in NN$
    $
      abs(f^(n) (z))=n!/(2pi i) integral_({abs(w-z)=rho}) abs(f(w))/abs(w-z)^(n+1) dif w <= abs(n!/(2pi)) (max_(abs(w-z)=R) abs(f))/R^(n+1) dot.op L({abs(z-w)=R})=n!/R^n max_(abs(w-z)) abs(f)
    $
  ]

הם כולם עוזרים לנו לקבל מידע על הפונקציות גם כשאנחנו לא יודעים עליהן כלום.

== תוכיחי קיום/אי קיום
