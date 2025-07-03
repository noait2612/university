#import "../../../src/article.typ": *
#show: article.with(title: [ פתרון מטלה 01 (לא להגשה) --- אנליזה פונקציונלית, 80417 ], signature: [#align(
    center,
  )[#image("../../../src/duck.png", width: 30%, fit: "contain")]])

#question()
תהיי $A subset.eq RR$, נראה כי $A$ חסומה טוטאלית אם ורק אם היא חסומה.\
בפרט, אם $I subset.eq RR$ הוא קטע סגור וחסום אזי לכל $epsilon > 0$ קיימים קטעים סגורים $I_1, dots.h.c, I_n subset.eq I$ כך שמתקיים $I = union.big_(i=1)^n I_i$ ואורכו של כל $I_i$ הוא לכל היותר $epsilon$.

#proof[
  ניזכר שנגיד כי $A$ חסומה טוטאלית אם לכל $epsilon > 0$ קיימים $x_1, dots.h.c, x_n in RR$ כך שמתקיים $A = union.big_(i=1)^n B_epsilon (x_i)$.\
  $<==$ נניח כי $A$ חסומה ונרצה להראות שהיא חסומה טוטאלית.\
  יהי $epsilon > 0$ ונסתכל על הקטע $(n epsilon - epsilon/2, n epsilon + epsilon/2)$ עבור $n in ZZ$: אלו בעצם כדורים פתוחים עם רדיוס $epsilon/2$.\
  מהחסימות, ניתן למצוא $m, n in ZZ$ כך ש־$m<n$ אבל $A subset (m epsilon - epsilon/2, n epsilon + epsilon/2)$ אבל אז $display(A subset union.big_(k=m)^n (k epsilon - epsilon/2, k epsilon + epsilon/2))$
  \
  $==>$ נניח כי $A$ חסומה טוטאלית ונרצה להראות שהיא חסומה.\
  יהי $epsilon > 0$, מהיות $A$ חסומה טוטאלית נובע שקיימים $x_1, dots.h.c, x_N in RR$ כך שמתקיים $display(A subset union.big_(k=1)^N B_epsilon (x_k))$, אבל זה איחוד סופי של קבוצות חסומות ולכן חסום גם־כן.\
]

#question()
מרחב מטרי $X$ נקרא *ספרבילי* אם קיימת קבוצה בת־מנייה $A subset.eq X$ שצפופה ב־$X$.\
נראה כי מרחב מטרי חסום טוטאלית הוא ספרבילי.

#proof[
  מהיות $X$ מרחב מטרי חסום טוטאלי נובע שלכל $n in NN$ מתקיים $X subset.eq_(x in D_n) B_(1/n) (x)$ כאשר $abs(D_n) < infinity$.\
  נגדיר $display(D = union.big_(n=1)^infinity D_n)$ שהיא בת־מנייה מאיחוד קבוצות בנות־מנייה, נראה כי $D$ צפופה: \
  יהי $epsilon > 0$ ויהי $B_epsilon (y) in X$, כדור פתוח וניקח $n in NN$ כך ש־$1/n < epsilon$ ולכן $display(y in X subset.eq union.big_(x in D_n) B_(1/n) (x))$ ולכן קיים $x in D_n subset.eq D$ המקיים
  $ y in B_(1/n) (x) => d(x,y) < 1/n < epsilon => x in B_epsilon (y) $
]

#question()
יהי $(X, d)$ מרחב מטרי. נראה כי קבוצה $A subset.eq X$ היא חסומה טוטאלית אם ורק אם לכל סדרה $(x_n)_(n=1)^infinity in A$ יש תת־סדרה $(x_n_k)_(k=1)^infinity$ כך שלכל $k in NN$ מתקיים $d(x_n_k, x_n_(k+1))<2^(-k)$

#proof[
  זה משפט האוסדרוף ואני עצלנית.
]

#question()
נתבונן במרחב $(C[-pi, pi], norm(dot.op)_2)$, מרחב הפונקציות הרציפות על $[-pi, pi]$ עם הנורמה
$ norm(f)_2 = sqrt(integral_(-pi)^pi f^2 d x) $
נראה כי במרחב זה הסדרה $(sin(n t))_(n=1)^infinity$ היא חסומה אבל לא חסומה טוטאלית.

#proof[
  נשים לב ש־$sin^2(-n t) = (-sin(n t))^2 = sin^2(n t)$ ולכן פונקציה זוגית, אז על קטע סימטרי מתקיים
  $
    integral_(-pi)^pi sin^2(n t) d t = 2 integral_0^pi sin^2(n t) d t
  $
  עכשיו נחשב
  $
    integral sin^2(n t) d t =_(x = n t \
    t = x/n \
    d t = 1/n d x) integral (sin^2(x))/n d x = 1/n integral sin^2(x) d x = 1/n integral (1-cos(2x))/2 d x = 1/(2n) integral 1-cos(2x)d x
  $
  וגם
  $
    integral cos(2x) d x =_(u = 2x \
    (d u)/2 = d x) integral cos(u)/2 d u = sin(u)/2 = sin(2x)/2
  $
  ולכן
  $ 1/(2n) integral 1-cos(2x) d x = 1/(2n)(x-sin(2x)/2) =_(x=n t) 1/(2n)(n t - sin(2 n t)/2) = t/2 - sin(2 n t)/(4n) $
  ולבסוף
  $
    integral_(-pi)^pi sin^2(n t) d t = 2 integral_0^pi sin^2(n t) d t = [t - sin(2 n t)/(2n)]_(t=0)^(t=pi) = pi - sin(2 n pi)/(2n) = pi
  $
  אז $norm(sin(n t))_2 = sqrt(pi)$ לכל $n in NN$ ולכן הסדרה מוכלת בכדור ברדיוס $2 > sqrt(pi)$ ועל־כן הסדרה חסומה.\
  נראה כי היא לא חסומה טוטאלית, מספיק שנחשב את המרחק בין שני אינדקסים $n!=m$
  $
    integral_(-pi)^pi (sin(n t)- sin(m t))^2 d t = integral_(-pi)^pi sin^2(n t) d t - 2 integral_(-pi)^pi sin(n t) sin(m t) d t + integral_(-pi)^pi sin^2(m t) d t
    2pi - 2 integral_(-pi)^pi sin(n t) sin(m t) d t
  $
  היות ו־$sin(n t), sin(m t)$ אי־זוגיות לכל $n, m in NN$ אז המכפלה שלהם היא פונקציה זוגית ולכן
  $
    integral_(-pi)^pi sin(n t) sin(m t) d t = 2 integral_0^pi sin(n t) sin(m t) d t = 2 integral_0^pi (cos((n-m)t)-cos((n+m)t))/2 d t \
    = integral_0^pi cos((n-m)t)-cos((n+m)t) d t = integral_0^pi cos(n t -m t) d t - integral_0^pi cos(n t + m t) d t
  $
  אז נחשב
  $
    integral cos(n t plus.minus m t) d t =_(x = n t plus.minus m t \
    1/(n plus.minus m) d x = d t) integral cos(x)/(n plus.minus m ) d x = sin(x)/(n plus.minus m) = sin(n t plus.minus m t)/(n plus.minus m)
  $
  ואז נקבל
  $
    integral_0^pi cos(n t -m t) d t - integral_0^pi cos(n t + m t) d t = [sin(n t - m t)/(n - m) - sin(n t + m t)/(n + m) ]_(t=0)^(t=pi) = 0
  $
  מצאנו שמתקיים
  $norm(sin ( n t) - sin (m t))_2 = sqrt(2 pi)$ לכל $n!=m$ וזה בפרט אומר שאין לנו תת־סדרה קושי, ולכן היא לא חסומה לחלוטין.
]
