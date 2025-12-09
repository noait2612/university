#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 06 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()

#question()
תהיי $Gamma_R$ מסילה המתקבלת משרשור (חיבור) הקו הישר המחבר בין הנקודות $R$ ו־$-R$ עם חצי מעגל ברדיוס $R$ ממורכב סביב הראשית, העובר בין הנקודות $R$ ו־$-R$.\
נמצא באיזה חצי מישור צריך לעבור חצי המעגל כדי שיתקיים
$ integral_RR cos(a x)/(x^2+1) dif x = lim_(R arrow.r infinity) integral_(Gamma_R) e^(a i z)/(z^2+1) dif gamma $

#solution[
  יהי $a in RR$ ונגדיר $ f(z) = e^(i a z)/(z^2+1) $
  ניקח $Gamma_R = [-R, R] union gamma_R$ כאשר $gamma_R$ זו המסילה של חצי המעגל ברדיוס $R$ הממורכז סביב הראשית ועובר בין הנקודות $R,-R$.\
  אם $a>0$ נבחר את חצי המעגל העליון ואם $a<0$ נבחר את החצי מעגל התחתון.\
  מלינאריות האינטגרל נקבל
  $ integral_(Gamma_R) f(z) dif z = integral_(-R)^R f(x) dif x + integral_(gamma_R) f(z) dif z $
  נשים לב שמתקיים עבור $a in RR$
  $ abs(f(x))=abs(e^(i a x))/(x^2+1) = 1/(x^2+1) $
  אבל אנחנו יודעים
  $ integral_(-infinity)^infinity 1/(x^2+1) dif x = pi $
  כלומר שהאינטגרל הזה מתכנס בהחלט, אז
  $ lim_(R arrow.r infinity) integral_(-R)^R f(x) dif x = integral_(-infinity)^infinity f(x) dif x $
  נכתוב פרמטריזציה לחצי המעגל על־ידי $z = R e^(i theta)$ עבור $theta in [0,pi]$, אז
  $
    abs(integral_(gamma_R) f(z) dif x)<= integral_0^pi abs(e^(i a R e^(i theta)))/abs(R^2 e^(2 i theta) +1) R dif theta = integral_0^pi e^(-a R sin(theta))/abs(R^2 e^(2 i theta)+1) R dif theta
  $
  נשים לב שמאי־שיוויון המשולש ההפוך, עבור $R>1$
  $ abs(R^2 e^(2 i theta)+1)>=abs(abs(R^2e^(2 i theta))-1)=abs(R^2-1)=R^2-1 $
  אז
  $
    integral_0^pi e^(-a R sin(theta))/abs(R^2 e^(2 i theta)+1) R dif theta <= integral_0^pi (R e^(-a R sin(theta)))/(R^2-1) dif theta = R/(R^2-1) integral_0^pi e^(-a R sin(theta)) dif theta
  $
  נזכר כי $sin(theta)$ היא סימטרית עבור $theta = pi/2$, כלומר $sin(theta)=sin(pi-theta)$ ולכן
  $ integral_0^pi e^(-a R sin(theta)) dif theta = 2 integral_0^(pi/2) e^(-a R sin(theta)) dif theta $
  אבל בקטע זה גם מתקיים $sin(theta)>=(2theta)/pi$ ולכן
  $
    2 integral_0^(pi/2) e^(-a R sin(theta)) dif theta <= 2 integral_0^(pi/2) e^(-a R (2theta)/pi) dif theta =_(u = (2a R theta)/pi, dif pi = pi/(2a R)) pi/(2 a R) integral_0^(a R) e^(-u) d u = [(-pi e^(-u))/(2 a R)]_(u=0)^(u=a R) = pi/(2 a R)(1-e^(-a R))<=pi/(2a R)
  $
  כלומר
  $ integral_0^pi e^(-a R sin(theta)) dif theta <= 2 dot.op pi/(2a R) = pi/(a R) $
  אז בסך־הכל קיבלנו
  $
    abs(integral_(gamma_R) f(z) dif z) <= R/(R^2-1) dot.op pi/(a R) = pi/(a(R^2-1)) stretch(arrow.r)_(r arrow.r infinity) 0
  $
  ולבסוף מאריתמטיקה של גבולות
  $ lim_(R arrow.r infinity) integral_(Gamma_R) f(z) dif z = integral_(-infinity)^infinity f(x) dif x $
  ואם ניקח את החלק הממשי נקבל בידיוק
  $ integral_RR cos(a x)/(x^2+1) dif x = lim_(R arrow.r infinity) integral_(Gamma_R) e^(a i z)/(z^2+1) dif gamma $
  כלומר, אם $a>0$ לוקחים את החצי מעגל העליון ואם $a<0$ לוקחים את חצי המעגל התחתון (ומחשבים עם $abs(a)$ את אותו תהליך לעיל).
]

#question()
#subquestion()
נמצא ענף של הלוגריתם בתחום $W = CC without {r e^(-(pi i)/2 bar r >=0)}$ ונוכיח שהוא אכן ענף של הלגוריתם.

#solution[

]
