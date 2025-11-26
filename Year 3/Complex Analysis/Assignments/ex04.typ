#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 04 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי $f(z) = sqrt((1+z)/(1-z))$, הרבה של העתקת מוביוס ופונקציית השורש.

#subquestion()
#sub_subquestion()
נסמן $G_1 = CC without (-infinity,-1] union [1, infinity)$. נראה כי העתקת מוביוס ממפה את $G_1$ אל $CC without [0,infinity)$.

#proof[
  נסמן $m(z) = (1+z)/(1-z)$ ונניח בשלילה שקיים $z in G_1$ כך שמתקיים $m(z) in [0,infinity)$.\
  אז $t = m(z) <==> (1+z)/(1-z) = t <==> 1+z = t(z-1) <==> z(1-t) = -(t+1) <==> z = (t+1)/(t-1)$
  ונחלק למקרים על $t>=0$:
  + אם $t>1$ אז $(t+1)/(t-1) > 1$ כלומר $z in (1, infinity)$
  + אם $0<=t<1$ אז $(t+1)/(t-1) <= -1$ ולכן $x in (-infinity, -1]$
  + אם $t=0$ אז $z=-1$
  + לא ייתכן ש־$t=1$ כי אז $z=infinity$
  בחלק המקרים מתקיים $z in (-infinity, -1] union [1, infinity)$, אבל $z in G_1$ ולכן זו סתירה ולכן $m(G_1) subset.eq CC without [0,infinity)$.\
  נשאר להראות את ההכלה בכיוון השני, עבור $CC without [0,infinity) subset.eq m(G_1)$ כדי לקבל שיוויון.\
  לכל $w in CC without [0,infinity)$ נסמן
  $ z = (w+1)/(w-1) $
  שמוגדר היטב מהתחום של $w$.\
  נניח ש־$z in.not G_1$ ולכן $z in (-infinity, -1] union [1,infinity)$ אבל אז $m(z)=w$ זה מספר ממשי אי־שלילי, אבל אמרנו ש־$w in.not [0,infinity)$ ולכן זו סתירה וקיבלנו את ההכלה בכיוון השני.\
  הראנו הכלה דו־כיוונית ולכן $m(G_1) = CC without [0,infinity)$.
]

#sub_subquestion()
ניקח את הענף מהתרגול ונראה ש־$f$ היא חד־חד ערכית ועל וממפה את הקטע $(-1,1)$ אל הישר ${re(z)=0}$.

#proof[
  בתרגול לקחנו את הענף
  $ l(z) = Log(e^(i pi) z)+ i pi $
  כדי להגדיר
  $ f(z)=e^(1/2l((1+z)/(1-z))) $
  מהסעיף הקודם נובע ש־$m$ היא העתקה חד־חד ערכית ועל בין $G_1$ לבין $CC without [0,infinity)$.\
  נסמן $w = (1+z)/(z-1)$ ואנחנו יודעים ש־$log(Z)$ הוא הענף הראשי שמוגדר על $CC without (-infinity,0]$ עם $im(log(Z)) in (-pi, pi]$.\
  נסמן $W=e^(i pi) w = -w$ כי $w in CC without [0,infinity)$ אז $W=-w$ זו בידיוק הקבוצה $CC without (-infinity,0]$, כלןמר $log(w)$ זה הענף של $log(-w)$ שמוזז ב־$i pi$.\
  אז מכך ש־$W=-w$ נקבל $log(w)=log(W)+i pi$ וניקח את הענף שמתאים לשורש $sqrt(w)=e^(1/2 log(w))$, כלומר
  $ f(z)=e^(1/2 l(w))=e^(1/2 log(-w) + i pi) = e^(1/2 log(-w)) e^((i pi)/2) $
  אבל $e^((i pi)/2) = i$ ולכן
  $ f(z) = i sqrt(-w) = i sqrt(- (1+z)/(z-1)) = i sqrt((1+z)/(1-z)) $
  כלומר זה הענף שמתאים לשורש.\
  ניקח $z=x in (-1,1)$ ולכן $1+x>0$ וכן $1-x>0$ כלומר $W' = (1+x)/(1-x) > 0 in RR^plus$.\
  $ R = (1+x)/(1-x) <==> x = (R-1)/(R+1) $
  אז
  + כאשר $x arrow.r -1^plus$ אז $1+x arrow.r 0^plus$ ולכן $R arrow.r 0^plus$
  + כאשר $x arrow.r 0$ אז $R=1$
  + כאשר $x arrow.r -1^minus$ מתקיים $1-x arrow.r 0^plus$ כלומר $R=infinity$
  כלומר הקטע $(-1,1)$ ממפה את $W'$ אל $(0,infinity)$.\
  ולכן עבור $x in (-1,1)$ יש לנו $f(x) = i sqrt(R)$ כאשר $R in (0,infinity)$  אבל $sqrt(R)$ זה השורש החיובי של $R$ ולכן התמונה של $(-1,1)$ זו הקבוצה $ {i y bar y in (0,infinity)} subset.eq {re(z)=0} $
  ואנחנו על עליה כי $R in (0,infinity)$ ולכן גם $sqrt(R) in (0,infinity)$ והיא חד־חד ערכית כי אם $f(x_1)=f(x_2)$ עבור $x_1, x_2 in (-1,1)$ מתקיים
  $ i sqrt((1+x_1)/(1-x_1))=i sqrt((1+x_2)/(1-x_2)) <==> (1+x_1)/(1-x_1) = (1+x_2)/(1-x_2) $
  אבל אם נסתכל על $g : (-1,1) arrow.r RR$ המוגדרת על־ידי $g(x)=(1+x)/(1-x)$ ונסתכל על מבחן הנגזרת
  $ g'(x)=(1(1-x)+1(1+x))/(1-x)^2 = 2/(1-x)^2 >= 0 space forall x in (-1,1) $
  וממבחן הנגזרת השנייה
  $ g''(x) = (4-4x)/(1-x)^4 >= space forall x in (-1,1) $
  לכן הפונקציה מונוטונית עולה ממש וחד־חד ערכית.\
  נשאר להראות שהיא על וחד־חד ערכית על $G_1$: \
  עבור חד־חד ערכית, נניח שיש $z_1, z_2 in G_1$ כך שמתקיים
  $
    f(z_1)=f(z_2) <==> e^(1/2 l(w_1))= e^(1/2 l(w_2))<==> 1/2 l(w_1) = 1/2 l(w_2) + 2pi i k <==> l(w_1) = l(w_2)+ 4 pi i k
  $
  אבל $ im(l(w)) = im(log(-w)+i pi) = Arg(-w) + pi $
  אבל $Arg(-w) in (-pi, pi]$ ולכן $im(l(w)) in (0, 2 pi]$ אז $k=0$ כי גם $im(l(w_2)) in (0, 2pi]$ (לדוגמה אם $k=1$ אז $im(l(w_1)) = im(l(w_2)) + 4pi >= im(l(w_1))>4pi$ וזאת סתירה).\
  אז $k=0$ ולכן $l(w_1) = l(w_2)$ ו־$log$ היא פונקציה חד־חד ערכית אז $Arg(-w_1) = Arg(-w_2)$ בהכרח וכן $abs(-w_1)=abs(-w_2)$ כלומר $-w_1=-w_2$ או $w_1=w_2$ אבל $w=(1+z)/(z-1)$ היא העתקת מוביוס שהיא חד־חד ערכית על $G_1$ ולכן קיבלנו חד־חד ערכיות.\
  בשביל העל, נסמן $u=re(l(w))=ln(abs(-w))=ln(abs(w))$ ו־$v = im(ln(w)) in (0,2pi)$ אז
  $ f(z) = e^(u/2)e^((i v)/2) $
  אבל
  $ abs(f(z)) = e^(u/2) = sqrt(abs(w)) in (0, infinity), space Arg(f(z))=v/2 in (0,pi) $
  כלומר התמונה של $G_1$ זה בידיוק חצי המישור העליון.
]

#sub_subquestion()
נגדיר ענף של $g(z)=sqrt(z^2-1)$ ב־$G_1$ כך שמתקיימת הזהות $(1-z)f(z)=g(z)$.

#proof[
  בהתאם למה שמצאנו בסעיפים הקודמים אנחנו רוצים שיתקיים
  $ g(z)=(1-z)(i sqrt((1+z)/(1-z))) $
  והענף בשביל השורש המדומה מוגדר על־ידי $sqrt(Z)=exp(1/2 log(Z))$
  נסמן $Z= z^2-1$ ונרצה $g(z)=sqrt(Z)$, כלומר
  $ g(z)=(1-z)f(z)=exp(log(1-z)+1/2 l((1+z)/(z-1))) = (1-z)i sqrt((1+z)/(1-z)) $
  נסמן $w' = (1+z)/(1-z)$ נשים לב שמתקיים
  $ w' = (1+z)/(-(z-1)) = -1/w' $
  אז $w'$ זו התמונה של $w$ מסובב ב־$pi$ והופכי, אבל $w in CC without [0, infinity)$ ולכן $w' in CC without (-infinity, 0]$ אז
  $ sqrt(w') = exp(1/2 Log(w')), space Arg(w') in (-pi,pi) $
  וזה הענף שמקיים את הזהות הרצויה.
]

#subquestion()
#sub_subquestion()
אם $G_2 = CC without [-1.1)$, נראה כי העתקת מוביוס ממפה את $G_2$ אל $CC without (-infinity, 0]$.

#proof[
  בדומה לתת־סעיף א', אם $x in [-1,1)$ אז $1+x>=0$ ו־$x-1<0$ אז
  $ m(x) = (1+x)/(1-x) in RR^minus $
  ב־$x=-1$ יש לנו $m(-1)=0/(-2)=0$, כאשר $x arrow.r 1^minus$ אז המכנה שואף ל־$0$ ולכן $m(x) arrow.r infinity$ ואם $x$ עולה בין $-1$ ל־$1$ אז $m(x)$ יורד מ־$0$ ל־$minus infinity$, כלומר $m([-1, 1)) = (-infinity, 0]$ ולכן $m(G_2)=CC without m([-1.1))=CC without (-infinity, 0]$.
]

#sub_subquestion()
נגדיר ענף של $f$ על $G_2$.

#proof[
  נשים לב ש־$Log$ הולומורפי על $(-infinity, 0]$ אז אם נגדיר
  $ S(w) colon.eq exp(1/2 Log(w)), space w in CC without (-infinity, 0] $
  אז $S$ הולומורפית כהרכבה של הולומורפיות ומקיימת $S(w)^2 = w$ כלומר התמונה היא ${re(z)> 0 }$ כי $Arg(w) in (-pi, pi)$ גורר $Arg(S(w)) in (-pi/2, pi/2)$.\
  אז נגדיר ענף של $f$ על $G_2$ להיות $f(z) colon.eq S(m(z))=exp(1/2 Log((1+z)/(z-1)))$ שמוגדר היטב בגלל הסעיף הקודם והולומורפי כהרכבה של הולומורפיות (זה אפילו חד־חד ערכית ועל על ${re(z) >0}$).
]

#sub_subquestion()
נראה שיש ענף של $f$ ב־$G_2$ עם תמונה ${re(z)>0}$ בו $f$ חד־חד ערכית ועל ונראה שהקו הישר המחבר בין $1$ ו־$-1$ דרך אינסוף ממופה אל ${im(z)=0}$.

#proof[
  ראשית הענף מהסעיף הקודם עונה על תנאי השאלה כי יש לנו הרכבה של פונקציות הולומורפיות וחד־חד ערכיות ועל. נשאר רק להראות שהתמונה של הקו הישר בין $1$ ל־$-1$ דרך אינסוף ממופה אל ${im(z)>0}$:\
  נשים לב ש־$x in RR inter G_2 = (-infinity,-1) union (1,infinity)$ ושם $m(x) in (0,infinity)$ אז עבור $t>0$ מתקיים $S(t)=exp(1/2 ln(t))=sqrt(t) in (0,infinity)$ אז $f(x) in (0,infinity) subset.eq RR$ כלומר ${im(w)=0}$ ונשים לב שמאריתמטיקה של גבולות אם $x=-1$ אז $S(m(x)) arrow.r infinity$ על הציר הממשי החיובי.\
  הקטע שהחסרנו $[-1,1)$ ממופה על־ידי $m$ אל $(-infinity, 0]$ ותחת $S$ אל ${i t bar t>=0}$ אבל הקטע הזה איננו ב־$G_2$
]

#question()
יהי $sigma in CC$.

#subquestion()
באמצעות הענף הראשי של הלוגריתם, נחשב את $(d^n)/(d z^n) (1+z)^sigma$.

#solution[
  לפי הגדרה שראינו בהרצאה מתקיים עבור הענף הראשי של הלוגריתם
  $ (1+z)^sigma = exp(sigma Log(1+z)) $
  שאנליטית לכל $z in.not (-infinity, -1]$: זאת מכיוון שמהגדרה
  $ Log(w) = log abs(w)+ i Arg w $
  אבל אנחנו יודעים שהארגומנט איננו רציף בקטע זה (הוא קופץ מ־$pi$ ל־$minus pi$), ולכן בפרט הפונקציה שלנו לא אנליטית מהרכבה בתחום הזה.\
  בשאר התחומים, היא אנליטית כהרכבה של אנליטיות. נחשב
  $
    d/(d z) (1+z)^sigma = d/(d z) exp(sigma log(1+z))) = exp(sigma log(1+z))) dot.op (sigma dot.op 1/(1+z)) = sigma(1+z)^(sigma-1)
  $
  בפרט, גם הפונקציה הזאת אנליטית כמכפלה של פונקציה אנליטית (מהרכבה)  וקבוע אז נוכיח באינדוקציה:\
  בסיס – הוכחנו, נניח כי הטענה נכונה עבור $k$ פעמים שגזרנו, כלומר
  $ d^k/(d z^k) (1+z)^sigma = sigma(sigma-1) dot.op dots.h dot.op (sigma-k+1)(1+z)^(sigma-k) $
  שוב יש לנו מכפלה של פונקציה אנליטית עם קבוע, ולכן אנליטית, נגזור
  $
    d^(k+1)/(d z^(k+1)) (1+z)^sigma = sigma(sigma-1) dot.op dots.h.c dot.op (sigma-k+1) (sigma-k)(1+z)^(sigma-k-1)
  $
  כלומר לכל $n in NN$ מתקיים מעיקרון האינדוקציה
  $ (d^n)/(d z^n) (1+z)^sigma = sigma(sigma-1) dot.op dots.h.c dot.op (sigma-n+1)(1+z)^(sigma-n) $
]

#subquestion()
נסיק שלכל $z$ עם $abs(z)<1$ מתקיים
$ (1+z)^sigma = sum_(n=1)^infinity binom(sigma, n) z^n $

#solution[
  התנאי של $abs(z)<1$ הכרחי בשביל האנליטיות (כי יש נקודת אי־רציפות עבור $z=-1$), אבל מהיות $abs(z)<1$ אז הכל אנליטי.\
  אנחנו מחשבים טור טיילור סביב $a=0$ ולכן במקרה שלנו לכל $n in NN$ מתקיים
  $
    f^(n)(0) = sigma(sigma-1) dot.op dots.h dot.op (sigma-n+1)(1+0)^(sigma-n) = sigma(sigma-1) dot.op dots.h dot.op (sigma-n+1)
  $
  כלומר
  $ a_n = (f^(n)(0))/n! = (sigma(sigma-1) dot.op dots.h dot.op (sigma-n+1))/n! = binom(sigma, n) $
  עבור $n=0$ פשוט מתקיים
  $f^(0)(0)=f(0)=(1+0)^sigma = 1$
  וגם כקונבציה מתקיים $binom(sigma, 0)=1$
  ולכן
  $ (1+z)^sigma = 1 + sum_(n=1)^infinity ((f^(n)(0))/n!)z^n = sum_(n=0)^infinity ((f^(n)(0))/n!)z^n $
]


#question()
יהי $G subset CC$ תחום ו־$f in Hol(G)$.\
תהיי $f = f(r,t)=u(r,t)+i v (r,t)$ ההצגה של $f$ בקורדינאטות פולריות ($z=r e^(i t)$).\
נראה ש־$f$ הולומורפית ואם $z!=0$ אז $u_r = 1/r v_t$ ו־$-1/r u_t = v_r$.

#proof[
  יהי $z=r e^(i t)$ עם $r>0$ ו־$t in RR$, נכתוב
  $ f(z)=u(x,y)+i v(x,y) eq.colon U(r,t) + i V(r,t) $
  כאשר $ U(r,t) = u(x(r,t), y(r,t)) space V(r,t) = v(x(r,t), y(r,t))\
  x = r cos(x), space y = r sin(x) $
  נגזור
  $ x_r = cos(t), space x_t = - r sin(t), space y_r = sin(t), space y_t = r cos(t) $
  מכלל שרשרת נקבל
  $
    U_r = u_x x_r + u_y y_r = u_x cos(t) + u_y sin(t) \
    U_t = u_x x_t + u_y y_t = u_x (-r sin(t))+ u_y (r cos(t)) = r(-u_x sin(t)+u_y cos(t))
  $
  ובאותו אופן גם נקבל
  $
    V_r = u_x cos(t) + v_y sin(t) \
    V_t = r(-v_x sin(t)+ v_y cos(t))
  $
  $f$ הולומורפית ולכן ממשוואות קושי־רימן, מתקיים $u_x = v_y, space u_y = -v_x$ ולכן
  $
    U_r = u_x cos(t) + u_y sin(t) = v_y cos(t) + (-v_x) sin(t) = v_y cos(t) - v_x sin(t) \
    1/r V_t = -v_x sin(t) + v_y cos(t)
  $
  כלומר $U_r = 1/r V_t$.\
  באופן דומה נקבל גם
  $ V_r = v_x cos(t) + v_y sin(t) = (-u_y) cos(t) + u_x sin(t) $
  ולכן
  $ -1/r U_t = -(-u_x sin(t) + u_y cos(t)) = u_x sin(t) - u_y cos(t) ==> V_r = -1/r U_t $
]

#question()
יהי $G subset CC$ תחום ותהיי $f in Hol(G)$. נסמן
$ Z_v colon.eq {z = x+i y bar u(x,y)=im(f(z))=0 } $
ונראה שאם לכל $z in.not Z_v$ מתקיים $f'=0$ אז $f$ קבועה.

#proof[
  נכתוב $f = u + i v$  עבור $u, v:RR^2 arrow.r RR$ ולכן
  $ Z_v colon.eq {z in G bar v(z)=0} $
  נניח שלכל $z in G without Z_v$ מתקיים $f'(z)=0$ ונראה ש־$f$ קבועה.\
  יש לנו שתי אופציות – או ש־$G=Z_v$ או ש־$G!=Z_v$ וניזכר כי הגדרנו את $G$ להיות קבוצה פתוחה וקשירה.\
  אם $Z_v = G$ אז $v eq.triple 0$ ולכן $f$ היא פונקציה $f : G arrow.r RR$ כלומר תמונתה רק ערכים ממשיים וזוהי פונקציה אנליטית.\
  משפט ההעתקה הפתוחה אומר שאם $f$ היא פונקציה אנליטית שאיננה קבועה אז היא שולחת קבוצות פתוחות לקבוצות פתוחות, ולכן נניח בשלילה ש־$f$ איננה קבועה:\
  אז $im(f) subset.eq RR$ כאשר נתייחס ל־$RR$ כתת־קבוצה של $CC$ צריכה להיות קבוצה פתוחה מהמשפט ונטען שזה לא ייתכן: \
  נטען טענה חזקה יותר, שעבור $UU subset.eq RR subset.eq CC$ עם הטופולוגיה המושרית מ־$CC$ היא פתוחה אם $U = emptyset$ בלבד: נניח שלא, כלומר $U != emptyset$ ונזהה את $U$ עם $U times {0}$, כלומר כל $u in U$ מתאים ל־$(u,0) in CC$.\
  כדי ש־$U$ תהיה פתוחה ב־$CC$, לכל $(u,0) in U$ צריך שיהיה דיסק $D((u,0), delta) subset.eq U$ עבור $delta>0$ אבל כל דיסק כזה מכיל גם $(u+a,b)$ עבור $a,b in (-delta,delta)$ אבל לא ייתכן ש־$b!=0$ (כי אז יש לנו גם ציר מדומה), ולכן קיבלנו סתירה להנחה ש־$U !=emptyset$ ולכן $U = emptyset$.\
  כלומר, לא ייתכן ש־$f$ איננה קבועה כי אז תמונתה חייבת להיות קבוצה פתוחה מה שראינו שלא ייתכן בתנאים, ולכן בהכרח $f$ פתוחה.\
  נשים לב שאפשר לענות על השאלה גם בלי משפט ההעתקה הפתוחה: $f$ אנליטית ולכן היא מקיימת את משוואות קושי־רימן ולכן מתקיים
  $ (partial u)/(partial x) = (partial v)/(partial y), space (partial v)/(partial x) = -(partial u)/(partial y) $
  אמרנו ש־$v eq.triple 0$ ולכן $v_x = v_y = 0$ ולכן גם $u_x = 0 = u_y$ ובפרט זה אומר שהנגזרת מתאפסת לחלוטין בכל $G$ ולפי תנאים שקולים שראינו זה אומר ש־$f$ קבועה על $G$.\
  נשאר לבחון את המקרה השני בו $G != Z_v$: אנחנו יודעים ש־$v$ רציפה (כי $f$ הולומורפית) ולכן הקבוצה $Z_v = v^(-1)({0})$ היא קבוצה סגורה ב־$G$ ולכן $G without Z_v$ היא קבוצה פתוחה (מהגדרת המשלים).\
  מההנחה, לכל $z in G without Z_v$ מתקיים $f'(z)=0$ אבל $G$ הוא תחום קשיר ו־$f$ הולומורפית, לכן אם $z in U subset G$ מקיימת $f'(z)=0$ לכל $z in U subset.eq G$ אז סביב כל נקודה כזאת יש סביבה בה הפונקציה מתאפסת ולכן בהכרח $f'(z)=0$ לכל $z in G$.\
  מהתנאים השקולים נקבל ש־$f$ קבועה על $G$ גם במקרה זה.
]

#question()
_תזכורת_:
$ partial_z = 1/2 (partial_x - i partial_y), wide partial_(overline(z))=1/2 (partial_x + i partial_y) $

#subquestion()
נוכיח את הזהות $overline(partial_(overline(z)) f) = partial_z overline(f)$.

#proof[
  ניזכר כי עבור $w_1, w_2, in CC$ מתקיים $overline(w_1+w_2) = overline(w_1)+overline(w_2)$ וכן $overline(i)=-i$, אז
  $
    overline(partial_(overline(z)) f) = 1/2 (overline(partial_x f + i partial_y f)) = 1/2 (overline(u_x + i v_x + i(u_y - i v_y))) = 1/2 overline((u_x + i v_x + i u_y +v_y)) = 1/2 (u_x - i v_x - i u_y + v_y) \
    = 1/2 ((u_x - v_y) - i(v_x + u_y))
  $
  מצד שניי, $overline(f) = u - i v$ ולכן
  $
    partial_z overline(f) = 1/2(partial_x overline(f)+ i partial_y overline(f))= 1/2 (u_x - i v_x - i u_y - i (-i) v_y) = 1/2 (u_x - i v_x - i u_y - v_y) = 1/2 ((u_x - v_y)- i(v_x + u_y))
  $
  אז יש לנו שיוויון.
]

#subquestion()
נוכיח את הזהות $partial_z (f dot.op g)= (partial_z f) dot.op g + f dot.op partial_z g$.

#proof[
  $
    partial_z (f dot.op g) = 1/2(partial_x (f dot.op g) - i partial_y (f dot.op g))= 1/2(partial_x f dot.op g + partial_x g dot.op f - i(partial_y f dot.op g + partial_y g dot.op f))\
    =1/2(partial_x f - i partial_y f) dot.op g + 1/2 dot.op f (partial_x g - i partial_y g) = (partial_z f) dot.op g + f dot.op (partial_z g)
  $
]

#subquestion()
נוכיח את הזהות $partial_(overline(z)) (f dot.op g) = (partial_(overline(z)) f) dot.op g + f dot.op (partial_(overline(z)) g)$.

#proof[
  $
    partial_(overline(z)) (f dot.op g) = 1/2(partial_x (f dot.op g) + i partial_y (f dot.op g))=1/2(partial_x f dot.op g + partial_x g dot.op f + i(partial_y f dot.op g + partial_y g dot.op f))\
    =1/2(partial_x f + i partial_y f) dot.op g + 1/2 dot.op f (partial_x g + i partial_y g) = (partial_(overline(z)) f) dot.op g + f dot.op (partial_(overline(z)) g)
  $
]

#subquestion()
נוכיח את הזהות $partial_(overline(z)) (f compose g) = ((partial_z f) compose g) partial_overline(z) g + ((partial_(overline(z)) f) compose g) partial_(overline(z))overline(g)$.

#proof[
  נפעל כמו בתרגול, נכתוב את $f$ על־ידי $z, overline(z)$ כלומר $g, overline(g)$ לאחר ההרכבה, ונקבל
  $ partial_overline(z) (f compose g) = partial_overline(z) (f(g(z,overline(z)),overline(g)(z, overline(z)))) $
  לנוחות נסמן $w =g(z,overline(z)), overline(w)=overline(g(z,overline(w)))$ ומכלל השרשרת לפונקציות ממשיות
  $
    partial_x (f(g(z),overline(g(z)))) = f_w partial_x w + f_overline(w) partial_x overline(w) \
    partial_y (f(g(z),overline(g(z)))) = f_w partial_y w + f_overline(w) partial_y overline(w)
  $
  כאשר
  $ f_w = partial_w f, space f_overline(w) = partial_overline(w) f $
  ולכן
  $
    partial_(overline(z)) (f compose g) = 1/2 (partial_x + i partial_y) (f(w(z))) = 1/2 (f_w partial_x w + f_overline(w) partial_x overline(w)+i f_w partial_y w + f_overline(w) partial_y overline(w)) \
    = 1/2 (f_w (partial_x w + i partial_y w) + f_overline(w) (partial_x overline(w)+i partial_y overline(w))) = f_w dot.op 1/2 (partial_x + i partial_y) w + f_overline(w) dot.op 1/2 (partial_x + i partial_y) overline(w)
  $
  נשים לב
  $
    1/2(partial_x + i partial_y)w = partial_overline(z) w = partial_overline(z) g, space 1/2(partial_x + i partial_y)overline(w) = partial_overline(z) overline(w) = partial_overline(z) overline(g)
  $
  כעת, $w=g(z)$ וכן $partial_W f = partial_z f, partial_overline(w) f = partial_overline(w) f$ ולכן
  $
    partial_overline(w) (f compose g) = (partial_w f compose g) partial_overline(z) g + (partial_overline(w) f compose g) partial_overline(z) overline(g) = (partial_z f compose g) partial_overline(z) g + (partial_overline(z) f compose g) partial_overline(z) overline(g)
  $
]
