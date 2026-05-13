#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 05 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי $A in M_n (RR)$ נוכיח לפי הגדרה ובאמצעות כפליות האקספוננט כי $E(t)=e^(t A)$ היא פונקציה גזירה ומתקיים
$ E^prime (t) = A E(t) $

#proof[
  מהגדרת הנגזרת
  $
    lim_(h arrow 0) (E(t+h)+E(t))/h = lim_(h arrow 0) (e^((t+h)A)-e^(t A))/h = lim_(h arrow 0) (e^(t A)e^(h A)-e^(t A))/h = lim_(h arrow 0) e^(t A) (e^(t h)-1)/h
  $
  מאותו טריק קבוע של מרוכבות עם הגדרת האקספוננט כטור נקבל אם כך
  $
    lim_(h arrow 0) (e^(t h)-1)/h = lim_(h arrow 0) 1/h sum_(n=1)^infinity (h^n A^n)/n! = lim_(h arrow 0) sum_(n=1)^infinity (h^(n-1) A^n)/n! = lim_(h arrow 0) A + o(h)
  $
  אז הנגזרת קיימת ומתקיים $E^prime (t) = A E(t)$.
]

#question()
#subquestion()
נמצא בסיס למרחב הפתרונות של המשוואה
$ x^prime (t) = mat(-1, 2; -3, 4) x(t) $

#solution[
  נסמן $ A = mat(-1, 2; -3, 4) $
  ונחשב את הפולינום האופייני של $A$
  $
    P_A (lambda) = det(lambda I_2 - A) = det mat(lambda+1, -2; 3, lambda-4) = (lambda+1)(lambda-4)+6 = lambda^2 -3lambda +2 = (lambda - 2)(lambda -1)
  $
  ולכן הערכים העצמיים של $A$ הם $1$ ו־2 כלומר $A$ לכסינה מעל $CC$ והצורה הלכסינה שלה היא
  $ mat(2, 0; 0, 1) $
  אם $v$ הוא וקטור עצמי של $A$ המתאים לערך העצמי $lambda$ אז הפונקציה $x(t)=e^(t lambda)v$ היא פיתרון של מערכת המשוואות.\
  עבור $lambda_1 = 1$ נפתור את המערכת $(A-I_2)v_1 = 0$
  $
    (A-I_2)v_1 = 0 <==> (mat(-1, 2; -3, 4) - mat(1, 0; 0, 1))v_1 = 0 <==> mat(-2, 2; -3, 3)v_1 = 0 <==> -2x+2y-3x+3y = 0 <==> 5x=5y <==> x=y
  $
  ולכן $v_1 = vec(1, 1)$ אז $x_1 (t) = e^2 v_1$.\
  באופן דומה נקבל עבור $lambda_2 = 2$ ש־$(A-2I_2)v_2 = 0$ אם ורק אם $-3x+2y = 0$ כלומר וקטור עצמי אפשרי לפיתרון הוא $v_1 = (2,3)$ ולכן $x_2 (t) = e^(2t) v_1$.\
  נסיים בהתאם בהתאם למשפט מהתרגול: בסיס למרחב הפתרונות הוא:
  $ { e^(2t) vec(2, 3), e^t vec(1, 1) } $
  והפתרון הכללי של המערכת הוא צירוף ליניארי שלהם:
  $ x(t) = c_1 e^(2t) vec(2, 3) + c_2 e^t vec(1, 1) $
]

#subquestion()
נמצא בסיס למרחב הפתרונות של המשוואה
$ y^(prime.triple) + y^(prime.double) + y^prime + y = 0 $

#solution[
  בהתאם לטענה המתרגול, נגדיר את המטריצה
  $
    A colon.eq mat(0, 1, 0; 0, 0, 1; -1, -1, -1)
  $

  $$
  כאשר פונקציה $y:I arrow RR$ פותרת את הבעיה אם ורק אם היא הקורדינאטה הראשונה של $x:I arrow RR^n$ כאשר $x$ פותרת את המשוואה $x^prime = A x$.\
  מלמה מהתרגול נובע שהפולינום האופייני של $A$ הוא $P_A (lambda)=lambda^3+lambda^2+lambda+1 = (lambda+1)(lambda^2+1)$.\
  זה פולינום ציקלוטומי מסדר $4$ ולכן הפתרונות שלו הם שורשי היחידה
  $ lambda_1 = -1, quad lambda_2 = i, quad lambda_3 = -i $
  למעט $lambda=1$ הם שורשי יחידה מסדר רביעי והם כולם שונים ולכן בסיס למרחב הפתרונות מעל $CC$ לפי הטענה מהתרגול הוא
  ${e^(-t), e^(i t), e^(-i t)}$.\
  אם נרצה מעל הממשיים פשוט נשתמש בזהות אויילר.\
]

#question()
תהיי $A in M_n (CC)$ כך שלכל $lambda$ ערך עצמי של $A$ מתקיים $abs(lambda)<1$ ונוכיח $lim_(n arrow.r infinity) A^n = 0$.

#proof[
  מכיוון ש־$A in M_n (CC)$ קיימת $P$ הפיכה כך שיש ל־$A$ צורת ז'ורדן $A = P^(-1) J P$.\
  כדי להראות $A^n arrow 0$ מספיק להראות ש־$J_k (lambda)^n arrow 0$ כי $A^n = P J^n P^(-1)$.\
  בלוק ז'ורדן $k times k$ הוא מהצורה
  $
    J = lambda I + N = mat(lambda, 1, 0, dots; 0, lambda, 1, dots; dots, dots, dots, 1; 0, 0, dots, lambda)
  $
  עבור $N$ מטריצה נילפוטנטית.\
  מכיוון ש־$I$ ו־$N$ מתחלפות, כשנעלה את $(lambda I+N)$ בחזקת $n$ נקבל
  $ binom(n, j) lambda^(n-j) wide j in {0, dots.h, k-1} $
  אז עבור איבר כללי $J^n$ מנוסחת הבינום עבור $J=lambda I + N$ נקבל
  $ (lambda I + N)^n = sum_(j=0)^(min(n, k-1)) binom(n, j) lambda^(n-j) N^j $
  כאשר $k$ הוא גודל הבלוק.\
  נחשב את הגבול
  $
    lim_(n arrow.r infinity) binom(n, j) lambda^(n-j) = lim_(n arrow.r infinity) frac(n(n-1)dots(n-j+1), j!) lambda^(n-j)
  $
  ו־$j$ קבוע ולכן $frac(n(n-1) dots.h.c (n-j+1), j!)$ הוא פולינום מדרגה $j$ ב־$n$ ונסמנו $P(n)$.\
  מהנתון $abs(lambda)<1$ ולכן
  $ lim_(n arrow.r infinity) n^j lambda^n = 0 $
  אז כל איברי המטריצה $J^n$ הם סכומים סופיים של איברים השואפים לאפס ולכן $ lim_(n arrow.r infinity) J^n = 0 $
  לבסוף
  $
    lim_(n arrow.r infinity) A^n = lim_(n arrow.r infinity) P J^n P^(-1) = P (lim_(n arrow.r infinity) J^n) P^(-1) = P dot 0 dot P^(-1) = 0
  $
]

#question()
נתבונן במשוואה הדיפרנציאלית
$ (star) quad x^prime.double (t) + a(t) x^prime (t)+b(t) x(t) = 0 $
כאשר $a,b$ הן פונקציות אנליטיות בסביבה של $0$ כלומר קיימת $delta>0$ וסדרות $(alpha_n)_(n=1)^infinity, (beta_n)_(n=1)^infinity$ כך שלכל $t in (-delta, delta)$ מתקיים
$ a(t)=sum_(n=1)^infinity alpha_n t^n wide b(t)=sum_(n=1)^infinity beta_n t^n $

#subquestion()
נראה כי אם $x$ פיתרון למשוואה $(star)$ שניתן לכתוב כטור חזקות $x(t)=sum_(n=1)^infinity c_n t^n$ אז
$
  c_0 =x(0) \
  c_1 =x^prime (0)
$

ולכל $k>=0$ מתקיים
$ (k+2)(k+1)c_(k+2)=-sum_(j=0)^k ((j+1)alpha_k c_(j+1)+b_(k-j)c_j) $

#proof[
  בהצבת $t=0$ נקבל
  $ x(0) = c_0 + c_1(0) + c_2(0)^2 + dots.h = c_0 $
  נחשב את הנגזרת של $x(t)$
  $ x^prime (t) = sum_(n=1)^infinity n c_n t^(n-1) = c_1 + 2 c_2 t + 3 c_3 t^2 + dots.h $
  ובהצבת $t=0$ נקבל
  $ x^prime (0) = c_1 + 2 c_2(0) + 3 c_3(0)^2 + dots.h = c_1 $
  נגזור שוב ונקבל
  $ x^prime.double (t) = sum_(n=2)^infinity n(n-1) c_n t^(n-2)= 2c_2 + 6 c_3 t + dots.h $
  נרצה להציב בחזרה במשוואה $(star)$ ונקבל
  $
    sum_(n=2)^infinity n(n-1)c_n t^(n-2) + (sum_(n=1)^infinity alpha_n t^n) (sum_(n=1)^infinity n c_n t^(n-1)) + (sum_(n=1)^infinity beta_n t^n) (sum_(n=0)^infinity c_n t^n) = 0
    \
    <==>_(k=n-2 \ n + k +2)
    sum_(k=0)^infinity (k+2)(k+1)c_(k+2) t^k + (sum_(n=1)^infinity alpha_n t^n) (sum_(n=1)^infinity n c_n t^(n-1)) + (sum_(n=1)^infinity beta_n t^n) (sum_(n=0)^infinity c_n t^n) = 0
  $
  אנחנו צריכים את נוסחת קושי לטורים שלא למדנו מעולם
  $ (sum_(i=0)^infinity A_i t^i) (sum_(j=0)^infinity B_j t^j) = sum_(k=0)^infinity (sum_(j=0)^k A_(k-j) B_j) t^k $
  אז
  $
    sum_(k=0)^infinity (k+2)(k+1)c_(k+2) t^k + (sum_(k=1)^infinity (sum_(j=1)^k alpha_(k-j+1) j c_j) t^k) + (sum_(k=1)^infinity (sum_(j=0)^(k-1) beta_(k-j) c_j) t^k) = 0
  $
  מכך ש־$alpha_0, beta_0 = 0$ ניתן לאחד את הסכומים בשמאל לסכום אחד ולכל $k>=0$ המקדם של $t^k$ באגף שמאל חייב להיות אפס לכל $k$ מהגדרת שיוויון טורים.\
  אז עבור $k in NN$ המקדם של $t^k$ הוא
  $
    (k+2)(k+1)c_(k+2) + sum_(j=0)^k alpha_(k-j) (j+1)c_(j+1) + sum_(j=0)^k beta_(k-j) c_j = 0 ==> (k+2)(k+1)c_(k+2) = -sum_(j=0)^k [(j+1)alpha_(k-j) c_(j+1) + beta_(k-j) c_j]
  $
]

#pagebreak()

#subquestion()
תהיי $(c_k)_(k=1)^infinity$ הסדרה המוגדרת על־ידי הרקורסיה
$ c_0 = xi_0 \ c_1 = xi_1 $
ולכל $k>=0$ מתקיים
$ (k+2)(k+1)c_(k+2) = - sum_(j=0)^k ((j+1)alpha_(k-j) c_(j+1)+b_(k-j) c_j) $
נראה כי טור החזקות $sum_(n=0)^infinity c_n t^n$ מתכנס בתחום $(-delta,delta)$.

#proof[
  נפעל בהתאם להדרכה, נקבע $r in (0,delta)$.\
  מהנתון $a,b$ אנליטיות בסביבה של $0$ כלומר קיים $M>0$ המקיים
  $
    abs(alpha_n) t^n < M r^(-n) \
    abs(b_n) t^n < M r^(-n)
  $
  ולכן בפרט
  $
    (k+2)(k+1)abs(c_(k+2)) & = abs(-sum_(j=0)^k ((j+1)alpha_(k-j) c_(j+1)+b_(k-j) c_j)) \
                           & <= sum_(j=0)^k abs((j+1)alpha_(k-j) c_(j+1)+b_(k-j) c_j)) \
                           & <= M/r^k sum_(j=0)^k ((j+1) abs(c_(j+1)) + abs(c_j)) dot.op r^j \
                           & <= M/r^k sum_(j=0)^k ((j+1) abs(c_(j+1)) + abs(c_j)) dot.op r^j + M abs(c_(k+1))r
  $
  נגדיר את הסדרה $(C_k)_(k=1)^infinity$ על־ידי $C_0 = abs(c_0), space C_1 = abs(c_1)$ וכן
  $ (k+2)(k+1)abs(C_(k+2)) & = M/r^k sum_(j=0)^k ((j+1) abs(C_(j+1)) + abs(C_j)) dot.op r^j + M abs(C_(k+1))r $
  ממבחן ההשוואה להתכנסות טורים אי־שליליים נובע שאם הטור $sum_(n=0)^infinity C_n t^n$ מתכנס ב־$(-delta, delta)$ אז גם הטור $sum_(n=0)^infinity C_n t^n$ מתכנס שם. ואכן
  $ (k+2)(k+1)C_(k+2) = M/r^k sum_(j=0)^(k-1) ((j+1)C_(j+1) + C_j)r^j + M/r^k ((k+1)C_(k+1) + C_k)r^k + M C_(k+1)r $
  ומהגדרת $C_(k+1)$ מתקיים
  $ (k+1)k C_(k+1) = M/r^(k-1) sum_(j=0)^(k-1) ((j+1)C_(j+1) + C_j)r^j + M C_k r $
  אז
  $ M/r^k sum_(j=0)^(k-1) ((j+1)C_(j+1) + C_j)r^j = 1/r [(k+1)k C_(k+1) - M C_k r] $
  ובהצבה חוזרת
  $
    (k+2)(k+1)C_(k+2) = 1/r (k+1)k C_(k+1) - cancel(M C_k) + M(k+1)C_(k+1) + cancel(M C_k) + M C_(k+1)r = ((k(k+1))/r + M(k+1) + M r) C_(k+1)
  $
  ממבחן המנה נקבל
  $
    L = lim_(k arrow.r infinity) abs((C_(k+2) t^(k+2)) / (C_(k+1) t^(k+1))) = lim_(k arrow.r infinity) frac((k(k+1))/r + M(k+1) + M r, (k+2)(k+1)) abs(t) = lim_(k arrow.r infinity) frac(frac(1, r)+frac(k, r)+frac(M, k)+frac(M, k^2)+frac(M r, k^2), (1+3/k+2/k^2)) abs(t) = 1/r abs(t)
  $
  והטור הזה מתכנס כאשר $L<1$ כלומר $abs(t)<r$ וממבחן ההשואה סיימנו.

]
