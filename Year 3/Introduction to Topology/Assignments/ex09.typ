#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 09 --- מבוא לטופולוגיה, 80516 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נקבע $x_0$ על הספירה $SS^2$.

#subquestion()
נוכיח שכל מסילה רציפה $gamma:I arrow SS^2$ הומוטופית למסילה ש־$x_0$ אינה נמצא בתמונתה.

#proof[
  תהיי $gamma:I arrow S^2$ מסילה. $I$ קומפקטי ולכן $gamma(I)$ קומפקטית ו־$S^2$ מרחב האוסדרוף ולכן קיימת נקודה $p in S^2 without gamma(I)$ (שכן גם $gamma(I)$ קומפקטית ופונקציה רציפה שולחת קטע לקטע ולכן בפרט לא יכולה לכסות את כל המרחב שלנו שהוא ספירה דו־מימדית בניגוד לקטע שהוא חד־מימדי).\
  נבחר $N=(0,0,1)$ הקוטב הצפוני ואת ההטלה הסטראוגרפית $pi : S^2 without {N} arrow RR^2$.\
  אז $pi compose gamma$ היא מסילה ב־$RR^2$ וראינו שבמישור קיימת הומוטפיה להזזתה כך שלא תעבור דרך $pi(x_0)$ (מקשירות מסילתית), אז $gamma_1 = pi^(-1) compose tilde(gamma)$ כאשר $tilde(gamma)$ היא המסילה המוזזת שלא עוברת בנקודה ולכן $gamma_1$ נותנת מסילה הומוטפית ל־$gamma$ (זה רציף כי העברנו מספרה למישור, הומוטופיה במישור וחזרה לספרה).
]

#subquestion()
נעזר בהטלה הסטראוגרפית על מנת להוכיח ש־$SS^2$ פשוט קשר.

#proof[
  בהרצאה ראינו טענה שמרחב הוא פשוט קשר אם ורק אם כל זוג מסילות בעלות אותן נקודות התחלה וסיום הן הומוטופיות, נרצה להשתמש בטענה הזאת.\
  תהיינה $gamma_1, gamma_2: I arrow SS^2$ שתי מסילות רציפות כלשהן המקיימות את אותן נקודות קצה
  $ gamma_1(0) = gamma_2(0) = a, quad quad gamma_1(1) = gamma_2(1) = b $
  נבחר $x_0 in SS^2$ השונה מנקודות הקצה (כמקודם, יש כזאת).\
  לפי סעיף א', המסילה $gamma_1$ הומוטופית למסילה $eta_1$ ש־$x_0$ אינה בתמונתה והמסילה $gamma_2$ הומוטופית למסילה $eta_2$ ש־$x_0$ אינה בתמונתה.\
  נשים לב שההומוטופיות מסעיף א' שומרות על נקודות הקצה $a$ ו־$b$, ולכן ל־$eta_1$ ו־$eta_2$ יש עדיין את אותן נקודות התחלה וסיום, ושתיהן מוכלות במלואן ב־ $S^2 without \{x_0\}$.\
  נפעיל את $pi : SS^2 without {x_0} arrow RR^2$  ההעתקה הסטראוגרפית (הומיאומורפיזם) מנקודה $x_0$ (אפשר כל נקודה להטלה ולא רק את הקוטב הצפוני כי אפשר לשחזר את אותו תהליך) ונסתכל על ההרכבות
  $ tilde(eta)_1 = pi compose eta_1, quad quad tilde(eta)_2 = pi compose eta_2 $
  קיבלנו שתי מסילות רציפות במישור הממשי $RR^2$ שיש להן בדיוק אותן נקודות התחלה וסיום ($pi(a)$ ו־$pi(b)$).\
  $RR^2$ הוא פשוט קשר כי הוא קשיר מסילתית ואם $gamma : I arrow RR^2$ לולאה כך ש־$gamma(0)=gamma(1)=x_0$ אפשר להגדיר הומוטופיה בהשראת הקמירות
  $ H(t,s) = (1-s)gamma(t) + s x_0 $
  המקיימת
  $
    H(t,0) = gamma(t), quad H(t,1) = x_0, quad H(0,s) = H(1,s) = x_0
  $
  ולכן $RR^2$ הוא פשוט קשר שכן $pi_1 (RR^2)={[e]} = 0$.\
  אז מאותה טענה בהתחלה, כל זוג מסילות ב־$RR^2$ בעלות אותן נקודות קצה הן הומוטופיות זו לזו.\
  תהיי $H: I times I arrow RR^2$ ההומוטופיה ביניהן במישור כך ש־$tilde(eta)_1 tilde tilde(eta)_2$ ונתבונן בהרכבה
  $ F = pi^(-1) compose H : I times I arrow SS^2 without {x_0} subset.eq SS^2 $
  $F$ רציפה והומוטופיה על הספירה השומרת על הקצוות בין $eta_1$ לבין $eta_2$
  מכיוון שהוהטומופיה הוא יחס שקילות מטרנזטיביות נקבל
  $ gamma_1 tilde eta_1 tilde eta_2 tilde gamma_2 ==> gamma_1 tilde gamma_2 $
  אז כל זוג מסילות בעלות אותן נקודות קצה הן הומוטופיות ולכן $SS^2$ הוא פשוט קשר.
]

#question()
יהי $X$ מרחב טופולוגי, $A subset.eq X$ ו־$a in A$. נסמן ב־$i : A arrow X$ את העתקת ההכלה.

#subquestion()
נניח ש־$r:X arrow A$ היא נסג עיוותי ונוכיח ש־$r_* : pi_1 (X,a) arrow pi_1 (A, a)$ איזומורפיזם.

#proof[
  $r$ היא נסג עיוות ולכן קיימת $H:X times I arrow X$ רציפה כך שלכל $x$ מתקיים $H(x,0)=id_X$ ו־$H(x,1)=r(x)$ וכן $H(a,s) = a$ לכל $a in A, s in I$.\
  נסתכל על $i_* : pi_1 (A,a) arrow pi_1 (X,a)$ ו־$r_* : pi_1 (X,a) arrow pi_1 (A,a)$ ההעתקות המושרות על החבורה היסודית (כלומר אלו הפעולות על מחלקות הומוטופיה), קרי עבור $i_*$ לוקחים לולאה ב־$A$ הנתונה $gamma:I arrow A$ ואז רואים אותה ב־$X$ על־ידי $i_* ([gamma])=[i compose gamma]$ אבל בפועל $i compose gamma = gamma$ שכן זו אותה פונקציה רק טווח גדול יותר ובהתאם עבור $r_*$.\  ותהיי $[y] in pi_1 (A,a)$, מתקיים $i_*([gamma])=[gamma]$ בתוך $X$ ולכן $r_*(i_* ([gamma]))=[r compose gamma]$ אבל $gamma$ ב־$A$ ו־$r|_A = id_A$ ולכן $r compose gamma = gamma$ ולכן $r_* i_* = id_(pi(A, a))$.\
  נגדיר $Gamma(t, s) = H(gamma(t), s)$ ומתקיים
  $
    Gamma(t, 0) = gamma(t) \
    Gamma(t, 1) = i(r(gamma(t)))
  $
  שכן נסג עיוות הוא בפרט נסג ולכן נקבל $gamma tilde i compose r compose gamma$ ולכן $[gamma]=i_* r_* ([gamma])$ כלומר $i_*r_* = id_(pi_1 (X,a)) = id_(pi_1 (A,a))$ וקיבלנו איזומורפיזם $r_*$ עם הופכי $i_*$.
]

#subquestion()
נוכיח כי קיימת נסג עיוות עבור $SS^1 subset.eq RR^2 without {0}$.

#proof[
  טבעי לבחור לכל $x!=$ את ההעתקה הרציפה $ r(x) = frac(x, norm(x)) $
  וזו העתקה אל $SS^1$ ולהגדיר
  $ H(x,t) = (1-t)x + t frac(x, norm(x)) = ((1-t)+ frac(t, norm(x)))x $
  מכיוון ש־$norm(x) > 0$ אז בפרט $(1-t)+frac(t, norm(x)) > 0$ והסכום חיובי ולכן $H(x,t) != 0$ ויתר על־כן
  $
    H(x,0) = x \
    H(x,1) = frac(x, norm(x)) = r(x) \
    norm(x) = 1 ==> H(x,t) = x
  $
  כאשר האחרון אומר שכל הנקודות ב־$SS^1$ נשארות קבועות ו־$H$ הומוטופיה בין $id$ ל־$r$ ולכן מההגדרה זה נסג עיוות כנדרש.
]

#question()
יהיו $X_1, X_2$ מרחבים טופולוגיים קשירים מסילתית ויהיו $x_1 in X_1$ ו־$x_2 in X_2$.

#subquestion()
יהיו $gamma_1, delta_1 : I arrow X_1, gamma_2, delta_2 : I arrow X_2$ שתי זוגות של מסילות כך ש־$gamma_i (0) = delta_i (0)$ ו־$gamma_i (1) = delta_i (1)$ עבור $i in {1,2}$.\
נגדיר מסילות $gamma,delta : I arrow X_1 times X_2$ על־ידי
$
  gamma(t) = (gamma_1 (t), gamma_2 (t)) \
  (delta_1 (t), delta_2 (t))
$
נוכיח ש־$gamma~delta$ אם ורק אם $gamma_1 ~ delta_1$ וגם $gamma_2 ~ delta_2$.

#proof[
  $<==$ נניח כי $gamma ~ delta$.\
  מהגדרה, קיימת הומוטופיה של מסילות $H : I times I arrow X_1 times X_2$ כך שמתקיים $H(t,0) = gamma(t), space H(t,1) = delta(t)$ וכן
  $ H(0,s)=gamma(0)=delta(0) wide H(1,s)=gamma(1)=delta(1) $
  נסתכל על $H_i : I times I arrow X_i$ ההטלות על הקורדינאטות ולכן
  $
    H_1 (t,0)=pi_1 (H(t,0))=pi_1 (gamma(t)) = gamma_1 (t) \
    H_1 (0,s)=gamma_1 (0) = delta_1 (0) \
    H_1 (1,s) = gamma_1 (1) = delta_1 (1)
  $
  באופן דומה, $H_1 (t,1) = delta_1 (t)$ ולכן $H_1$ היא הומוטופיה של מסילות בין $gamma_1$ ל־$delta_1$.
  באופן זהה נקבל על $H_2$ ולכן $gamma_1 tilde delta_1$ וכן $gamma_2 tilde delta_2$.\
  $==>$ נניח כי $gamma_1 tilde delta_1$ וגם $gamma_2 tilde delta_2$.\
  נסתכל על ההומוטופיות של מסילות $H_1 : I times I arrow X_1, H_2 : I times I arrow X_2$ כך שמתקיים
  $
    H_i (t,0) = gamma_i (t) wide H_i (t,1) = delta_i (t) \
    H_i (0,s) = gamma_i (0) = delta_i (0) \
    H_i (1,s) = gamma_i (1) = delta_i (1)
  $
  טבעי להגדיר $H : I times I arrow X_1 times X_2$ על־ידי $H(t,s) = (H_1 (t,s), H_2 (t,s))$ והיא רציפה בכל קורדינאטה ולכן רציפה, אז
  $
    H(t,0) = (H_1 (t,0), H_2 (t,0)) = (gamma_1 (t), gamma_2 (t)) = gamma (t) \
    H(t,1) = delta (t) \
    H(0,s) = (H_1 (0,s), H_2 (0,s))=(gamma_1 (0), gamma_2 (0)) = gamma(0) = delta(0) \
    H (1,s) = gamma(1) = delta(1)
  $
  אז $H$ הומוטופיה של מסילות בין $gamma$ ל־$delta$.
]

#subquestion()
נוכיח שיש איזומורפיזם של חבורות $pi_1 (X_1 times X_2, (x_1, x_2)) tilde.equiv pi_1 (X_1, x_1) times (X_2, x_2)$.

#proof[
  נגדיר $Phi :pi_1 (X_1 times X_2, (x_1, x_2)) arrow pi_1 (X_1, x_1) times (X_2, x_2)$ על־ידי $Phi([gamma])=([gamma_1], [gamma_2])$ כאשר $gamma(t) = (gamma_1 (t), gamma_2 (t))$.\
  נניח ש־$[gamma]=[delta]$ ולכן $gamma~tilde$ ומהסעיף הקודם $gamma_1 tilde delta_1, space gamma_2 tilde delta_2$ ולכן $[gamma_1]=[delta_1], [gamma_2] = [delta_2]$ ומכאן נקבל ש־$Phi$ מוגדרת היטב.\
  כזכור, כפל בחבורה היסודית הוא שרשור מסילות ולכן נחשב
  $ Phi([gamma] dot.op [delta]) =Phi([gamma * delta]) $
  אז
  $
    (gamma * delta)_1 = gamma_1 * delta_1, quad
    (gamma * delta)_2 = gamma_2 * delta_2
  $
  ולכן
  $
    Phi([gamma*delta])=Phi([gamma_1 * delta_1], [gamma_2 * delta_2]) = Phi([gamma_1][delta_1], [gamma_2][delta_2]) = Phi([gamma])Phi([delta])
  $
  אז $Phi$ הומומורפיזם.\
  החד־חד ערכיות נובעת ישירות מהסעיף הקודם גם־כן שכן אם $Phi([gamma])=Phi([delta])$ אז $[gamma_1] = [delta_1], [gamma_2] = [delta_2]$ כלומר $gamma_1 ~ delta_1, gamma_2 ~ delta_2$ ומהסעיף הקודם $gamma~delta$ והחד־חד ערכיות נובעת.\
  נשאר להראות על – יהיו $([alpha_1], [alpha_2]) in pi_1 (X_1, x_1) times pi_2 (X_2, x_2)$ אז נגדיר $alpha(t)=(alpha_1 (t), alpha_2 (t))$.\
  מאחר שמתקיים
  $
    alpha_1 (0) = alpha_1 (1) = x_1, quad alpha_2 (0) = alpha_2 (1) = x_2
  $
  אז $alpha$ היא לולאה בבסיס $(x_1, x_2)$ ומתקיים $Phi([alpha])=([alpha_1], [alpha_2])$ ו־$Phi$ על ולכן $Phi$ איזומורפיזם של חבורות.
]

#question()
תהיי $(G, dot.op)$ חבורה ותהיי $tau$ טופולוגיה שמוגדרת על $G$. נאמר כי $G$ חבורה טופולוגית אם פעולות הכפל וההפכי הן רציפות כאשר
$
  G times G arrow G, space (x,y) mapsto x dot.op y \
  G arrow G, space x mapsto x^(-1)
$
תהיי $G$ חבורה טופולוגית ונסמן ב־$1$ את איבר היחידה של $G$.\
תהיי $Omega(G, 1)$ קבוצת כל הלולאות הרציפות עם בסיס ב־$1$. אם $f,g in Omega(G, 1)$ נוכל להגדיר
$ (f times.o g)(s) = f(s) dot.op g(s) $

#subquestion()
נוכיח כי $(Omega(G, 1), times.o)$ היא אכן חבורה.

#proof[
  ראשית עליו להראות סגירות תחת הפעולה $times.o$ אז יהיו $f,g in Omega(G, 1)$.\
  נשים לב ש־$f times.o g$ היא הרכבה של שתי פונקציות רציפות ולכן רציפה שכן כל קורדיאנטה שלה היא רציפה ופעולת הכפל של חבורה $G$ היא רציפה ולכן המסילה $f times.o g$ רציפה ומתקיים מכך ש־$f,g$ לולאות רציפות עם בסיס ב־$1$ (כלומר מתחילות ונגמרות ב־$1$)
  $
    (f times.o g)(0) = f(0) dot.op g(0) = 1 dot.op 1 = 1 \
    (f times.o g)(1) = f(1) dot.op g(1) = 1 dot.op 1 = 1
  $
  ולכן $f times.o g in Omega(G, 1)$ ויש לנו סגירות.\
  בשביל האסוציאטיביות, יהיו $f,g,h in Omega(G, 1)$. מכך ש־$G$ חבורה מתקיים
  $
    ((f times.o g) times.o h)(s) = (f(s) dot.op g(s)) dot.op h(s) = f(s) dot.op (g(s) dot.op h(s)) = (f times.o (g times.o h))(s)
  $
  נראה שיש איבר יחידה – נגדיר $e:I arrow G$ על־ידי $e(s)=1$ ופונקציה קבועה היא פונקציה רציפה ואכן $e in Omega(G, 1)$ ולכל $f in Omega(G, 1)$ ולכל $s in I$ מתקיים
  $
    (e times.o f)(s) = 1 dot.op f(s) = f(s) \
    (f times.o 1)(s) = f(s) dot.op 1 = f(s)
  $
  נשאר רק להראות קיום איבר הופכי – תהיי $f in Omega(G, 1)$ ונגדיר $f^(-1) : I arrow G$ על־ידי $f^(-1)(s) = (f(s))^(-1)$ והיא אכן רציפה שכן זו הרכבה של $f$ עם ההעתקת ההופכי של החבורה $G$ ובעצם זו הרכבה של רציפות ולכן רציף ויתר על־כן מתקיים
  $
    f^(-1)(0)=(f(0))^(-1) = 1^(-1) = 1 \
    f^(-1)(1) = (f(1))^(-1) = 1^(-1) = 1
  $
  ועל־כן, $f in Omega(G, 1)$. כדי שזה יהיה הופכי עלינו לוודא שעבור כל $s in I$ מתקיים
  $ (f times.o f^(-1))(s) = f(s) dot.op (f(s))^(-1) = 1 = e(s) $
  הראינו את כל האקסיומות של החבורה ועל־כן $(Omega(G, 1), times.o)$ היא אכן חבורה.
]

#subquestion()
נוכל להגדיר פעולה $times.o$ על $pi_1 (G,1)$ על־ידי $[f] times.o [g]=[f times.o g]$ לכל $[f],[g] in pi_1 (G,1)$.\
נוכיח כי $times.o$ מוגדרת היטב על $pi_1 (G,1)$ וכי $(pi_1 (G,1), times.o)$ היא חבורה.

#proof[
  יהיו $f_1, f_2, g_1, g_2 in Omega(G, 1)$ כך ש־$f_1 ~ f_2, g_1 ~ g_2$ ולכן קיימות הומוטופיות $F : I times I arrow G$ בין $f_1$ ל־$f_2$ ו־$G : I times I arrow H$ בין $g_1$ ל־$g_2$.\
  נגדיר $K: I times I arrow G$ על־ידי $K(s,t) = F(s,t) dot.op H(s,t)$ ו־$K$ רציפה כהרכבת פונקציות רציפות ($G$ חבורה טופולוגית).\
  לכל $t$ מתקיים
  $ F(0,t) = F(1,t) = H(0,t) = H(1,t) = 1 $
  ולכן
  $ K(1,t) = K(0,t) = 1 dot.op 1 = 1 $
  כלומר $K( minus, t)$ היא לולאה ב־$1$ לכל $t$.\
  יתר על־כן
  $
    K(s,1) = f_2 (s) dot.op g_2 (s) \
    K(s,0) = f_1 (s) dot.op g_1 (s)
  $
  מכך ש־$K$ הומוטופיה בין $f_1 times.o g_1$ ל־$f_2 times.o g_2$ מתקיים $[f_1 times.o g_1] = [f_2 times.o g_2]$  והפעולה מוגדרת היטב.\
  כעת, נשאר להראות שזו אכן חבורה.\
  האסוציאטיביות ברורה מהאסוציאטיביות של $G$, איבר היחידה כמקודם הוא $e(s)=1$ הלולאה הקבועה ומתקיים
  $ [f] times.o [e] = [f(s) dot.op 1] = [f(s)] = [f] $
  ובאופן זהה $[e] times.o [f] = [f]$, נשאר רק להראות הופכי אבל זה בידיוק כמקודם עם $f^(-1)(s) = (f(s))^(-1)$ זו לולאה רציפה (כי ההופכי בחבורה טופולוגית רציף) ומתקיים
  $ [f] times.o [f^(-1)] = [f(s) dot.op (f(s))^(-1)] = [1] = [e] $
  ובאופן דומה גם $[f^(-1) times.o [f] = [e]$ ולכן $(pi_1 (G,1), times.o)$ זו חבורה.
]

#subquestion()
נוכיח כי $[f] times.o [g] = [f] * [g]$ לכל $[f], [g] in pi_1 (G,1)$.

#proof[
  מתקיים $[g] = [e*g], [f] = [f * e]$ כאשר $e$ היא הלולאה הקבועה ב־$1$ ולכן
  $ [f] times.o [g] = [f * e] times.o [e*g] = [(f*e) times.o (e*g)] $
  ומתקיים
  $
    ((f*e) times.o (e*g))(s) = mycases(f(2s) dot.op e(2s) = f(2s) dot.op 1 = f(2s), 0<=s<=1/2, e(2s-1) dot.op g(2s-1) = 1 dot.op g(2s-1) = g(2s-1), 1/2 <= s<=1)
  $
  וזו בידיוק הגדרת השרשור.
]

#subquestion()
נוכיח כי $pi_1 (G,1)$ היא חבורה אבלית.

#proof[
  ראינו שמתקיים $[g] = [g*e], [f] = [e*f]$ ומתקיים
  $ [f] times.o [g] = [e*f] times.o [g*e] = [(e*f) times.o (g*e)] $
  וכעת מתקיים
  $
    ((e*f) times.o (g*e))(s) = mycases(e(2s) dot.op g(2s) = 1 dot.op g(2s) = g(2s), 0<=s<=1/2, f(2s-1) dot.op e(2s-1) = f(2s-1) dot.op 1 = f(2s-1), 1/2 <= s<=1)
  $
  זו בידיוק ההגדרה לשרשור של $g*f$, ולכן
  $ [f] times.o [g] = [g*f] = [g]*[f] $
  ומהסעיף הקודם
  $ [f] times.o [g] = [f] * [g] = [g]*[f] $
  אבל זה בידיוק אומר שהחבורה אבלית.
]
