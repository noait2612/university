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
  זו משוואה ניתנת להפרדה כי $(dif x)/(dif t)=x(1-x) = (dif x)/(x(1-x)) = dif t$ ונגדיר $f(x)=x(1-x)$ ו־$g(t) eq.triple 1$.\
  $g$ רציפה ו־$f$ לא מתאפסת בסביבה שלא מכילה את $0,1$ ולכן נוכל להשתמש בטענה מהתרגול בצורה לוקאלית ולהגדיר
  $
    phi(x)=integral 1/f(x) dif x = integral 1/(x(1-x)) dif x = integral 1/x + 1/(1-x) dif x = ln abs(x)-ln abs(1-x)=ln abs(x/(1-x))
  $
  ומהמשפט נקבל
  $ x(t)=phi^(-1)(integral g(s) dif s + C)= phi^(-1)(t + C) $
  כאשר את $phi^(-1)$ נחשב
  $
    y=ln abs(x/(1-x)) <==> e^y = x/(1-x) <==> x=e^y(1-x) <==> x = e^y -e^y x <==> x+e^y x =e^y <==> x(1+e^y)=e^y \
    ==> phi^(-1)(y)=e^y/(1+e^y)
  $
  ולכן
  $
    x(t) = phi^(-1)(t+C) = e^(t+C)/(1+e^(t+C)) =_(K colon.eq t+C \
    K in RR) e^K/(1+e^K)
  $
  כאשר ב־$0,1$ נקבל $x(t)=0, x(t)=1$ כי אם נסתכל על $x(t)=0$ נקבל ש־$x'(t)=0$ ולכן
  $ x(t)(1-x(t))=0 dot.op (1-0)=0 $
  כלומר התנאי של $x'(t)=x(t)(1-x(t))$ מתקיים ולכן $x(t)=0$ זה פיתרון, באותו אופן עושים גם בשביל $1$.
]

#question()
נמצא את הפיתרון למשוואה $x''(t)-18x(t)^3=0$ עם תנאי ההתחלה $x(0)=1, x'(0)=-3$.

#solution[
  נעזר בהכוונה ונכפול ב־$x'(t)$ ונקבל $x''(t)x'(t)-18x(t)^3x'(t)=0$ ולכן
  $ integral_0^t x' x''-18x^3x' dif t= 0 $
  נעשה אינטגרציה איבר איבר
  $ integral x' x'' dif t = (x')^2/2 $
  כי אם נסמן $u=x'(t)$ אז $(dif u)/(dif t)=x''(t)$ ולכן $x'(t)x''(t)=u dif u$.\
  בשביל האיבר השני באינטגרל נסמן $u=x(t)$ ולכן $dif u = x'(t)$ ונקבל
  $ integral 18x^3 x' dif t = integral 18x^3 dif x = 18/4 x^4 = 9/2 x^4 $
  כלומר
  $ integral_0^t x' x''-18x^3x' dif t = 0 <==> (x')^2/2 - 9/2 x^4=C <==> (x')^2 -9x^4=C $
  מהנתון $x(0)=1, x'(0)=-3$ ולכן
  $ (-3)^2-9(1)^4=9-9=0 ==> C = 0 ==> (x')^2 = 9x^4 <==> x' = plus.minus 3x^2 ==>_(x'(0)=-3) x'=-3x^2 $
  #todo
]

#question()
תהיי $Omega subset RR times RR^n$ פתוחה ותהיי $f:Omega arrow RR^n$.\
נסמן נקודות ב־$Omega$ בתום $(t,x) = (t, x_1, dots.h, x_n) in RR times RR^n$ ונתבונן במשוואה הדיפרנציאלית
$ (star) space x'(t)=f(t, x(t)) $
נאמר כי המשוואה $(star)$ היא אוטונומית אם $(dif f)/(dif t) = 0$.\
בהרצאה הוכחנו שהפיתרון של משוואה דיפרנציאלית מסדר $n$ שקול לפתרון משוואה דיפרנציאלית מסדר $1$.\
נשתמש ברעיון כדי להוכיח שפתרון משוואה מהצורה של $(star)$ שקולה לפיתרון משוואה אוטונמית מתאימה.

#proof[

]
