#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: thmbox-init()
#show: article_he.with(
  title: [ הכנה למבחן --- משוואות דיפרנציאליות ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 2)

= משפטים חשובים
== משפט הקיום של פיאנו
#theorem[משפט הקיום של פיאנו][
  תהיי $U subset.eq RR^n$ פתוחה, $F:U arrow RR^n$ רציפה ו־$tilde(x_0) in U$ נקודת התחלה.\
  אז יש $delta > 0$ ופונקציה גזירה $x:(-delta, delta) arrow U$ שפותרת את בעיית ההתחלה
  $ cases(x(0)= tilde(x_0), x^prime (t) = F(x(t))) $
]<peano_existence_theorem>

#proof[
  יהי $r>0$ כך ש־$B colon.eq closure(B(tilde(x_0), r)) subset.eq U$, נסמן $M colon.eq norm(F|_B)_infinity = sup_(x in B) abs(F(x))$, נגדיר $delta = frac(r, M)$ ואת סדרת הפונקציות $x_n : [-delta, delta] arrow U$ על־ידי
  $
    x_0 (t) = tilde(x_0) \
    "for" 1<=j<=k-1, space x_k (t) = mycases(
      tilde(x_0) + t F(tilde(x_0)), t in [-frac(delta, k), frac(delta, k)],
      x_k (frac(j delta, k))+(t-frac(j delta, k))F(x_k (frac(j delta, k))), t in [frac(j delta, k), frac((j+1)delta, k)],
      x_k (-frac(j delta, k))+(t+frac(j delta, k))F(x_k (-frac(j delta, k))), t in [-frac((j+1) delta, k), -frac(j delta, k)],
    )
  $
  נשים לב ש־$x_k (t)$ לינארית למקוטעין ב־$t$ ולכן גזירה פרט למספר סופי של נקודות ותמונתה נמצאת בכדור $B$, כלומר $im (x_k) in B$ שכן לכל $0<delta<t$ מתקיים
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
  באופן זהה נקבל גם עבור $-delta<t<0$ ולכן הסדרה ${x_k}_(k=1)^infinity$ חסומה במידה שווה (שכן כולן בתוך $B$) והן רציפות במידה אחידה שכן לכל $k$ מתקיים
  $ norm(x_k (t) - x_k (s)) <=M abs(t-s) $
  אז הסדרה רציפה במידה אחידה ולכן ממשפט ארצלה־אסקולי יש לסדרה תת־סדרה $(x_k_j)_(j=1)^infinity$ מתכנסת במידה שווה לגבול $x$ ולשם הפשטות נקרא לתת־סדרה זו $(x_k)_(k=1)^infinity$.\
  נרצה להראות ש־$x$ גזירה ומקיימת $x^prime (t) = F(x(t))$ ומכך ש־$F$ רציפה מהמשפט היסודי מספיק להראות
  $ x(t) = tilde(x_0) + integral_0^t F(x(s)) dif s $
  ואכן, לכל $k$ נגדיר את $y_k : [-delta, delta] arrow U$ ולכל $1<=j<k$ על־ידי
  $
    y_k (s) = mycases(
      tilde(x_0), s in [-frac(delta, k), frac(delta, k)],
      x_k (frac(j delta, k)), s in [frac(delta j, k), frac((j+1)delta, k)],
      x_k (-frac(j delta, k)), s in [-frac((j+1)delta, k), - frac(j delta, k)]
    )
  $
  אז לכל $k$ מתקיים $x_k (t) = tilde(x_0) + integral_0^t F(y_k (s)) dif s$ ומתקיים
  $ norm(y_k - x_k)_infinity <= frac(M delta, k) stretch(arrow)_(k arrow infinity) 0 $
  אז $(y_k)$ מתכנסת במידה שווה לאורך אותה תת־סדרה ל־$x$.\
  יתר על־כן, $F compose y_k arrow F compose x$ במידה שווה לאורך התת־סדרה שכן $F$ רציפה במידה שווה ב־$B$: כי אם $epsilon > 0$, קיימת $eta>0$ כך שלכל $p,q in B$ מתקיים $norm(p-q) < eta$ ומתקיים $norm(F(p)-F(q)) < epsilon$.\
  ניקח $L_0$ כך שלכל $ell>L_0$ ולכל $t in [-delta, delta]$ מתקיים $norm(y_k_ell (t) - x(t))<eta$ כי ההתכנסות במידה שווה אבל אז לכל $ell > L_0$ מתקיים $norm(F(y_k_ell (t)) - F(x(t)))<epsilon$ ומכך שרציפות במידה שווה מאפשרת להחליף סדר של גבול ואינטגרל
  $
    x(t) = lim_(ell arrow infinity) x_k_ell (t) = tilde(x_0) + lim_(ell arrow infinity) integral_0^t F(y_k_ell (s)) dif s = tilde(x_0) + integral_0^t lim_(ell arrow infinity) F(y_k_ell (s)) dif s = tilde(x_0) + integral_0^t F(x(s)) dif s
  $
]

#pagebreak()

== משפט פיקארד
#theorem[משפט פיקארד][
  תהיי $U subset.eq RR^n$ פתוחה, $tilde(x_0) in RR^n$ ותהיי $F:U arrow RR^n$ שהיא ליפשיצית מקומית כלומר לכל $K subset.eq U$ קומפקטית יש קבוע $L_K$ כך ש־$F|_K$ ליפשיצית עם הקבוע $L_K$.\
  אזי יש $delta>0$ כך שקיים פתרון יחיד בקטע $[-delta, delta]$ לבעיה
  $ cases(x(0) = tilde(x_0), x^prime (t) = F(x(t))) $
]<picard_existence_theorem>

ישנן שתי הוכחות למשפט – אחת באמצעות משפט העתקה מכווצת שראינו בתרגול 2 ואחת מההרצאה.\
#proof[יונתן בהרצאה][
  משפט פיקארד נובע מהלמה הבאה בעזרת משפט פיאנו.
  #lemma[
    תהיי $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ ליפשיצית מקומית.\
    נניח ש־$x(t)$ ו־$y(t)$ שני פתרונות של המשוואה $eta^prime (t) = F(eta(t))$ כך ש־$x$ מוגדר על הקטע הפתוח $I subset.eq RR$ ו־$y$ מוגדר על הקטע הפתוח $J subset.eq RR$.\
    אם $0 in I inter J$ ו־$x(0) = y(0)$ אזי $x(t)=y(t)$ לכל $t in I inter J$.
  ]

  #proof[
    נוכיח ש־$x(t)=y(t)$ לכל $t in I inter J inter [0,infinity)$. נניח שלא ככה ונגדיר $tau = inf{t in I inter J inter (0,infinity) bar x(t) != y(t)}$ ומרציפות $overline(x) = x(tau)=y(tau)$.\
    ניקח $r>0$ כך ש־$closure(B_(2r) (overline(x))) subset.eq U$ וניקח $delta>0$ כך שיתקיים $[tau, tau+delta] subset.eq I inter J$ וגם $x(t), y(t) in closure(B_r (overline(x)))$ לכל $t in [tau, tau + delta]$.\
    נסמן ב־$L$ את קבוע ליפשיץ של $F|_closure(B_r (overline(x)))$, עבור $t in [tau, tau+delta]$ מתקיים
    $
      frac(dif, dif t) norm(x(t) - y(t))^2 & = 2(x(t)-y(t), x^prime (t) - y^prime (t)) \
                                           & = 2(x(t)-y(t), F(x(t))-F(y(t))) \
                                           & <=_((star)) 2norm(x(t)-y(t)) dot.op norm(F(x(t))-F(y(t))) \
                                           & <=_((star star)) 2 L dot.op norm(x(t)-y(t))^2
    $
    כאשר $(star)$ זה אי־שיוויון קושי־שוורץ ו־$(star star)$ זה מהליפשיציות.\
    אז הפונקציה $f(t) = e^(-2 L t) norm(x(t)-y(t))^2$ היא מונוטונית יורדת כי מגזירה
    $
      frac(dif, dif t) f = -2L f(t) + 2 L f(t) = 0
    $
    הנגזרת לא חיובית ולכן היא מונוטונית יורדת ובנוסף $f(t)$ אי־שלילית ב־$[tau, tau+delta]$ אבל $f(tau)=0$ ולכן $f(t) =0$ לכל $t in [tau, tau + delta]$ ולכן $norm(x(t)-y(t))=0$ וזו סתירה להגדרת $tau$ בתור אינפימום.\
    עבור $t$־ײם שליליים ההוכחה דומה עם $sup$ ופונקציה קצת אחרת או להסתכל על $tilde(x)(t)=x(-t)$ ומהמשוואה $eta^prime (t) = -F(eta(t))$.
  ]
]

#pagebreak()

== יציבות
#lemma[
  תהיי $A in CC^(n times n)$ מטריצה עם קבוצת ערכים עצמיים $Lambda subset.eq CC$ ונניח ש־$max_(lambda in Lambda) re(lambda)<0$.\
  אזי לכל $0<alpha<min_(lambda in Lambda) abs(re(lambda))$ יש $C>0$ כך שלכל $t>=0$ מתקיים
  $ normop(exp(t A)) <= C e^(-t alpha) $
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


= פתרון תרגילים רנדומליים
== נקודות שיווי משקל
#pagebreak()

== שימוש בשיטת גורם האינטגרציה
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

== דברים חשובים מתרגילים

= דברים חשובים (בעיניי) מהתרגילים
== תרגיל 1
#theorem[
  יהי $J in RR$ מקטע ונקבע $t_0 in J$. נניח כי $a,f : J arrow RR$ רציפות ונוכיח כי $x : J arrow RR$ פותרת את המשוואה
  $ x^prime (t) = a(t) x(t) + f(t) $
  אם ורק אם קיים $c in RR$ כך שמתקיים
  $ x(t) = e^(phi(t)) (integral_(t_0)^t e^(-phi(s)) f(s) dif s + c) $
  כאשר
  $ phi(t) = integral_(t_0)^t a(s) dif s $
]<integrating_factor_method>

#proofSketch[ \
  $<==$ מגדירים $y(t) = e^(-phi(t)) x(t)$ וגוזרים ואז מתכונות נגזרת אקספוננט נובע שקיים $c in RR$ כך שמתקיים
  $ y(t) = integral_(t_0)^t e^(-phi(s)) f(s) dif s + c $
  $==>$ $x$ גזירה ברציפות ולכן מכלל שרשרת מסיימים.
]

== תרגיל 2
#lemma[הלמה של גרונוול][
  יהי $delta > 0$ ותהיינה $a, u : [0,delta] arrow RR$ כך שך־$a$ רציפה ו־$u$ גזירה ברציפות. נניח כי לכל $t in (0,delta)$ מתקיים
  $ u^prime (t) <= a(t) u(t) $
  + מתקים ש־$v(t)=e^(integral_0^t a(s) dif s)$ היא פיתרון לבעיה
    $ cases(v^prime (t) = a(t)v(t), v(0)=1) $
  + לכל $t in [0,delta)$ מתקיים
    $ u(t) <= u(0) v(t) $
]
#proofSketch[
  + נסמן $g(t) = integral_0^t a(s) dif s$ וגוזרים לפי כלל שרשרת, מציבים $0$ וסיימנו
  + נסתכל על $w(t) = frac(u(t), v(t))$, גוזרים ועם הסעיף הקודם רואים שהיא מונוטונית יורדת, מציבים $0$ ומסיימים
]

== תרגיל 3
#theorem[
  יהי $I subset.eq RR$ קטע שמכיל את $0$, $A:I arrow RR^(n times n), g:I arrow RR^n$ פונקציות רציפות.\
  אזי לכל $x_0 in RR^n$ קיים פתרון יחיד אשר מוגדר על כל $I$ לבעיית ההתחלה
  $ (star) space cases(x^prime (t) = A(t) x(t) + g(t), x(0)=x_0) $
]<the_solution_defined_as_long_as_the_equation_defined>

#proof[
  מספיק להוכיח את המשפט לכל קטע סגור וחסום $I_0 subset.eq I$.\
  נסמן $ F(x,t) colon.eq A(t) x + g(t) \
  L colon.eq sup_(t in I_0) normop(A(t)) \
  M colon.eq sup_(t in I_0) norm(g(t)) $
  מתקיים ש־$L<infinity$ שכן $A$ רציפה ו־$I_0$ קומפקטי ולכן $F$ רציפה ב־$RR^n times I_0$ ומקיימת את תנאי ליפשיץ
  $ norm(F(x,t)-F(y,t)) = norm(A(t) dot.op (x-y)) <= L norm(x-y) $
  ממשפט פיקארד מספיק להניח רציפות של $F$ במשתנה הזמן וליפשציות מקומית של $F$ במשתנה המיקום עם קבועי ליפשיץ שלא תלויים בזמן ולכן קיים פתרון יחיד לפרק זמן סופי כלשהו.\
  מכאן ניתן להתפצל לשני פתרונות שונים
  + מאי־שיוויון קושי־שוורץ נקבל
    $
      frac(dif, dif t) norm(x(t))^2 & = 2 chevron.l x^prime (t), x(t) chevron.r \
                                    & = 2 chevron.l A(t)x(t)+g(t), x(t) chevron.r \
                                    & <= 2 norm(A(t) x(t) + g(t)) dot.op norm(x(t)) \
                                    & <= 2 norm(A(t) x(t)) dot.op norm(x(t)) + 2 norm(g(t))dot.op norm(x(t)) \
                                    & <= 2 L norm(x(t))^2 + 2 M norm(x(t))
    $
    אז אפשר לקחת $0<C$ שתלוי ב־$L,M$ אבל לא תלוי ב־$t$ (כי א חד ריבועי ב־$norm(x(t))$ והשני לינארי בו) כך שמתקיים
    $ 2 L norm(x(t))^2 + 2 M norm(x(t)) <= 4 L norm(x(t))^2 + C $
    בלי הגבלת הכלליות $0<t$ ואז
    $ frac(dif, dif t) [e^(-4L t) norm(x(t))^2] <= C e^(-4 L t) <= C $
    מאינטגרציה על התחום $[0,t]$ נקבל
    $ norm(x(t))^2 e^(-4 L t) - norm(x_0)^2 <= C t ==> norm(x(t))^2 <= C t e^(4 L t) + norm(x_0)^2 e^(4 L t) $
    החסם הזה מעיד שהפתרון לא יכול להתפוצץ בזמן סופי ($C,M,L$ תלויים בבחירת $I_0$ אבל הם קבועים שלא יכולים להתפוצץ בזמן סופי) ומטריכוטומיה הפתרון מוגדר היטב על כל $I$.
  + נראה שהפתרון אינו מתפוצץ על ידי מעבר למשוואה האינטגרלית השקולה:
    $ x(t) = x_0 + integral_0^t (A(s)x(s) + g(s)) dif s $
    נניח ללא הגבלת הכלליות כי $t>0$. מאי־שוויון המשולש לאינטגרלים ותכונות הנורמה נקבל:
    $
      norm(x(t)) & <= norm(x_0) + integral_0^t norm(A(s)x(s) + g(s)) dif s \
                 & <= norm(x_0) + integral_0^t (normop(A(s)) norm(x(s)) + norm(g(s))) dif s \
                 & <= norm(x_0) + integral_0^t (L norm(x(s)) + M) dif s \
                 & = (norm(x_0) + M t) + integral_0^t L norm(x(s)) dif s \
                 & = (norm(x_0) + M t) e^(L t)
    $
    כאשר המעבר האחרון הוא מהלמה של גרונוול אז אם־כך החסם שקיבלנו מעיד שהנורמה של הפתרון חסומה לכל זמן $t in I_0$.\
    ממשפט הטריכוטומיה מכיוון שהפתרון חסום על כל קטע סגור $I_0$, הוא אינו מתפוצץ בזמן סופי ולכן מוגדר היטב על כל $I$.
]
