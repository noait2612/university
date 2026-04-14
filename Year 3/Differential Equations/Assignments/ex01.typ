#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 01 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהי $J in RR$ מקטע ונקבע $t_0 in J$. נניח כי $a,f : J arrow RR$ פונקציות רציפות.\
נוכיח כי $x:J arrow RR$ פותרת את המשוואה
$ x'(t)=a(t)x(t)+f(t) $
אם ורק אם קיים $c in RR$ כך שמתקיים
$ x(t)=e^(phi(t))(integral_(t_0)^t e^(-phi(s))f(s)dif s + c) $
כאשר $phi(t) = integral_(t_0)^t a(s) dif s$.

#proof[
  $<==$ נעזר בהדרכה ונסתכל על $y(t)=e^(-phi(t)) x(t)$ והנגזרת שלה היא
  $ y'(t)=e^(-phi(t))x'(t)+x(t) dif/(dif t)(e^(-phi(t)))=e^(-phi(t))x'(t)-a(t)e^(-phi(t))x(t) $
  כאשר המעבר האחרון נובע מכך שמתקיים
  $ dif/(dif t)(e^(-phi(t))) = -a(t)e^(-phi(t)) $
  נציב $x'(t)=a(t)x(t)+f(t)$ ונקבל
  $ y'(t)=e^(-phi(t))(a(t)x(t)+f(t))-a(t)e^(-phi(t))x(t) = e^(-phi(t))f(t) $
  ניקח אינטגרל ונקבל
  $ y(t)=y(t_0)+integral_(t_0)^t e^(-phi(s))f(s) dif s = x(t_0) integral_(t_0)^t e^(-phi(s))f(s) dif s $
  שכן
  $ y(t_0)=e^(-phi(t_0))x(t_0) $
  כי $phi(t_0)=0$.\
  אבל $ x(t)=e^(phi(t))y(t) $
  ולכן
  $
    x(t)=e^(phi(t))(x(t_0) + integral_(t_0)^t e^(-phi(s))f(s) dif s) =_(c=x(t_0)) e^(phi(t))(integral_(t_0)^t e^(-phi(s))f(s) dif s + c)
  $
  $==>$ נגזור לפי כלל מכפלה ונקבל את הנדרש
  $
    x'(t)=a(t)e^(phi(t))(integral_(t_0)^t e^(-phi(s)) f(s) dif s + c)+e^(phi(s)) dot.op e^(-phi(t)) f(t) = a(t)x(t)+f(t)
  $
]

#question()
נמצא את הפיתרון למשוואה $x'(t)=t/(t+1) x(t)+1$ עם תנאי התחלה $x(0)=1$ בתחום $(-1, infinity)$.

#solution[
  נשתמש בשאלה הראשונה.\
  נגדיר
  $
    a(t)=t/(t+1) \
    f(t) = 1
  $
  ואלו פונקציות רציפות במקטע $(-1, infinity)$.\
  נבחר את הנקודה $t_0 = 0$ ואז
  $ phi(t) = t-ln(t+1) $
  כאשר $phi(t)$ מוגדרת היטב כי אנחנו בתחום $(-1, infinity)$.\
  כלומר הפיתרון הוא מהצורה
  $
    x(t) = e^(phi(t))(integral_(t_0)^t e^(-phi(s)) f(s) dif s + c) = e^t/(t+1) (integral_0^t (s+1)/e^s dif s + c)=e^t/(t+1) ([-(s+2)/e^s]_(s=0)^(s=t)+c)=e^t/(t+1)(-(t+2)/e^t +2+c)
  $
  תנאי ההתחלה הוא $x(0)=1$ ונקבל
  $ e^0/(0+1) (-(0+2)/e^0 + 2 + c) = 1 <==> -2+2 + c = 1 <==> c=1 $
  כלומר
  $ x(t)= e^t/(t+1)(-(t+2)/e^t -1) $
]

#question()
נמצא את הפיתרון הכללי למשוואה $x'(t)=x(t)(1-x(t))$ בתחום $RR$.

#solution[

]

#question()
נמצא את הפיתרון למשוואה $x''(t)-18x(t)^3=0$ עם תנאי ההתחלה $x(0)=1, x'(0)=-3$.

#solution[]

#question()
תהיי $Omega subset RR times RR^n$ פתוחה ותהיי $f:Omega arrow RR^n$.\
נסמן נקודות ב־$Omega$ בתום $(t,x) = (t, x_1, dots.h, x_n) in RR times RR^n$ ונתבונן במשוואה הדיפרנציאלית
$ (star) space x'(t)=f(t, x(t)) $
נאמר כי המשוואה $(star)$ היא אוטונומית אם $(dif f)/(dif t) = 0$.\
בהרצאה הוכחנו שהפיתרון של משוואה דיפרנציאלית מסדר $n$ שקול לפתרון משוואה דיפרנציאלית מסדר $1$.\
נשתמש ברעיון כדי להוכיח שפתרון משוואה מהצורה של $(star)$ שקולה לפיתרון משוואה אוטונמית מתאימה.

#proof[

]
