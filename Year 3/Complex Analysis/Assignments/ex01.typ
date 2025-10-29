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
דברים עם ציורים וזה
#subquestion()
#todo

#subquestion()
#todo

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
  נשתמש בסעיף א' עם אותן הגבלות על $theta$
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
  _תזכורת_: בהרצאה הגדרנו שקבוצה היא קומפקטית אם היא סגורה וחסומה וש־$CC$ הוא אכן מרחב מטרי.\
  $<==$ נניח כי $K$ קומפקטי ונראה שלסדרה $(z_n)_(n=1)^infinity subset.eq K$ יש תת־סדרה מתכנסת.\
  נניח בשלילה כי $K$ אינו קומפקטי־סדרתית, כלומר יש $(z_n)_(n=1)^infinity subset.eq z$ כך שאין לה תת־סדרה מתכנסת.
  $==>$ נניח שלכל סדרה $(z_n)_(n=1)^infinity subset.eq K$ יש תת־סדרה מתכנסת $(z_n_k)_(k=1)^infinity$ ל־$z in K$ ונרצה להראות ש־$K$ סגור וחסום.\
  סגור: נובע מהניסוח השקול קבוצה סגורה כאוסף כל הנקודות הגבוליות במרחב ומכך שלכל סדרה יש תת־סדרה מתכנסת ל־$z in K$, כלומר $K$ אוסף כל הנקודות הגבוליות.\
  חסום: נניח ש־$K$ לא חסומה ויהי $z_0 in K$

]
