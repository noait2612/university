#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: thmbox-init()
#show: article_he.with(
  title: [ משוואות דיפרנציאליות ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 2)

= משוואות דיפרנציאליות רגילות
== הגדרות בסיסיות
#definition[משוואה דיפרנציאלית רגילה מסדר $bold(n)$][
  משוואה דיפרנציאלית רגילה מסדר $n$ היא משוואה מהצורה
  $ F(x(t), x^prime (t), dots.h, x^n (t), t)=0 $
  כאשר $t$ משתנה זמן חופשי היכן ש־$F:Omega arrow RR$ כאשר $Omega subset.eq RR^(n+2)$ קבוצה פתוחה.\
  פיתרון של המשוואה בקטע $I subset.eq RR$ הוא פונקציה $x:I arrow RR$ אשר גזירה $n$ פעמים כך ש־$x$ מקיים את המשוואה לכל $t in I$.\
  באופן דומה, מערכת של $m$ משוואות דיפרנציאליות רגילות מסדר $n$ היא מערכת משוואות מהצורה
  $ F(x(t), x^prime (t), dots.h, x^(n) (t), t) = 0 $
  עבור $F:Omega subset.eq RR^((n+1)m+1) arrow RR^n$ ופתרון שלה בקטע $I subset.eq RR$ הוא פונקציה גזירה $n$ פעמים $x:I arrow RR^m$ שמספקת שפותרת את המשוואה בכל $t in I$.
]

#definition[מערכת/משוואה אוטונומית][
  נאמר שהמערכת / משוואה היא אוטונומית אם $F$ אינה תלויה ב־$t$.
]

#definition[מערכת משוואות לינארית][
  נאמר שמשוואה דיפרנציאלית היא לינארית אם יש פונקציות $c_0, c_1, dots.h, c_n, f : RR arrow RR$ כך שמתקיים
  $
    F(x(t), x^prime (t), dots.h, x^(n) (t), t) = c_0 (t) x(t) + c_1 (t) x^prime (t) + dots.h.c + c_n (t) x^(n) (t) + f(t)
  $
  אם כל ה־$c_i$־ים לא תלויים ב־$t$ נאמר שהמשוואה במקדמים קבועים ואם $f(t)=0$ נאמר שהמשוואה הומוגנית.
]

#remark[
  נשים לב שבמשוואה דיפרנציאלית הומוגנית כל צירוף לינארי של פתרונות הוא פתרון. שכן, אם למשל $x_1, dots.h, x_m$ פתרונות למשוואה לינארית הומוגנית ו־$alpha_1, dots.h, alpha_m$ סקלרים, אזי
  $ g(t) = sum_(i=1)^m alpha_i x_i (t) $
  הוא צירוף לינארי של פתרונות.\
  נציב את הפונקציה במשוואה כדי לקבל את הביטוי $sum_(j=0)^n c_j (t) (g^(j) (t))$ ונרצה להראות שתוצאתו היא $0$: ואכן, מתוך לינאריות הנגזרת והחלפת סדר הסכימה נקבל
  $
    sum_(j=0)^n c_j (t) (g^(j) (t)) = sum_(j=0)^n c_j (t) (sum_(i=1)^m alpha_i x_i^(j) (t)) = sum_(i=1)^m alpha_i (sum_(j=0)^n c_j (t) x_i^(j) (t))
  $
  מכיוון שכל הפונקציות $x_i$ הן פתרונות של המשוואה ההומוגנית, הסכום הפנימי בסוגריים שווה ל־$0$ לכל $i$. לכן מתקבל:
  $ = sum_(i=1)^m alpha_i dot 0 = 0 $
  ומכאן שגם $g(t)$ פותרת את המשוואה, כנדרש.
]

#remark[
  באינפי2 פתרנו משוואות מהצורה $x^prime (t) = f(t)$.\
  אם יודעים לחשב פונקציה קדומה ל־$f$ אז נוכל לכתוב $x(t) = x(t_0) + integral_(t_0)^t f(s) dif s$ מהמשפט היסודי ($x(t_0)$ זה מידע שתמיד היינו צריכים לקבל מאיפשהו).\
  לכן, גם בקורס הזה כשתנבונן במשוואות דיפרנציאליות תמיד נקבע את תנאי ההתחלה $x(0)=x_0$ וננסה לפתור את המשוואה עם הנתון הזה. זה נקרא *בעיית התחלה*.
]

#pagebreak()

== קיום ויחידות
#theorem[
  נניח שנתונה מערכת $m$ משוואות דיפרנציאליות מסדר $n$ כאשר $x^((n)) (t) = F(x, x^prime, dots.h, x^((n-1)), t)$ עבור $F:U arrow RR^m$ כאשר $U subset.eq R^(n m + 1)$.\
  אז יש מערכת מסדר 1, $y^prime (t) = G(y,t)$ עבור $G:V arrow RR^(n m)$ כאשר $V subset.eq RR^(n m + 1)$ כך שאם $x$ פתרון למערכת המקורית אז $y=(x, x^prime, dots.h, x^((n-1)))$ הוא פתרון למערכת החדשה ואם $y$ פתרון למערכת החדשה אזי $x=y_0$ הוא פתרון למערכת המקורית ולכל $0<=i<=n-2$ מתקיים $y_i^prime = y_(i+1)$ כאשר $y_i$ וקטור.
]<equivalence_theorem_to_system_from_order_one>

#end_of_lecture("1 – 23/03")

#proof[
  נסמן ב־$I$ את $x^((n)) (t) = F(x, x^prime, dots.h, x^((n-1)), t)$ וב־$I I$ את $y^prime (t) = G(y,t)$.\
  נגדיר את המערכת $y^prime (t) = G(y(t), t)$ על־ידי
  $
    cases(
      y_0^prime (t) = y_1 (t),
      y_1^prime (t) = y_2 (t),
      dots.v,
      y_(n-1)^prime (t) = F(y_0, y_1, dots.h, y_(n-1), t)
    )
  $
  יש לנו $n$ משוואות שכל משוואה בגודל $m$ וקל לבדוק שהתנאים הנדרשים מתקיימים, נראה זאת
  + *כיוון ראשון ($I arrow I I$):* נניח ש־$x(t)$ הוא פתרון של המערכת המקורית $I$. \
    נגדיר וקטור $y(t)$ על ידי הרכיבים $y_i (t) = x^((i)) (t)$ לכל $0 <= i <= n-1$. נוכיח ש־$y(t)$ מקיים את מערכת $I I$:
    + לכל $0 <= i <= n-2$, מתקיים מההגדרה ש־$y_i^prime (t) = (x^((i)) (t))^prime = x^((i+1)) (t) = y_(i+1) (t)$. אלו הן $n-1$ המשוואות הראשונות במערכת החדשה
    + עבור הרכיב האחרון, מתקיים $y_(n-1)^prime (t) = (x^((n-1)) (t))^prime = x^((n)) (t)$. מכיוון ש־$x(t)$ הוא פתרון של המערכת המקורית $I$, נציב את הביטוי שלו ונקבל
      $ y_(n-1)^prime (t) = F(x, x^prime, dots.h, x^((n-1)), t) = F(y_0, y_1, dots.h, y_(n-1), t) $
    לכן, הוקטור $y(t)$ שנבנה פותר את המערכת החדשה $I I$.

  + *כיוון שני ($I I arrow I$):* נניח ש־$y(t) = (y_0, y_1, dots.h, y_(n-1))$ הוא פתרון של המערכת החדשה $I I$. \
    נגדיר פונקציה $x(t) = y_0 (t)$ ונוכיח שהיא פותרת את המערכת המקורית $I$:
    + מהמשוואה הראשונה של המערכת $I I$ נובע ש־$y_0^prime = y_1$, ולכן $x^prime = y_1$
    + מהמשוואה השנייה נובע ש־$y_1^prime = y_2$, ולכן בגזירה חוזרת נקבל $x^((2)) = (y_1)^prime = y_2$
    + באופן אינדוקטיבי, לכל $0 <= i <= n-1$ מתקיים ש־$x^((i)) (t) = y_i (t)$
    + כעת נביט במשוואה האחרונה במערכת $I I$: $y_(n-1)^prime (t) = F(y_0, y_1, dots.h, y_(n-1), t)$ \
      מצד שמאל, $y_(n-1)^prime = (x^((n-1)))^prime = x^((n))$. מצד ימין, נציב את הקשרים שמצאנו ($y_i = x^((i))$) ונקבל בדיוק
      $ x^((n)) (t) = F(x, x^prime, dots.h, x^((n-1)), t) $
    משמע ש־$x(t)$ הוא פתרון למערכת המקורית $I$.
]

בתרגיל הבית נראה באופן דומה שאפשר לכל מערכת לא אוטונומית לבנות מערכת שקולה שכן אוטונומית ולכן מעתה נעסוק במערכות של משוואות דיפרנציאליות רגילות אוטונומיות מסדר 1.\
טבעי לשאול מהם התנאים שמבטיחים קיום פתרון למשוואות דיפרנציאליות.

#theorem[משפט הקיום של פיאנו][
  תהיי $U subset.eq RR^n$ פתוחה, $F:U arrow RR^n$ רציפה ו־$tilde(x_0) in U$ נקודת התחלה.\
  אז יש $delta > 0$ ופונקציה גזירה $x:(-delta, delta) arrow U$ שפותרת את בעיית ההתחלה
  $ cases(x(0)= tilde(x_0), x^prime (t) = F(x(t))) $
]<peano_existence_theorem>

#remark[
  תנאי המשפט לא מבטיחים יחידות.
]

#proof[
  יהי $r>0$ כך ש־$B colon.eq closure(B(tilde(x_0), r)) subset.eq U$ ונסמן $ M = norm(F|_B)_infinity = sup_(x in B) abs(F(x)) $
  נגדיר $delta = frac(r, M)$ ואת סדרת הפונקציות $x_n : [-delta, delta] arrow U$ על־ידי
  + $x_0 (t)$ תהיה הפונקציה הקבועה $x_0 (t) = tilde(x_0)$ לכל $t in [-delta,delta]$
  + $x_1 (t)$ מוגדרת על־ידי $x_1 (t) = x_0 + t F(tilde(x_0))$
  + $
      x_2 (t) = mycases(
        tilde(x_0) + t F(tilde(x_0)), t in [-frac(delta, 2), frac(delta, 2)],
        x_2 (frac(delta, 2)) + (t-frac(delta, 2)F(x_2 (frac(delta, 2)))
        ), t in [frac(delta, 2), delta],
        x_2 (-frac(delta, 2)) + (t+frac(delta, 2)F(x_2 (-frac(delta, 2)))), t in [-delta, -frac(delta, 2)]
      )
    $
    (זה נראה קצת מסובך אבל בעצם מה שעשינו פה זה שבנינו ישר לינארי)
  + באופן כללי נקבל עבור $1<=j<=k-1$
    $
      x_k (t) = mycases(
        tilde(x_0) + t F(tilde(x_0)), t in [-frac(delta, k), frac(delta, k)],
        x_k (frac(j delta, k))+(t-frac(j delta, k))F(x_k (frac(j delta, k))), t in [frac(j delta, k), frac((j+1)delta, k)],
        x_k (-frac(j delta, k))+(t+frac(j delta, k))F(x_k (-frac(j delta, k))), t in [-frac((j+1) delta, k), -frac(j delta, k)],
      )
    $
  (מספיק לבנייה במבחן כמובן $1$ ו־$4$).\
  נשים לב ש־$x_k (t)$ לינארית למקוטעין ב־$t$ ולכן גזירה פרט למספר סופי של נקודות ותמונתה נמצאת בכדור $B$, כלומר $im (x_k) in B$ לכל $0<delta<t$ ומתקיים
  $
    norm(x_k (t) - tilde(x_0)) &= norm(integral_0^t x_k^prime (s) dif s) \
    &<=_triangle integral_0^delta norm(x_k^prime (s)) dif s \
    &= integral_0^frac(delta, k) norm(F(tilde(x_0))) dif s + sum_(j=1)^(k-1) integral_frac(j delta, k)^frac((j+1) delta, k) norm(F(x_k (frac(j delta, k)))) dif s
  $
  באופן רקורסיבי ניתן להראות שלכל $j$ מתקיים $x_k (frac(j delta, k)) in B$ ולכן $norm(F(x_k (frac(j delta, k)))) <= M$ ונקבל לבסוף
  $
    norm(x_k (t) - tilde(x_0)) & <= integral_0^frac(delta, k) norm(F(tilde(x_0))) dif s + sum_(j=1)^(k-1) integral_frac(j delta, k)^frac((j+1) delta, k) norm(F(x_k (frac(j delta, k)))) dif s \
    &<= M dot.op frac(delta, k) + sum_(j=1)^(k-1) M(frac((j+1) delta, k)-frac(j delta, k)) \
    &<= M dot.op delta \
    & = r
  $

  #end_of_lecture("2 – 24/03")
  באופן זהה נקבל גם עבור $-delta<t<0$ ולכן הסדרה ${x_k}_(k=1)^infinity$ חסומה במידה שווה (שכן כולן בתוך $B$) והן רציפות במידה אחידה שכן לכל $k$ מתקיים
  $ norm(x_k (t) - x_k (s)) <=M abs(t-s) $
  אז הסדרה רציפה במידה אחידה ולכן ממשפט ארצלה אסקולי יש לסדרה תת־סדרה $(x_k_j)_(j=1)^infinity$ מתכנסת במידה שווה לגבול $x$ ולשם הפשטות נקרא לתת־סדרה זו $(x_k)_(k=1)^infinity$ במקום $(x_k_j)_(j=1)^infinity$.\
  נרצה להראות ש־$x$ גזירה ומקיימת $x^prime (t) = F(x(t))$ ומכך ש־$F$ רציפה מהמשפט היסודי מספיק להראות
  $ x(t) = tilde(x_0) + integral_0^t F(x(s)) dif s $
  ואכן, לכל $k$ נגדיר את $x_k : [-delta, delta] arrow U$ ולכל $1<=j<k$ על־ידי
  $
    Y_k (s) = mycases(
      tilde(x_0), s in [-frac(delta, k), frac(delta, k)],
      x_k (frac(j delta, k)), s in [frac(delta j, k), frac((j+1)delta, k)],
      x_k (-frac(j delta, k)), s in [-frac((j+1)delta, k), - frac(j delta, k)]
    )
  $
  אז לכל $k$ מתקיים $x_k (t) = tilde(x_0) + integral_0^t F(Y_k (s)) dif s$ ומתקיים
  $ norm(Y_k - x_k)_infinity <= frac(M delta, k) stretch(arrow)_(k arrow infinity) 0 $
  אז $(Y_k)$ מתכנסת במידה שווה לאורך אותה תת־סדרה ל־$x$.\
  יתר על־כן, $F compose Y_k arrow F compose x$ במידה שווה לאורך התת־סדרה שכן $F$ רציפה במידה שווה ב־$B$: כי אם $epsilon > 0$, קיימת $eta>0$ כך שלכל $p,q in B$ מתקיים $norm(p-q) < eta$ ומתקיים $norm(F(p)-F(q)) < epsilon$.\
  ניקח $L_0$ כך שלכל $ell>L_0$ ולכל $t in [-delta, delta]$ מתקיים $norm(Y_k_ell (t) - x(t))<eta$ כי ההתכנסות במידה שווה אבל אז לכל $ell > L_0$ מתקיים $norm(F(Y_k_ell (t)) - F(x(t)))<epsilon$ ומכך שרציפות במידה שווה מאפשרת להחליף סדר של גבול ואינטגרל
  $
    x(t) = lim_(ell arrow infinity) x_k_ell (t) = tilde(x_0) + lim_(ell arrow infinity) integral_0^t F(Y_k_ell (s)) dif s = tilde(x_0) + integral_0^t lim_(ell arrow infinity) F(Y_k_ell (s)) dif s = tilde(x_0) + integral_0^t F(x(s)) dif s
  $
]

#corollary[
  אם $U subset.eq RR^(n+1)$ קבוצה פתוחה ו־$F : U arrow RR$ רציפה אז לכל $(y_0, y_1, dots.h, y_(n-1), t_0) in U$ יש $delta>0$, $x:[t_0 - delta, t_0 + delta] arrow RR$ כך שמתקיים
  $
    cases(x(t_0) = y_0, x^prime (t_0) = y_1, dots.v, x^((n-1)) (t_0) = y_(n-1), x^((n)) (t) = F(x(t), x^prime (t), dots.h, x^((n-1)) (t), t))
  $
]

#proof[
  מכוון שכל משוואה לא אוטונומית מסדר $n$ ניתן להמיר למערכת משוואות אוטונומית מסדר $1$ ואז עם @equivalence_theorem_to_system_from_order_one נקבל את הנדרש.
]

לא ראינו בתנאים שניסחנו יחידות של הפתרון ואם הפתרון בתנאים האלו הוא בהכרח יחיד ואכן לא כך הדבר.
#example[
  $ x^prime (t) = 2 sqrt(abs(x(t))) ==> F(x) = 2 sqrt(abs(x)) $
  זו פונקציה $F:RR arrow RR$ ויש שני פתרונות $x=0$ ו־$x(t)=t^2$ ואלו שני פתרונות שלא מתלכדים על אף סביבה של $0$.
]

יחד עם זאת, ניתן למצוא תנאים ליחידות וזהו משפט פיקארד.
#theorem[משפט פיקארד][
  תהיי $U subset.eq RR^n$ פתוחה, $tilde(x_0) in RR$ ותהיי $F:U arrow RR^n$ שהיא ליפשיצית מקומית כלומר לכל $K subset.eq U$ קומפקטית יש קבוע $L_K$ כך ש־$F|_K$ ליפשיצית עם הקבוע $L_K$.\
  אזי יש $delta>0$ כך שקיים *פתרון יחיד* בקטע $[-delta, delta]$ לבעיה
  $ cases(x(0) = tilde(x_0), x^prime (t) = F(x(t))) $
]<picard_existence_theorem>

ישנן שתי הוכחות למשפט – אחד באמצעות משפט העתקה מכווצת שראינו בתרגול ואחת מההרצאה.\
#proof[יונתן בהרצאה][
  משפט פיקארד נובע מהלמה הבאה בעזרת משפט פיאנו.
  #lemma[
    תהיי $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ ליפשיצית מקומית.\
    נניח ש־$x(t)$ ו־$y(t)$ שני פתרונות של המשוואה $eta^prime (t) = F(eta(t))$ כך ש־$x$ מוגדר על הקטע הפתוח $I subset.eq RR$ ו־$y$ מוגדר על הקטע הפתוח $J subset.eq RR$.\
    אם $0 in I inter J$ ו־$x(0) = y(0)$ אזי $x(t)=y(t)$ לכל $t in I inter J$.
  ]

  #proof[
    נוכיח ש־$x(t)=y(t)$ לכל $t in I inter J inter [0,infinity)$. נניח שלא ככה ונגדיר $tau = inf{t in I inter J inter (0,infinity) bar x(t) != y(t)}$ ומרציפות $overline(x) = x(tau)=y(tau)$.\
    ניקח $r>0$ כך ש־$closure(B_(2r) (overline(x))) subset.eq$ וניקח $delta>0$ כך שיתקיים $[tau, tau+delta] subset.eq I inter J$ וגם $x(t), y(t) in closure(B_r (overline(x)))$ לכל $t in [tau, tau + delta]$.\
    נסמן ב־$L$ את קבוע ליפשיץ של $F|_closure(B_r (overline(x)))$, עבור $t in [tau, tau+delta]$ מתקיים
    $
      frac(dif, dif t) norm(x(t) - y(t))^2 & = 2(x(t)-y(t), x^prime (t) - y^prime (t)) \
                                           & = 2(x(t)-y(t), F(x(t))-F(Y(t))) \
                                           & <=_((star)) 2norm(x(t)-y(t)) dot.op norm(F(x(t))-F(Y(t))) \
                                           & <=_((star star)) 2 L dot.op norm(x(t)-y(t))^2
    $
    כאשר $(star)$ זה אי־שיוויון קושי־שוורץ ו־$(star star)$ זה מהליפשיציות.\
    אז הפונקציה $f(t) = e^(-2 L t) norm(x(t)-y(t))^2$ היא מונוטונית יורדת כי מגזירה
    $
      frac(dif, dif t) f = -2L f(t) + 2 L f(t) = 0
    $
    הנגזרת לא חיובית ולכן היא מונוטונית יורדת ובנוסף $f(t)$ אי־שלילית ב־$[tau, tau++delta]$ אבל $f(tau)=0$ ולכן $f(t) =0$ לכל $t in [tau, tau + delta]$ ולכן $norm(x(t)-y(t))=0$ וזו סתירה להגדרת $tau$ בתור אינפימום.\
    עבור $t$־ײם שליליים ההוכחה דומה עם $sup$ ופונקציה קצת אחרת או להסתכל על $tilde(x)(t)=x(-t)$ ומהמשוואה $eta^prime (t) = -F(eta(t))$.
  ]
]

#end_of_lecture("3 – 13/04")

== תלות בתנאי ההתחלה
#definition("הפיתרון המקסימלי")[
  נניח ש־$U subset.eq RR^n$ פתוחה ו־$F : U arrow RR$ ליפשיץ מקומית, נגדיר
  $ J_p^* colon.eq {t in RR bar "Exists solution for the problem" (star) "on a segment that contains" t} $
  ו־$J_p^*$ היינו קטע (כי אם $t$ נמצא בו ו־$0$ נמצא בו אז כל נקודה בין $0$ ל־$t$ נמצא בו כי זה מכיל את הקטע).\
  הפיתרון שמוגדר על $J_p^*$ הוא יחיד (מהלמה שהוכחנו) ופיתרון זה נקרא *הפיתרון המקסימלי לבעיית ההתחלה*.\
]

#theorem("טריכוטומיה של זרימות של שדה ליפשיץ מקומי")[
  תהיי $U in RR^n$ פתוחה, תהיי $p in U$ ו־$F: U arrow RR^n$ ליפשיץ מקומית.\
  נסמן $X:J_p^* arrow U$ הפיתרון המקסימלי לבעיית ההתחלה
  $ cases(x'(t) = F(x(t)), x(0)=p) $
  אזי עבור $T in boundary(J_p^*) without {plus.minus infinity}$ מתקיים אחד משני המקרים הבאים
  + $display(liminf_( t arrow T) dist(x(t), boundary(U))=0)$
  + $display(limsup_(t arrow T) norm(x(t))=infinity)$
]

#proof[
  נניח ש־$sup J_p^* = T < infinity, space liminf_(t arrow T) dist(x(t), boundary(U))>0$ וש־$limsup_(t arrow T) norm(x(t))<infinity$.\
  כלומר, הקבוצה (התמונה של המסילה) $x([0,T))$ חסומה ומוכלת בקבוצה הסגורה $ A_(epsilon_0) colon.eq {x bar dist(x, boundary(U) >= epsilon_0/2)} $ לאיזשהו $epsilon_0 > 0$.\
  ניקח סדרה $0<t_k < T$ כך ש־$t_k stretch(arrow)_(k arrow infinity) T$ ונבחין ש־$x_(t_k)$ כולם שייכים לקבוצה $A_(epsilon_0)$ וגם לקבוצה החסומה $x([0, T))$.\
  נפעיל את (ההוכחה של) משפט פיאנו  עם $x_(t_k)$ כנקודת התחלה עם אותו $0<delta$ לכולם שכן $delta$ תלוי ברדיוס בכדור שניתן לקחת סביב $x_(t_k)$ ובחסם על $norm(F bar_B)$ אבל את הרדיוס והחסם על הנורמה ניתן לבחור באופן אחיד (כי $F$ רציפה ולכן חסומה וזה חוסם את כל הנקודות).\
  יהי $K$ כך ש־$T<t_K + delta$ ונקבל סתירה לכך ש־$T=sup J_p^*$ כי ממשפט פיאנו הפיתרון מוגדר מעבר ל־$T$.\
  משיקולי סימטריה ההוכחה למקרה השני זהה.
]

#proposition[בתנאי המשפט, נניח שאנחנו יודעים שקיימת קבוצה קומפקטית $K subset.eq U$ ו־$T>0$ ($T<0$ עובד באופן דומה) כך שלכל $0<t<T$ מתקיים
  + אם $t in J_p^*$ אז $x_p (t) in K$ אזי $[0, T) subset.eq J_p^*$ #todo
]

#proof[
  אם $T > 0 sup J_p^*$ אז נסמן $T > tau = sup J_p^*$ ונקבל ש־$x([0, tau)) subset.eq K$ אבל אז לא קרה אף אחד מהדברים (לא התפוצצנו ולא נגענו בשפה) בסתירה לכך \
  ש־$tau < T != infinity$.
]

#definition[
  נגדיר
  $ Omega colon.eq {(p, t) bar p in U, t in J_p^*} subset.eq RR^(n+1) $
  לכל $(p,t) in Omega$ נגדיר את $Phi(p, t)=x_p (t) = phi_t (p)$ היכן ש־$x_p (t)$ פיתרון ל־$x'_p (t) = F(x_p (t))$ ו־$x_p (0) = p$.
]

#theorem[
  הקבוצה $Omega$ היא קבוצה פתוחה וההעתקה $Phi : Omega arrow U$ היא רציפה ($F$ כמובן ליפשיץ מקומית).
]

#proof[
  תהיי $(p, t_0) in Omega$, נרצה להראות ש־$Omega$ מכילה סביבה של $(p, t_0)$ וש־$Phi$ רציפה שם.\
  ניקח $t_0 >= 0$ (לשלילי אותו הדבר אבל אנחנו אנשים חיוביים) ותהיי $ C colon.eq {Phi(p, t) bar 0<=t<=t_0} subset.eq U $
  זאת קבוצה סגורה וחסומה ולכן קומפקטית יש לה מרחק חיובי מהשפה (כלומר, קיים $r>0$ כך ש־$0<4r<dist(C, boundary(U))$).\
  נסמן
  $
    M colon.eq sup{norm(F(x)) bar dist(x, C) <= 4r} \
    L colon.eq Lip F|_(dist(x, C)<=4r)
  $
  #lemma[תהיי $q in U$ כך ש־$norm(q-p)<=r e^(-L t_0)$ אזי לכל $0<=t<=t_0$ כך ש־$(q, t) in Omega$ מתקיים
    $ norm(Phi(p, t) - Phi(q, t))<=2e^(L t)norm(p-q)<=2r $
  ]
  #proof[
    נסמן $x_p (t), x_q (t)$ להיות הפתרונות המתאימים.\
    נניח שקיים $0<=t <=t_0$ כך ש־$(q,t) in Omega$ אבל $norm(x_p (t) - x_q (t))>=2e^(L t) norm(p-q)$.\
    ברור כי $q!=p$ ונסמן $ tau colon.eq inf{t in [0, t_0] bar (q, t) in Omega, space norm(x_p (t) - x_q (t))>=2e^(L t) norm(p-q)} $
    אז $0<tau<=t_0$ (מהרציפות), $(q, tau) in Omega$ וכן $norm(x_p (tau)-x_q (tau))=2e^(L tau) norm(p-q)$.\
    יתרה מזאת, לכל $t in [0,tau]$
    $ norm(x_p (t) - x_q (t))<=2e^(L t)norm(p-q)<=2r $
    לכן $x_p (t), x_q (t)$ לכל $t in [0, tau]$ מוכל בקבוצה $ {x in RR^n bar dist(x, C)<=2r} $
    ולכן $F$ ליפשיץ שם עם קבוע $L$ ובפרט לכל $t in [0, tau]$ $ norm(F(x_p (t))-F(x_q (t)))<=L norm(x_p (t) - x_q (t)) $
    ומכאן
    $ dif/(dif t) norm(x_p (t) - x_q (t))=2L norm(x_p (t) - x_q (t))^2 $
    ולכן הפונקציה $t mapsto e^(-2L t) norm(x_p (t) - x_q (t))^2$ מונוטונית יורדת בקטע $[0,tau]$ ומכאן נקבל
    $ 2 norm(p-q) <= e^(-L tau) norm(x_p (tau) - x_q (tau)) <= norm(p-q) $
    וזאת סתירה.
  ]
  #end_of_lecture("4 – 20/04")
]
#todo
כל מה שעובר פה הוא קצת חוזר על מה שהיה בהרצאה הקודמת אז תסדרי את זה...\
_תזכורת:_ $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ ליפשיץ מקומית כך שעבור $p in U$
$ cases(x'_p (t) = F(x_p (t)), x_p (0) = p) $
הגדרנו
$ Omega = {(p,t) bar t in J_p^*, space p in U} $
כאשר הגדרנו את $J_p^*$ תחום ההגדרה של הפיתרון המקסימלי ל־$F$.\
והגדרנו $Phi : Omega arrow U$ על־ידי $Phi(p, t) = x_p (t) = phi_t p)$ וראינו משפט שאומר ש־$Omega$ קבוצה פתוחה ו־$Phi$ העתקה רציפה.\
כלומר, לכל $(p, t_0)$ יש סביבה קטנה שמוכלת ב־$Omega$ ולכל $(q,t)$  בסביבה הזו מתקיים ש־$Phi(q, t)$ קרוב ל־$phi(p, t_0)$.

#proof[
  יהי $t_0 >=0$, נגדיר $C={Phi(p, t) bar 0<=t<=t_0}$ וקיים $r>0$ כך ש־$dist(C, boundary(U))>4r$ ולכן נגדיר קבוצה קומפקטית \
  $tilde(C) = {x in U bar dist(x, C) <= 4r}$ וניקח
  $ M = sup{norm(F(x)) bar x in tilde(C)} $
  ו־$L$ הקבוע ליפשיץ של $F$ על $tilde(C)$.
]

#lemma("תזכורת")[תהיי $q in U$ כך ש־$norm(q-p)<=r e^(-L t_0)$ אזי לכל $0<=t<=t_0$ כך ש־$(q, t) in Omega$ מתקיים
  $ norm(Phi(p, t) - Phi(q, t))<=2e^(L t)norm(p-q)<=2r $
]

#lemma[
  תהיי $q$ כזו ש־$norm(p-q)<=r e^(-L t_0)$, אם $(q,t) in Omega$ ו־$0<=t<=t_0+r/M$ אזי $Phi(q, t) in tilde(C)$.
]

#proof[
  בשלילה נניח שיש $0<=t<=t_0 + r/M$ כך ש־$(q,t) in Omega$ אבל $dist(Phi(q, t), C)>4r$ ומהלמה הקודמת ל־$0<=t<=t_0$ מתקיים $dist(Phi(q, t), C)<=2r$ ולכן עבור $t$ כזה מהנחת השלילה בהכרח מתקיים $t_0 < r$ ובפרט $(q, t_0) in Omega$.\
  נסמן $tau = inf{t_0 <= t<= t_0 + r/M bar (q, t) in Omega, space dist(q, C)>4r}$.\
  אבל $t_0 <= tau <= t_0 + r/M$ ו־$dist(Phi(q, tau), C) = 4r$ ויתר על־כן לכל $t_0 <= t<=tau$ מתקיים $dist((q,t), C)<=4r$ ובפרט לכל $0<=t<=tau$ מתקיים $norm(F(Phi((q,t))))<=M$ ונשים לב $ dist(Phi(q, tau), C)<=norm(Phi(q, tau) - Phi(q, t_0))+dist(Phi(q, t_0), C)<=M dot.op (tau - t_0) + 2r <= M dot.op r/M + 2r = 3r $
  וזאת כמובן סתירה.
  #remark[ $(q,t) in Omega <==> t in J_q^*$]
]

#lemma[
  נניח ש־$norm(p-q)<=r e^(-L t_0)$ ו־$0<=t<=t_0+r/M$ אזי $(q,t) in Omega$ ומתקיים
  $ norm(Phi(q, t_0)-Phi(q, t))<=2e^(L t_0)norm(p-q)+M norm(t_0 - t) $
  הלמה הזאת מסיימת את ההוכחה עבור $t_0 >=0$.\
  ראשית ברור מכאן ש־$Omega$ פתוחה וכן ש־$Phi$ רציפה עבור $t_0 > 0$ ובמקרה $t_0 = 0$ מקבלים סביבה ימנית ב־$t$ והרציפות היא רציפות מימין ב־$t$.\
  ומהוכחה דומה עבור $t_0 <= 0$ נקבל רציפות משמאל וזה מסיים את ההוכחה.
]

#proof[
  הראינו שבתנאים הנתונים לכל $t$ שעבורו $(q,t) in Omega$ מתקיים $dist(Phi(q, t), C)<=4r$ ולכן לכל $0<=t<=t_0 + r/M$ כזה, $(q,t) in Omega$ כי אחרת היה $0<=t_0 <= t_0 + r/M$ שעבורו הפתרון מגיע לשפה של $U$ או מתפוצץ אבל זה לא ייתכן.\
  כעת, כדי לקבל את האי־שיוויון נכתוב
  $
    norm(Phi(p, t_0)-Phi(q, t))<= norm(Phi(p, t_0)-Phi(q, t_0))+norm(Phi(q, t_0)-Phi(q, t)) <= underbrace(2e^(L t_0) norm(p-q), "Lemma 1") + underbrace(M abs(t-t_0), Phi(q, t) in tilde(C))
  $
]

נשים לב
$ x'_p (t) = (partial Phi(, p, t))/(partial t) = F compose Phi(p, t) = F(x_p (t)) $
מה לגבי הגזירה של $Phi$ לפי מיקום? \
*אם* $Phi$ גזירה לפי המיקום (נסמן את הנגזרת ב־$D Phi$), בזמן $0$ היא הזהות על כל $U$ ולכן $Phi$ אכן גזירה ומתקיים $D Phi (p, 0) = Id$ ולכן
$ partial/(partial t) D Phi = D(partial/(partial t) Phi) = D(F compose Phi)=D F(Phi(p, t))D Phi(p, t) $
אז אם $F$ לא גזירה אין על מה לדבר!

#theorem[
  תהיי $U subset.eq RR^n$ פתוחה ו־$p in U$ עם $F:U arrow RR^n$ גזירה ברציפות ובפרט ליפשיץ מקומית.\
  יהי $x_p$ הפיתרון המקסימלי לבעיית התחחלה $cases(x'(t)=F(x(t)), x(0)=p)$ ויהי $M(t)$ הפיתרון המקסימלי לבעיית ההתחלה $cases(M'(t)=D F(x(t))M(t), M(0) = Id)$.\
  אזי לכל $T in I_p^*$, $phi_T$ גזירה ב־$p$ והדיפרנציאל שלה נתון על־ידי $D phi_T (p) = M(t)$.
]

#remark[יהי $I subset.eq RR$ קטע פתוח שמכיל את $0$ ותהיי $A : I arrow RR^(n times n)$ פונקציה רציפה (למרחב המטריצות) אזי לבעיית ההתחלה $cases(M'(t)=A(t)M(t), M(0)=Id)$
  קיים פיתרון על כל הקטע $I$ (ראינו/נראה את זה בתרגיל עד־כדי המעבר מוקטור למטריצה שאת זה עושים בקלות כי המטריצה היא אוסף של $n$ וקטורי עמודות).
]

#proof[
  צריך להראות שאם אנחנו מסתכלים על
  $ phi_T (q) = phi_T (p) + M(t)(q-p)+o(norm(q-p)) $
  נסמן $x_q (t) = phi_t (q), x_p (t) = phi_t (p)$ ונסמן $u(t)=x_q (t) - x_p (t) - M_t (q-p)$.\
  יהי $epsilon > 0$, צריך להראות שקיים $delta>0$ כך שלכל $q$ עם $0<norm(q-p)<delta$ מתקיים $norm(u(t))<epsilon norm(q-p)$.\
  נגדיר $ K colon.eq sup_(t in [0,T]) normop(M(t)) wide L colon.eq sup_(t in [0,T]) normop(D F(x_p (t))) $
  ונבחר $eta>0$ כך ש־$eta dot.op K dot.op t dot.op e^((L+eta)T)<epsilon$.\
  $D F$ רציפה ולכן יש $r>0$ כך שלכל $0<=t<=T$ ולכל $z in B_r (x_p (t))$ מתקיים $normop(D F(z)-D F(x_p (t)))<eta$ ולכן עבור $z$ כאלה $ norm(F(z)-F(x_p (t))-D F(x_p (t))(z-x_p (t)))<eta norm(z-x_p (t)) $
  הסבר: עד היום תמיד הסכמנו שאם $normop(D G) < M$ אז $norm(G(z)-G(w))<=M norm(z-w)$ על המסלול בין $z$ ל־$w$ (טריק אינטגרציה).\
  אז עבור $t, p$ נתונים נגדיר $G(z)=F(z)-D F (x_p (t)) z$ ומכללי גזירה
  $ D G(z)= D F (z)-D F(x_p (t)) $
  ולכן
  $ norm(D G(z)) = norm(D F (z) - D F (x_p (t)))<eta $
  ולכן
  $ norm(G(z)-G(x_p (t)))<eta norm(z-x_p (t)) $
  אז אם נציב
  $ norm(F(z)-D F (x_p (t)) z - F(x_p (t))+D F(x_p (t))x_p (t))=norm(F(z)-F(x_p (t))-D F(x_p (t))(z-x_p (t))) $
  מרציפות בתנאי ההתחלה קיים $delta>0$ כך שלכל $q$ עם $norm(p-q)<delta$ ולכל $0<=t<=T$ מתקיים $norm(x_p (t) - x_q (t))<r$ ולכן מצאנו $delta$.\
]

#end_of_lecture("5 – 27/04")

#theorem[$U subset.eq RR^n$ פתוחה, $p in U$ ו־$F : U arrow RR^n$ גזירה ברציפות.\
  אז לכל $T in J_p^*$, $phi_T (dot.op) space$ גזירה ב־$p$ והדיפרנציאל שלה מקיים $D phi_T (p) = M(t)$ היכן ש־$M$ מקיימת
  $ M'(t)=D F(x_p (t))M(t), space M(0)= Id $
]

#proof[
  נניח ש־$T>0$ (כי אם $T=0$ אז זו הזהות ולכן גזירה ועבור $T<0$ זה תהליך דומה) ולכל $q in U$ נגדיר
  $ u(t) = x_q (t) - x_p (t) - M(t)(q-p) $
  צריך להוכיח שלכל $epsilon > 0$ קיים $delta>0$ כך שאם $norm(q-p)<delta$ אז $norm(u(T))<=epsilon norm(q-p)$.\
  יהי $epsilon > 0$ ונסמן $L = sup_(t in [0,T]) norm(D F(x_p (t))), space K = sup_(t in [0,T]) norm(M(t))$ וקיימת $eta>0$ כך שמתקיים $eta K T e^(T(L + eta)) < epsilon$.\
  קיים $r>0$ כך שלכל $t in [0,T]$ ולכל $z$ כך ש־$norm(z-x_p (t))<r$ מתקיים
  $ norm(F(z)-F(x_p (t))- D F(x_p (t))(z-x_p (t)))<eta norm(z-x_p (t)) $
  מרציפות הזרימה בתנאי ההתחלה (מה שאמרנו ש־$Phi(p, t)=x_p (t)$ רציפה במשפט הקודם) קיים $delta>0$ כך שאם $norm(q-p)<delta$ אז \
  $norm(x_q (t) - x_p (t))<r$ לכל $t in [0,T]$.\
  צריך להעריך את $u(T)$: אם $norm(u(T))=0$ סיימנו, אחרת נסמן $tau = sup {0<=t<=T bar u(t)=0}$ וכמובן $u(tau)=0$ והוא הזמן האחרון שבו $u$ מקבלת את הערך אפס ו־$0<=tau < T$ והיא כמובן לא קבוצה ריקה אז על הקטע $(tau, T]$, הפונקציה $norm(u(t))=sqrt(chevron.l u(t) comma u(t) chevron.r)$ מקיימת
  $ dif/(dif t) norm(u(t)) = (chevron.l u(t), u'(t) chevron.r)/norm(u(t)) <=_"אי־שיוויון קושי־שוורץ" norm(u'(t)) $
  נחשב
  $
    u'(t) = x'_q (t) - x'_p (t) - M'(t)(q-p) = F(x_q (t))-F(x_p (t))-D F(x_p (t)) M(t)(q-p) \
    = F(x_q (t)) - F(x_p (t))- D F(x_p (t))(x_q (t)- x_p (t))+D F(x_p (t))u(t)
  $
  נשים לב שממה שמצאנו לעיל והבחירה שלנו של $q$
  $ norm(F(x_q (t)) - F(x_p (t))-D F(x_q (t) - x_p (t)))< eta norm(x_q (t) - x_p (t)) $
  אז
  $
    norm(u'(t))<= eta norm(x_q (t) - x_p (t))+ L norm(u(t)) = eta norm(u(t)+M(t)(q-p))+L norm(u(t)) \
    <=_"אי-שיוויון המשולש" (eta+L) norm(u(t))+eta norm(M(t))(q-p) <= eta K norm(q-p)+(L + eta)norm(u(t))
  $
  בפרט
  $ (star) space dif/(dif t) norm(u(t))<=eta K norm(q-p)+(L + eta)norm(u(t)) $
  מאותו טריק של מרוכבות על נגזרת של אקספוננט
  $
    dif/(dif t) (e^(-t(L+eta)) norm(u(t)))= e^(-t(L+eta))(-(L+eta)norm(u(t))+dif/(dif t) norm(u(t))) <=_((star)) eta K underbrace(e^(-t(L+eta)), <= 1))norm(q-p) <= eta K norm(q-p)
  $
  אבל האחרון זה נגזרת של פונקציה לינארית $dif/(dif t) (eta K norm(q-p)t)$.\
  ולכן הפונקציה $e^(-t(L+eta))norm(u(t))-eta K t norm(q-p)$ היא מונוטונית יורדת באינטרוול $(tau, T]$ כי הנגזרת קטנה מאפס (מהצבה) ונקבל $ e^(T (L+eta))norm(u(T))-eta K T norm(q-p)<=e^(-tau(L+eta))underbrace(norm(u(tau)), =0)-eta K tau norm(q-p) = -eta K tau norm(q-p)<=0 $
  ובסך־הכל
  $ norm(u(T)) <= e^(T(L+eta)) eta K T norm(q-p) < epsilon norm(q-p) $
]

#end_of_lecture("6 – 28/04")

== משוואות לינאריות עם מקדמים קבועים
נניח ש־$I subset.eq RR$ קטע וש־$A : I arrow RR^(n times n), g:I arrow RR^n$ רציפות. אזי
$ cases((star) space x^prime (t) = A(t) x(t) + g(t), x(0)=x_0) $
בתרגיל בית הראינו שהפתרון המקסימלי מוגדר על כל $I$.

#theorem[
  מרחב הפתרונות המקסימלי למשואוה $(star)$ עם $g(t)=0$ לכל $t$ (ללא תנאי התחלה) הוא מרחב לינארי ממימד $n$.
]

#remark[
  קבוצת הפתרונות ל־$(star)$ כאשר $g=0$ סגורה לחיבור וכפל בסקלר שכן אם $x,y$ פתרונות ו־$alpha, beta in RR$ נסתכל על
  $ (alpha x + beta y)^prime = alpha x^prime + beta y^prime = alpha A(t)x(t) + beta A(t) y(t) = A(t)(alpha x + beta y) $
  שכן $x,y$ פתרונות וזאת הוכחה עבור מימד $2$ ושאר ההוכחה באינדוקציה על $n$ ולכן $alpha x + beta y$ פתרון.
]

#proof[

]

#end_of_lecture("7 – 04/05")
תשלימי...

#end_of_lecture("8 – 05/05")
תשלימי...

נניח שאנחנו יודעים לפתור את המשוואה
$ (star) space x^prime (t) = A(t) x(t) $
ויש לנו את המשוואה הלא הומגנית
$ (star star) space x^prime(t) = A(t) x(t) + g(t) $
כאשר $A(t)$ היא $n times n$.\
יהיו ${x_1 (t), x_2 (t), dots.h, space x_n (t)}$ בסיס למרחב הפתרונות של $(star)$.\
הרעיון הוא לכתוב פיתרון כללי למשוואה לא הומוגנית $(star star)$ וצריך להראות שלכל $x_i (t)$ עם מתקדמים שמשתנים בזמן. כלומר, נכתוב את $y$ פיתרון ל־$(star star)$ כ־$y(t) = sum_(j=1)^n alpha_j (t) x_j (t)$.\
נסמן ב־$pi(t)$ את המטריצה שעמודותיה הן $x_1 (t), x_2 (t), dots.h, x_n (t)$ והיא נקראית לרוב *המטריצה היסודית / מטריצת פתרונות יסודית*.\
נשים לב ש־$sum_(j=1)^n alpha_j (t) x_j (t) = pi(t) alpha(t)$ כאשר $alpha(t) = vec(alpha_1 (t), dots.v, alpha_n (t))$.\
אם $y(t) = pi(t) alpha(t)$ פותר את $(star star)$ אז $y(0)=pi(0)alpha(0)$ אז $y(t)$ מקיים
$ y^prime (t) = A(t) y(t) + g(t) $
אבל גם
$ y^prime (t) = (pi(t) alpha(t))^prime = pi^prime (t) alpha(t) + pi(t) alpha^prime (t) $
אבל $pi^prime (t)$ מקיימת את המשוואה ההומוגנית ולכן
$ y^prime (t) = A(t) pi(t) alpha(t) + pi(t) alpha^prime (t) $
כלומר
$
  cancel(A(t) y(t)) + g(t) = y^prime (t) = A(t) underbrace(pi(t) alpha(t), = y(t)) + pi(t) alpha^prime (t) = cancel(A(t) y(t)) + pi(t) alpha^prime (t)
$
לכן קיבלנו שתנאי הכרחי על $alpha$ היינו
$ pi(t)alpha^prime (t) = g(t) ==> alpha^prime (t) pi(t)^(-1) g(t) $
ו־$pi$ הפיכה כי היא בסיס למרחב הפתרונות (זוהי מטריצה רגולרית).\
אם כך, מהמשפט היסודי $ alpha(t) = alpha(0) + integral_0^t pi(s)^(-1) g(s) dif s $
זה תנאי הכרחי, צריך לראות אם זה אכן פיתרון.

#theorem[
  יהיו $A : I arrow RR^(n times n)$ רציפה ו־$g: I arrow RR^n$ רציפה כאשר $I subset.eq RR$ קטע.\
  נסמן ב־$pi(t)$ את מטריצת הפתרונות היסודית למשוואה $x^prime (t) = A(t)x(t)$.\
  אזי פונקציה $y(t)=pi(t)(alpha(0)+integral_0^t pi(s)^(-1) g(s) dif s)$ פותרת את המשוואה $y^prime (t) = A(t)x(t)+g(t)$ עם תנאי ההתחלה $y(0)=pi(0)alpha(0)$.
]
#proof[
  נגזור
  $
    y^prime (t) & = [pi(t)(alpha(0) + integral_0^t pi(s)^(-1) g(s) dif s)]^prime \
                & = pi^(prime) (t) (alpha(0) + integral_0^t pi(s)^(-1) g(s) dif s) + pi(t) pi(t)^(-1)g(t) \
                & = A(t) pi(t) (alpha(0) + integral_0^t pi(s)^(-1) g(s) dif s) + g(t) \
                & = A(t) y(t) + g(t)
  $
]

אם $A$ פונקציה קבועה כלומר $A(t)=A$ ו־$x_i (0) = "e"_i$ (הבסיס הסטנדרטי ב־$0$) אז $pi(t) = e^(A t)$ ונקבל
$ y(t)= e^(t A) y_0 + integral_0^t e^((t -s)A) g(s) dif s $
זה נקרא *עיקרון דוהמל*.

== התנהגות לוקלית, התנהגות גלובלית ויציבות
לאורך פרק זה יש לנו $U subset.eq RR^n$ פתוחה ו־$F: U arrow RR^n$ גזירה ברציפות והסימון הרגיל של $Phi(p, t) = phi_t (p)=x_p (t)$ היא הנקודה בה נמצא הפיתרון של $x^prime = F(x)$ עם תנאי התחלה $p$ לאחר זמן $t$.

#theorem[
  תהיי $p in U$ ונניח ש־$F(p)!=0$.\
  אזי קיימות קבוצות פתוחות $p in U_0 subset.eq U_1 subset.eq U$, $V$ פתוחה ב־$RR^n$ כך ש־$0 in V subset.eq RR^n$ והעתקה חד־חד ערכית ועל, גזירה ברציפות ושגם ההופכית שלה היא גזירה ברציפות $alpha:U_1 arrow V$ ו־$delta>0$ כך ש־$alpha(p)=0$ ולכל $x in U_0$ ו־$t in (-delta, delta)$ מתקיים
  $phi_t (x) in U_1$ ו־$alpha(phi_t (x))=alpha(x)+(t, 0, dots.h, 0)$.
]

#proof[
  בלי הגבלת הכלליות נניח ש־$p=0$ ונתבונן בנגזרות החלקיות של $Phi(t, x)$ בנקודה $p=0, t=0$
  $ (partial Phi)/(partial t) |_((0,0)) = F(0) != 0 wide (partial Phi)/(partial x_i) |_((0,0)) = "e"_i $
  היות ש־$F(0)!=0$ ניתן לבחור $n-1$ איברים מאיברי $("e"_1, dots.h, "e"_n)$ ונסמנם $"e"_(i_1), dots.h, "e"_(i_(n-1))$ כך ש־$(F(0), "e"_(i_1), dots.h, e_(i_(n-1)))$ זה בסיס.\
  נניח בלי הגבלת הכלליות ש־$(F(0), "e"_i, dots.h, "e"_(n-1))$ זה בסיס.\
  נגדיר העתקה $beta: RR^n"סביבת 0 ב־" arrow RR^n$ על־ידי $beta(t, x_1, dots.h, x_(n-1))=phi_t (x_1, x_2, dots.h, x_(n-1), 0)$.\
  ממשפט הפונקציה ההפוכה יש סביבה $p in U_1$ וסביבה $0 in V$ כך ש־$beta: V arrow U_1$ היא דיפאומורפיזם גזיר ברציפות ונגדיר $alpha=beta^(-1)$.\
  קיימת סביבה פתוחה $p in U_0 subset.eq U_1$ ו־$delta>0$ כך שלכל $x in U_0$ ו־$t in (-delta, delta)$ מתקיים $phi_t (x) in U_1$.\
  נשאר לבדוק: יהי $x in U_0$ אז יש $s, y_1, y_2, dots.h, y_(n-1)$ כך ש־$x=beta(s, y_1, dots.h, y_(n-1))$ לכומר $x=phi_s (y_1, dots.h, y_(n-1), 0)$ ואז עבור $abs(t)<delta$ מתקיים $phi_t (x) in U_1$ ולכן
  $
    alpha(phi_t (x)) & = alpha(phi_t (phi_s (y_1, dots.h, y_(n-1), 0))) \
                     & = alpha(phi_(t+s) (y_1, dots.h, y_(n-1), 0)) \
                     & = alpha(beta(t+s, y_1, dots.h, y_(n-1))) \
                     & = (s, y_1, dots.h, y_(n-1))+(t, 0, dots.h, 0) \
                     & = alpha(x) + (t, 0, dots.h, 0)
  $
]

#definition[נקודת שיווי משקל][
  הנקודה $p in U$ נקראת *נקודת שיווי משקל* (לפעמיים נקודת שבת) אם $F(p)=0$.\
]
#definition[נקודת שיווי משקל יציבה][
  נקודת שיווי משקל $p$ תקרא *נקודת שיווי משקל יציבה* אם לכל $epsilon > 0$ יש $delta>0$ כך שלכל $q in B_delta (p)$ ולכל $t>0$ מתקיים $phi_t (q) in B_epsilon (p)$.
]
#definition[נקודת שיווי משקל יציבה אסימפטוטית][
  נקודת שיווי משקל $p$ תקרא *נקודת שיווי משקל אסימפטוטית* אם $p$ יציבה וקיימת גם $eta>0$ כך שלכל $q in B_eta (p)$ מתקיים $display(lim_(t arrow infinity) phi_t (q) = p)$.
]
#theorem[הקריטריון הלינארי ליציבות אסימפטוטית][
  תהיי $p in U$ נקודת שיווי משקל של $F$ ונניח שלכל ערך עצמי של $D F(p)$ יש חלק ממשי שלילי. אזי $p$ יציבה אסימפטוטית.
]<linear-criterion-for-asymptotic-stability>
#lemma[
  תהיי $A in CC^(n times n)$ מטריצה עם קבוצת ערכים עצמיים $Lambda subset.eq CC$ ונניח ש־$max_(lambda in Lambda) re(lambda)<0$.\
  אזי לכל $0<alpha<min_(lambda in Lambda) abs(re(lambda))$ יש $C>0$ כך שלכל $t>=0$ מתקיים
  $ norm(exp(t A))_p <= C e^(-t alpha) $
  בפרט
  $ lim_(t arrow infinity) exp(t A)=0 $
]<lemma_before_linear_criterion_for_asymptotic_stability>
#proof[
  נניח ש־$J = P A P^(-1)$ צורת ז'ורדן של $A$.\
  נשים לב ש־$J + alpha I$ היא מטריצה בצורדת ז'ורדן שכל שלכל ערכייה העצמיים חלק ממשי שלילי.\
  לכן עבור $t>=0$ הערכים של $exp(t (J + alpha I))$ הם פולינומים ב־$t$ כפול אקספוננט עם מעריך שלילי ב־$t$ ולכן קיים $C^prime > 0$ כך שמתקיים $ sup_(t >=0) normop(exp(t(J + alpha I))) <= C^prime $
  לכן
  $
    normop(exp(t A)) & = normop(P exp(t J) P^(-1)) \
                     & <= normop(P) normop(P^(-1)) normop(exp(t J)) \
                     & = normop(P)normop(P^(-1))normop(exp(t J + t alpha I - t alpha I)) \
                     & = normop(P)normop(P^(-1))normop(exp(t(J + alpha I))) dot.op e^(-t alpha) <= C dot.op e^(-t alpha)
  $
]
#end_of_lecture("9 – 11/05")

#proof[@linear-criterion-for-asymptotic-stability, הקריטריון הלינארי ליציבות אסימפטוטית][
  כזכור לכל $t in I_p$, $phi_t (x)$ גזירה ב־$p$ ו־$D phi)t (p)$ מקיימת
  $
    (star) space dif/(dif t) [D phi_t (p)] = (D phi_t (p))^prime = D F (phi_t (p)) D phi_t (p) \
    D phi_0 (o) = id
  $
  כאשר קראנו ל־$D phi_t (p) = M$ בעבר.\
  אבל $p$ נקודת שיווי משקל כלומר $F(p)=0$ ולכן $phi_t (p) = p$ לכל $t$ ומכאן נובע ש־$(star)$ היא משוואה לינארית במקדמים קבועים ולכן $M^prime = D F (p) M$.\
  ולכן $ D phi_t (p) = exp(t D F (p)) $
  בפרט מ@lemma_before_linear_criterion_for_asymptotic_stability נובע ש־$normop(exp(t D F(p))) stretch(arrow)_(t arrow infinity) 0$ ולכן יש $T > 0$ שעבורו
  $ normop(exp(T D F(p)))< 1/4 $
  יהי $epsilon > 0$ וקיימת $delta > 0$ כך שלכל $q in B_delta (p)$ ולכן $t in [0,T]$ מתקיים $phi_t (q) in B_epsilon (p)$ (מתלות רציפה בתנאי ההתחלה).\
  בנוסף מהקירוב הלינארי
  $ phi_T (q) = phi_T (p) + D phi_T (p) (q-p) $
  ולכן על־ידי הקטנה של $delta$ אם צריך נוכל להניח שהמחובר $o(p-q)$ לא עולה על $1/4 normop(p-q)$.\
  כלמר
  $ normop(phi_T (q) - phi_T (p)) <= normop(q-p)/2 $
  בפרט $phi_T (q) in B_delta (p)$ שכן $phi_T (p) = p$ ושוב לכל $0<= t<=T$ מתקיים $phi_(T+t) (q) in B_epsilon (p)$ (שוב מהרציפות בתנאי ההתחלה).\
  באיטרציה
  $ normop(phi_(k T) (q) - p)<= 2^(-k) norm(q-p) $
  ולכן $t in [0,T]$ ולכל $k in NN$ מתקיים $phi_(k T + t) (q) in B_epsilon (p)$ כלומר לכל $t > 0$ $phi_t (q) in B_epsilon (p)$ וזו בידיוק ההגדרה של יציבות.\
  נשאר להראות יציבות אסימפטוטית: קיבלנו ש־$phi_(k T) (q) stretch(arrow)_(k arrow infinity) p$ לכל $q in B_delta (p)$.\
  שוב מאותה תלות רציפה בתנאי התחלה נקבל $lim_(t arrow infinity) phi_t (q) = p$ שכן לכל $epsilon^prime > 0$ יש $delta^prime > 0$ כך שאם $y in B_(delta^prime) (p)$ אז לכל $t in [0,T]$ נקבל $ normop(phi_t (y) - p)<epsilon^prime $
]

#definition[פונקציית ליאפונוב][
  יהי $p in B subset.eq U$ כדור.\
  נאמר ש־$L : B arrow RR$ גזירה ברציפות היא *פונקציית ליאפונוב* ל־$F$ בנקודה $p$ אם $chevron.l gradient L, F(x) chevron.r <= 0$ לכל $x in B$ ול־$L$ יש מינימום חזק / מינימום ממש ב־$p$ (כלומר $L(p) <= L(x)$ לכל $x in B$ עם שיוויון אם ורק אם $x=p$).\
  נאמר ש־$L$ היא *פונקציית ליאפונוב חזקה* אם היא פונקציית ליאפונוב ומתקיים בנוסף $chevron.l gradient L(x), F(x) chevron.r < 0$ לכל $x!=p$.
]
#theorem[משפט ליאפונוב][
  תהיי $p in U$ נקודת שיווי משקל של $F$. אם ל־$F$ יש פונקציית ליאפונוב ב־$p$ אז $p$ יציבה.\
  אם ל־$F$ יש פונקציית ליאפונוב חזקה ב־$p$ אז $p$ יציבה אסימפטוטית.
]
#end_of_lecture("10 – 12/05")

#proof[
  נוכיח ראשית שאם יש פונקציית ליאפונוב אז יש לנו יציבות.\
  יהי $r>0$ ו־$L in C^1 (B_r (x_0))$ פונקציית ליאפונוב.\
  נשיב לב שלכל $p in B_r (x_0)$ אם נסתכל על המסילה $x_p$ ונרכיב עליה את הפונקציה $L(x_p (t))$ היא פונקציה יורדת מהגדרת פונקציית ליאפונוב היא יורדת כל זמן שהיא מוגדרת מכלל השרשרת
  $ dif/(dif t) (L(x_p (t))) = (x^prime_p (t), gradient L(x_p (t)))=(F(x_p (t)), L(x_p (t)))<0 $
  יהי $r>epsilon>0$ ומתכונה $(2)$ של פונקציית ליאפונוב ($L(x_0) <= L(x)$) נקבל ש־$display(L(x_0) < min_(x in boundary(B_epsilon (x_0))) L(x))$.\
  לכן קיים $delta > 0$ כך ש־$display(max_(x in B_delta (x_0)) < min_(x in boundary(B_epsilon (x_0))) L(x))$.\
  כעת, אם $p in B_delta (x_0)$ מתקיים שאם יש $t>0$ שעבורו $x_p (t) in.not B_epsilon (x_0)$ אז קיים $t_star$ כך ש־$x_p (t_star) in boundary(B_epsilon (x_0))$ אבל אז $L(x_p (t_star)) > L(x_p (0)) = L(p)$ בסתירה למונוטוניות.\
  כעת נראה ליאפונוב חזקה גורר יציבות אסימפטוטית.\
  יהי $0<R<r$ ומכך שזו פונקציית ליאפונוב חזקה נובע שיש $eta>0$ כך שלכל $p in B_eta (x_0)$ כך ש־$x_p (t) in B_R (x_0)$ לכל $t>=0$.\
  נרצה להראות שלכל $p in B_eta (x_0)$ מתקיים ש־$x_p (t) arrow x_0$. נניח שלא ככה, כלומר יש $p in B_eta (x_0)$ ויש $epsilon > 0$ וסדרת זמנים $t_k arrow infinity$ כך ש־$d(x_p (t_k), x_0) >= epsilon$.\
  נסמן ב־$M = max_(x in B_R (x_0)) norm(F(x))$ ונסמן $C=max {chevron.l gradient L(x), F(x) chevron.r bar epsilon/2 <= norm(x-x_0)<=R}$ ונבחין ש־$0>C$ (מהאי־שיוויון החזק).\
  נשים לב שאם $norm(x_p (t) -x_0)>epsilon$ אז לכל $t<=s<=t+epsilon/(2M)$ מתקיים ש־$norm(x_p (s)-x_0)>=epsilon/2$ שכן
  $ norm(integral_t^s x^prime_p (u) dif u)<= M abs(s-t)<=epsilon/2 $
  כעת נניח על־ידי צמצום לתת־סדרה (אם צריך) ש־$epsilon/(2M) < abs(t_(k+1)-t_k)$ ונחשב את $L(x_p (t))$ עבור $t>0$
  $
    L(x_p (t)) & = L(p) + integral_0^t (L (x_p (s)))^prime dif s \
    & = L(p) + integral_0^t chevron.l gradient L(x_p (s)), F(x_p (s)) chevron.r dif s \
    &<= L(p) + sum_(k=1)^(n bar t_(n+1) <=t) integral_(t_k)^(t_(k+1)) chevron.l gradient L(x_p (s)), F(x_p (s)) chevron.r dif s \
    &<= L(p) + sum_(k=1)^(n bar t_(n+1) <=t) integral_(t_k)^(t_k + epsilon/(2M)) chevron.l gradient L(x_p (s)), F(x_p (s)) chevron.l dif s \
    &= L(p) + sum_(k=1)^(n bar t_(n+1) <=t) C dot.op epsilon/(2M) stretch(arrow)_(t arrow infinity) - infinity
  $
  אבל זאת סתירה כי $L$ חסומה ב־$closure(B_R (x_0))$ לכן לכל $p in B_eta (x_0)$ מתקיים $x_p (t) stretch(arrow)_(t arrow infinity) x_0$.
]

#example[
  נניח ש־$H:U arrow RR$ גזירה ברציפות (כרגיל $U$ פתוחה) ו־$J$ מטריצה אנטי־סימטרית ($J^t = - J$) ונגדיר $F= J gradient H$ אז $H$ פונקציית ליאפונוב (לא חזקה) עבור $F$ היכן ש־$x_0$ היא נקודת מינימום של $H$ (ברור שאם $x_0$ מינימום (חזקה) של $H$ אז $F(x_0) = 0$).\
  $H$ פונקציית ליאפונוב שכן
  $
    chevron.l F, gradient H chevron.r & = chevron.l J gradient H, gradient H chevron.r \
                                      & = chevron.l gradient H, J^t gradient H chevron.r \
                                      & = chevron.l J^t gradient H, gradient H chevron.r \
                                      & = - chevron.l J gradient H, gradient H chevron.r = 0
  $
  אם $x_0$ נקודת שיווי משקל יציבה, האם ייתכן ש־$x_0$ נקודת שיווי משקל יציבה אסימפטוטית? לא ייתכן דבר כזה.\
  כי $chevron.l F, gradient H chevron.r=0$ אומר ש־$H$ נשארת קבועה לאורך המסלולים (זה בעצם קווי גובה) למה? כי
  $ dif/(dif t) H(x_p (t)) = chevron.l gradient H, x^prime_p (t) chevron.r = chevron.l gradient H, F chevron.r = 0 $
]

#example[
  נסמן ב־$f$ את הכוח, אז החוק השני של ניוטון: $f = m a$ ומיריעות אנחנו יודעים שהפוטנציאל הוא $- gradient V = f = m a$.\
  נסמן את המיקום ב־$q$ והתנע זה $p=dif/(dif t) m q = m dif/(dif t) q$.\
  בהינתן $N$ גופים תלת מימדיים יש $3N$ קורדינאטות מיקומים ו־$3N$ קורדינאטות של תנעים $x=(q_1, dots.h, q_(3n), p_1, dots.h, p_(3n))$.\
  אז $ dif/(dif t) p_i = (-gradient V)_i = - (partial V)/(partial q_i) $
  אבל $ dif/(dif t) q_i = p_i / m = partial/(partial p_i) ((p_i^2)/(2m)) $
  נסכום
  $
    H = underbrace(sum_(i=1)^(3N) (p_i^2)/(2m), "אנרגיה קינטית") + underbrace(V(q_1, dots.h q_(3N)), "אנרגיה פוטנציאלית")
  $
  ולכן
  $ dif/(dif t) p_i = - (partial H)/(partial q_i), quad (dif q_i)/(dif t) = (partial H)/(partial p_i) $
  כלומר
  $
    dif/(dif t) vec(q_1, q_2, dots.v, q_(3N), p_1, p_2, dots.v, p_(3N)) = underbrace(mat(0, 3N I; - I_n, 0), 6N times 6N) vec((partial H)/(partial q_1), (partial H)/(partial q_2), dots.v, (partial H)/(partial q_(3N)), (partial H)/(partial p_1), dots.v, (partial H)/(partial p_(3N)))
  $
  המסקנה מהכתיבה הזו היא שתחת כוח משמר (שתלוי רק במיקום) נובע ש־$H$ קבועה לאורך המסילות – כלומר $H$ קבועה בזמן במערכת ו־$H$ נקראת האנרגיה של המערכת ו־$H$ נקראת המילטוניאן.
]

#theorem[הקריטריון הלינארי לאי־יציבות][
  תהיי $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ שדה גזיר ברציפות ו־$x_o in U$ נקודת שיווי משקל.\
  אם ל־$D F(x_0)$ יש ערך עצמי עם חלק ממשי חיובי אז $x_0$ לא יציבה.
]

#proof[
  נוכיח את המשפט תחת ההנחה שלכל הערכים העצמיים של $A colon.eq D F(x_0)$ יש חלק ממשי שאינו אפס כלומר אין ל־$A$ ערכים עצמיים עם חלק ממשי אפס.\
  נסמן $H_plus$ יהיה תת־המרחב של $RR^n$ הנפרש על־ידי הוקטורים העצמיים (המוכללים אם צריך) עם ערך עצמי שלו חלק ממשי גדול מאפס ו־$H_minus$ וכן הלאה עם ערך עצמי שלו חלק ממשי קטן מאפס ומההנחה $RR^n = H_plus plus.o H_minus$ ונסמן ב־$pi_plus.minus$ את ההטלות המתאימות לסכום הישר (ההנחה של המשפט אומר ש־$H_plus != {0}$).\
  #end_of_lecture("11 – 18/05")
  נניח ש־$x_0 = 0$ ונניח בשלילה ש־$0$ יציבה, כלומר: לכל לכל $epsilon > 0$ יש $delta>0$ כך שאם $p in B_delta (0)$ אז $x_p (t) in B_epsilon (0)$.\
  נגדיר את הפונקציה $g(x)=F(x)-A x$ כך שיתקיים
  $ x^prime (t) = F(x(t)) = A x(t) + g(x(t)) $
  לכן ניתן לכתוב את הפתרון למשוואה באופן הבא
  $ (star star) space x(t) = e^(t A) x(0) + integral_0^t e^((t-s)A) g(x(s)) dif s $
  להמשך ההוכחה אנחנו צריכים שתי למות
  #lemma[
    קיים $R>0$ כך שאם $x:[0,infinity) arrow B_R (0)$ פותרת את המשוואה $x^prime (t) = F(x(t))$ אז
    $
      x(t)=e^(t A) pi_minus (x(0)) + integral_0^t e^((t-s) A) pi_minus g(x(s)) dif s - integral_t^infinity e^((t-s)A) pi_plus + g(x(s)) dif s
    $
  ]<first-lemma-for-the-linear-criterion-for-instable>
  #proof[@first-lemma-for-the-linear-criterion-for-instable][
    נשים לב
    $ F(x) = F(0) + A(x+ o(norm(x))) $
    ולכן מכך ש־$F(0) = 0$
    $ g(x) =F(x) - A x = o(norm(x)) $
    בפרט, יש $R>0$ כך שלכל $x in RR$ מתקיים $norm(g(x))<=norm(x)$ ובנוסף
    $ pi_plus.minus e^(t A) = e^(t A) pi plus.minus $
    נכפול את $(star star)$ ב־$e^(t A)$ ונפעיל את $pi_plus$ ונקבל (כי $pi_plus$ זו העתקה לינארית וגם אינטגרל הוא לינארי)
    $
      (star star star) space e^(-t A) pi_plus x(t) = pi_plus (x(0)) + integral_0^t e^(-s A) pi_plus g(x(s)) dif s ==> pi_plus (x(0)) = - integral_0^infinity e^(-s A) pi_plus + g(x(s)) dif s
    $
    נרצה להראת את החץ מימין: קיים קבוע $C>0$ כך שאם $0<mu<min { abs(re(lambda)) bar A "ערך עצמי של" lambda}$ ואז
    $ normop(pi_plus.minus) <= C $
    אז לכל $t>0$
    $ norm(e^(t A) pi_minus x) <= C e^(- mu t) norm(x) $
    ולכל $t<0$
    $
      norm(e^(t A) pi_plus x) <= C e^(-mu abs(t)) norm(x)
    $
    לכן אם $x(t) in B_r (0)$ לכל $t<0$ נובע
    $ norm(e^(-t A) pi_plus (x(t)))<= C^2 e^(-pi t) R stretch(arrow)_(t arrow infinity) 0 $
    בנוסף לכל $s>0$
    $ norm(g(x(s)))<=norm(x(s)) $
    ולכן
    $ norm(e^(-s A) + pi_plus g(x(s)))<= C^2 e^(-s mu) R $
    וזה אינטגרבילי ב־$s$ ולכן ניתן ל־$t$ לשאוף לאינסוף ב־$(star star star)$ ונקבל
    $ pi_plus (x(0)) = - integral_0^infinity e^(-s A) pi_plus g(x(s)) dif s $
    נתבונן
    $ x(t)=e^(t A) x(0) + integral_0^t e^((t-s) A) g(x(s)) dif s $
    ונקבל
    $
      x(t) = e^(t A) pi_plus (x(0)) + e^(t A) pi_minus (x(0)) + integral_0^t e^((t-s)A) pi_minus g(x(s)) dif s + integral_0^t e^((t-s)A) pi_plus g(x(s)) dif s \
      = e^(t A) pi_minus (x(0)) + integral_0^t e^((t-s)A) pi_minus g(X(s)) dif s - integral_t^infinity e^((t-s)A) pi_plus g(x(s)) dif s
    $
  ]

  #lemma[
    קיים $R>R_0 > 0$ מהלמטה הקודמת כך שאם $x,y : [0,infinity) arrow B_(R_0) (0)$ הם פתרונות ל־$x^prime = F(x)$ כך ש־$pi_minus (x(0)) = pi_minus (y(0))$ אז $x(t)=y(t)$ לכל $t$.
  ]<second-lemma-for-the-linear-criterion-for-instable>

  #proof[@second-lemma-for-the-linear-criterion-for-instable][
    לכל $epsilon > 0$ קיים $R>R_0 > 0$ ($R$ מהלמה הקודמת) כך שלכל $z_1, z_2 in B_(R_0) (0)$ מתקיים
    $ norm(g(z_1) - g(z_2)) < epsilon norm(z_1 - z_2) $
    זה נובע מהגזירות ברציפות של $F$ : כי לכל $z_1, z_2$ מתקיים
    $
      F(z_2) = F(z_1) + D F(z_1)(z_2 - z_1) + o(norm(z_2-z_1)) = F(z_1) + A(z_2 -z_1) + (D F(z_1) - A)(z_2 - z_1) + o(norm(z_2 - z_1))
    $
    לכן
    $ g(z_2) - g(z_1) = (D F(z_1)-A)(z_2 - z_1) + o(norm(z_2 - z_1)) $
    #end_of_lecture("12 – 19/05")
    נקבע $R_0 = R_0 (epsilon)$ עבור $epsilon=epsilon(C, mu)$ עבור $mu$ מהלמה הקודמת שנגדיר בהמשך.
    נניח ש־$x,y$ פתרונות עם $pi_minus (y(0))=pi_minus (x(0))$ כך ש־$x!=y$ ל־$t>0$ ו־$x(t), y(t) in B_(R_0) (0)$ ונסמן
    $ d = sup_(t in [0,infinity)) norm(x(t)-y(t)) $
    היות ש־$R>R_0$ ו־$x(t), y(t) in B_R (0)$ ל־$t>0$ ובפרט המסקנה של הלמה הקודמת נכונה עבורם. כלומר
    $
      x(t)=e^(t A) pi_minus (x(0))+integral_0^t e^((t-s)A)pi_minus (g(x(s))) dif s - integral_t^infinity e^((t-s) A) pi_plus (g(x(s))) dif s
    $
    וכנל עבור $y$.\
    לכן
    $
      norm(x(t)-y(t)) &= norm(integral_0^t e^((t-s) A) pi_minus (g(x(s))-g(y(s))) dif s - integral_t^infinity e^((t-s)A) pi_plus (g(x(s))-g(y(s))) dif s) \
      &<= integral_0^t norm(e^((t-s)A) pi_minus (g(x(s))-g(y(s))))+integral_t^infinity norm(e^((t-s)A) pi_plus (g(x(s))-g(y(s))))
      \ &<= integral_0^t C e^(-(t-s)mu) norm(g(x(s))-g(y(s)) dif s) + integral_t^infinity C e^((t-s)mu)norm(g(x(s))-g(y(s))) dif s \
      &<= epsilon integral_0^t C e^(-(t-s)mu) norm(x(s)-y(s)) dif s + epsilon integral_t^infinity C e^((t-s)mu) norm(x(s)-y(s)) dif s \
      &<= 2epsilon C d (integral_0^t e^(-s mu) dif s + integral_t^infinity e^(-s mu) dif s) \
      &= 2 epsilon C d integral_0^infinity e^(-s mu) dif s \
      &= (2epsilon C d)/mu
    $
    כאשר אי־השיוויון השני נובע מהלמה הקודמת.\
    אז נבחר $epsilon = mu/(4C)$ ונקבל לעיל $d/2$ אבל זו סתירה כי $d$ זה אומר ש־$d=0$ (נזכר ש־$norm(x(t)-y(t))=d$).
  ]
  נבחין שההוכחה של @second-lemma-for-the-linear-criterion-for-instable מראה שיציבות היא בלתי אפשרית.
  שכן, אם $x_0$ נקודה יציבה אז קיימת $eta>0$ כך שלכל $p in B_eta (0)$ מתקיים $x_p (t) in B_(R_0) (0)$ לכל $t>0$.\
  בפרט, קיימים $x!=y$ כמו בלמה עם $pi_minus (x) = pi_minus (y)$ ולכן $x(0)=y(0)$.
]

= מערכות שטורם־ליוביל (לא בחומר למבחן)
== מוטיבציה קצרה
מה המשוואה שמתארת את התזוזה של מיתר? היא נתונה על־ידי $u=(x,t)$ ומתקיים
$ 1/c^2 (partial^2 u)/(partial t^2) = (partial^2 u)/(partial x^2) $
$c$ הוא קבוע פיזיקלי ועבורנו הוא $1$.\
נניח שניתן לכתוב פתרון $u$ בצורה $u(x,t) = phi(x)psi(t)$ אז
$
  (partial^2 u)/(partial t^2) = phi(x) psi^prime.double (t) wide (partial^2 u)/(partial x^2) = phi^prime.double (x) psi (t) \
  ==> phi(x) psi^prime.double (t) = phi^prime.double (x) psi(t) <==> (psi^prime.double (t))/psi(t) = (phi^prime.double (t))/phi(t) = lambda
$
כלומר $psi^prime.double (t) = lambda psi(t)$ וגם $phi^prime.double (x) = lambda phi(x)$.\
מה התנאים הטבעיים שהמיתר מספר לנו?
$ forall t, space u(0,t) = u(pi,t)=0 $
אז
$
  u(x, 0) = f(x) \
  (partial u)/(partial t) (x,0) = g(x)
$
התנאי שלנו של $phi(0)=phi(pi)=0$ זה לא תנאי התחלתי זה תנאי שפה.\
אז אם נסתכל על המערכת $phi^prime.double (x) = lambda phi(x)$ אז עבור $lambda>0$ הפתרונות הם צירוף לינארי של $e^(plus.minus sqrt(lambda)x)$ אבל זה כמובן לא ייתכן, $lambda=0$ זה פיתרון טריוויאלי ואם $lambda<0$ נסמן $lambda=-m^2$ ונקבל
$ phi(x) = A_m cos(m x) + B_m sin(m x) $
אבל $phi(0)=0$ ולכן $A_m = 0$ אבל גם $phi(pi)=0$ אז $m in ZZ$ ולכן $phi_m (x) = B_m sin (m x)$.

== משוואות עם תנאי שפה

#definition[מערכת שטורם ליוביל][
  יהי $[a,b] subset.eq RR$ קטע ויהיו $p,q : [a,b] arrow RR$ גזירות ברציפות.\
  המשוואה
  $ dif/(dif t) [p(t) dif/(dif t) u(t)] + q(t) u(t) = 0 $
  נקראת משוואת שטורם־ליוביל (S-L).\
  נאמר שהיא רגולרית אם $p(t) > 0$ לכל $t in [a,b]$ ואנחנו נתבונן רק במשוואות רגולריות.\
  נוסיף למשוואה תנאי שפה – כלומר תנאים על $u$ בנקודות $a,b$, למשל
  + תנאי דיריכלה – $u(a)=0=u(b)$
  + תנאי דיריכלה מוכלל – $u(a)=A, u(b) = B$
  + תנאי נוימן $u^prime (a) = 0 = u^prime (b)$
  + תנאי נוימן מוכלל $u^prime (a) = A, u^prime (b) = B$
  + מעורבב $u(a)=A, u^prime (b) = B$
  + מחזוריים $u(a)=u(b), u^prime (a) = u^prime (b)$
  משוואת S-L עם תנאי שפה נקראת מערכת $S-L$.
]

#end_of_lecture("13 – 25/05")

#example[
  ראינו שלמשוואה $u^prime.double (t) + u(t) = 0$ על $[0,pi]$ עם $u(0)=u(pi)=0$ יש אינסוף פתרונות (למעשה כל כפולה בסקלר של $sin(t)$).\
  מצד שני, אותה משוואה עם התנאים $u(0)=0, u(pi)=1$ אין בכלל פתרון.
]

#theorem[
  עבור משוואות S-L רגולרית הבאים שקולים
  + לכל $A,B in RR$ יש פתרון יחיד $u$ שמקיים  $u(a)=A, u(b)=B$
  + הפתרון היחידי עבורו תנאי השפה דיריכלה $u(a)=0=u(b)$ הוא פתרון ה־$0$
]

#proof[
  ברור ש־$1$ גורר את $2$. בכיוון השני, יהיו $A,B in RR$.\
  מרחב הפתרונות למשוואה הוא מרחב לינארי דו־מימדי (זו משוואה לינארית מסדר 2). נתבונן בהעתקה ששולחת פתרון $u$ לערכים $vec(u(a), u(b)) in RR^2$.\
  זו העתקה לינארית לינארית ומההנחה שלנו הגרעין שלה הוא הגרעין הטריוויאלי – וקטור האפס ולכן זו העתקה חד־חד ערכית ועל וזה בידיוק מה שרצינו.\
  (הגרעין הוא טריוויאלי ולכן חד־חד ערכית וזו העתקה מ־$RR^2$ ל־$RR^2$ ולכן על).
]

#remark[
  מעתה נתבונן במערכות S-L עם תנאי שפה דיריכלה.\
  + יש עוד משוואות דיפרנציאליות חלקיות שפיתרון שלהן בעזרת הפרדת משתנים מוביל למערכת S-L ולא רק משוואת המיתר שלנו
  + הביטוי במערכת S-L עם תנאי שפה דיריכלה
    $
      (p(t)u^prime (t))^prime + q(t)u(t) #text(orange)[(0=)] \
      u(a) = 0 = u(b)
    $
    מגדירה העתקה לינארית (למשל) ממרחב הפונקציות החלקות על $[a,b]$ עם תנאי השפה לעצמו.\
    לשם הדיון נניח ש־$p,q$ חלקות ובהקשר הזה מאוד טבעי לשאול על וקטורים עצמיים, כלומר פונקציות $u$ שמקיימות
    $ (p(t)u^prime (t))^prime + q(t)u(t) = lambda u(t) $
    משוואות המיתר הובילה אותנו למשוואה כזו! משוואת הערכים העצמיים שקולה בעצם למשוואה
    $ (p(t)u^prime (t))^prime + (q(t)-lambda)u(t) = 0 $
    נתמקד בפיתרון בעיית הערכים העצמיים עבור מערכת S-L. למעשה, נתבונן בבעיה כללית יותר
    $ (p(t)u^prime (t))^prime + (q(t)+lambda rho (t))u(t) = 0 $
    יש המון מערכות עם התנהגות דומה (דיסקרטיות, רציפות ואחרות)
  + בהקשר הזה, מוטיבציה נוספת מגיעה מכך שההעתקה הלינארית המתוארת על־ידי משוואת S-L מתארת המילטוניאן קוונטי
    $ underbrace((p(t)u^prime (t))^prime, "אנרגיה קינטית")+ underbrace(q(t)u(t), "אנרגיה פוטנציאלית") $
    והערכים העצמיים הם הגדלים שניתן לקבל במדידת האנרגיה של המערכת
]
האסטרטגיה שלנו לחקר מערכת S-L: נעביר את הוקטור $display(vec(u(t), p(t)u^prime (t)))$ לקורדינאטות פולאריות, נכתוב עבורן משוואות ונגדיר
$
  u(t) = r(t) sin(theta(t)) \
  p(t)u^prime (t) = r(t) cos(theta(t))
$
$u$ מקיימת
$ (p(t)u^prime (t))^prime + q(t)u(t)=0 $
מתקיים
$ dif/(dif t) u(t) - 1/p (p(t) u^prime (t))=0 $
אז
$ r^prime (t) sin(theta(t))+r(t)cos(theta(t))theta^prime (t) - 1/p(t) r(t) cos(theta(t))=0 $
ובנוסף, מהמשוואה
$ r^prime (t) cos(theta(t))-r(t)sin(theta(t))theta^prime (t) + q(t)r(t)sin(theta(t))=0 $
מכאן
$
  r^prime (t) = (1/p - q(t)) r(t) cos(theta(t) sin(theta(t))) \
  theta^prime (t) = q(t)sin^2(theta(t))+1/p(t) cos^2(theta(t))
$
יונתן טוען שהראשונה לא חשובה והשנייה כן – היא לא לינארית אבל היא מסדר ראשון.
#end_of_lecture("14 – 26/05")
נבחין שעבור $k in ZZ$ מתקיים
$ theta(t) = pi k <==> u(t) =0 $
לכן אם נתרגם $u(0)=0$ ל־$theta(0)=0$ נקבל ש־$u$ פתרון למערכת המשוואות שלנו  עם תנאי שפה דיריכלה אם ורק אם $theta(b)=pi k$ לאיזשהו $k in ZZ$.\
נתמקד כרגע במשוואה הבאה עבור מערכת S-L
$ theta^prime (t) = q(t) sin^2 (theta(t)) + 1/p(t) cos^2(theta(t)) $

#proposition[
  נניח ש־$theta, tilde(theta)$ שתי פונקציות המקיימות
  $
    theta^prime (t) >= q(t) sin^2(theta(t))+1/p(t) cos^2(theta(t)) \
    tilde(theta)^prime (t) <= q(t) sin^2 tilde(theta)(t)+1/p(t) cos^2 (tilde(theta)(t))
  $
  ונניח בנוסף ש־$tilde(a)>=tilde(theta)(a)$. אזי $theta(t)>=tilde(theta)(t)$ לכל $t in [a,b]$.\
  יתרה מזאת, אם $theta(b)=tilde(theta)(b)$ אז $theta(t)=tilde(theta)(t)$ לכל $t in [a,b]$.
]

#proof[
  $
    dif/(dif t) (theta(t) - tilde(theta)(t)) >= q(t)(sin^2(theta(t))-sin^2(tilde(theta)(t)))+1/p(t)(cos^2(theta(t))-cos^2(tilde(theta)(t)))
  $
  ידוע שמתקיים
  $ abs(sin(x)-sin(y))<= abs(x-y) ==> abs(sin^2(x)-sin^2(y)) = abs((sin(x)+sin(y))(sin(x)-sin(y)))<=2abs(x-y) $
  וזה נכון גם עבור $cos$ ולכן
  $
    dif/(dif t) (theta(t) - tilde(theta)(t)) >= q(t)(sin^2(theta(t))-sin^2(tilde(theta)(t)))+1/p(t)(cos^2(theta(t))-cos^2(tilde(theta)(t))) >= -L abs(theta-tilde(theta))
  $
  עבור $L>0$.\
  נניח בשלילה שיש $a<t_1 <=b$ כך ש־$theta(t_1) < tilde(theta)(t_1)$ ונסמן $t_0 =sup{t in [a,t_1), theta(t) >= tilde(theta)(t)}$ ואז $theta(t_0)=tilde(theta)(t_0)$ ולכל $t in [t_0, t_1]$ מתקיים $theta(t)<=tilde(theta)(t)$ או בקטע הפתוח $t in (t_0, t_1]$ מתקיים $theta(t)<tilde(theta)(t)$. לכן בקטע $[t_0, t_1]$ מתקיים
  $ dif/(dif t)= (theta(t)-tilde(theta)(t))>=L(theta(t)+tilde(theta)(t)) $
  ולכן הפונקציה $e^(-L t)(theta(t)-tilde(theta)(t))$ מונוטונית עולה בקטע $[t_0, t_1]$ ולכן
  $ e^(-L t_1)(theta(t_1)-tilde(theta)(t_1))>=0 $
  בפרט $theta(t_1) >= tilde(theta)(t_1)$ בסתירה להנחה שלנו ולכן $theta(t)>=tilde(theta)(t)$. בפרט, לכל $t in [a,b]$ מתקיים $ dif/(dif t)(theta(t)-tilde(theta)(t))>=-L(theta(t)-tilde(theta)(t)) $
  כלומר הפונקציה $e^(L t)(theta(t)-tilde(theta)(t))$ מונוטונית עולה ואי־שלילית בקטע ולכן אם $theta(b)=tilde(theta)(b)$ אז $theta(t)=tilde(theta)(t)$ לכל $t in [a, b]$.
]

#corollary[
  נניח שהפונקציה $theta$ (על הקטע $[a,b]$) מקיימת את אי־השיוויון
  $ theta^prime (t) >= q(t)sin^2(theta(t))+1/p(t)cos^2(theta(t)) $
  ויהי $k in ZZ$ כך ש־$theta(a)>=pi k$ אזי $theta(b)>pi k$.
]

#proof[
  נגדיר $tilde(theta) eq.triple pi k$ אזי $ 0=tilde(theta)^prime < q(t)underbrace(sin^2(tilde(theta)(t)), =0)+underbrace(1/p(t)cos^2(tilde(theta)(t)), >0) $ ומתקיים $theta(a)>=tilde(theta)(a)$ ולכן $theta(b)>=tilde(theta)(b)$ ולמעשה האי־שיוויון חזק כי אחרת היה שיוויון ואז $theta$ הייתה קבועה והיינו מקבלים $theta^prime eq.triple 0$ ולכן $theta(b)>pi k$.
]

#corollary[
  יהי $p, tilde(p), q, tilde(q)$ פונקציות גזירות ברציפות ב־$[a,b]$ כך ש־$0<p(t)<=tilde(p)(t)$ ו־$q(t)>=tilde(q)(t)$ לכל $t in [a,b]$.\
  יהיו $u, tilde(u)$ פתרונות למשוואות שטורם־ליוביל המתאימות ו־$theta, tilde(theta)$ הזוויות המתאימות (פונקציות הפאזה המתאימות/משתני פרופר המתאימים).\
  אם $theta(a)>=tilde(theta)(a)$ אז $theta(t)>=tilde(theta)(t)$ ואם $theta(b)= tilde(theta)(t)$ אז $theta(t)=tilde(theta)(t)$ לכל $t in [a,b]$.
]

#proof[
  $
    theta^prime (t) = q(t)sin^2(theta(t))+1/p(t)cos^2(theta(t)) \
    tilde(theta)^prime (t) = tilde(q)(t)sin^2(tilde(theta)(t))+1/tilde(p)(t) cos^2(tilde(theta)(t))
  $
  ולכן המשפט הוא מסקנה ישירה של הטענה (אם נחלק ונשתמש ב־$0<p(t)<=tilde(p)(t), q(t)>=tilde(q)(t)$).
]

#corollary[משפט ההשוואה של שטרום][
  נניח ש־$0<p(t)<=tilde(p)(t)$ ו־$q(t)>=tilde(q)(t)$ לכל $t$ ויהיו $u, tilde(u)$ פתרונות לא טריוויאליים למשוואות S-L המתאימות.\
  אם $tilde(u)(a)=tilde(u)(b)=0$ אז קיים $tau in (a,b]$ כך ש־$u(tau)=0$.
]

#proof[
  נתבונן ב־$theta, tilde(theta)$ פונקציות הפאזה המתאימות. על־ידי הפלכה ב־$(-1)$ אם יש בך צורך ניתן לדאוג ש־$theta(a) in [0, pi)$.\
  באותו אופן ניתן להניח ש־$tilde(theta)(a)=0$ ולכן $tilde(theta)(b)>0$ מהמסקנה לפני הקודמת.\
  אבל $tilde(u)(b)=0$ ולכן $tilde(theta)(b)=pi k$ לאיזשהו $k in ZZ$ ולכן $tilde(theta)(b)>=pi$ ומהמסקנה הקודמת $theta(a)>=tilde(theta)(a)$ ומהמסקנה הקודמת $theta(b)>=tilde(theta)(b)>=pi$ וממשפט ערך הביניים יש $tau in (a,b]$ שעבורו $theta(tau)=pi$ אבל אז $u(tau)=0$, כנדרש.
]

== ערכים עצמיים ופונקציות עצמיות
יהיו $p,q,rho :[a,b] arrow RR$ פונקציות גזירות ברציפות בקטע $[a,b]$ כך ש־$p,rho>0$ בקטע.

#definition[
  נאמר ש־$lambda in RR$ הוא ערך עצמי של המערכת S-L המתאימה לפונקציות $p,q, rho$. אז יש פתרון שהוא לא זהותית אפס למערכת
  $ (star) space dif/(dif t) (p(t)+dif/(dif t) u(t))+(q(t)-lambda rho(t))u(t)=0 $
  וכן $u(a)=u(b)=0$ פתרון $u$ למערכת הזו ייקרא פונקציה עצמית.
]<u_lambda_def>
כידוע, לכל $lambda$ ישנו פתרון יחיד למשוואה
$ (p(t)u^prime (t))^prime + (q(t)+lambda rho(t))u(t) = 0 $
המקיים
$ u(a)=0, wide u^prime (a) = 1 $
נסמן אותו ב־$u_lambda$.

#end_of_lecture("15  – 01/06")

#proposition[
  $lambda$ הוא ערך עצמי של המערכת אם ורק אם $u_lambda (b) =0$ ובמקרה הזה כל וקטור/פונקציה עצמית היא כפל של $u_lambda$ בסקלר.
]

#proof[
  אם $u_lambda (b) =0$ אז $lambda$ הוא ערך עצמי. מצד שני, אם $lambda$ הוא ערך עצמי אז קיימת פונקציה $u$ כך ש־$u(a)=u(b)=0$ כאשר $u^prime (a) != 0$ המקיימת את $(star)$ ב@u_lambda_def.\
  נתבונן ב־$tilde(u) = u^prime (a) u_lambda$.\
  נשים לב ש־$tilde(u)(a)=0$ ו־$tilde(u)^prime (a) = u^prime (a)$ ולכן מיחידות $u = tilde(u)$ כי הם מסכימים על תנאי ההתחלה ובפרט $ u^prime (a) u_lambda (b) = tilde(u)=u(b)=0 $
  ולכן $u_lambda (b) =0$.
]

נגדיר $r_lambda, theta_lambda$ להיות פונקציות האמפליטודה והפאזה של $u_lambda$
$
  vec(p(t) u_lambda^prime (t), u_lambda (t)) = vec(r_lambda (t) cos(theta_lambda (t)), r_lambda (t) sin(theta_lambda (t)))
$
נשים לב ש־$theta_lambda (a) =0$ כי הנגזרת של $u_lambda (a)$ היא $1$ ובפרט היא חיובית (אנחנו שומרים על מערכת המשוואות לעיל) ולכן ממה שר5אינו $theta_lambda (t) > 0$ לכל $b>=t>a$.

#proposition[
  $lambda$ הוא ערך עצמי אם ורק אם $theta_lambda (b) = pi n$ עבור $n in NN$.
]

#proof[
  אנחנו יודעים ש־$lambda$ ערך עצמי אם ורק אם $u_lambda (b) = 0$ וזה קורה אם ורק אם $theta_lambda (b) = pi n$ לאיזשהו $n in ZZ$ אבל $theta_lambda (b) > 0$.\
  (הראינו שאם $theta(a)=pi n$ אז $theta(b) > pi n$)
]

#example[
  כשהסתכלנו על משוואת המיתר
  $
    dif^2/(dif t^2) u(t) + lambda u(t) =0 \
    u(a)=0=u(b)
  $
  מהי $u_lambda$?
  $
    u_lambda (t) = mycases(
      1/sqrt(lambda) sin(sqrt(lambda)(t-a)), lambda >0, t-a, lambda=0,
      1/sqrt(-lambda) sinh(sqrt(-lambda)(t-a)), lambda < 0
    )
  $
  מתקיים ש־$u_lambda (b) =0$ אפשרי רק עבור $lambda>0$ (כי סינוס היפרבולי לא מתאפס)ואז זה קורה אם ורק אם $sqrt(lambda)(b-a) = pi n$ עבור $n in NN$.\
  כלומר הערכים העצמיים הם
  $ lambda_n = (pi^2 n^2)/(b-a)^2 $
  והפונקציות העצמיות הן
  $ u (t) = C sin((pi n(t-a))/(b-a)) $
  עבור $C$ קבוע כלשהו.
]

#proposition[
  אם $theta_lambda (b) = pi n$ אז לפונקציה $u_lambda (t)$ יש בידיוק $n-1$ אפסים בקטע הפתוח $(a,b)$.
]

#proof[
  לכל $0<=k<=n$ נגדיר $tau_k colon.eq inf{t in [a,b] bar theta_lambda (t) >= pi k}$.\
  נשים לב ש־$a=tau_0$ ו־$tau_n = b$ ומהגדרת האיפימום זאת סדרה עולה
  $ a=tau_0 < tau_1 < dots.h.c < tau_n = b $
  לכל $t<tau_k$ מתקיים $theta_lambda (t) < pi k$ ו־$theta_lambda (tau_k) = pi k$ ועבור $t > tau_k$ מתקיים $theta_lambda (t) > pi k$.\
  אבל $u_lambda (t) =0$ אם ורק אם $theta_lambda (t) = pi k$ לאיזשהו $k$ וזה קורה אם ורק אם $t = tau_k$.
]

אנחנו רוצים להבין מתי ולאיזה $lambda$ מתקיים $theta_lambda (b) = pi n$ ונראה כעת שלכל $n in NN$ יש $lambda$ יחיד כזה.

#theorem[
  הפונקציה $lambda mapsto theta_lambda (b)$ היא רציפה ומונוטונית עולה ממש ויתרה מזאת
  $
    lim_(lambda arrow.r infinity) theta_lambda (b) = infinity \
    lim_(lambda arrow.r -infinity) theta_lambda (b) =0
  $
]

#end_of_lecture("16  – 02/06")

#proof[
  את רציפות הפונקציה $lambda mapsto theta_lambda (b)$ נראה בתרגיל.\
  יהיו $lambda, mu in RR$ עם $lambda > mu$ מתקיים
  $
    dif/(dif t) (p(t) dif/(dif) u_lambda (t)) + (q(t) + lambda rho(t))u_lambda (t) = 0 \
    dif/(dif t) (p(t) dif/(dif) u_mu (t)) + (q(t) + mu rho(t))u_mu (t) = 0
  $
  מתקיים $q(t) + lambda rho(t) > q(t) + mu rho(t)$ ולכן $theta_lambda (b) >= theta_mu (b)$ כי ראינו שמכפלה כזאת מובילה לזווית גדולה יותר.\
  אם יש שיוויון, כלומר $theta_lambda (b) = theta_mu (b)$ ולכן $theta_lambda (t) = theta_mu (t)$ לכל $t$, אבל נשים לב
  $
    theta^prime_lambda (t) = (q(t) + lambda rho(t))sin^2 (theta_lambda (t)) + 1/p(t) cos^2(theta_lambda (t)) \
    theta^prime_mu = (q(t) + mu rho(t))sin^2 (theta_mu (t)) +1/p(t) cos^2 (theta_mu (t))
  $
  אז בפרט גם $theta^prime_lambda = theta^prime_mu$ ולכן נובע ש־$mu=lambda$, בסתירה. ולכן $lambda arrow theta_lambda (b)$ היא מונוטונית עולה ממש.\
  נראה ש־$lim_(lambda arrow infinity) theta_lambda (b) = infinity$.\
  יהי $n in NN$, נגדיר
  $ hat(mu)(t) = sin(pi n (t-a)/(b-a)) $
  נשים לב ש־$hat(u)$ פותרת את המשוואה
  $ dif/(dif t) (p_max dif/(dif t) hat(u)(t) + (pi^2 n^2)/(b-a)^2 p_max hat(u)(t)) = 0 $
  היכן ש־$p_max = max{p(t) bar t in [a,b]}$ ונשים לב שמתקיים
  $ hat(u)(a) = 0 = hat(u)(b) $
  נגדיר
  $
    p_max dif/(dif t) hat(u)(t) = hat(r)(t) cos(hat(theta)(t)) \
    hat(u)(t) = hat(r)(t)sin(hat(theta)(t)) \
    hat(theta)(t) = 0
  $
  ניתן לבחור $lambda$ כך שיתקיים
  $ lambda rho_min >= (pi^2 n^2)/(b-a)^2 p_max - q_min $
  ולכן
  $ q(t) + lambda rho(t) >= q_min + lambda rho_min >= (pi^2 n^2)/(b-a)^2 p_max $
  יתרה מזאת, $p(t) <= p_max$ ולכן $theta_lambda (b) >= hat(theta)(b)$ אבל $hat(theta)(b) = pi n$ ולכן מצאנו $lambda$ כך ש־$theta_lambda (b) >= pi n$ ומשרירותיות $n in NN$ ולכן $lim_(lambda arrow.r infinity) theta_lambda (b) = infinity$ (הגבול קיים ממונוטוניות).\
  נראה ש־$lim_(lambda arrow.r minus infinity) theta_lambda (b) = 0$.\
  יהי $0<epsilon<pi$ ונבחר $lambda < 0$ כך שיתקיים
  $ (q_max + lambda rho_min)sin^2 (epsilon) + 1/p_min cos^2 (epsilon) < 0 $
  היות ש־$rho$ פונקציה חיובית נוכל לבחור $lambda$ קטנה דיו שהביטוי לעיל יהיה שלילי (ובהתאם $sin$ לא מתאפס שם), נראה ש־$theta_lambda (b) <= epsilon$. נניח שלא, כלומר $theta_lambda (b) > epsilon$ ונגדיר
  $ tau = inf {t in [a,b] bar theta_lambda (t)>epsilon} $
  וקיימת סדרה $t_j arrow.b tau$ כך ש־$theta_lambda (t_j) > epsilon$ ולכן $theta^prime_lambda (tau) >= 0$. מצד שני
  $
    theta^prime_lambda (tau) & = (q(tau)+lambda rho(tau))sin^2 (theta_lambda (tau)) + 1/p(tau) cos^2 (theta_lambda (tau)) \
                             & = (q(t) + lambda rho(tau))sin^2 (epsilon) + 1/p(tau) cos^2 (epsilon) \
                             & <= (q_max + lambda rho_min )sin^2 (epsilon) + 1/(p_min (tau)) < 0
  $
  וזאת סתירה מההנחה שלנו לעיל ולכן $theta_lambda (b) < epsilon$ ומשרירותיות $epsilon$ נקבל $lim_(lambda arrow.r minus infinity) theta_lambda (b) =0$.
]

#corollary[
  קיימת סדרה עולה של מספרים ממשיים $lambda_1 < lambda_2 < lambda_3 < dots.h$ כך שמתקיים
  + $lambda_n$ הוא הפיתרון היחידי של המשוואה $theta_lambda (b) = pi n$
  + $lambda_n arrow_(n arrow infinity) infinity$
  + $lambda$ הוא ערך עצמי של המערכת S-L אם ורק אם $lambda<=lambda_n$ עבור $n in NN$
  + לכל $n in NN$ הפונקציה $mu_lambda_n$ היא פונקציה עצמית של המערכת S-L עם ערך עצמי $lambda_n$. יתרה מזאת, לפונקציה $mu_lambda_n$ יש בידיוק $n-1$ אפסים בקטע $(a,b)$
]

#proof[
  לכל $n in NN$ יש $lambda_n$ כך ש־$theta_lambda_n = pi n$ זאת משום הפונקציה $theta mapsto theta_lambda (b)$ היא רציפה ומתקיים
  $ lim_(lambda arrow infinity) theta_lambda (b) = infinity, lim_(lambda arrow minus infinity) theta_lambda (b) =0 $
  אז ממשפט ערך הביניים $lambda_n$ יחיד כי הפונקציה מונוטונית ממש וזה מוכיח את 1.\
  נשים לב ש־$lim_(n arrow infinity) underbrace(theta_lambda_n (b), = pi n) = infinity$ אבל הפונקציה $lambda mapsto theta_lambda (b)$ היא פונקציה רציפה וזה גורר ש־$lim_(n arrow.r infinity) lambda_n = infinity$ וזה סוגר את 2.\
  הראנו ש־$lambda$ ערך עצמי אם ורק אם $theta_lambda (b) = pi n$ אם ורק אם $lambda = lambda_n$ וזה סוגר את 3 ואת 4 הראינו כבר.
]

#corollary[
  לכל מערכת S-L רגולריות ($rho, p > 0$) עם תנאי שפה דיריכלה יש אינסוף ערכים עצמיים.
]

#end_of_lecture("17  – 08/06")

= משוואות דיפרנציאליות חלקיות
== משוואת לפלס
#definition[משוואת לפלס][
  עבור $u in C^2 (Omega)$ עבור $Omega subset.eq RR^n$ פתוחה נגדיר את משוואת לפלס להיות המשוואה
  $ Delta u = sum_(j=1)^n (partial^2 u)/(partial x_j^2) = 0 $
  ול־$Delta u$ אנחנו קוראים הלפלסיאן ול־$u$ אנחנו קוראים פונקציה הרמונית.
]
#remark[
  + באופן שקול, $Delta u$ הוא ה־$divergence$ של הגרדיאנט (הדיברגנס הופך שדה לסקלר והסקלר אומר מה הקצב של ההתרחבות של השדה) וזה בעצם אנלוג טבעי לנגזרת השנייה במימד אחד.
  + אם $u in C^2 (Omega)$, $H$ ההסיאן כאשר $H_(i j) = (partial^2 u)/(partial x_i partial x_j)$ מטריצת הנגזרות החלקיות. אז $Delta u = tr H(u)$.\
    היות שהעקבה לא משתנה תחת שינוי בסיס, $Delta u$ אינווריאנטי לסיבובים ולהזזות.
]

#example[
  + אם $n=1$ ו־$u$ הרמונית אז $u(x)=a x + b$
  + אם $n=2$ טבעי להסתכל על המרוכבים אז $f:CC arrow CC$ הולומורפית כלומר גזירה לפי $z$ אז $f(z) = u + i v$ עבור $u,v : RR arrow RR$ הרמוניות כאשר $CC tilde.equiv RR^2$.
    כאשר $u(x,y) = re(f(x+i y)), v(x,y) = im(f(x + i y))$. למה? כי פונקציה הולומורפית מקיימת את משוואות קושי רימן
    $
      (partial u)/(partial x) = (partial v)/(partial y) wide (partial u)/(partial y) = - (partial v)/(partial x) \
      (partial^2 u)/(partial x^2) = partial/(partial x) ((partial u)/(partial x)) = partial/(partial x )((partial v)/(partial y)) = partial/(partial y) ((partial y)/(partial x)) = - (partial^2 u)/(partial y^2)
    $
]

#theorem[תכונת הערך הממוצע של פונקציות הרמוניות][
  תהיי $Omega subset.eq RR^n$ פתוחה ותהיי $u in C^2 (Omega)$ אזי $u$ הרמונית ב־$Omega$ אם ורק אם לכל $closure(B(x_0, r_0)) subset.eq Omega$ (כדור שהסגור שלו ב־$Omega$) מתקיים
  $
    integral.slash_(B(x_0, r_0)) u dif v colon.eq 1/Vol(B(x_0, r_0)) integral_(B(x_0, r_0)) u dif v = u(x_0) <==> integral.slash_(boundary(B(x_0, r_0))) u dif s = 1/Area(boundary(B(x_0, r_0))) integral_boundary(B(x_0, r_0)) u dif s = u(x_0)
  $
]

#proof[
  נניח ראשית ש־$u$ הרמונית ויהי $closure(B(x_0, r_0)) subset.eq Omega$ נראה ש־$integral.slash_(boundary(B(x_0, r_0))) u dif s = u(x_0)$.\
  נראה זאת על־ידי שנגדיר לכל $0<r<= r_0$ את $phi(r) = integral.slash_(boundary(B(x_0, r))) u dif s$ ונראה ש־$phi^prime (r) = 0$ ואז מרציפות $u$ נובע $lim_(r arrow.r 0) phi(r) = u(x_0)$ שכן לכל $epsilon > 0$ יש \
  $delta>0$ כך ש־ אם $y in B(x_0, delta)$ אז $abs(u(y)-u(x_0))<epsilon$ ואז עבור $0<r<delta$ מתקיים
  $
    abs(u(x_0) - phi(r)) = abs(integral.slash_(boundary(B(x_0, r))) - u(x_0)) = abs(integral.slash_(boundary(B(x_0, r)))(u(s)-u(x_0)) dif s) <= integral.slash_(boundary(B(x_0, r))) abs(u(s)-u(x_0)) dif s < epsilon integral.slash_(boundary(B(x_0, r))) dif s = epsilon
  $
  נגדיר $psi_r : closure(B(0,1)) arrow closure(B(x_0, r))$ על־ידי $psi_r (y) = x_0 + r y$ אז $psi_r$ הוא דיפאומורפיזם בין השפות עם יעקוביאן $r^(n-1)$.
  $
    integral.slash_boundary(B(0,1)) (u compose psi_r) dif s = 1/(Area(boundary(B(0,1))) dot.op r^(n-1)) integral_boundary(B(0,1)) (u compose psi_r) r^(n-1) dif = 1/Area(boundary(B(x_0, r))) integral_boundary(B(x_0,r)) u dif s = phi(r) s
  $
  #exercise[
    $ Area(boundary(B(0,1))) dot.op r^(n-1) = Area(boundary(B(x_0, r))) $
  ]
  ולכן
  $
    phi^prime (r) = integral.slash_boundary(B(0,1)) partial/(partial r) (u compose psi_r) dif s = integral.slash_boundary(B(0,1)) chevron.l gradient u, hat(n) chevron.r dif s =_((star)) 1/Area(boundary(B(0,1))) integral_(B(0,1)) divergence (gradient u) dif v =_((star star)) 1/Area(boundary(B(0,1))) integral_(B(0,1)) Delta u dif v =_((star star star)) 0
  $
  כאשר $(star)$ זה משפט הדיברגנץ, $(star star)$ זו הגדרת הלפלסיאן ו־$(star star star)$ זה מהיות $u$ הרמונית.\
  הראינו שאם $u$ הרמונית אזי $integral.slash_boundary(B(x_0, r_0)) u dif s = u(x_0)$ ו־$phi(r) = integral.slash_boundary(B(x_0, r))$ עבור $0<r<=r_0$ אז $u$ קבועה
  אז
  $
    integral.slash_(B(x_0, r_0)) u dif v &= 1/Vol(B(x_0, r_0)) integral_0^(r_0) dif r integral_boundary(B(x_0, r)) u dif s \
    &= 1/Vol(B(x_0, r_0)) integral_0^(r_0) dif r (Area(boundary(B(x_0, r))))/(Area(boundary(B(x_0, r)))) integral_boundary(B(x_0, r)) u dif s \
    &= u(x_0)/Vol(B(x_0, r_0)) integral_0^(r_0) Area(boundary(B(x_0, r))) dif r \
    &= u(x_0)
  $
  אז הראינו שאם $u$ הרמונית אזי $integral.slash_boundary(B(x_0, r_0)) u dif s = u(x_0)$ והראינו ש־$integral.slash_(B(x_0, r_0)) u dif v = u(x_0)$.\
  נשאר להראות את הכיוון השני ולכן נניח ש־$u$ לא הרמונית ולכן יש כדור קטן שעליו $Delta u > 0$ (בלי הגבלת הכלליות, יכול להיות גם קטן מאפס) אבל אז מההנחה \
  ש־$integral.slash_(boundary(B(x_0, r_0))) u dif s = u(x_0)$ נקבל ש־$phi^prime (r) = 0$ אבל זאת סתירה.
]

#end_of_lecture("18  – 09/06")

#theorem[עיקרון המקסימום לפונקציות הרמוניות][
  נניח ש־$Omega subset.eq RR^n$ פתוחה וחסומה ונניח ש־$u in C^2 (Omega) inter C(closure(Omega))$ הרמונית.
  + העיקרון החלש – המקסימום מתקבל על השפה
    $ max u (closure(Omega)) = max u(boundary(Omega)) $
  + העיקרון החזק – אם $Omega$ קשירה וקיים $x_0 in Omega$ כך ש־$u(x_0) = max u(closure(Omega))$ אז $u$ קבועה
]

#proof[
  + יהי $x_0 in closure(Omega)$ כך ש־$u(x_0) = max u(closure(Omega))$. אם $x_0 in boundary(Omega)$ אז סיימנו. אחרת, יש $r>0$ כך ש־$B(x_0, r) subset.eq Omega$ מתקיים $u(x_0) = integral.slash_(B(x_0, r)) u dif V$.\
    אבל זה אומר שלכל $y in B(x_0, r)$ מתקיים $u(y)=u(x_0)$ שכן אם לא מתקיים $u(y) < u(x_0)$ (כי $u(x_0)$ מקסימום) ולכן מרציפות יש קבוצה פתוחה $supset.eq$ $B(x_0, r)$ שעליה $u < u(x_0)$ ואז $integral.slash_(B(x_0, r)) u dif V < u(x_0)$.\
    אבל זה נכון לכל $r<=dist(x_0, boundary(Omega))$ ולכן לכל $y in boundary(Omega) inter boundary(B(x_0, dist(x_0, boundary(Omega))))$ מתקיים $u(y)=u(x_0) = max u(closure(Omega))$.
  + נניח ש־$x_0 in Omega$ מקיימת $u(x_0) = max u(Omega)$ ונתבונן בקבוצה $A colon.eq {y in Omega bar u(x_0)=u(y)}$.\
    $A$ סגורה מרציפות והיא לא ריקה כי $x_0 in A$. אבל הראשנו ש־$A$ פתוחה ב־$Omega$ אבל $Omega$ קשירה ולכן $A=Omega$.
]

#remark[
  אם $u$ הרמונית אז $minus u$ הרמונית גם כן ולכן המשפט לגבי עיקרון המקסימום נכון גם למינימום.
]

#corollary[
  אם $u,v in C^2 (Omega) inter C(closure(U))$ כאשר $Omega$ פתוחה וחסומה ומתקיים ש־$u|_boundary(Omega)=v|_boundary(Omega)$ ו־$Delta u = Delta v$.
  אז $u=v$.
]

#proof[
  $u-v$ פונקציה הרמונית ב־$Omega$ ומקיימת $min(u-v)=max(u-v)=0$ ולכן זו פונקציית האפס ו־$u=v$.
]

נקבע פונקציה חלקה ואי־שלילית $eta:(0, infinity) arrow RR$ המקיימת $eta|_([0,1/2)) = 1$ ועבור $x>=1$ ניקח $eta(x)=0$.\
בהינתן $epsilon > 0$ נגדיר $phi_epsilon : RR^n arrow RR$ על־ידי
$ phi_epsilon = frac(1, epsilon^n) frac(eta(frac(norm(x), epsilon)), integral_(RR^n) eta(norm(y)) dif y) $
$phi_epsilon$ חלקה, רדיאלית הנתמכת על $B(0,epsilon)$ ומקיימת $integral_(RR^n) phi_epsilon (y dif y = 1)$.

#definition[שיכוך][
  תהיי $Omega subset.eq RR^n$ פתוחה. לכל $epsilon > 0$ נסמן
  $ Omega_epsilon colon.eq {x in Omega bar dist(x, boundary(Omega)>epsilon)} $
  נניח ש־$u in C(Omega)$ ויהי $epsilon > 0$. השיכוך של $u$ בסקאלה $epsilon$ הוא הפונקציה $u^epsilon : Omega_epsilon arrow RR$ שנתונה על־ידי
  $ u^epsilon = phi_epsilon * u = integral_(RR^n) phi_epsilon (x-y) u(y) dif y $
  בפרט $u^epsilon$ חלקה (מהתרגיל).
]

#theorem[
  תהיי $Omega subset.eq RR^n$ פתוחה ונניח ש־$u in C(Omega)$ מקיימת את תכונת הערך הממוצע ב־$Omega$. אזי $u in C^infinity (Omega)$ (חלקה) ובפרט הרמונית.
]

#proof[
  מספיק להראות שלכל $epsilon > 0$ מתקיים $u|_Omega_epsilon = u^epsilon$.\
  עבור $x in Omega_epsilon$ מתקיים
  $
    u^epsilon (x) & = integral_(B(x, epsilon)) phi_epsilon (x-y)u(y) dif V(y) \
    & = integral_0^epsilon integral_boundary(B(x,r)) phi_epsilon (x-y)u(y)dif s(y) dif r \
    & = frac(1, integral_(RR^n) eta(norm(z)) dif z) integral_0^epsilon frac(eta(frac(r, epsilon)), epsilon^n) integral_boundary(B(x,r)) u(y) dif s(y) dif r \
    &= frac(1, integral_(RR^n) eta(norm(z)) dif z) integral_0^epsilon frac(eta(frac(r, epsilon)), epsilon^n) integral_boundary(B(x,r)) u(x) dif s(y) dif r \
    &= frac(u(x), integral_(RR^n) eta(norm(z)) dif z) integral_0^epsilon frac(eta(frac(r, epsilon)), epsilon^n) integral_boundary(B(x,r)) dif s(y) dif r \
    &= u(x) integral_(B(x, epsilon)) phi^epsilon (x-y) dif V(y) \
    &= u(x) integral_(RR^n) phi^epsilon (y) dif y \
    &= u(x)
  $
]

#corollary[
  פונקציות הרמוניות הן חלקות.
]

#corollary[
  גבול במידה שווה של פונקציות הרמוניות הוא הרמוני (ב־$Omega subset.eq RR^n$ פתוחה).
]

#proof[
  אם $(f_n)_(n=1)^infinity$ סדרת פונקציות הרמוניות ו־$f_n arrows.rr f$ (במידה שווה).
  אז $f_n$ רציפות ולכן $f$ רציפה. בנוסף, לכל $x in Omega$ מתקיים
  $
    integral.slash_(B(x, r)) f(y) dif V(y) = lim_(n arrow infinity) integral.slash_(B(x,r)) f_n (y) dif V(y) = lim_(n arrow.r infinity) f_n (x) = f(x)
  $
]

#theorem[הערכת נגזרות לפונקציות הרמוניות][
  לכל $n, k in NN$ יש קבוע $0<C(n,k)$ כך שלכל קבוצה פתוחה $Omega subset.eq RR^n$ ולכל $u:Omega arrow RR$ הרמונית ולכל מולטי־אינדקס $alpha = (alpha_1, dots.h, alpha_n)$ (אינדקס וקטורי) עם $abs(alpha)=sum alpha_i = k$ ולכל $closure(B(x,r)) subset.eq Omega$ מתקיים
  $
    abs(D^alpha u(x)) = abs(frac(partial^(alpha_1), partial x_1^(alpha_1)) frac(partial^(alpha_2), partial x_2^(alpha_2)) dots.h.c frac(partial^(alpha_n), partial x_n^(alpha_n)) u(x)) <= integral_(B(x,r)) abs(D^alpha phi_r (x-y)) abs(u(y)) dif y <= frac(C(n comma k), r^(n+k)) integral_(B(x,r)) abs(u(y)) dif y
  $
]

#proof[
  מתקיים $u|_Omega_r = u^r$ ולכן $D^alpha u(x) = D^alpha phi_r * u$ כאשר
  $ phi_r (x-y)=frac(1, r^n integral_(RR^n) eta(norm(z)) dif z) eta(frac(norm(x-y), r)) $
  על־כל גזירה יוצאת חזקה של $r$ החוצה ואת שאר הגורמים ניתן לחסום מכך ש־$eta$ נתמכת קומפקטית וחלקה.
]

#end_of_lecture("19  – 15/06")

#theorem[אי־שיוויון הרנאק][
  יהי $Omega subset.eq RR^n$ קבוצה פתוחה ותהיי $V subset.eq Omega$ פתוחה, קשירה וחסומה כך ש־$closure(V) subset.eq Omega$. אזי יש קבוע $0<C(Omega, V)$ כך שלכל $u : Omega arrow RR$ הרמונית ואי־שלילית מתקיים
  $ sup u(V) <= C(Omega, V) dot.op inf u(V) $
]

#proof[
  נוכיח קודם מקרה פרטי. נניח ש־$V=B(x,r)$ ונניח גם ש־$closure(B(x,4r)) subset.eq Omega$ ונקבע $x_0, x_1 in V$.\
  מאי־שיוויון המשולש $B(x_1, r) subset.eq B(x_0, 3r)$ ו־$closure(B(x_0, 3r)) subset.eq Omega$ ולכן מערך הממוצע ומאי־אליליות של $u$
  $
    u(x_0) & = 1/Vol(B(x_0, 3r)) integral_(B(x_0, 3r)) u(y) dif y \
           & >= 1/Vol(B(x_0, 3r)) integral_(B(x_1, r)) u(y) dif y \
           & = frac(Vol(B(x_1, r)), Vol(B(x_0, 3r))) u(x_1) \
           & = 3^(-n) u(x_1)
  $
  כלומר עבור המקרי הפרטי אפשר לקחת את הקבוע להיות $3^n$.\
  למקרה הכללי, מקומפקטיות יש אוסף סופי של נקודות $o_1, dots.h, p_M in closure(V)$ ורדיוסים $r_1, dots.h, r_M > 0$ כך ש־$closure(V) subset.eq union.big_(i=1)^M B(p_i, r_i)$ ו־$closure(B(p_i, 4r_i)) subset.eq Omega$ לכל $i$.\
  נקבע $x_0, x_1 in V$ ומכך ש־$V$ תת־קבוצה פתוחה וקשירה של $RR^n$ אז היא קשירה מסילתית. לכן נקבע איזושהי מסילה ב־$V$ שמקשרת בין $x_0$ ו־$x_1$ והמסילה מכוסה על־ידי לכל היותר $M$ מהכדורים.
  בלי הגבלת הכלליות אפשר להניח שאפשר להתקדם מ־$x_0$ ל־$x_1$ על־גבי המסילה כאשר בכל צעד אנחנו עוברים מכדור נתון לכדור שעדיין לא ביקרנו בו ובכל מעבר כזה אנחנו צוברים פקטור של לכל היותר $3^(-n)$ בהפרש בין ערכי $u$ על נקודות הקצה של המעבר ולכן $C(Omega,V) = 3^(n M)$ הקבוע הנדרש.
]

== בעיית דיריכלה
נתונה קבוצה פתוחה וחסומה $Omega subset.eq RR^n$ יפה מספיק ונתונות פונקציות $g in C(boundary(Omega))$ ו־$f in C(Omega)$.
איך למצוא $u in C^2 (Omega) inter C(closure(Omega))$ כך ש־$u|_boundary(Omega) = g$ ו־$Delta u|_Omega = f$.\
זו בעיית דיריכלה למשוואת פואסון והמקרה הפרטי $f=0$ נקרא בעיית דיריכלה למשוואת לפלס/לפונקציות הרמוניות. \
איך פותרים בעיה כזאת? האסטרטגיה שלנו היא שאם נניח שיש לנו פונקציה $K:Omega times boundary(Omega) arrow RR$ המקיימת שלכל $y$, $Delta_x K(x,y) = 0$ ונניח בנוסף שמתקיים
$ lim_(x arrow y_0) integral_boundary(Omega) K(x,y)g(y) dif s(y) = g(y_0) $
אז אם $K$ מספיק "יפה" כדי שיהיה אפשר להצדיק גזירה מתחת לסמן האינטגרל, אז עבור
$
  u(x) = integral_boundary(Omega) K(x,y) g(y) dif s(y) ==> Delta u(x) = integral_boundary(Omega) Delta_x K(x,y) g(y) dif s(y) = 0
$
אז נקבל פונקציה הרמונית ובנוסף $lim_(x arrow y_0 in boundary(Omega)) u(x) = g(y_0)$.

#example[
  נזהה $CC tilde.equiv RR^2$. נתבונן בפונקציה $K(z,w)=re(frac(z+w, w-z))$ כאשר $w in boundary(DD), z in DD$ ו־$Omega=DD$.
  $K$ הרמונית כי החלק הממשי של פונקציה הולומורפית.\
  $
    K(z,w)=_(w = e^(i t) \
    z= r e^(i theta))re(frac(e^(i t) + r e^(i theta), e^(i t)-r e^(i theta))) = re(frac(1+r e^(i(theta-t)), 1- r e^(i(theta-t))))
  $
  אנחנו רוצים להבין את ההתנהגות של $K(z,w)$ כאשר $z arrow w_0=e^(i t_0) in boundary(DD)$.
  נסמן $theta^prime = theta-t$ ואנחנו רוצים להתבונן באינטגרל
  $
    integral_boundary(DD) K(z,w)g(w) dif t = 1/(2pi) integral_(minus pi)^pi K(r e^(i theta), e^(i t)) g(e^(i t)) dif t stretch(arrow)_(r arrow 1 \
    theta arrow t_0) ?
  $
  נניח ש־$theta=t_0$ אזי
  $
    1/(2pi) integral_(minus pi)^pi K(r e^(i t_0), e^(i t)) g(e^(i t)) dif t = 1/(2pi) integral_(minus pi)^pi re(frac(1+r e^(i(t_0 -t)), 1-r e^(i(t_0 - t)))) g(t) dif t
  $
  נשים לב שאם נסמן $t^prime = t_0 - t$ נקבל
  $ re(frac(1+ r e^(i t^prime), 1- r e^(i t^prime))) = frac(1-r^2, 1-2 r cos(t^prime)+r^2) $
  וזה בעצם גרעין פואסון! כאשר $t^prime =0$ זה בעצם $frac(1-r^2, 1-2r+r^2) = frac((1-r)(1+r), (1-r)^2) = frac(1+r, 1-r)$ וכאשר $r arrow 1$ זה מתפוצץ.
]

#end_of_lecture("20  – 16/06")

== שיטת Perron לפתרון בעיית דיריכלה
המטרה שלנו היא לפתור את בעיית דיריכלה עבור משוואת לפלס $Delta u|_Omega =0$ כאשר $u|_boundary(Omega) = g$.

#definition[פונקציה תת־הרמונית][
  תהיי $Omega subset.eq RR^n$ תחום (קבוצה פתוחה וקשירה), $v in C(Omega)$ תקרא תת־הרמונית ב־$Omega$ אם לכל $B subset.eq Omega$ כדור פתוח כך ש־$closure(B) subset.eq Omega$ ולכל $h in C(closure(B))$ הרמונית ב־$B$ המקיימת $u|_boundary(B) <= h|_boundary(B)$ מתקיים $v<=h$ ב־$B$.
]

#proposition[הגדרה שקולה לפונקציה תת־הרמונית במימד אחד][
  במימד אחד פונקציה $v$ היא תת־הרמונית אם ורק אם $v$ קמורה.
]

#remark[
  כל פונקציה הרמונית היא תת־הרמונית.
]

#theorem[עיקרון המקסימום החזק עם פונקציות תת־הרמוניות][
  תהיי $Omega subset.eq RR^n$ תחום ו־$v in C(Omega)$ תת־הרמונית ב־$Omega$. אם $u$ מקבלת מקסימום ב־$Omega$ אז $u$ קבועה ב־$Omega$.
]

#proof[
  נסמן $m = max_(x in Omega) u(x)$ ונביט בקבוצה
  $ A = {x in Omega bar u(x) = M} $
  $A$ קבוצה סגורה ולא ריקה ונראה ש־$A$ פתוחה.\
  יהי $x_0 in A$ כך ש־$u(x_0) = M$ ויהי $closure(B) = closure(B(x_0, r)) subset.eq Omega$.\
  תהיי $h$ הרמונית ב־$B$ כך ש־$h|_boundary(Omega) = v|_boundary(Omega)$ אנו יודעים ש־$u<=h$ ובפרט $m=u(x_0) <= h(x_0)$ ו־$h|_boundary(B) = u|_boundary(Omega)$.\
  אם־כך, $h$ הרמונית ב־$B$ רציפה ב־$closure(B)$, $h<=M$ על $closure(B)$ ו־$h(x_0)=M$ אז מעיקרון המקסימום לפונקציות הרמוניות $h<=M$ ב־$B$ וכן מאחר ש־$h(x_0)=M$ נקודה פנימית שבה מתקדם המקסימום ונובע כי $h eq.triple|_B M$ אבל לכן מרציפות $h$ נובע ש־$h eq.triple|_closure(Omega) M$ אבל $u|_boundary(B) = h|_boundary(B)=M$.\
  מאחר שהרדיוס $r$ שרירותי נקבל ש־$u eq.triple M|_B$ לכל כדור.\
  אז נובע מכך ש־$A$ פתוחה אבל היא גם סגורה ולא ריקה ולכן מקשירות $Omega$ נסיק ש־$A = Omega$.
]

#theorem[עקרון המקסימום החלש לפונקציות תת־הרמוניות][
  תהיי $Omega subset.eq RR^n$ תחום חסום ותהיינה $u in C(closure(Omega))$ תת־הרמונית, $h in C(closure(Omega))$ הרמונית ב־$Omega$.\ אם $u<=h$ על $boundary(Omega)$ אז $u<=h$ ב־$Omega$.
]

#remark[
  למשל, אם $u<=M$ על $boundary(Omega)$ אזי $u<=M$ ב־$Omega$ (זה בעצם ניסוח שקול).
]

#proof[
  נביט ב־$w=u-h$ והיא תת־הרמונית (מהגדרה ואריתמטיקה של פונקציות תת־הרמוניות).\
  תהיי $x_0 in closure(Omega)$ כך ש־$w(x_0) = max_(closure(Omega)) w$.\
  נתון ש־$w<=0$ על $boundary(Omega)$ ונחלק למקרים
  + אם $x_0 in Omega$ אז $w$ קבועה על $closure(Omega)$ מעיקרון המקסימום החזק ולכן $w<=0$ על $boundary(Omega)$ גורר ש־$w<=0$ ב־$Omega$
  + אם $x_0 in boundary(Omega)$ אז
    $ forall x in closure(Omega), space w(x) <= w(x_0) <= 0 $
    כאשר האי־שיוויון הראשון זה כי $x_0$ נקודת מקסימום והשני זה ש־$x_0 in boundary(Omega)$.
  בכל מקרה $w<=0$ ב־$Omega$ כלומר $u<=h$ ב־$Omega$.
]

#proposition[
  אם $u_1, u_2, dots.h, u_N$ תת־הרמוניות ב־$Omega$ אז $v = max{u_1, u_2, dots.h, u_N}$ היא תת־הרמונית ב־$Omega$.
]

#proof[
  יהי $closure(B) subset.eq Omega$ ו־$h in C(closure(B))$ הרמונית ב־$B$ כך ש־$u|_boundary(Omega) <= u|_boundary(Omega)$.\
  אז מתקיים לכל $1<=j<=n$ גם ש־$u_j |_closure(Omega) <= h|_closure(Omega)$ אבל $u_j$ תת־הרמונית ולכן $u_j <= h$ ב־$B$ וזה נכון לכל $j$ ולכן גם $u<=h$.
]

#pagebreak()

הרעיון של שיטת Perron זה לחפש פונקציות תת־הרמוניות $v$ שמקיימות $v|_boundary(Omega) <=g$ ופותרת את מערכת המשוואה הבאה ב־$Omega$  $ cases(Delta u = 0, u|_boundary(Omega) = g) $ אז נגדיר
$ u^(p e r) (x) = sup{v(x) bar v|_boundary(Omega)<=g, v in C(closure(Omega)) "sub-harmonic"} $

#definition[ההרמה ההרמונית][
  תהיי $v$ תת־הרמונית ב־$Omega$ ו־$closure(B) subset.eq Omega$. נגדיר את ההרמה ההרמונית של $v$ לכדור $B$ ב־$closure(v)^B$ כך ש־$closure(v)^B in C(Omega)$ המוגדרת על־ידי
  $ closure(v)^B (x) = mycases(v(x), x in.not B, h(x) x in B) $
  כאשר $h in C(closure(B))$, $h|_boundary(B) = v|_boundary(B)$ ו־$h$ הרמונית ב־$B$.
]

#proposition[
  $closure(v)^B$ היא תת־הרמונית ב־$Omega$.
]

#proof[
  יהי $closure(B^prime) subset.eq Omega$ כדור סגור כלשהו ותהיי $h in C(closure(B^prime))$ הרמונית כך ש־$closure(v)^B|_boundary(B^prime) <= h|_boundary(B^prime)$.\
  נרצה להראות ש־$closure(v)^B <= h$ ב־$B^prime$.\
  נראה תחילה ש־$closure(v)^B = v$ ב־$B^prime without B$ ונשים לב ש־$v<=closure(v)^B$ שכן $v|_boundary(B^prime) <= closure(v)^B |_boundary(B^prime)$ ומאחר ש־$v$ תת־הרמונית נקבל ש־$v<=h$ ב־$B^prime$ ובפרט $closure(v)^B = v <=h$ ב־$B^prime without B$.\
  נראה ש־$closure(v)^B <= h$ ב־$B^prime inter B$, מתקיים
  $
    boundary(B^prime inter B) = underbrace((boundary(B^prime) inter closure(B)), I) union underbrace((closure(B^prime) inter boundary(B)), I I)
  $
  ב־$I$ מתקיים $closure(v)^B<=h$ שכן $boundary(B^prime) inter closure(B) subset.eq boundary(B^prime)$ ונתון ש־$closure(v)^B <=h$ על $boundary(B^prime)$.\
  ב־$I I$ מתקיים ש־$closure(B^prime) inter boundary(B) subset.eq closure(B^prime) without B$ ולכן $closure(v)^B$ מתלכדת עם $v$ ב־$I I$ וראינו ש־$v<=h$ ב־$B^prime$ ולכן גם ב־$B^prime without B$ ועל־כן $closure(v)^B <= h$.
]

#theorem[
  תהיי $u_n$ סדרה חסומה של פונקציות הרמוניות ב־$Omega$. אזי קיימת תת־סדרה $u_n_k$ המתכנסת לפונקציה הרמונית ב־$Omega$ (ההתכנסות היא במידה שווה על כל תת־קבוצה קומפקטית של $Omega$).
]<bounded_harmonic-series_functions_have_sub_converges_harmonic_function>

#proof[
  טבעי לרצות להשתמש במבחן ארצלה הסקאולי מפונקציונלית.\
  נביט ב־$partial_i u$ (כלומר $frac(partial u, partial x_i)$) והיא גם פונקציה הרמונית ולכן לכל $x_0 in Omega$ מתקיים
  $
    partial_i u(x_0) &= frac(1, abs(B(x_0, r))) integral_(B(x_0, r)) (partial_i u) (x) dif x \
    &= frac(1, abs(B(x_0, r))) integral_(B(x,r)) (partial_i u)(x) dot.op 1 dif x \
    &= -frac(1, abs(B(x_0, r))) cancel(integral_(B(x_, r)) u(partial_i 1) dif x) + frac(1, abs(B(x_0, r))) integral_boundary(B(x_0,r)) u dot.op 1 dot.op n_i dif Vol_(n-1) \
    & <= frac(abs(boundary(B(x_0, r))) dot.op max abs(u), abs(B(x_0, r))) \
    & <= frac(C_n r^(n-1), C_n^prime r^n) dot.op max_closure(Omega) abs(u) \
    &=frac(max_closure(Omega) abs(u), r)
  $
  כאשר $r$ קטן דיו עבור $r<dist(K, boundary(Omega))$ עבור $K subset.eq Omega$ קומפקטית.\
  אז לכל $x in K$ מתקיים $abs((partial_i u_n) (x))<=frac(M, r)$ ולכן
  $ abs(u_n (x) - u_n (y))<= max_K abs(gradient u_n) dot.op abs(x-y) <= frac(M, r) abs(x-y) $
  אז $u_n$ רציפה במידה שווה ואפילו ליפשיצית והיא לא תלויה ב־$n$ ולכן רציפה במידה אחידה וממשפט ארצלה הסקאולי נקבל שקיימת תת־סדרה של $u_n_k$ שמתכנסת במידה שווה על $K$ והגבול הזה הרמוני כי הוא גבול במידה שווה, יחד עם טיעון אלכסון $Omega = union.big K_n$ נקבל את הנדרש.
]

#end_of_lecture("21  – 23/06")

#remark[
  לא דיברנו על זה (אבל כן ראינו ביריעות) ש־$v in C^2(Omega)$ תת־הרמונית אם ורק אם $Delta v >= 0$ ולכן יש הרבה מאוד פונקציות תת־הרמוניות וקל לייצר כאלו.
]

#theorem[משפט Perron][
  נגדיר
  $
    S_g colon.eq {v in C(closure(Omega) bar v "sub-harmonic", v|_boundary(Omega)<=g)} \
    u^(p e r) colon.eq sup {v bar v in S_g}
  $
  אז $u^(p e r)$ הרמונית ב־$Omega$ (כלומר מועמד רציני לפיתרון), כאשר הגדרנו
  $ u^(p e r) (x) = sup{v(x) bar v|_boundary(Omega)<=g, v in C(closure(Omega)) "sub-harmonic"} $
]

#proof[
  תהיי $y in Omega$ ולכן קיימת סדרה $v_n in S_g$ כך ש־$v_n (y) stretch(arrow)_(n arrow infinity) u^(p e r) (y)$.\
  נשים לב ש־$v_n <= sup_boundary(Omega) g$ מעיקרון המקסימום.\
  נגדיר $tilde(v)_n colon.eq max{v_n, inf_boundary(Omega) g}$ ונשים לב ש־$tilde(v)_n in S_g$ ומקיימת
  $
    inf g <= tilde(v)_n <= sup g \
    v_n (y) <= tilde(v)_n (y) <=_(tilde(v)_n in S_g) u^(p e r) (y)
  $
  נשים לב ש־$v_n (y) stretch(arrow)_(n arrow infinity) u^(p e r )(y)$ ולכן מכלל הכריך מתקיים $tilde(v)_n (y) stretch(arrow)_(n arrow infinity) u^(p e r)(y)$.\
  מצאנו סדרה חסומה של פונקציות ב־$S_g$ כך שבנקודה $y in Omega$ מתקיים $tilde(v)_n (y) stretch(arrow)_(n arrow infinity) u^(p e r)(y)$.\
  יהי $B = B(y,r) subset.eq Omega$ כך ש־$closure(B) subset.eq Omega$, נשים לב שעם ההרמה ההרמונית $tilde(v)_n <= closure(tilde(v))_n^B$ ולכן $closure(tilde(v))_n^B in S_g$ ואז נקבל את שרשרת אי־השיוויונות
  $ tilde(v)_n <= closure(tilde(v))_n^B <= u^(p e r) $
  ולכן בנקודה $y$ נקבל $closure(tilde(v))_n^B (y) stretch(arrow)_(n arrow infinity) u^(p e r) (y)$.\
  אז $(closure(tilde(v))_n^B)_(n=1)^infinity$ היא סדרה חסומה של פונקציות הרמוניות בכדור $B$ ומ@bounded_harmonic-series_functions_have_sub_converges_harmonic_function קיימת תת־סדרה $closure(tilde(v))_n_k^B$ שמתכנסת ב־$B$ לפונקציה הרמונית $h_v$ ואז נקודתית ב־$B$ מתקיים $ closure(tilde(v))_n_k^B stretch(arrow)_(k arrow infinity) h_v \
  closure(tilde(v))_n_k^B (y) stretch(arrow)_(k arrow infinity) u^(p e r) \
  closure(tilde(v))_n_k^B (y) stretch(arrow)_(k arrow infinity) h_v (y) $
  קיבלנו פונקציה הרמונית $h_v$ ב־$B$ כך ש־$h_v (y) = u^(p e r) (y)$ ונרצה להראות ש־$h_v eq.triple u^(p e r)$ ב־$B$ ונשים לב ש־$h_v <= u^(p e r)$ ב־$B$.\
  נניח בשלילה שקיימת $z in B$ כך ש־$h_v (z) < u^(p e r) (z)$. תהיי $w_k in S_g$ כך ש־$w_k >= closure(tilde(v))_n_k^B$ ו־$w_k (z) arrow u^(p e r)(z)$.\
  קיימת סדרה $hat(w)_k in S_g$ כך שהתנאי השני מתקיים (פשוט מהגדרת הסופרמום) ונגדיר את $w_k$ על־ידי $w_k colon.eq max{hat(w)_k, closure(tilde(v))_n_k^B} in S_g$ ולכן
  $
    closure(tilde(v))_n_k^B <= w_k <= u^(p e r) \
    w_k (z) stretch(arrow)_(k arrow infinity) u^(p e r) (z) \
    w_k (y) stretch(arrow)_(k arrow infinity) u^(p e r)(y)
  $
  ושוב עם ההרמה ההרמונית, $closure(w)_k^B in S_g$ ומתקיים
  $ closure(tilde(v))_n_k^B <= w_k <= closure(w)_k^B <= u^(p e r) $
  נוכל למצוא תת־סדרה מתכנסת $closure(w)_(k_n)^B$ ב־$B$ לפונקציה הרמונית $h_w$.\
  קיבלנו שתי פונקציות הרמוניות ב־$B$ המקיימות $h_v <= h_w$ ו־$h_v (y) = h_w (y) = u^(p e r)(y)$ ויתר על־כן $h_v (z) < h_w (z) = u^(p e r) (z)$ (מהנחת השלילה) וזאת כמובן סתירה כי אם נסתכל על $h_v - h_w <= 0$ אבל ב־$y$ היא מתאפסת וב־$z$ היא קטנה ממש מאפס והיא מקבלת מקסימום בנקודה פנימית אבל פונקציה הרמונית מקבלת מקסימום בנקודה פנימית אם ורק אם היא קבועה (מעיקרון המקסימום החזק) ועל־כן, סתירה.\
  כלומר, $h_v = u^(p e r)$ ב־$B$ ולכן $u^(p e r)$ הרמונית ב־$B$ ומשרירותיות $y$ ו־$B$ נקבל ש־$u^(p e r)$ הרמונית ב־$Omega$.
]

== תנאי שפה
#theorem[
  אם $Omega$ הוא תחום $C^2$ ו־$g:boundary(Omega) arrow RR$ רציפה אז ניתן לפתור באופן יחיד את בעיית דיריכלה ב־$Omega$ $ cases(Delta u =0, u|_boundary(Omega) =g) $
]

נשים לב שהפיתרון הוא יחיד שכן אם יש שני פתרונות ונסתכל על ההפרש שלהם מעיקרון המקסימום והמינימום (זה מתאפס על השפה).\
כיצד נפתור
$ cases(Delta u = f in Omega, u|_boundary(Omega) = g) $
נוכל להגדיר עם מה שראינו לעיל
$
  cases(Delta u_2 = f, u_2 |_boundary(Omega) = 0) quad cases(Delta u_2 = 0, u_2|_boundary(Omega) = g-u_1|_boundary(Omega))
$
כאשר אנחנו עם הקונבולוציה $u_1 colon.eq Gamma * f$ עם $u_1 + u_2 = u$.

#end_of_lecture("22  – 24/06")

= חלקים חשובים מהתרגולים
== שיטות גורם אינטגרציה והפרדת משתנים
#theorem[שיטת גורם האינטגרציה][
  יהי $I subset.eq RR$ קטע, $t_0 in I$ זמן התחלה, $a, f : I arrow RR$ פונקציות רציפות. אזי $x:I arrow RR$ היא פיתרון של המשוואה הדיפרנציאלית $x^prime (t) = a(t) x(t) + f(t)$ אם ורק אם היא מהצורה
  $ x(t) = e^(phi (t)) dot.op (integral_(t_0)^t e^(-phi(s)) f(s) dif s + C) $
  כאשר $phi$ היא פונקציה קדומה ל־$a$ ב־$I$ ו־$C$ קבוע כלשהו.
]
תשלימי....
