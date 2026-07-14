#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: thmbox-init()
#show: article_he.with(
  title: [ הכנה למבחן --- משוואות דיפרנציאליות ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 3)
#let per = math.italic("per")

#let proofKey(
  title: "מפתח להוכחה",
  separator: ":",
  body: [],
  ..args,
) = {
  // set values
  let pa = args.pos()
  let num-pas = pa.len()
  let title = if num-pas == 2 [מפתח להוכחה של #pa.at(0)] else { title }
  let body = if num-pas > 0 and num-pas <= 3 { pa.at(num-pas - 1) } else { body }

  [
    #set text(weight: "bold")
    #title;#separator
  ]
  [#body \ ]
}

= מפתחות למשפטים חשובים
== קיום ויחידות
=== כל מערכת משוואות מסדר $n$ שקולה למערכת משוואות מסדר ראשון
#theorem[
  נניח שנתונה מערכת $m$ משוואות דיפרנציאליות מסדר $n$ כאשר $x^((n)) (t) = F(x(t), x^prime (t), dots.h, x^((n-1)) (t), t)$ עבור $F:U arrow RR^m$ כאשר $U subset.eq R^(n m + 1)$.\
  אז יש מערכת מסדר 1, $y^prime (t) = G(y(t),t)$ עבור $G:V subset.eq RR^(n m + 1) arrow RR^(n m)$ כך שהמערכות שקולות במובן הבא
  + אם $x(t)$ פתרון למערכת המקורית אז $y=(x, x^prime, dots.h, x^((n-1)))$ הוא פתרון למערכת החדשה
  + אם $y$ פתרון למערכת החדשה אזי $x=y_0$ הוא פתרון למערכת המקורית ולכל $0<=i<=n-2$ מתקיים $y_i^prime = y_(i+1)$
]<equivalence_theorem_to_system_from_order_one>

#proofKey[
  לטענת יונתן, קל לראות שהנדרש מתקיים כשמגדירים את המערכת $y^prime (t) = G(y(t), t)$ על־ידי
  $
    cases(
      y_0^prime (t) = y_1 (t),
      y_1^prime (t) = y_2 (t),
      dots.v,
      y_(n-1)^prime (t) = F(y_0 (t), dots.h, y_(n-1) (t), t)
    )
  $

]

=== משפט הקיום של פיאנו
#theorem[משפט הקיום של פיאנו][
  תהיי $U subset.eq RR^n$ פתוחה, $F:U arrow RR^n$ רציפה ו־$tilde(x_0) in U$ נקודת התחלה.\
  אז יש $delta > 0$ ופונקציה גזירה $x:(-delta, delta) arrow U$ שפותרת את בעיית ההתחלה
  $ cases(x(0)= tilde(x_0), x^prime (t) = F(x(t))) $
]<peano_existence_theorem>

#proofKey[
  מספיק לזכור את הבנייה של $x_k$ ו־$y_k$ תחת הרצון להגיע לרציפות במידה שווה כדי להוכיח את הגבול
  $ x(t) = lim_(k arrow infinity) x_k (t) = tilde(x_0) + integral_0^t F(x(s)) dif s $
]

=== משפט פיקארד
#theorem[משפט פיקארד][
  תהיי $U subset.eq RR^n$ פתוחה, $tilde(x_0) in U$ ותהיי $F:U arrow RR^n$ שהיא ליפשיצית מקומית כלומר לכל $K subset.eq U$ קומפקטית יש קבוע $L_K$ כך ש־$F|_K$ ליפשיצית עם הקבוע $L_K$.\
  אזי יש $delta>0$ כך שקיים פתרון יחיד בקטע $[-delta, delta]$ לבעיה
  $ cases(x(0) = tilde(x_0), x^prime (t) = F(x(t))) $
]<picard_existence_theorem>

#proofKey[יונתן מההרצאה][
  מספיק לזכור את הטריק של $tau = inf{t in I inter J inter (0,infinity) bar x(t) != y(t)}$ ומרציפות לחסום את $frac(dif, dif t) norm(x(t)-y(t))^2$ כדי להגדיר \
  $f(t)=e^(-2L t) norm(x(t)-y(t))^2$ ולהגיע לסתירה באמצעות גזירה (אין צורך להוכיח את כל תהליך הגזירה, מספיק להגיד $frac(dif, dif t) f(t) <= -2L f(t) +2 L f(t) = 0$).
]

#proofKey[משפט פיקארד בווריאציה של משפט העתקה מכווצת][
  + מגדירים מהמשפט היסודי
    $ x(t) = x_0 + integral_0^t F(x(s)) dif s, quad K x(t) = x_0 + integral_0^t F(x(s)) dif s $
  + מסתכלים על כדור שחסום על־ידי $C_r$ וזה מרחב מטרי שלם מהקטע $(-delta, delta)$ אז בוחרים $delta<=min(frac(r, 2M_r), frac(1, 2C_r))$ ומראים שחסום $norm(K x(t)-x_0), norm(K x(t) - K y(t))$
  + משפט העתקה מכווצת מסיים
]

#pagebreak()
== תלות בתנאי התחלה
=== טריכוטומיות
#theorem("טריכוטומיה של זרימות של שדה ליפשיץ מקומי")[
  תהיי $U in RR^n$ פתוחה, תהיי $p in U$ ו־$F: U arrow RR^n$ ליפשיץ מקומית.\
  נסמן $X:J_p^* arrow U$ הפיתרון המקסימלי לבעיית ההתחלה
  $ cases(x'(t) = F(x(t)), x(0)=p) $
  אזי עבור $T in boundary(J_p^*) without {plus.minus infinity}$ מתקיים אחד משני המקרים הבאים
  + $display(liminf_( t arrow T) dist(x(t), boundary(U))=0)$
  + $display(limsup_(t arrow T) norm(x(t))=infinity)$
]

#proofKey[
  מניחים שלא ככה, ולכן יש $epsilon_0 > 0$ כך שעבור $A_epsilon_0 = {x bar dist(x, boundary(U)) > frac(epsilon_0, 2)}$ ולכן יש לנו קבוצה שחוסמת, אפשר לקחת סדרת זמנים ששואפת ל־$T$ ועם כל $x_t_k$ אפשר להפעיל את ההוכחה של משפט פיקארד ולקבל $delta>0$ אחידה לכולם אבל אז משפט פיקארד אומר שעבור $T<t_K + delta$ הפיתרון מוגדר, בסתירה לסופרמיות של $T$.
]

#proposition[
  תהיי $U in RR^n$ פתוחה, תהיי $p in U$ ו־$F: U arrow RR^n$ ליפשיץ מקומית.\
  נניח שאנחנו יודעים שקיימת קבוצה קומפקטית $K subset.eq U$ ו־$T>0$ ($T<0$ עובד באופן דומה) כך שלכל $0<t<T$ מתקיים שאם $t in J_p^*$ אז $x_p (t) in K$ אז מתקיים $[0, T) subset.eq J_p^*$.\
  כלומר, אם הפיתרון בתנאי התחלה $p$ קיים עד לזמן $t$ שבפיתרון המקסימלי אז $x_p (t) in K$ אז אם כל זה קורה, $[0,T) subset.eq J_p^*$.
]

#proofKey[
  מניחים בשלילה ולכן הפיתרון מת בזמן מוקדם $tau < T$ אבל מהנתון הוא נמצא בקבוצה הקומפקטית $K$ אבל אז הפיתרון לא יכול לצאת מ־$K$ כלומר לא יכול לגעת בשפה ולא יכול להתפוצץ כי $K$ סגורה וחסומה.
]

#pagebreak()
=== תלות רציפה בתנאי ההתחלה
#theorem[תלות רציפה בתנאי ההתחלה][
  הקבוצה $Omega$ היא קבוצה פתוחה וההעתקה $Phi : Omega arrow U$ היא רציפה ($F$ כמובן ליפשיץ מקומית).
]<continuous_dependence_on_initial_conditions>

#proofKey[
  תהיי $(p, t_0) in Omega$, נרצה להראות ש־$Omega$ מכילה סביבה של $(p, t_0)$ וש־$Phi$ רציפה שם.\
  ניקח $t_0 >= 0$ (לשלילי אותו הדבר אבל אנחנו אנשים חיוביים) ותהיי $ C colon.eq {Phi(p, t) bar 0<=t<=t_0} subset.eq U $
  זאת קבוצה סגורה וחסומה ולכן קומפקטית ויש לה מרחק חיובי מהשפה (כלומר, קיים $r>0$ כך ש־$0<4r<dist(C, boundary(U))$). נסמן
  $
    M colon.eq sup{norm(F(x)) bar dist(x, C) <= 4r} \
    L colon.eq Lip F|_(dist(x, C)<=4r)
  $
  בשביל ההוכחה הזאת אנחנו צריכים $3$ למות.
  #lemma[
    תהיי $q in U$ כך ש־$norm(q-p)<=r e^(-L t_0)$ אזי לכל $0<=t<=t_0$ כך ש־$(q, t) in Omega$ מתקיים
    $ norm(Phi(p, t) - Phi(q, t))<=2e^(L t)norm(p-q)<=2r $
  ]<lemma_1_for_continuous_dependence_on_initial_conditions>

  #proofKey[@lemma_1_for_continuous_dependence_on_initial_conditions][
    נניח בשלילה שלא ככה עבור $0<=t<=t_0$ וניקח את $tau$ כאינפימום של הזמנים המקיימים את הנחת השלילה. מהרציפות כמובן $(q, tau) in Omega$ וכן \
    $norm(x_p (tau) - x_q (tau))=2e^(L tau) norm(p-q)$, וברור שלכל $t in [0,tau]$ מתקיים $norm(x_p (t) - x_q (t))<=2e^(L t) norm(p-q)$.\
    בפרט, מהפעלת הליפשיציות של $F$ נקבל שלכל $t in [0,tau]$ מתקיים $norm(F(x_p (t)) - F(x_q (t)))<=L norm(x_p (t)-x_q (t))$.\
    מהטריק הקבוע של גזירת הנורמה בריבוע מניב שהפונקציה $f(t)=e^(-2L t) norm(x_p (t) - x_q (t))^2$ מונוטונית יורדת בקטע $[0,tau]$. הצבת הקצוות $0$ ו־$tau$ נותנת סתירה ישירה.
  ]

  #lemma[
    תהיי $q$ כזו ש־$norm(p-q)<=r e^(-L t_0)$, אם $(q,t) in Omega$ ו־$0<=t<=t_0+r/M$ אזי $Phi(q, t) in tilde(C)$.
  ]<lemma_2_for_continuous_dependence_on_initial_conditions>

  #proofKey[@lemma_2_for_continuous_dependence_on_initial_conditions][
    נניח בשלילה שהמסלול בורח רחוק מדי (מרחק גדול מ־$4r$) בתוך תוספת הזמן.
    לפי למה 1, עד זמן $t_0$ הפתרון נמצא קרוב (מרחק שקטן מ־$2r$), ולכן הבריחה חייבת לקרות אחרי $t_0$.
    נגדיר את $tau$ כרגע הבריחה המדויק הראשון (שבו המרחק שווה ל־$4r$). עד לרגע זה אנו נשארים באזור שבו המהירות חסומה על ידי $M$ ואז חוסמים את החישוב
    $ dist(Phi(q, tau), C)<=norm(Phi(q, tau) - Phi(q, t_0))+dist(Phi(q, t_0), C) $
  ]

  #lemma[
    נניח ש־$norm(p-q)<=r e^(-L t_0)$ ו־$0<=t<=t_0+r/M$ אזי $(q,t) in Omega$ ומתקיים
    $ norm(Phi(p, t_0)-Phi(q, t))<=2e^(L t_0)norm(p-q)+M norm(t_0 - t) $
  ]<lemma_3_for_continuous_dependence_on_initial_conditions>

  #remark[
    הלמה הזאת מסיימת את ההוכחה של @continuous_dependence_on_initial_conditions עבור $t_0 >=0$.\
    ראשית ברור מכאן ש־$Omega$ פתוחה וכן ש־$Phi$ רציפה עבור $t_0 > 0$ ובמקרה $t_0 = 0$ מקבלים סביבה ימנית ב־$t$ והרציפות היא רציפות מימין ב־$t$ ומהוכחה דומה עבור $t_0 <= 0$ נקבל רציפות משמאל וזה מסיים את ההוכחה.
  ]

  #proofKey[@lemma_3_for_continuous_dependence_on_initial_conditions][
    $(q,t) in Omega$: מלמה 2 הפתרון חסום בקבוצה הקומפקטית $tilde(C)$, ולכן ממשפט הטריכוטומיה של פתרונות מקסימליים הוא אינו יכול לפקוע לפני הזמן $t_0 + r/M$ (כי אינו מתפוצץ ואינו פוגע בשפה).\
    האי־שיוויון: נפרק את המרחק בעזרת אי־שוויון המשולש דרך תחנת הביניים $Phi(q, t_0)$.
    החלק הראשון ($norm(Phi(p, t_0) - Phi(q, t_0))$) חסום על ידי למה 1 (התרחקות הפתרונות לאותו פרק זמן $t_0$).
    החלק השני ($norm(Phi(q, t_0) - Phi(q, t))$) מייצג את המרחק שהפתרון של $q$ עובר בזמן $abs(t-t_0)$. מכיוון שהפתרון נשאר ב־$tilde(C)$, המהירות שלו חסומה ב־$M$, ולכן המרחק חסום על ידי המהירות $M$ כפול הפרש הזמנים.
  ]
]

=== תלות גזירה בתנאי התחלה
#theorem[
  יהי $I subset.eq RR$ קטע פתוח המכיל את $0$, ותהיי $A: I arrow RR^(n times n)$ פונקציה רציפה. אזי לבעיית ההתחלה
  $ cases(M'(t) = A(t) M(t), M(0) = Id) $
  קיים פתרון יחיד $M(t)$ המוגדר על כל הקטע $I$.
]

#proofKey[
  + קיום מקומי: המשוואה לינארית ב־$M$, ולכן ליפשיצית מקומית. משפט פיקארד מבטיח קיום פתרון מקומי סביב כל נקודה.
  + פירוק לעמודות: כדי להקל על העבודה עם נורמות, מפרקים את המשוואה המטריציונית ל־$n$ משוואות וקטוריות נפרדות עבור כל עמודה $v_j$.
  + מניעת פיצוץ (גרונוול): עושים אינטגרציה על שני האגפים ומוציאים נורמה. מקבלים אי־שוויון אינטגרלי שבו הנורמה של הפתרון חסומה על ידי האינטגרל של עצמה. הלמה של גרונוול מבטיחה שהנורמה גדלה לכל היותר בקצב מעריכי (חסם $e^(L t)$), ולכן לעולם אינה מתפוצצת לאינסוף בזמן סופי.
  + קיום גלובלי: לפי משפט הטריכוטומיה, פתרון שאינו מתפוצץ לאינסוף ואינו פוגע בשפה (שהיא כל המרחב), חייב להמשיך להתקיים ולהיות מוגדר על כל הקטע $I$.
]

#theorem[תלות גזירה בתנאי ההתחלה][
  תהיי $U subset.eq RR^n$ פתוחה ו־$p in U$ עם $F:U arrow RR^n$ גזירה ברציפות ובפרט ליפשיץ מקומית.\
  יהי $x_p$ הפיתרון המקסימלי לבעיית ההתחלה
  $ cases(x'(t)=F(x(t)), x(0)=p) $
  ויהי $M(t)$ הפיתרון המקסימלי לבעיית ההתחלה
  $ cases(M'(t)=D F(x(t))M(t), M(0) = Id) $
  אזי לכל $T in J_p^*$, $phi_T$ גזירה ב־$p$ והדיפרנציאל שלה נתון על־ידי $D phi_T (p) = M(t)$.
]

#proofKey[
  יש הרבה שלבים טכניים אז נדבר יותר על הרעיון של ההוכחה.\
  נגדיר
  $ u(t) = x_q (t) - x_p (t) - M(t)(q-p) $
  + פירוק הנגזרת: גוזרים את $u(t)$ ומקבלים ביטוי שאפשר לסדר מחדש כשני חלקים: חלק לינארי ($D F dot.op u$) ועוד שארית טיילור של הפונקציה $F$ (שהיא זניחה).
  + שליטה בשארית: בזכות "תלות רציפה בתנאי ההתחלה" (המשפט הקודם), המסלולים נשארים קרובים מאוד זה לזה. לכן אפשר להבטיח ששארית טיילור נשארת קטנה כרצוננו ($eta$ כאשר קיימת $eta>0$ כך שמתקיים $eta K T e^(T(L + eta)) < epsilon$).
  + הלמה של גרונוול: עושים אינטגרציה על משוואת הנגזרת שקיבלנו. מפעילים את הלמה של גרונוול על הנורמה של השגיאה, והיא מבטיחה לנו שהשגיאה הכוללת נשלטת על ידי השארית הזניחה, ולכן הקירוב הלינארי באמת מתאר את המערכת היטב.
]


#pagebreak()

== משוואות לינאריות עם מקדמים קבועים
#theorem[קיום פיתרון כל עוד המשוואה מוגדרת][
  יהי $I subset.eq RR$ קטע שמכיל את $0$, $A:I arrow RR^(n times n), g:I arrow RR^n$ פונקציות רציפות.  אזי לכל $x_0 in RR^n$ קיים פתרון יחיד אשר מוגדר על כל $I$ לבעיית ההתחלה
  $ (star) space cases(x^prime (t) = A(t) x(t) + g(t), x(0)=x_0) $
]<the_solution_defined_as_long_as_the_equation_defined>

#proofKey[
  1. קיום מקומי: מצמצמים לקטע קומפקטי $I_0$ שעליו הפונקציות $A(t), g(t)$ חסומות (על ידי $L$ ו־$M$). הפונקציה ליפשיצית ב־$x$, ולכן לפי משפט פיקארד מובטח פתרון מקומי.
  2. חסימת קצב הגידול: גוזרים את הנורמה בריבוע ($norm(x(t))^2$) ונעזרים בקושי־שוורץ ומשולש כדי לחסום את הנגזרת מלמעלה על ידי פולינום: $2 L norm(x(t))^2 + 2 M norm(x(t))$.
  3. בליעת האיבר הליניארי: כדי להיפטר מהאיבר הלינארי, "בולעים" אותו אל תוך האיבר הריבועי (מגדילים ל־$4L$) בתוספת קבוע $C$. מתקבל אי־השיוויון \
  $dif/(dif t) norm(x(t))^2 <= 4L norm(x(t))^2 + C$.
  4. גורם אינטגרציה: כופלים באקספוננט $e^(-4 L t)$ כדי לכנס את האגפים לנגזרת אחת, ועושים אינטגרציה. מוכיחים שהפתרון חסום מעריכית ולכן אינו מתפוצץ לאינסוף.
  5. קיום גלובלי (טריכוטומיה): הפתרון אינו פוגע בשפה (המרחב הוא כל $RR^n$) ואינו מתפוצץ בזמן סופי, ולכן ממשפט הטריכוטומיה חייב להיות מוגדר על כל הקטע $I_0$.
]

#theorem[
  מרחב הפתרונות המקסימלי למשוואה $(star)$ עם $g(t)=0$ לכל $t$ (ללא תנאי התחלה) הוא מרחב לינארי ממימד $n$.
]

#proofKey[
  נסמן ב־$eBase_k$ את הוקטור הסטנדרטי ונסמן ב־$x_k$ את הפתרון ל־$(star)$ עם תנאי ההתחלה $x_k (0)=eBase_k$.\
  מראים אי־תלות ופורשת ישירות מהגדרה תחת ההנחה שלכל $t$, $sum_(j=1)^n alpha_j x_j (t) = 0$ ולכן זה בפרט נכון ל־$0$ ואת הפורשת מראים עם משפט פיקארד.
]
=== טענות על אקספוננט
#proposition[
  הטור $exp(A) = sum_(k=0)^infinity frac(A^k, k!)$ כאשר $A^0 = Id$ מתכנס.
]

#proposition[
  אם $A,B in RR^(n times n)$ כך ש־$A B = B A$ אזי $exp(A+B)=exp(A) exp(B)$.
]

#corollary[
  אם $A in RR^(n times n)$ אז $exp(A)$ מטריצה הפיכה ו־$(exp(A))^(-1) = exp(-A)$.
]

#corollary[
  לכל $A in RR^(n times n)$ ההעתקה $t mapsto exp(t A)$ (זו ההעתקה $RR arrow GL_n (RR)$) היא הומומורפיזם של חבורות.
]

#proposition[
  יהי $y$ הפתרון המקסימלי למשוואה
  $
    cases(
      x^prime (t) = A x (t),
      x(0) = x_0,
    )
  $
  ו־$x(t)=exp(t A) x_0$.
  אז $y(t) = exp(t A) x_0$ לכל $t in I$.
]

#proofKey[
  כרגיל מניחים שלא ומסמנים $tau colon.eq inf {t>0 bar x(t) != y(t)}$ ומרציפות כרגיל $y(tau)=x(tau)$.\
  נסמן $z_* = exp(tau A) x_0$ ונתבונן בבעיה
  $ (star star) space cases(z^prime (t) = A z(t), z(tau) = z_*) $
  מאיטרציות פיקארד ידוע שיש סביבה $0<delta$ של $tau$ כך ש־$z(t)=exp((t-tau)A) z_*$ הוא הפיתרון היחיד לבעיה $(star star)$ וגם $y,z$ מתלכדים ומחשבים את $z(t)$ בסביבה עם תכונות האקספוננט ומגיעים לסתירה.
]

#proposition[
  לכל בלוק ז'ורדן $J_lambda in CC^(n times n)$ מתקיים
  $
    exp(t J_lambda) = e^(t lambda) mat(1, t, frac(t^2, 2), dots.h, frac(t^(n-1), (n-1)!); , 1, t, dots.h, frac(t^(n-2), (n-2)!); , , dots.down, dots.down, dots.v; , , , 1, t; , , , , 1)
  $
]

#proofKey[
  באינדוקציה עם נוסחת הבינום.
]

#pagebreak()

== משוואות לינאריות לא הומגניות
#theorem[
  יהיו $A : I arrow RR^(n times n)$ רציפה ו־$g: I arrow RR^n$ רציפה כאשר $I subset.eq RR$ קטע ונסמן ב־$pi(t)$ את מטריצת הפתרונות היסודית למשוואה $x^prime (t) = A(t)x(t)$.\
  אזי פונקציה $y(t)=pi(t)(alpha(0)+integral_0^t pi(s)^(-1) g(s) dif s)$ פותרת את המשוואה $y^prime (t) = A(t)x(t)+g(t)$ עם תנאי ההתחלה $y(0)=pi(0)alpha(0)$.
]

#proofKey[
  גוזרים את $y^prime (t)$ וזוכרים $pi^prime = A(t)pi(t)$ כי זה מטריצת פתרונות יסודית.
]

#corollary[עקרון דוהמל][
  נניח שמטריצת המקדמים קבועה כלומר $A(t) = A$  ו־$x_i (0) = "e"_i$ (הבסיס הסטנדרטי ב־$0$) אז $pi(t) = e^(t A)$ ו־$pi(0)=Id$ ונקבל
  $ y(t)= e^(t A) y_0 + integral_0^t e^((t -s)A) g(s) dif s $
]

#proofKey[
  לא ראינו בהרצאה אבל זה די ברור עם הטענה הקודמת.
]

#pagebreak()

== התנהגות לוקלית, התנהגות גלובלית ויציבות
#theorem[
  תהיי $p in U$ ונניח ש־$F(p)!=0$.\
  אזי קיימות קבוצות פתוחות $p in U_0 subset.eq U_1 subset.eq U$, $V$ פתוחה ב־$RR^n$ כך ש־$0 in V subset.eq RR^n$ ודיפאומורפיזם גזיר ברציפות $alpha:U_1 arrow V$ ו־$delta>0$ כך ש־$alpha(p)=0$ ולכל $x in U_0$ ו־$t in (-delta, delta)$ מתקיים
  $phi_t (x) in U_1$ ו־$alpha(phi_t (x))=alpha(x)+(t, 0, dots.h, 0)$.
]

#proof[
  + בלי הגבלת הכלליות $p=0$ ומסתכלים על הנגזרות החלקיות של $Phi(t, x)$ בראשית
  + מכיוון ש־$F(0)!=0$ מרחיבים לבסיס עם וקטורי הבסיס הסטנדרטי
  + מגדירים העתקה $beta$ מסביבה של $0$ ב־$RR^n$ ל־$RR^n$ על־ידי $beta(t, x_1, dots.h, x_(n-1))=phi_t (x_1, x_2, dots.h, x_(n-1), 0)$
  + משפט הפונקציה ההפוכה נקבל דיפאומורפיזם $alpha=beta^(-1)$ גזיר ברציפות ונקבל את התנאי הראשון ובשביל השני נחשב את $alpha(phi_t (x))$ עבור $ x=beta(s, y_1, dots.h, y_(n-1))=phi_s (y_1, dots.h, y_(n-1), 0) $

]

#lemma[
  תהיי $A in CC^(n times n)$ מטריצה עם קבוצת ערכים עצמיים $Lambda subset.eq CC$ ונניח ש־$max_(lambda in Lambda) re(lambda)<0$.\
  אזי לכל $0<alpha<min_(lambda in Lambda) abs(re(lambda))$ יש $C>0$ כך שלכל $t>=0$ מתקיים $normop(exp(t A)) <= C e^(-t alpha)$ ובפרט $lim_(t arrow infinity) exp(t A)=0$.
]<lemma_before_linear_criterion_for_asymptotic_stability>

#proofKey[
  לוקחים צורת ז'ורדן $J= P A P^(-1)$ ומסתכלים על המטריצה $J+alpha I$, זאת מטריצה בצורת ז'ורדן שלכל ערכייה העצמיים חלק ממשי שלילי והם פולינומים עם מעריך שלילי ולכן קיים חסם
  $ sup_(t >=0) normop(exp(t(J + alpha I))) <= C^prime $
  נשאר רק לחשב את $normop(exp(t A))$ ואת זה עושים עם הצורת ז'ורדן לעיל ועם החילופיות של האקספוננט שכן מטרויצת היחידה הסקלרית מתחלפת עם כל מטריצה.
]

=== הקריטריון הלינארי ליציבות אסימפטוטית
#theorem[הקריטריון הלינארי ליציבות אסימפטוטית][
  תהיי $p in U$ נקודת שיווי משקל של $F$ ונניח שלכל ערך עצמי של $D F(p)$ יש חלק ממשי שלילי. אזי $p$ יציבה אסימפטוטית.
]<linear-criterion-for-asymptotic-stability>

#proofKey[
  + דיפרנציאל כאקספוננט: מכיוון ש־$p$ היא נקודת שבת, משוואת הדיפרנציאל של הזרימה היא לינארית עם מקדמים קבועים, ופתרונה הוא האקספוננט המטריציוני $exp(t D F(p))$
  + כיווץ בזמן מוגדר $T$: מכיוון שהחלק הממשי של הערכים העצמיים שלילי, הנורמה של האקספוננט דועכת לאפס. לכן קיים זמן $T$ שבו הדיפרנציאל קטן מ־$frac(1, 4)$
  + מסתכלים על הפיתוח
    $ phi_T (q) = phi_T (p) + D phi_T (p) (q-p) + o(norm(q-p)) $
    ולכן על־ידי הקטנה של $delta$ אם צריך נוכל להניח שהמחובר $o(p-q)$ לא עולה על $1/4 normop(p-q)$, כלומר $normop(phi_T (q) - phi_T (p)) <= normop(q-p)/2$
  + מחזוריות (קפיצות $k T$): מפעילים את הכיווץ באופן אינדוקטיבי בכל מחזור $T$, ומקבלים שבזמנים $k T$ המרחק דועך לאפס כמו $2^(-k)$ וזה בידיוק הגדרה של יציבות.
  + השלמה בין קפיצות: הרציפות בתנאי ההתחלה מבטיחה שבין זמני הקפיצות (בתוך הקטעים $[0,T]$) המסלול לא משתולל ובורח מהסביבה. השילוב של הדעיכה הבדידה והרציפות הביניים מבטיח יציבות ויציבות אסימפטוטית.
]
=== משפט ליאפונוב
#theorem[משפט ליאפונוב][
  תהיי $x_0 in U$ נקודת שיווי משקל של $F$. אם ל־$F$ יש פונקציית ליאפונוב ב־$x_0$ אז $x_0$ יציבה ואם ל־$F$ יש פונקציית ליאפונוב חזקה ב־$x_0$ אז $x_0$ יציבה אסימפטוטית.
]

#proofKey[
  #underline("אם יש פונקציית ליאפונוב אז יש יציבות):")
  הפונקציה $L$ יורדת לאורך המסלול מכלל השרשרת. מכיוון ש־$x_0$ היא מינימום חזק, הערך המינימלי של $L$ על שפת כדור $epsilon$ גדול מ־$L(x_0)$. לכן אפשר למצוא סביבה התחלתית קטנה יותר $delta$ שבה המקסימום של $L$ עדיין קטן מהמינימום שעל השפה הרחוקה. פתרון שמתחיל בסביבת ה־$delta$ הקטנה לעולם לא יוכל לחצות את שפת ה־$epsilon$, כי זה ידרוש מהפונקציה $L$ לעלות מתישהו, וזו סתירה למונוטוניות.

  #underline("אם יש ליאפונוב חזקה אז יש יציבות אסימפטוטית:")
  נניח בשלילה שהמסלול לא מתכנס ל־$x_0$. לכן הוא מתרחק לסירוגין ושוהה אינסוף פעמים במרחק של לפחות $epsilon$ מ־$x_0$.
  מכיוון שהמהירות של המסלול חסומה (על ידי $M$), לוקח לו זמן לברוח ולחזור, וכל "ביקור" כזה מאלץ אותו לשהות פרק זמן מינימלי ($epsilon/(2M)$) בתוך טבעת מרוחקת.
  בטבעת הזו, הנגזרת של $L$ (פונקציית ליאפונוב חזקה) היא שלילית ממש ורחוקה מאפס (חסומה על ידי קבוע שלילי). לכן, בכל ביקור כזה $L$ צונחת למטה בכמות קבועה לפחות. סכימה של אינסוף צניחות כאלו גוררת ש־$L stretch(arrow)_(t arrow infinity) - infinity$, וזו סתירה לכך ש־$L$ רציפה וחסומה מלמטה על קבוצה קומפקטית.\
  ההוכחה עצמה מאוד טכנית אז זה יותר רעיון.
]

#theorem[הקריטריון הלינארי לאי־יציבות][
  תהיי $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ שדה גזיר ברציפות ו־$x_o in U$ נקודת שיווי משקל.  אם ל־$D F(x_0)$ יש ערך עצמי עם חלק ממשי חיובי אז $x_0$ לא יציבה.
]

#proofKey[
  תחת ההנחה שאין ערכים עצמיים עם חלק ממשי אפס ומפרקים ל־$H_plus plus.o H_minus$ בהתאם לסימן של הערך הממשי של ערך עצמי עם $pi_plus.minus$ ההטלות המתאימות.\
  מניחים בשלילה ש־$x_0 = 0$ יציבה ומגדירים $g(x)=F(x)-A x$ כך שיתקיים
  $ x^prime (t) = F(x(t)) = A x(t) + g(x(t)) $
  לכן ניתן לכתוב את הפתרון למשוואה באופן הבא (עקרון דוהמל)
  $ (star star) space x(t) = e^(t A) x(0) + integral_0^t e^((t-s)A) g(x(s)) dif s $
  להמשך ההוכחה אנחנו צריכים שתי למות
  #lemma[
    קיים $R>0$ כך שאם $x:[0,infinity) arrow B_R (0)$ פותרת את המשוואה $x^prime (t) = F(x(t))$ אז
    $
      x(t)=e^(t A) pi_minus (x(0)) + integral_0^t e^((t-s) A) pi_minus g(x(s)) dif s - integral_t^infinity e^((t-s)A) pi_plus g(x(s)) dif s
    $
  ]<first-lemma-for-the-linear-criterion-for-instable>

  #proofKey[@first-lemma-for-the-linear-criterion-for-instable][
    המטרה שלנו זה להראות שאם הפתרון נשאר חסום לכל $t>0$ (הנחת השלילה של יציבות), אפשר לכתוב אותו בצורה אינטגרלית שמפרידה בין החלק המתכווץ ($pi_minus$) לחלק המתפוצץ ($pi_plus$).
    + פירוק ועיקרון דוהמל: מפרידים את המערכת לחלק לינארי ($A x$) וחלק לא לינארי שהוא $o(norm(x))$ ($g(x)$), וכותבים את הפתרון כאינטגרל.
    + הטלה מתפוצצת: מטילים את המשוואה על המרחב המתפוצץ ($pi_plus$) ומכפילים ב־$e^(-t A)$.
    + חסימות וגבולות: מכיוון שהנחנו שהפתרון חסום (נמצא ב־$B_R(0)$), והאופרטור $e^(-t A)$ מכווץ על תת־המרחב $pi_plus$ (כי החזקה שלילית והערכים העצמיים חיוביים), אגף שמאל שואף לאפס כש־$t arrow infinity$.
    + בידוד התחלה: כתוצאה מהגבול, מקבלים ש־$pi_plus (x(0))$ חייב להיות שווה לאינטגרל מ־$0$ עד אינסוף, מה שמאפשר להציב אותו חזרה בנוסחת דוהמל המקורית ולקבל הצגה חדשה שמסתמכת רק על $pi_minus (x(0))$.
  ]

  #lemma[
    קיים $R>R_0 > 0$ מהלמה הקודמת כך שאם $x,y : [0,infinity) arrow B_(R_0) (0)$ הם פתרונות ל־$x^prime = F(x)$ כך ש־$pi_minus (x(0)) = pi_minus (y(0))$ אז $x(t)=y(t)$ לכל $t$.
  ]<second-lemma-for-the-linear-criterion-for-instable>

  #proofKey[
    המטרה: להראות שאם שני פתרונות נשארים חסומים ($x(t), y(t) in B_(R_0)$) ומסכימים על החלק המתכווץ בתנאי ההתחלה שלהם ($pi_minus (x(0)) = pi_minus (y(0))$), הם בהכרח זהים לחלוטין.
    + הפרש פתרונות: מציבים את ההצגה האינטגרלית מהלמה הקודמת עבור $x$ ו־$y$, ומחסרים. תנאי ההתחלה מבטלים זה את זה.
    + שליטה לא לינארית: מכיוון שהפונקציה חלקה מספיק (גזירה ברציפות), ניתן להראות שבסביבה קטנה $B_(R_0)$, הפער $norm(g(x) - g(y))$ נשלט על ידי $epsilon norm(x-y)$.
    + חסם אינטגרלי: מפעילים נורמה ומשתמשים בחסמים המעריכיים מהלמה הקודמת (דעיכה $e^(-mu abs(t))$) על שני האינטגרלים.
    + סתירה למקסימום: חוסמים את הפער המקסימלי $d = sup norm(x(t)-y(t))$. מקבלים אי־שוויון מהצורה $d <= (2 epsilon C / mu) d$.\
      אם בוחרים את סביבת $R_0$ כך ש־$epsilon$ יהיה מספיק קטן, מקבלים $d <= d/2$, מה שאפשרי רק אם $d=0$, כלומר הפתרונות זהים.
  ]
  סיום משפט אי־היציבות: אם הייתה יציבות, כל נקודה קרובה הייתה נשארת חסומה. היינו יכולים לבחור שתי נקודות שונות שמסכימות על $pi_minus$ אך שונות ב־$pi_plus$. הלמה הייתה מכריחה את הפתרונות להתלכד למרות שהתחילו בנקודות שונות, וזו סתירה מוחלטת ליחידות משפט פיקארד.
]


#pagebreak()
== משוואות דיפרנציאליות חלקיות
=== פונקציות הרמוניות
#theorem[תכונת הערך הממוצע של פונקציות הרמוניות][
  תהיי $Omega subset.eq RR^n$ פתוחה ותהיי $u in C^2 (Omega)$ אזי $u$ הרמונית ב־$Omega$ אם ורק אם לכל $closure(B(x_0, r_0)) subset.eq Omega$ (כדור שהסגור שלו ב־$Omega$) מתקיים
  $
    integral.slash_(B(x_0, r_0)) u dif V = u(x_0) = integral.slash_(boundary(B(x_0, r_0))) u dif S
  $
]

#proofKey[
  בכיוון הראשון מניחים ש־$u$ הרמונית.\
  מגדירים $phi(r) = integral.slash_(boundary(B(x_0, r))) u dif S$ ואת $psi_r : closure(B(0,1)) arrow closure(B(x_0, r))$ על־ידי $psi_r (y) = x_0 + r y$ אז $psi_r$ הוא דיפאומורפיזם בין השפות עם יעקוביאן $r^(n-1)$ ובגלל \
  ש־$Area(boundary(B(0,1))) dot.op r^(n-1) = Area(boundary(B(x_0, r)))$ נקבל $phi(r) = integral.slash_boundary(B(0,1)) (u compose psi_r) dif S$.\
  גוזרים את זה ובשימוש עם משפט הדבירגנץ והרמוניות מקבלים ש־$phi^prime (r) = 0$ ומרציפות היא קבועה $u(x_0)$.\
  נשאר להראות את השיוויון השני, אבל זה פשוט מהתוצאה הקודמת
  $
    integral.slash_(B(x_0, r_0)) u dif v = 1/Vol(B(x_0, r_0)) integral_0^(r_0) dif r (Area(boundary(B(x_0, r))))/(Area(boundary(B(x_0, r)))) integral_boundary(B(x_0, r)) u dif S
  $
  הכיוון השני נובע מהנחת השלילה ואז בלי הגבלת הכלליות $Delta u > 0$ אבל זאת סתירה לכך ש־$phi^prime (r) =0$.
]

#theorem[עיקרון המקסימום לפונקציות הרמוניות][
  נניח ש־$Omega subset.eq RR^n$ פתוחה וחסומה ונניח ש־$u in C^2 (Omega) inter C(closure(Omega))$ הרמונית.
  + העיקרון החלש – המקסימום מתקבל על השפה, כלומר $max u (closure(Omega)) = max u(boundary(Omega))$
  + העיקרון החזק – אם $Omega$ קשירה וקיים $x_0 in Omega$ כך ש־$u(x_0) = max u(closure(Omega))$ אז $u$ קבועה
]

#proofKey[
  + מערך הממוצע של פונקציות הרמוניות כי אחרת יש סביבה שבה כל הערכים קטנים ממש מהמקסימום ואז בפרט הממוצע בסביבה הזאת לא יכול להיות המקסימום, סתירה
  + מגדירים $A colon.eq {y in Omega bar u(x_0)=u(y)}$ ומסבירים למה ממשפט הערך הממוצע של פונקציות הרמוניות היא גם פתוחה, גם סגורה, גם לא ריקה ומקשירות מסיימים.
]

#corollary[
  אם $u,v in C^2 (Omega) inter C(closure(U))$ כאשר $Omega$ פתוחה וחסומה ומתקיים ש־$u|_boundary(Omega)=v|_boundary(Omega)$ ו־$Delta u = Delta v$.
  אז $u=v$.
]

#theorem[
  תהיי $Omega subset.eq RR^n$ פתוחה ונניח ש־$u in C(Omega)$ מקיימת את תכונת הערך הממוצע ב־$Omega$. אזי $u in C^infinity (Omega)$ (חלקה) ובפרט הרמונית.
]

#proofKey[
  זוכרים בלב את ההגדרה המאוד ארוכה הבאה:  נקבע פונקציה חלקה ואי־שלילית $eta:(0, infinity) arrow RR$ המקיימת $eta|_([0,1/2)) = 1$ ועבור $x>=1$ ניקח $eta(x)=0$.\
  בהינתן $epsilon > 0$ נגדיר $phi_epsilon : RR^n arrow RR$ על־ידי
  $ phi_epsilon = frac(1, epsilon^n) frac(eta(frac(norm(x), epsilon)), integral_(RR^n) eta(norm(y)) dif y) $
  $phi_epsilon$ חלקה, רדיאלית הנתמכת על $B(0,epsilon)$ ומקיימת $integral_(RR^n) phi_epsilon (y) dif y = 1$.

  #definition[שיכוך][
    יהי $Omega subset.eq RR^n$ תחום ולכל $epsilon > 0$ נסמן $Omega_epsilon colon.eq {x in Omega bar dist(x, boundary(Omega))>epsilon}$.\
    עבור $u in C(Omega)$ ו־$epsilon > 0$ נגדיר את השיכוך של $u$ בסקאלה $epsilon$ להיות הפונקציה  $u^epsilon : Omega_epsilon arrow RR$ שנתונה על־ידי
    $ u^epsilon = phi_epsilon * u = integral_(RR^n) phi_epsilon (x-y) u(y) dif y $
    בפרט $u^epsilon$ חלקה (הוכחנו בתרגיל 10).
  ]

  מספיק להראות שלכל $epsilon > 0$ מתקיים $u|_Omega_epsilon = u^epsilon$ מחשבים את $phi^epsilon (x)$ לפי פתיחת סוגריים של קונבולוציה $<--$ משתמשים בתכונת ערך הממוצע שנתונה $<--$ אורזים בחזרה אחורה $<--$ זוכרים ש־$phi^epsilon$ מנורמלת כאינטגרל על כל המרחב וסיימנו.
]

#corollary[
  פונקציות הרמוניות הן חלקות.
]

#corollary[
  גבול במידה שווה של פונקציות הרמוניות הוא הרמוני (ב־$Omega subset.eq RR^n$ פתוחה).
]

#theorem[הערכת נגזרות לפונקציות הרמוניות][
  לכל $n, k in NN$ יש קבוע $0<C(n,k)$ כך שלכל קבוצה פתוחה $Omega subset.eq RR^n$ ולכל $u:Omega arrow RR$ הרמונית ולכל מולטי־אינדקס $alpha = (alpha_1, dots.h, alpha_n)$ (אינדקס וקטורי) עם $abs(alpha)=sum alpha_i = k$ ולכל $closure(B(x,r)) subset.eq Omega$ מתקיים
  $
    abs(D^alpha u(x)) = abs(frac(partial^(alpha_1), partial x_1^(alpha_1)) frac(partial^(alpha_2), partial x_2^(alpha_2)) dots.h.c frac(partial^(alpha_n), partial x_n^(alpha_n)) u(x)) <= integral_(B(x,r)) abs(D^alpha phi_r (x-y)) abs(u(y)) dif y <= frac(C(n comma k), r^(n+k)) integral_(B(x,r)) abs(u(y)) dif y
  $
]

#proofKey[
  מתקיים $u|_Omega_r = u^r$ ולכן $D^alpha u(x) = D^alpha phi_r * u$ כאשר
  $ phi_r (x-y)=frac(1, r^n integral_(RR^n) eta(norm(z)) dif z) eta(frac(norm(x-y), r)) $
  על־כל גזירה יוצאת חזקה של $r$ החוצה ואת שאר הגורמים ניתן לחסום יוניפורמית מכך ש־$eta$ נתמכת קומפקטית וחלקה ואז (וגם את הנגזרות שלה מסדר גדול שווה ל־$k$ וגם לחסום צירופים לינאריים ומכפלות שלהם) ולכן יש $C(n,k)$ גדול מספיק החוסם כנדרש.
]

#theorem[אי־שיוויון הרנאק][
  יהי $Omega subset.eq RR^n$ קבוצה פתוחה ותהיי $V subset.eq Omega$ פתוחה, קשירה וחסומה כך ש־$closure(V) subset.eq Omega$. אזי יש קבוע $0<C(Omega, V)$ כך שלכל $u : Omega arrow RR$ הרמונית ואי־שלילית מתקיים
  $ sup u(V) <= C(Omega, V) dot.op inf u(V) $
]

#proofKey[
  מוכיחים למקרה פרטי – נניח ש־$V=B(x,r)$ ונניח גם ש־$closure(B(x_0,4r)) subset.eq Omega$ ונקבע $x_0, x_1 in V$ מאי־שיוויון המשולש $B(x_1, r) subset.eq B(x_0, 3r)$\
  ו־$closure(B(x_0, 3r)) subset.eq Omega$ ולכן מערך הממוצע ומאי־שליליות של $u$ חוסמים
  $ u(x_0) = 1/Vol(B(x_0, 3r)) integral_(B(x_0, 3r)) u(y) dif y >= dots.h.c >= 3^(-n) u(x_1) $
  למקרה הכללי, מקומפקטיות יש אוסף סופי של נקודות $p_1, dots.h, p_M in closure(V)$ ורדיוסים $r_1, dots.h, r_M > 0$ כך ש־$closure(V) subset.eq union.big_(i=1)^M B(p_i, r_i)$ ו־$closure(B(p_i, 4r_i)) subset.eq Omega$ לכל $i$.\
  מקבעים שתי נקודות ומקשירות יש מסילה שמחברת ביניהן ומכוסה על־ידי $M$ כדורים שיחד עם המקרה הפרטי כשמניחים שלא עוברים בין אותו כדור פעמייים צוברים את הפקטור של המקרה הפרטי וזה מסיים.
]

=== פונקציות תת־הרמוניות
הכי חשוב לזכור את ההגדרה
#definition[פונקציה תת־הרמונית][
  תהיי $Omega subset.eq RR^n$ תחום (קבוצה פתוחה וקשירה). $v in C(Omega)$ תקרא תת־הרמונית ב־$Omega$ אם לכל $B subset.eq Omega$ כדור פתוח כך ש־$closure(B) subset.eq Omega$ ולכל $h in C(closure(B))$ הרמונית ב־$B$ המקיימת $v|_boundary(B) <= h|_boundary(B)$ מתקיים $v<=h$ ב־$B$.
]

#theorem[עיקרון המקסימום החזק עם פונקציות תת־הרמוניות][
  יהי $Omega subset.eq RR^n$ תחום ותהיי $u in C(Omega)$ תת־הרמונית ב־$Omega$. אם $u$ מקבלת מקסימום ב־$Omega$ אז $u$ קבועה ב־$Omega$.
]

#proofKey[
  נסמן
  $ M colon.eq max_(x in Omega) u(x), quad A colon.eq {x in Omega bar u(x) = M} $
  מאחר ש־$u$ רציפה נובע ש־$A$ סגורה ב־$Omega$ ולא ריקה ויהיו $x_0 in A$, $B=B(x_0, r)$ כדור כך ש־$closure(B) subset.eq Omega$.\
  ישירות מהגדרת פונקציות הרמוניות ופונקציות תת־הרמוניות עם עיקרון המקסימום לפונקציות הרמוניות מראים ש־$h eq.triple M$ ולכן זה נכון גם על שפת הכדור ולכן הכדור הפתוח $B$ מוכל ב־$A$ שפתוחה, סגורה, לא ריקה ומקשירות סיימנו.
]

#theorem[עקרון המקסימום החלש לפונקציות תת־הרמוניות][
  יהי $Omega subset.eq RR^n$ תחום חסום ותהיינה $u in C(closure(Omega))$ תת־הרמונית, $h in C(closure(Omega))$ הרמונית ב־$Omega$. אם $u<=h$ על $boundary(Omega)$ אז $u<=h$ ב־$Omega$.
]


#proofKey[
  נביט ב־$w=u-h$ והיא תת־הרמונית, לוקחים $x_0 in closure(Omega)$ שהוא המקסימלי ו־$w<=0$ עליו ולכן נחלק למקרים עבור $x_0 in Omega$ ו־$x_0 in boundary(Omega)$ וזה די ישיר מכאן.
]

#proposition[
  אם $u_1, u_2, dots.h, u_N$ תת־הרמוניות ב־$Omega$ אז $u = max{u_1, u_2, dots.h, u_N}$ היא תת־הרמונית ב־$Omega$.
]

=== הרמות הרמוניות
#definition[$bold(u^per)$][
  $ u^per (x) = sup{v(x) bar v|_boundary(Omega)<=g, v in C(closure(Omega)) "sub-harmonic"} $
]

#definition[ההרמה ההרמונית][
  תהיי $v$ תת־הרמונית ב־$Omega$ ו־$closure(B) subset.eq Omega$. נגדיר את ההרמה ההרמונית של $v$ לכדור $B$ ב־$V$ כך ש־$V in C(Omega)$ המוגדרת על־ידי
  $ V (x) = mycases(v(x), x in.not B, overline(v)(x), x in B) $
  כאשר $overline(v) in C(closure(B))$, $overline(v)|_boundary(B) = v|_boundary(B)$ ו־$overline(v)$ הרמונית ב־$B$.
]

#proposition[
  $V$ היא תת־הרמונית ב־$Omega$.
]<harmonic_lift_is_subharmonic>

#proofKey[
  + לוקחים כדור שרירותי $C$ ופונקציה הרמונית $h$ שחוסמת את $V$ ממעל על השפה $boundary(C)$. נדרש להראות ש־$V <= h$ בתוך $C$.
  + שליטה מחוץ לכדור הפנימי: מכיוון ש־$V>=v$ והנחנו $V<=h$ על $boundary(C)$, נובע ש־$v<=h$ על $boundary(C)$. כיוון ש־$v$ תת־הרמונית, עיקרון המקסימום גורר ש־$v<=h$ בכל $C$. מכיוון שמחוץ לכדור $B$ מתקיים $V=v$, קיבלנו ש־$V<=h$ בקבוצה $C without B$.
  + שליטה בתוך הכדור הפנימי: נותר לבדוק את החיתוך $U = B inter C$. השפה שלו מורכבת מחלקים שנמצאים על $boundary(B)$ או על $boundary(C)$, ובשניהם הראינו כבר ש־$V<=h$.
  + מסיימים עם עיקרון המקסימום
]

#theorem[
  תהיי $u_n$ סדרה חסומה של פונקציות הרמוניות ב־$Omega$. אזי קיימת תת־סדרה $u_n_k$ המתכנסת לפונקציה הרמונית ב־$Omega$ (ההתכנסות היא במידה שווה על כל תת־קבוצה קומפקטית של $Omega$).
]<bounded_harmonic-series_functions_have_sub_converges_harmonic_function>

#proofKey[
  גם הנגזרות של פונקציה הרמונית הן פונקציה הרמונית עם אינטגרציה בחלקים עם הפונקציה הקבועה $1$ על
  $ partial_i u(x_0) = frac(1, abs(B(x_0, r))) integral_(B(x_0, r)) (partial_i u) (x) dif x $
  וחסם על היחס בין נפח לשטח מביא לנו חסם של $frac(max_closure(Omega) u, r)$ עבור $r<dist(K, boundary(Omega))$ קטן דיו ואז אפשר לחסום על קבוצה קומפקטית $K$
  $ abs(u_n (x) - u_n (y))<= max_K abs(gradient u_n) dot.op abs(x-y) <= frac(max_closure(Omega) abs(u), r) abs(x-y) $
  ומטיעון אלכסון עם ארצלה־אקסולי על $K_1 subset.eq K_2 subset.eq dots.h.c$ כך ש־$union.big_(m) K_m = Omega$ נסיים.
]

#theorem[משפט Perron][
  נגדיר
  $
    S_g colon.eq {v in C(closure(Omega) bar v "sub-harmonic", v|_boundary(Omega)<=g)}, quad u^per colon.eq sup {v bar v in S_g}
  $
  אז $u^per$ הרמונית ב־$Omega$ (כלומר מועמד רציני לפיתרון).
]

#proofKey[
  + בוחרים נקודה $y$ ומוצאים סדרה של פונקציות תת־הרמוניות $v_n$ שמתכנסת ל־$u^per (y)$. קוטמים אותן מלמטה (כדי להבטיח חסימות) מבלי להרוס את התכונה התת־הרמונית.
  + מרימים: מפעילים על הסדרה הרמה הרמונית בתוך כדור $B$ סביב $y$. מתקבלת סדרת פונקציות $V_n$ שגדולות יותר מהמקוריות אבל קטנות מ־$u^per$, והן הרמוניות ב־$B$.
  + התכנסות לגבול הרמוני $h_v$: לפי משפט שראינו, יש תת־סדרה שמתכנסת במידה שווה לפונקציה הרמונית $h_v$. ברור ש־$h_v (y) = u^per (y)$ וש־$h_v <= u^per$ בכל מקום.
  + נניח בשלילה שקיימת נקודה $z$ בכדור שבה $h_v (z) < u^per (z)$. בונים סדרה חדשה $w_n$ שממקסמת את הערך ב־$z$, דורשים שהיא תהיה גדולה מ־$V_n$, ומרימים גם אותה להרמונית $W_n$.
  + סיום עם עיקרון המקסימום: הגבול החדש $h_w$ חייב להיות הרמוני, והוא מסכים עם $h_v$ בנקודה $y$, אבל גדול ממנו בנקודה $z$. זה אומר שההפרש $h_v - h_w$ הוא פונקציה הרמונית שלילית שמקבלת מקסימום ($0$) בנקודה הפנימית $y$, וזו סתירה לעיקרון המקסימום החזק. לכן $h_v$ שווה זהותית ל־$u^per$ והיא בהכרח הרמונית.
]

= דברים חשובים מתרגילים
== תרגיל 1
=== שיטת גורם האינטגרציה
#theorem[
  יהי $J in RR$ מקטע ונקבע $t_0 in J$. נניח כי $a,f : J arrow RR$ רציפות ונוכיח כי $x : J arrow RR$ פותרת את המשוואה
  $ x^prime (t) = a(t) x(t) + f(t) $
  אם ורק אם קיים $c in RR$ כך שמתקיים
  $ x(t) = e^(phi(t)) (integral_(t_0)^t e^(-phi(s)) f(s) dif s + c) $
  כאשר
  $ phi(t) = integral_(t_0)^t a(s) dif s $
]<integrating_factor_method>

#proof[ \
  $<==$ מגדירים $y(t) = e^(-phi(t)) x(t)$ וגוזרים ואז מתכונות נגזרת אקספוננט נובע שקיים $c in RR$ כך שמתקיים
  $ y(t) = integral_(t_0)^t e^(-phi(s)) f(s) dif s + c $
  $==>$ $x$ גזירה ברציפות ולכן מכלל שרשרת מסיימים.
]

== תרגיל 2
=== הלמה של גרונוול
#lemma[הלמה של גרונוול][
  יהי $delta > 0$ ותהיינה $a, u : [0,delta] arrow RR$ כך שך־$a$ רציפה ו־$u$ גזירה ברציפות. נניח כי לכל $t in (0,delta)$ מתקיים
  $ u^prime (t) <= a(t) u(t) $
  + מתקים ש־$v(t)=e^(integral_0^t a(s) dif s)$ היא פיתרון לבעיה
    $ cases(v^prime (t) = a(t)v(t), v(0)=1) $
  + לכל $t in [0,delta)$ מתקיים
    $ u(t) <= u(0) v(t) $
]
#proof[
  + נסמן $g(t) = integral_0^t a(s) dif s$ וגוזרים לפי כלל שרשרת, מציבים $0$ וסיימנו
  + נסתכל על $w(t) = frac(u(t), v(t))$, גוזרים ועם הסעיף הקודם רואים שהיא מונוטונית יורדת, מציבים $0$ ומסיימים
]

== תרגיל 3
=== משפט פיקארד עבור משוואות לינאריות עם מקדמים קבועים
#theorem[
  יהי $I subset.eq RR$ קטע שמכיל את $0$, $A:I arrow RR^(n times n), g:I arrow RR^n$ פונקציות רציפות.\
  אזי לכל $x_0 in RR^n$ קיים פתרון יחיד אשר מוגדר על כל $I$ לבעיית ההתחלה
  $ (star) space cases(x^prime (t) = A(t) x(t) + g(t), x(0)=x_0) $
]

#proof[
  ראה @the_solution_defined_as_long_as_the_equation_defined.
]

= דברים טכניים
== שימוש בשיטת גורם האינטגרציה
ראה @integrating_factor_method.
#example[
  נמצא את הפיתרון למשוואה $x^prime (t) = frac(t, t+1) x(t)+1$ עם תנאי ההתחלה $x(0)=1$ בתחום $(-1, infinity)$.
]

#proof[
  בשביל להשתמש ב@integrating_factor_method
  נגדיר
  $
    a(t) = frac(t, t+1) \
    f(t) = 1
  $
  אלו פונקציות רציפות ב־$(-1, infinity)$ ועבור $t_0 = 0$ מתקיים
  $ phi(t) = integral_0^t a(s) dif s = integral_0^t frac(s, s+1) dif s = t-ln(t+1) $
  שהאחרונה מוגדרת היטב בתחום שלנו ולכן הפיתרון הוא מהצורה
  $
    x(t) = e^(phi(t)) (integral_(t_0)^t e^(-phi(s)) f(s) dif s + c ) = frac(e^t, t+1) (integral_0^t frac(s+1, e^s) dif s + c) = frac(e^t, t+1) (-frac(t+2, e^t) + 2 + c)
  $
  תנאי ההתחלה הוא $x(0)=1$ ונקבל
  $ frac(e^0, 0+1)(-frac(0+2, e^0) + 2 + c) = 1 <==> -2 + 2 + c = 1 <==> c = 1 $
  כלומר
  $ x(t) = frac(e^t, t+1)(-frac(t+2, e^t)-1) $
]

#pagebreak()

== שיטת הפרדת משתנים
#theorem[שיטת הפרדת משתנים][
  תהיי $U subset.eq RR$ פתוחה, $I subset.eq RR$ קטע, $t_0 in I$ זמן התחלה, $f:U arrow RR$ ו־$g:I arrow RR$ רציפות. נניח גם ש־$f$ לא מתאפסת ב־$U$.\
  אז $x:I arrow U$ היא פיתרון של המשוואה הדיפרנציאלית הרגילה $x^prime (t) = f(x(t))g(t)$ אם ורק אם היא מהצורה
  $ x(t)=phi^(-1) (integral_(t_0)^t g(s) dif s + C) $
  כאשר $phi$ פונקציה קדומה ל־$frac(1, f)$ ב־$U$ ו־$C$ קבוע כלשהו.
]

#proof[
  המשוואה השקולה היא
  $ frac(x^prime (t), f(x(t)))=g(t) $
  ומכלל השרשרת זה שקול למשוואה
  $ phi(x(t))^prime = g(t) $
  מהמשפט היסודי זה שקול לכך שיש קבוע $C$ כך שמתקיים
  $ phi(x(t))=integral_(t_0)^t g(s) dif s + C $
  כעת $phi^prime = frac(1, f)$ פונקציה רציפה שלא מתאפסת ב־$U$ ולכן ממשפט הפונקציה ההופכית $phi$ הפיכה ב־$U$ וזה שקול למשוואה
  $ x(t)=phi^(-1)(integral_(t_0)^t g(s) dif s + C) $
]

#example[מתרגול 2][
  נמצא את הפיתרון הכללי למשוואה
  $ x^prime (t) = t(1+x^2 (t)) $
  זוהי משוואה ניתנת להפרדה ולכן נגדיר
  $ f(x)=1+x^2, quad g(t) = t $
  ואז
  $ phi(x) = arctan(x) $
  כלומר
  $ x(t)=phi^(-1)(integral g(t) dif t + C) = tan(frac(t^2, 2) + C) $
]

#pagebreak()

== שימוש בוריאציה של קבועים
#example[
  נתונה המערכת הלינארית
  $ x^prime (t) = mat(-2, 1; 1, -2)x(t) + v $
  היכן ש־$v in RR^2$ וקטור קבוע.\
  באמצעות וריאציה של קבועים נכתוב נוסחה סגורה לפיתרון המשוואה עם תנאי ההתחלה $x_0 in RR^2$ ולהוכיח שהנוסחה אכן מתארת את הפיתרון.
]

#solution[
  אנחנו מתחילים מלחשב את הפולינום האופייני של $A$
  $ det(A - lambda I) = mat(-2-lambda, 1; 1, -2-lambda)= (-2-lambda)^2-1 = (lambda+3)(lambda+1) $
  ולכן הערכים העצמיים הם $lambda_1 = -1, lambda_2 = -3$ ובהתאם נחשב
  $
    mat(-2+1, 1; 1, -2+1) = mat(-1, 1; 1, -1) ==> mat(-1, 1; 1, -1) vec(a, b) = vec(0, 0) <==> vec(a, b)=vec(1, 1) \
    mat(-2+3, 1; 1, -3+1) = mat(1, 1; 1, 1) ==> mat(1, 1; 1, 1) vec(a, b) = vec(0, 0) <==> vec(a, b)=vec(1, -1)
  $
  ולכן המטריצה המלכסנת $P$ והמטריצה האלכסונית $D$ הן
  $ D = mat(-1, 0; 0, -3), quad P = mat(1, 1; 1, -1), quad P^(-1) = frac(1, 2) mat(1, 1; 1, -1) $
  ועובדה חשובה שחוזרת על עצמה היא דרך חישוב של מטריצה הופכית למטריצה מסדר $2 times 2$ על־ידי הנוסחה $display(P^(-1) = frac(1, det(P)) mat(d, -b; -c, a))$.\
  נקבל
  $
    e^(t A) = P e^(t D) P^(-1) = frac(1, 2) mat(1, 1; 1, -1) mat(e^(-t), 0; 0, e^(-3t)) mat(1, 1; 1, -1) = frac(1, 2) mat(e^(-t)+e^(-3t), e^(-t)-e^(-3t); e^(-t)-e^(-3t), e^(-t)+e^(-3t))
  $
  לפי עיקרון דוהמל עבור $x(0) = x_0$ נקבל מטריצת הפתרונות היסודית ניתנת על־ידי $pi(t)=e^(A t)$ ומתקיים
  $ x(t) = e^(t A) x_0 + integral_0^t e^((t-s)A) g(s) dif s $
  במקרה שלנו $g(s)=v$ וקטור קבוע ולכן ניתן לחשב את האינטגרל מימין
  $
    integral_0^t e^((t-s)A) v dif s = (integral_0^t e^((t-s)A) dif s)v = (integral_0^t e^(u A) dif u)v = A^(-1) (e^(t A) - Id)v
  $
  שכן $det(A)!=0$ ולכן $A$ הפיכה וכמקודם
  $ A^(-1) = frac(1, 3) mat(-2, -1; -1, -2) = mat(-frac(2, 3), -frac(1, 3); -frac(1, 3), -frac(2, 3)) $
  ולכן המועמדת לנוסחה סגורה היא
  $ x(t) = e^(t A) x_0 + A^(-1)(e^(t A) - Id) v $
  כדי להראות שהיא אכן סגורה, נשים לב ש־$x(0)=x_0$ ולכן רק נשאר להראות האם $x^prime (t)=A x(t) + v$ ואכן
  $ frac(dif, dif t) (x(t)) = A e^(t A)x_0 +A^(-1) A e^(t A) v = A(e^(t A) x_0 + e^(t A) v) $
  וכן
  $ A(e^(t A) x_0 + A^(-1) e^(t A) v - A^(-1) v) + v = A e^(t A) x_0 + e^(t A) v - v + v = A e^(t A) x_0 + e^(t A) v $
  כלומר קיבלנו שהנוסחה סגורה.
]

#pagebreak()

== איטרציות פיקארד
#definition[איטרציות פיקארד][
  משפט העתקה מכווצת מספק לנו גם אלגוריתם קונסטרוקטיבי למציאת הפתרון.\
  אם נתחיל מניחוש התחלתי כלשהו, למשל הפונקציה הקבועה $y_0 (t) = x_0$, ונפעיל את האופרטור $K$ באופן איטרטיבי:
  $ y_n (t) = K y_(n-1) (t) = x_0 + integral_0^t F(y_(n-1) (s)) dif s $
  מובטח לנו שסדרת הפונקציות $(y_n)_(n=0)^infinity$ (אשר נקראת "איטרציות פיקארד") תתכנס במידה שווה לפתרון היחיד של המשוואה.
]

#example[תרגול 2][
  נתבונן בבעיית ההתחלה $cases(
    x^prime = 2(x+1),
    x(0) = 0
  )$, נסמן $y_0 (t) = 0$ ונגדיר את האופרטור
  $
    K x = 2 integral_0^t (x(s)+1) dif s \
    y_n (t) = K y_(n-1) (t)
  $
  ולכן
  $
    y_1 = K y_0 (t) = 2 integral_0^t 1 dif s = 2t \
    y_2 (t) = K y_1 (t) = 2 integral_0^t 2s+1 dif s = 2t^2 + 2t = frac((2t)^2, 2) + 2t \
    dots.v \
    y_n (t) = K^n y_0 (t) = sum_(i=1)^n frac((2t)^i, i!)
  $
  הפונקציה הגבולית היא
  $ lim_(n arrow infinity) y_n (t) = sum_(i=1)^infinity frac((2t)^i, i!) = e^(2t)-1 $
  והיא אכן פיתרון למשוואה.
]

#example[תרגיל בית 2][
  נתבונן בבעיית ההתחלה $cases(x' = x, x(0) = 1)$
  נגדיר $y_0 (t) = 1$ ונגדיר את האופרטור על פונקציות רציפות
  $ K x (t) = 1+ integral_0^t x(s) dif s $
  ונפעיל איטרציות של האופרטור על $y_0$
  $
    y_1 = K y_0 (t) = 1+ integral_0^t 1 dif s = 1+t \
    y_2 (t) = K y_1 (t) = 1 + integral_0^t 1+s dif s = 1 + integral_0^t 1 dif s + integral_0^t s dif s = 1+t+t^2/2 \
    dots.v \
    y_n (t) = K^n y_0 (t) = sum_(k=0)^n t^k/k! stretch(arrow)_(n arrow infinity) e^t
  $
  והאיטרציות פיקארד האלו בעצם מביאות את טור טיילור של אקספוננט ואכן $e^t$ הוא פיתרון למשוואה כי $(e^x)'=e^x$ ו־$e^0 = 1$.
]

== דיאגרמות זרימה
#figure(
  image("../../../src/images/Stability Diagram.png", width: 100%, height: 45%, fit: "contain"),
)
