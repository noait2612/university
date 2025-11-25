#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 05 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()

#question()
#subquestion()
נחשב את הגבול
$ lim_(n arrow.r infinity) integral_0^n (1-x/n)^n e^(x/2) d x $

#solution[
  נגדיר $f_n : RR arrow.r RR$ על־ידי
  $ f_n (x) = mycases((1-x/n)^n e^(x/2), x in [0,n], 0, x in.not [0,n]) $
  ונרצה לחשב את
  $ lim_(n arrow.r infinity) integral_0^n (1-x/n)^n e^(x/2) d x = lim_(n arrow.r infinity) integral_RR f_n (x) d x $
  ניזכר באריתמטיקה של גבולות
  $ lim_(n arrow.r infinity) (1+a/n)^n = e^a $
  אז עבור $x in [0,infinity)$, בבחירת  $a = -x$ מתקיים
  $ f(x) = lim_(n arrow.r infinity) f_n (x) = e^(-x)e^(x/2)=e^(-x/2) $
  אז יש לנו התכנסות נקודתית $f_n arrow.r f$ כאשר $ f(x) = mycases(e^(-x/2), x>=0, 0, "אחרת") $
  נרצה להשתמש במשפט ההתכנסות הנשלטת ולכן עלינו לחסום את $abs(f_n (x))$ עבור $x in [0,n]$.\
  נשים לב ש־$x/n in [0,1]$ ולכן $1-x/n >=0$, ונזכר באי־השיוויון הבא עבור $y in [0,infinity)$,
  $ 1-y <= e^(-y) $
  אז מהאי־שליליות ומהאי־שיוויון הזה נקבל
  $ (1-x/n)^n <= e^(-x/n)^n = e^(-x) ==> abs(f_n (x))=(1-x/n)^n e^(x/2)<=e^(-x)e^(x/2)=e^(-x/2) $
  ולכן נוכל להגדיר את הפונקציה השולטת
  $ g(x) = mycases(e^(-x/2), x>=0, 0, x<0) $
  כדי להשתמש במשפט ההתכנסות הנשלטת עלינו להראות ש־$g(x)$ אינטגרבילית, ואכן
  $
    integral_RR g(x) d x = integral_0^infinity e^(-x/2) d x= [e^(-x/2)/(-1/2)]^infinity_0 = [-2e^(-x/2)]^infinity_0 = 0 - (-2) = 2
  $
  ולכן $g$ אינטגרבילית ומתקיים במקרה זה יחד עם משפט ההתכנסות הנשלטת
  $
    lim_(n arrow.r infinity) integral_RR f_n (x) d x = integral_RR lim_(n arrow.r infinity) f_n (x) d x = integral_RR f(x) d x = integral_RR g(x) d x = 2
  $
]
