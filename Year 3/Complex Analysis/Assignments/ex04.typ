#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 04 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()

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
    overline(partial_(overline(z)) f) = 1/2 overline(partial_x f + i partial_y f) = 1/2 overline(u_x + i v_x + i(u_y + i v_y)) \
    = 1/2 overline((u_x + v_y) + i(v_x + u_y)) = 1/2 ((u_x + v_y)+i(v_x + u_y)) = 1/2((u_x + i v_x) + i(u_y+i v_y)) \
    = 1/2()
  $
  #todo
  $
    overline(partial_(overline(z)) f) = overline(1/2 (partial_x f + i partial_y f)) = 1/2 (partial_x overline(f) - i partial_y overline(f)) = partial_z overline(f)
  $
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
  $ partial_(overline(z)) (f compose g) = 1/2(partial_x (f compose g) + i partial_y (f compose g)) = 1/2 $
  #todo
]
