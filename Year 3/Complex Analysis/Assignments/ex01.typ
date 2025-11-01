#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 01 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)
#let Arg = math.italic(math.op("Arg"))
#let atan2 = math.op("atan2")
#let im = math.italic(math.op("Im"))
#let re = math.italic(math.op("Re"))


#question()
#subquestion()
נתון $z = 1- i sqrt(3)$, נמיר לקורדינאטות פולאריות ונצייר.

#solution[
  נחשב $r = sqrt(1^2+(-sqrt(3))^2) = sqrt(1+3) = sqrt(4) = 2$.\
  בשביל הארגומנט, נשים לב ש־$re(z)>0$ ו־$im(z)<0$ כלומר אנחנו נמצאים ברביע הרביעי ולכן
  $ alpha = arctan(abs((-sqrt(3))/1))= pi/3 $
  וכדי שנהיה ברביע הנכון בשביל הארגומנט עלינו לשקף כלומר $Arg(z) = -pi/3$.\
  אז בכתיב פולארי, מתקיים
  $ z = 2(cos(-pi/3)+ i sin(-pi/3)) = 2e^((-i pi)/3) $
  #figure(
    image("../../../src/images/complex analysis ex01 question 1a.jpg", width: 30%, fit: "contain"),
  )
]
#subquestion()
נתון $z=3e^((i pi)/2)$, נעביר לקורדינאטות פולאריות ונצייר.

#solution[
  נתון $r = 3$ ולכן $z = 3(cos(pi/2)+i sin(pi/2)) = 3i$ כלומר ממש קיבלנו נקודה.
  #figure(
    image("../../../src/images/complex analysis ex01 question 1b.jpg", width: 30%, fit: "contain"),
  )
]

#subquestion()
נסמן $CC in.rev z = x + i y, w = a + i b$ ותהיינה $M_z, M_w$ המטריצות שמייצגות את המספר המרוכב $z,w$ בהתאמה.\
תזכורת: $display(M_z = mat(x, -y; y, x))$.\

#sub_subquestion()
נוכיח את הזהות $M_(z+w) = M_z + M_w$.

#proof[
  מתקיים
  $ z+w =_"חיבור מרוכבים" (x+a)+i(y + b) ==> M_(z+w) = mat(x+a, -(y+b); y+b, x+a) = mat(x+a, -y-b; y+b, x+a) $
  מצד שני
  $ M_z + M_w = mat(x, -y; y, x) + mat(a, -b; b, a) = mat(x+a, -y-b; y+b, x+a) = M_(z+w) $
]

#sub_subquestion()
נוכיח את הזהות $M_(z dot.op w) = M_z dot.op M_w$.

#proof[
  מתקיים
  $
    z dot.op w =_"כפל מרוכבים" (x+i y) dot.op (a+i b) = (x a - y b)+ i(y a+ x b) ==> M_(z dot.op w) = mat(x a - y b, -y a - x b; y a + x b, x a - y b)
  $
  מצד שני
  $
    M_z dot.op M_w = mat(x, -y; y, x) dot.op mat(a, -b; b, a) = mat(x a - y b, -x b - y b; y a + x b, -y b + x a) = M_(z dot.op w)
  $
]

#question()

#subquestion()
נפתור $x^4=-8+i 8 sqrt(3)$.

#solution[
  אנחנו מחפשים את השורש ארבעת השורשים המרוכבים של המספר $z = -8+ i 8 sqrt(3)$.\
  נעבור לקורדינאטות פולאריות
  $ r = abs(z) = sqrt((-8)^2+(8sqrt(3))^2) = sqrt(64+192) =sqrt(256) = 16 space (r>=0) $
  ראינו $Arg(z) = atan2(y, x)$, כלומר $arctan$ עם התחשבות ברביע.\
  במקרה שלנו מתקיים $re(z)=-8, im(z)=8 sqrt(3)$ כלומר $z$ נמצא ברביע השני ו־$arctan$ יחזיר לנו זווית בכיוון הפוך ולכן עלינו לתקן בהוספת $pi$, אז
  $ atan2(z)=arctan((8 sqrt(3))/(-8))+pi=(-pi)/3+pi=(2pi)/3 $
  באופן דומה יכלנו למצוא באמצעות פתירת מערכת המשוואות
  $
    cases(
      x = r cos(theta) ==> cos(theta) = (-8)/16 = -1/2,
      y = r sin(theta) ==> sin(theta) = (8 sqrt(3))/16 = sqrt(3)/2
    ) ==> theta = (2pi)/3
  $
  אז
  $ z = 16(cos((2pi)/3)+ i sin((2pi)/3)) = 16e^((i 2 pi)/3) $
  יש $4$ שורשים ולכן ממשפט דה־מואבר נקבל
  $ x_k = root(n, 16)(cos((theta+2pi k)/n) + i sin((theta+2pi k)/n)), space k in {0,1,2,3}, space n = 4 $
  נחשב
  $
    x_0 = 2(cos(((2pi)/3+0)/4)+i sin(((2pi)/3+0)/4)) = 2(cos(pi/6)+ i sin(pi/6)) \
    x_1 = 2(cos(((2pi)/3+2pi)/4)+i sin(((2pi)/3+2pi)/4)) = 2(cos((2pi)/3) + i sin((2pi)/3)), \
    x_2 = 2(cos(((2pi)/3+4pi)/4)+i sin(((2pi)/3+4pi)/4)) = 2(cos((7pi)/ 6) + i sin((7pi)/6)), \
    x_3 = 2(cos(((2pi)/3+6pi)/4)+i sin(((2pi)/3+6pi)/4)) = 2(cos((5pi)/ 3) + i sin((5pi)/3))
  $
]

#pagebreak()

#subquestion()
תהיי $theta in RR$ ו־$N in NN$ ונמצא נוסחה סגורה לסכום בכל סעיף.

#sub_subquestion()
$sum_(n=1)^N cos(n theta)$.

#solution[
  ראינו $e^(i theta) = cos(theta) + i sin(theta)$ ולכן $cos(n theta) = re(e^(i n theta))$ ונקבל
  $
    sum_(n=1)^N cos(n theta) = sum_(n=1)^N re(e^(i n theta))= re(sum_(n=1)^N e^(i n theta)) =_"משפט דה־מואבר" re(sum_(n=1)^N (e^(i theta))^n)=_"תור הנדסי סופי" re((e^(i theta)-e^(i(N+1)theta))/(1-e^(i theta))) \
    re((e^((i theta)/2)(e^((i theta)/2)-e^(i(N+1/2)theta)))/(e^((i theta)/2)(e^((-i theta)/2)-e^((i theta)/2)))) = re((e^((i theta)/2)-e^(i(N+1/2)theta))/(e^((-i theta)/2)-e^((i theta)/2))) (star)
  $
  מנוסחת דה־מואבר ומהיות $sin, cos$ פונקציות אי־זוגית וזוגית בהתאמה
  $
    e^((-i theta)/2)-e^((i theta)/2)=cos(-theta/2)+i sin(-theta/2)-(cos(theta/2)+ i sin(theta/2)) = cancel(cos(theta/2))- i sin(theta/2)cancel(-cos(theta/2))-i sin(theta/2) \
    = - 2 i sin(theta/2)
  $
  נניח $theta != 2pi k$ עבור $k in ZZ$, ולכן כאשר $(star star)$ נובע שוב מדה־מואבר
  $
    (star) = re((e^((i theta)/2)-e^(i(N+1/2)theta))/(-2 i sin(theta/2)))=_(1/(-i)=i) = re(i(e^((i theta)/2)-e^(i(N+1/2)theta))/(2 sin (theta/2))) \
    =_((star star))
    re(i(cos(theta/2)+i sin(theta/2)-cos((N+1/2)theta)-i sin((N+1/2)theta))/(2 sin (theta/2))) \
    = re((i cos(theta/2)- sin(theta/2)-i cos((N+1/2)theta)+sin((N+1/2)theta))/(2 sin (theta/2))) \
    = (sin((N+1/2)theta)- sin(theta/2))/(2 sin(theta/2))
  $
  אם $theta = 2pi k$ עבור $k in ZZ$ אז
  $ sum_(n=1)^N cos(n theta) = sum_(n=1)^N 1 = N $
]

#sub_subquestion()
$sum_(n=1)^N sin(n theta)$.

#solution[
  נשתמש בסעיף א' עם אותן הגבלות על $theta$ רק שאם $theta = 2pi k$ עבור $k in ZZ$ אז $sum_(n=1)^N sin(n theta) = 0$
  $
    sum_(n=1)^N sin(n theta) = sum_(n=1)^N im(e^(i n theta)) = im(sum_(n=1)^N e^(i n theta)) =_"משפט דה־מואבר" im(sum_(n=1)^N (e^(i theta))^n)=_"תור הנדסי סופי" im((e^(i theta)-e^(i(N+1)theta))/(1-e^(i theta))) \
    ==>_"סעיף א' רק מדומה במקום ממשי" im((i cos(theta/2)- sin(theta/2)-i cos((N+1/2)theta)+sin((N+1/2)theta))/(2 sin (theta/2))) \
    = (cos(theta/2)-cos((N+1/2)theta))/(2 sin(theta/2))=_"זהות" (sin)
  $
]



#question()
#subquestion()
נוכיח שמתקיים $ z_n arrow.r z <==> re(z_n) arrow.r re(z) space and space im(z_n) arrow.r im(z) $

#proof[
  לכל $n in NN$ נסמן $z_n = x_n + i y_n$ ו־$z = x + i y$.\
  $<==$ נניח כי $z_n arrow.r z$ ונרצה להראות $re(z_n) arrow.r re(z)$ וכן $im(z_n) arrow.r im(z)$.\
  יהי $epsilon > 0$, מההתכנסות נובע שיש $N in NN$ כך שלכל $n>=N$ מתקיים
  $ abs(z_n - z) = abs(x_n+i y_n - (x+i y)) = abs(x_n - x + i(y_n - y))=sqrt((x_n-x)^2+(y_n-y)^2) < epsilon $
  מצד שני
  $
    abs(re(z_n)-re(z)) = abs(x_n - x) = sqrt((x_n-x)^2)<= sqrt((x_n-x)^2+(y_n-y)^2) < epsilon \
    abs(im(z_n)-im(z)) = abs(y_n - y) = sqrt((y_n-y)^2)<= sqrt((x_n-x)^2+(y_n-y)^2) < epsilon
  $
  כלומר, $re(z_n) arrow.r re(z) space and space im(z_n) arrow.r im(z)$, כנדרש.\
  $==>$ נניח כי $re(z_n) arrow.r re(z) space and space im(z_n) arrow.r im(z)$ ונרצה להראות $z_n arrow.r z$.\
  יהי $epsilon > 0$ ומההתכנסות נובע שקיימים $N_1, N_2 in NN$ כך שמתקיים לכל $k>=N_1$ ו־$m>=N_2$,
  $ abs(re(z_k)-re(z)) < epsilon/2, space abs(im(z_m)-im(z)) < epsilon/2 $
  נבחר $N = max(N_1, N_2)$ ולכל $n>=N$ מתקיים
  $
    abs(z_n - z)= abs(x_n + i y_n - (x+ i y))= abs((x_n-x) + i(y_n - y))<= abs(x_n - x) + abs(y_n - y) < epsilon/2 + epsilon/2 = epsilon
  $
  כלומר, $z_n arrow.r z$, כנדרש.
]

#subquestion()
יהי $K subset CC$ ונראה ש־$K$ קומפקטי אם ורק אם לכל סדרה $(z_n)_(n=1)^infinity subset.eq K$ יש תת־סדרה $(z_n_k)_(k=1)^infinity$ מתכנסת ל־$z in K$.

#proof[\
  _תזכורת:_ ראשית, ראינו ש־$CC$ הוא מרחב מטרי. שנית, באינפי3 ראינו שבמרחבים מטריים, קומפקטיות וקומפקטיות סדרתית הן טענות שקולות. \
  כלומר, להגיד שלקבוצה במרחב מטרי לכל סדרה יש תת־סדרה מתכנסת (קומפקטיות סדרתית) שקול ללהגיד שיש לכל כיסוי פתוח של הקבוצה יש תת־כיסוי סופי (קומפקטיות).\
  $<==$ נניח כי $K$ קומפקטי ונראה שלסדרה $(z_n)_(n=1)^infinity subset.eq K$ יש תת־סדרה מתכנסת.\
  תהיי $(z_n)_(n=1)^infinity subset.eq K$, כך שלכל $n in NN$ מתקיים $z_n = x_n + i y_n$.\
  מהיות$K$ קומפקטי (סגור וחסום), נובע שקיים $M>0$ כך שלכל $z in K$ מתקיים $abs(z)<=M$ ובפרט לכל $n in NN$ מתקיים $abs(z_n)<=M$.\
  נבחין ש־$(z_n)_(n=1)^infinity$ חסומה ב־$CC$ אם ורק אם $(re(z_n))_(n=1)^infinity=(x_n)_(n=1)^infinity, (im(z_n))_(n=1)^infinity=(y_n)_(n=1)^infinity$ חסומות ב־$RR$.\
  החסימות על $CC$ במקרה זה תקפה גם לחסימות על $RR$ ולכן ממשפט בולציאנו-ויירשטראס יש ל־$(x_n)_(n=1)^infinity$ תת־סדרה מתכנסת, $(x_n_k)_(k=1)^infinity$ המתכנסת ל־$x in RR$.\
  באותו אופן, ל־$(y_n_k)_(k=1)^infinity$ יש גם תת־סדרה מתכנסת, $(y_n_k_l)_(l=1)^infinity$ המתכנסת ל־$y in RR$.\
  נסתכל על $(z_n_k_l)_(l=1)^infinity$ זו כמובן תת־סדרה של $(z_n)_(n=1)^infinity$ כך שסדרת הממשיים וסדרת המדומים מתכנסות ל־$x,y$ בהתאמה ולכן מהסעיף הקודם
  $ lim_(l arrow.r infinity) z_n_k_l = lim_(l arrow.r infinity) (x_n_k_l + i y_n_k_l) = x + i y = z in CC $
  מצאנו סדרה מתכנסת ב־$K$ ומהיות $K$ קומפקטי אז הוא סגור וחסום ולכן $z in K$ (מהניסוח השקול כאוסף הנקודות הגבוליות).\
  נניח בשלילה כי $K$ אינו קומפקטי־סדרתית, כלומר יש $(z_n)_(n=1)^infinity subset.eq z$ כך שאין לה תת־סדרה מתכנסת.
  #colbreak()
  $==>$ נניח שלכל סדרה $(z_n)_(n=1)^infinity subset.eq K$ יש תת־סדרה מתכנסת $(z_n_k)_(k=1)^infinity$ ל־$z in K$ ונרצה להראות ש־$K$ סגור וחסום.\
  סגור: נובע מהניסוח השקול קבוצה סגורה כאוסף כל הנקודות הגבוליות במרחב ומכך שלכל סדרה יש תת־סדרה מתכנסת ל־$z in K$, כלומר $K$ אוסף כל הנקודות הגבוליות.\
  חסום: נניח ש־$K$ לא חסומה ויהי $z_0 in K$
]

#question()
תהיי $(z_n)_(n=1)^infinity subset.eq CC$.\

#subquestion()
נוכיח $rho(z_n, infinity) arrow.r 0$ אם ורק אם $abs(z_n) arrow.r infinity$.

#proof[\
  _תזכורת:_
  $
    rho(z, infinity) = lim_(w arrow.r infinity) rho(z, w) = lim_(w arrow.r infinity) (2abs(1-z/w))/(sqrt(1+abs(z)^2)sqrt(1/abs(w)^2+1)) = 2/sqrt(1+abs(z)^2)
  $
  $<==$ נניח כי $rho(z_n, infinity) arrow.r 0$ ונרצה להראות $abs(z_n) arrow.r infinity$.\
  מתקיים
  $
    lim_(n arrow.r infinity) rho(z_n, infinity) = 0 <==>_"הגדרה" lim_(n arrow.r infinity) 2/sqrt(1+abs(z_n)^2) = 0 <==>_"אריתמטיקה של גבולות" lim_(n arrow.r infinity) sqrt(1+abs(z_n)^2) = infinity \
    <==>_"אי־שליליות" lim_(n arrow.r infinity) 1+abs(z_n)^2 = infinity <==>_"קבוע" lim_(n arrow.r infinity) abs(z_n)^2 = infinity <==>_"אי־שליליות" lim_(n arrow.r infinity) abs(z_n) = infinity
  $
  $==>$ נניח כי $abs(z_n) arrow.r infinity$ ונרצה להראות $rho(z_n, infinity) arrow.r 0$.\
  מתקיים
  $ lim_(n arrow.r infinity) rho(z_n, infinity) = 2/sqrt(1+abs(z)^2) $
  היות $abs(z_n) arrow.r infinity$ אזי המכנה שואף ל־$infinity$ ומאריתמטיקה של גבולות $lim_(n arrow.r infinity) rho(z_n, infinity) = 0$.
]

#subquestion()
נוכיח $rho(z_n, z) arrow.r 0$ אם ורק אם $abs(z_n-z) arrow.r 0$.

#proof[
  _תזכורת:_
  $ rho(z, w) = (2abs(z-w))/(sqrt(1+abs(z)^2)sqrt(1+abs(w)^2)) $
  $<==$ נניח כי $rho(z_n, z) arrow.r 0$ ונראה כי $abs(z_n - z) arrow.r 0$.\
  מתקיים
  $
    lim_(n arrow.r infinity) rho(z_n, z) = 0 <==> lim_(n arrow.r infinity) (2abs(z_n-z))/(sqrt(1+abs(z_n)^2)sqrt(1+abs(z)^2)) = 0
  $
  ראשית, $sqrt(1+abs(z)^2) = C in RR$ קבוע כלשהו. \
  שנית, נובע מהגדרת הגבול שהמונה שואף ל־$0$ או שהמכנה שואף ל־$infinity$.\
  אם המונה שואף ל־$0$ אזי $lim_(n arrow.r infinity) 2 abs(z_n-z) = 0 <==> lim_(n arrow.r infinity) abs(z_n-z) = 0$ וסיימנו.\
  לא ייתכן שהמכנה שואף ל־$infinity$: ההגדרה $rho(z_n, z) arrow.r 0$ אומרת שהמרחק בין $z_n$ לבין $z in CC$ שהיא נקודה סופית שואף ל־$0$ על הספירה של רימן.\
  אם יתקיים $lim_(n arrow.r infinity) abs(z_n) = infinity$, יהיה חייב להתקיים $rho(infinity, z)=2/sqrt(1+abs(z)^2) in RR$ וזאת סתירה.\
  $<==$ נניח כי $abs(z_n-z) arrow.r 0$ ונראה כי $rho(z_n, z) arrow.r 0$.\
  מהתזכורת, מספיק שנבחן את המכנה (כי המונה שואף ל־$0$ מההנחה), מתקיים
  $
    lim_(n arrow.r infinity) sqrt(1+abs(z_n)^2)sqrt((1+abs(z)^2)) =_"ההנחה" sqrt(1+abs(z)^2)sqrt(1+abs(z)^2) = 1+abs(z)^2 ==> RR in.rev 1+abs(z)^2 != 0
  $
  נסמן $C = 1 + abs(z)^2$ ונקבל $lim_(n arrow.r infinity) rho(z_n, z) = lim_(n arrow.r infinity) (2abs(z_n-z))/underbrace((sqrt(1+abs(z_n)^2)sqrt(1+abs(z)^2)), = 1+abs(z)^2 eq.colon C) = 0/C = 0$.
]

#question()
תהיי $P=(x_0, y_0, z_0)$ כך שמתקיים $phi.alt^(-1) (z) = P$, כלומר
$
  phi.alt^(-1) (z) = phi.alt^(-1) (x+ i y) = ((2x)/(1+x^2+y^2),(2y)/(1+x^2+y^2),1-2/(1+x^2+y^2))= (x_0, y_0, z_0) \
  phi.alt (z) = ((2re(z))/(1 + abs(z)^2),(2im(z))/(1 + abs(z)^2), (abs(z)^2-1)/(abs(z)^2+1)) \
$

#subquestion()
נראה כי $P_1 = (x_0, -y_0, z_0)$ הוא התמונה של $overline(z)$, כלומר $phi.alt(overline(z)) = P_1$.

#solution[
  ניזכר
  $
    abs(z) = sqrt(z dot.op overline(z)) ==> abs(overline(z)) = sqrt(overline(z) dot.op overline(overline(z))) = sqrt(overline(z) dot.op z) = abs(z)
  $
  מתקיים $overline(z)=x- i y$ ולכן
  $
    phi.alt(overline(z)) = phi.alt(x-i y) = ((2x)/(1+abs(z)^2), (-2y)/(1+abs(z)^2), (abs(z)^2-1)/(abs(z)^2+1)) = P_1
  $
]

#subquestion()
נראה כי $P_2 = (x_0, y_0, -z_0)$ הוא התמונה של $1/overline(z)$, כלומר $phi.alt(1/overline(z)) = P_2$.

#solution[
  נסמן $z = x + i y$ ולכן $overline(z) = x-i y$ ונגדיר $w = 1/overline(z) = 1/(x-i y)$, נרצה לייצג את $w$ בצורה $w = a + i b$ עבור $a, b in RR$, אז
  $ w = 1/(x-i y) = 1/(x-i y) dot.op (x+ i y)/(x + i y) = (x+ i y)/(x^2+y^2) = (x+ i y)/abs(z)^2 $
  ובאותו אופן מהסעיף הקודם $abs(overline(z)) = abs(z)$ ולכן $abs(w)^2 = 1/abs(z)^2$ ומתקיים
  $
    phi.alt(1/overline(z)) = phi.alt(w) = phi.alt((x+ i y)/abs(z)^2) = ((2 dot.op x/abs(z)^2)/(1 + 1/abs(z)^2),(2 dot.op y/abs(z)^2)/(1 + 1/abs(z)^2), (1/abs(z^2)-1)/(1/abs(z)^2+1)) \
    = ((2x)/(1+abs(z)^2), (2y)/(1+abs(z)^2), (1-abs(z)^2)/(1+abs(z)^2)) = (x_0, y_0, -z_0) = P_2
  $
]

#subquestion()
נראה כי $P_3 = (x_0, -y_0, -z_0)$ הוא התמונה של $1/z$, כלומר $phi.alt(1/z) = P_3$.\

#solution[
  שוב נסמן $z = x+ i y$ ולכן $w = 1/z = 1/(x + i y)$ ונרצה לייצג את $w$ בצורה $w = a + i b$ עבור $a, b in RR$, אז
  $ w = 1/(x + i y) = 1/(x + i y) dot.op (x - i y)/(x - i y) = (x - i y )/(x^2+y^2) = (x - i y)/abs(z)^2 $
  מתקיים
  $
    phi.alt(1/z) = phi.alt(w) = phi.alt((x-i y)/abs(z)^2) = ((2 dot.op x/abs(z)^2)/(1 + 1/abs(z)^2),(2 dot.op (-y)/abs(z)^2)/(1 + 1/abs(z)^2), (1/abs(z^2)-1)/(1/abs(z)^2+1)) \
    = ((2x)/(1+abs(z)^2), (-2y)/(1+abs(z)^2), (1-abs(z)^2)/(1+abs(z)^2)) = (x_0, -y_0, -z_0) = P_3
  $
]

#subquestion()
נראה כי הפעולות בסעיפים הקודמים משמרים את $rho$.

#proof[
  במילים אחרות, אנחנו רוצים להראות שהפונקציות $z mapsto overline(z), z mapsto 1/overline(z), z mapsto 1/z$ הן כולן איזומטריות.\
  כפעולות על $CC$ – שיקוף על־פני ציר $x z$, שיקוף על־פני ציר $x y$ וסיבוב ב־$pi$ מסביב לציר ה־$x$, בהתאמה לסעיף.\
  נכתוב $z = x_0 + i y_0, w = x_1 + i y_1$.\
  עבור סעיף א' עלינו להראות $rho(overline(z), overline(w)) = rho(z, w)$, כלומר
  $
    (2abs(z-w))/(sqrt(1+abs(z)^2)sqrt(1+abs(w)^2))= (2abs(overline(z)-overline(w)))/(sqrt(1+abs(overline(z))^2)sqrt(1+abs(overline(w))^2))
  $
  אכן כבר ראינו $(star) space abs(z)=abs(overline(z))$ לכל $z in CC$ וכן
  $
    overline(z)-overline(w) = x_0 - i y_0 - (x_1 - i y_1) = (x_0-x_1) - i(y_0-y_1) = overline(z-w) ==> abs(overline(z)-overline(w)) = abs(z-w)
  $
  כלומר אכן יש למעלה שיוויון.\
  עבור סעיף ב' עלינו להראות $rho(overline(1/abs(z)), overline(1/abs(w)))$, כלומר
  $
    (2abs(z-w))/(sqrt(1+abs(z)^2)sqrt(1+abs(w)^2)) = (2abs(1/overline(z)-1/overline(w)))/(sqrt(1+abs(1/overline(z))^2)sqrt(1+abs(1/overline(w))^2))
  $
  מתקיים
  $
    abs(1/overline(z) - 1/overline(w)) = abs((overline(w)-overline(z))/overline(z w))=_(abs(overline(w)-overline(z))=abs(overline(w-z))) = abs(w-z)/(abs(overline(z))abs(overline(w))) =_((star)) abs(w-z)/(abs(z)abs(w)) \
    sqrt(1+abs(1/overline(z))^2) =_((star)) sqrt(1+1/abs(z)^2) = sqrt((abs(z)^2+1)/abs(z)^2) = sqrt(1+abs(z)^2)/abs(z)
  $
  ולכן
  $
    rho(1/overline(z), 1/overline(w)) = (2 dot.op abs(z-w)/cancel((abs(z)abs(w))))/(sqrt(1+abs(z)^2)/cancel(abs(z))(1+abs(w)^2)/cancel(abs(w))) = (2 abs(z-w))/(sqrt(1+abs(z)^2)sqrt(1+abs(w)^2))
  $
  ושוב קיבלנו לעיל שיוויון.\
  עבור סעיף ג', נבחין שזה נובע משני המקרים הקודמים כהרכבה של איזומטריות שכן $1/z = overline(1/overline(z))$ וכידוע הרכבה של איזומטריות היא איזומטרייה, ולכן גם מתקיים
  $
    (2abs(z-w))/(sqrt(1+abs(z)^2)sqrt(1+abs(w)^2)) = (2abs(1/z-1/w))/(sqrt(1+abs(1/z)^2)sqrt(1+abs(1/w)^2))
  $
  כלומר, כל הסעיפים הקודמים הם איזומטריות על ספירת רימן.
]
