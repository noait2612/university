#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 04 --- מבוא לטופולוגיה, 80516 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
#subquestion()
תהיי $(X, <=)$ קבוצה סדורה קווית ותהיי $ordTopology(tau)$ טופולוגיית הסדר המתאימה על $X$.\
נוכיח ש־$(X, ordTopology(tau))$ הוא מרחב האוסדרוף.

#proof[
  עלינו להראות שלכל $x!=y in X$ קיימות $x in U, y in V$ פתוחות כך ש־$U inter V = emptyset$.\
  הגדרנו את טופולוגיית הסדר להיות הטופולוגיה הנוצרת על־ידי הבסיס שמורכב מהקבוצות מהצורה
  $
    (-infinity, a) colon.eq {x in X bar x<a} wide (a, infinity) colon.eq {x in X bar x>a} wide (a,b) colon.eq {x in X bar a<x<b}
  $
  לכל $a,b in X$ ובטופולוגיה זו קבוצות פתוחות הן קטעים פתוחים אז בלי הגבלת הכלליות ניקח $a<b$ ונרצה למצוא קטעים זרים ופתוחים שמכילים אותם.\
  נחלק למקרים:
  + אם קיים $c$ כך ש־$a<c<b$ אז $(-infinity,c), (c,infinity)$ הן פתוחות וזרות כך ש־$a in (-infinity, c)$ ו־$b in (c, infinity)$
  + אם לא קיים $c$ כך ש־$a<c<b$ אז $a,b$ הם "עוקבים" ולכן נסתכל על $U = (-infinity, b)$ ו־$V = (a, infinity)$.\
    $U,V$ הן כמובן פתוחות מהגדרת הבסיס ומתקיים $a in U$ ו־$b in V$ וכן $U inter V = emptyset$ כי $U inter V= (a,b)$ ומההנחה אין איברים שם קרי זו הקבוצה הריקה.
]

#subquestion()
יהי $X=ZZ$ עם טופולוגיית הסדרות החשבוניות של פירסטנברג (בסיס לקבוצות הפתוחות נתון על־ידי $cal(B) colon.eq {{a+n d bar n in ZZ} bar a,d in ZZ, space d!=0}$).\
נוכיח ש־$X$ מרחב האוסדרוף.

#proof[
  נראה שכל סדרה חשבונית היא גם קבוצה סגורה: שכן המשלימה של $a ZZ + b$ כלשהי היא הקבוצה
  $ ZZ - (a ZZ + b) = union.big_(b_i = 1, dots.h, abs(a)-1) [a ZZ + (b+b_i)] $
  כלומר איחוד של $abs(a)-1$ סדרות חשבוניות ולכן היא איחוד של קבוצות פתוחות בטופולוגיה ולכן פתוח והמשלים הוא קבוצה פתוחה ולכן $a ZZ + b$ היא גם סגורה.\
  עבור $n,m in ZZ$ נבחר קבוצה בסיסית $U$ כך ש־$n in U$ אבל $m in.not U$ כמו לדוגמה $a>abs(n-m)$ ולכן $U = a ZZ + n$ היא קבוצה פתוחה שמכילה את $n$ אך לא את $m$.\
  אז $U$ היא גם פתוחה וגם סגורה מההוכחה לעיל ולכן גם $V = ZZ without U$ היא קבוצה פתוחה כך שמתקיים $U inter V = emptyset$, $n in U$, $m in V$ כלומר קיבלנו הפרדה ולכן האוסדרוף.
]

#subquestion()
נסמן ב־$RR_l$ את $RR$ עם הטופולוגיה הנוצרת על־ידי הבסיס ${[a,b) bar a,b in RR}$ ונוכיח ש־$RR_l$ מרחב $T_4$.

#proof[#todo]

#question()
#subquestion()
#solution[#todo]

#subquestion()
#proof[#todo]

#subquestion()
#proof[#todo]

#subquestion()
#solution[#todo]



#question()
יהיו ${(X_i, tau_i)}_(i in I)$ מרחבים טופולוגיים, נסמן ב־$X=product_(i in I) X_i$ המכפלה שלהם ולכל $i in I$ נסמן ב־$pi_i : X arrow X_i$ את ההטלה.\
תהיי $tau$ טופולוגיה על $X$ המקיימת
+ $pi_i : (X, tau) arrow (X_i, tau_i)$ רציפה לכל $i$
+ אם $Z$ מרחב טופולוגי נוסף ו־$f:Z arrow X$ פונקציה כלשהי אז $f$ רציפה (ביחס ל־$tau$ והטופולוגיה הנתונה על $Z$) אם ורק אם $pi_i compose f$ רציפה לכל $i in I$
נוכיח ש־$tau$ היא טופולוגיית המכפלה.

#proof[
  ראינו שטופולוגיית המכפלה היא הטופולוגיה החלשה ביותר שתחתיה ההטלות רציפות ולכן הכיוון $prodTopology(tau) subset.eq tau$ הוא ישיר כי כל ההטלות $pi_i$ הן רציפות ונשאר רק להראות את הכיוון $prodTopology(tau) supset.eq tau$.\
  מהתנאי ה־2 נובע שאם נגדיר את $Z$ להיות $(X, prodTopology(tau))$ ואת $f$ להיות פונקציית הזהות $id:(X, prodTopology(tau)) arrow (X, tau)$  נובע ש־$id$ רציפה אם ורק אם לכל $i in I$ גם ההרכבה $pi_i compose id: (X, prodTopology(tau)) arrow X_i$ היא רציפה אבל $pi_i compose id = pi_i$ וההטלות הן רציפות תחת טופולוגיית המכפלה מהגדרה ולכן כל ההרכבות רציפות ו־$id$ היא רציפה.\
  בתרגיל הקודם הוכחנו שאם פונקציית הזהות רציפה נובע ש־$tau subset.eq prodTopology(tau)$ ולכן סיימנו.
]

#question()
יהיו $(X, d_X), (Y, d_Y)$ מרחבים מטריים ונניח ש־$Y$ שלם.\
תהיי $S subset.eq X$ קבוצה צפופה ותהיי $f:S arrow Y$ רציפה במידה שווה.

#subquestion()
נוכיח שאם ${x_n}_(n in NN)$ סדרת קושי ב־$S$ אזי ${f(x_n)}_(n in NN)$ היא סדרת קושי ב־$Y$.

#proof[
  תהיי ${X_n}_(n in NN)$ סדרת קושי ב־$S$ ויהי $epsilon > 0$.\
  מכך ש־$f:S arrow Y$  רציפה במידה שווה נובע שקיים $delta>0$ כך שלכל $a,b in S$ אם $d_X (a,b) < delta$ אזי $d_Y (f(a), f(b))<epsilon$.\
  נשתמש ב־$delta$ הזאת ולכן קיים $N in NN$ כך שלכל $n,m > N$ מתקיים גם $d_X (x_n, x_m) < delta$.\
  מהרציפות במידה שווה נובע שלכל $n,m > N$ מתקיים גם $d_Y (f(x_n), f(x_m)) < epsilon$.\
  כלומר לכל $epsilon > 0$ קיים $N$ כך שלכל $n,m > N$ מתקיים שהמרחק בין איברי הסדרה ב־$Y$ קטן מ־$epsilon$ כלומר קיבלנו ש־${f(x_n)}_(n in NN)$ היא סדרת קושי.
]

#subquestion()
נראה שאם ${a_n}_(n in NN)$ ו־${b_n}_(n in NN)$ סדרות קושי ב־$S$ ששתיהן מתכנסות לאותה נקודה $x in X$ אז $f({a_n})_(n in NN)$ ו־$f({b_n})_(n in NN)$ מתכנסות לאותה נקודה ב־$Y$.

#proof[
  יהי $epsilon > 0$ נניח שלא ככה ולכן קיימות $y_1, y_2 in Y$ כך שמתקיים
  $ lim_(n arrow infinity) f(a_n) = y_1 != y_2 = lim_(n arrow infinity) f(b_n) $
  מכך ש־$y_1 != y_2$ נובע ש־$d_Y (y_1, y_2) = 2epsilon >0$.\
  אם כך מתקיים מאי־שיוויןון המשולש
  $ d_Y (y_1, y_2) <= d_Y (y_1, f(a_n)) + d_Y (f(a_n), f(b_n)) + d_Y (f(b_n), y_2) $
  המחוברים הראשון והשלישי שואפים ל־$0$ מהגדרת הגבול כאשר $n arrow infinity$.\
  עבור האיבר השני נשים לב שמהרציפות במידה שווה נובע שאם $a_n arrow x$ וגם $b_n arrow x$ נובע כי $d_X (a_n, b_n) stretch(arrow)_(n arrow infinity) 0$  ולכן גם $d_Y (f(a_n), f(b_n)) stretch(arrow)_(n arrow infinity) 0$.\
  וזאת כמובן סתירה שכן $d_Y (y_1, y_2)=0$ בסתירה להיותם שונים.\
  אפשר להוכיח בעוד דרך כשמניחים שהטענה לא נכונה: נגדיר את הסדרה ${c_n}_(n in NN)$ על־ידי $c_n = (a_1, b_1, a_2, b_2, dots.h)$ (סדרת זיג־זג), באופן פורמלי
  $ c_n = mycases(a_((n+1)/2), "אי־זוגי" n, b_(n/2), "זוגי" n) $
  מכך ש־$a_n arrow x$ וגם $b_n arrow x$ נובע כי בהכרח ש־$c_n arrow x$ וזאת סדרת קושי ב־$S$ (כי סדרה מתכנסת במרחב מטרי היא סדרת קושי).\
  מהסעיף הקודם נובע ש־${f(c_n)}_(n in NN)$ היא סדרת קושי ב־$Y$ ו־$Y$ שלם ולכן זו סדרה מתכנסת לגבול $L in Y$.\
  מיחידות הגבול כל תת־סדרה של ${f(c_n_k)}_(k in NN)$ מתכנסת גם היא ל־$L$ ולכן בפרט גם תתי־הסדרות של האינדקסים הזוגיים והזוגיים מתכנסים לאותו $Y$ בסתירה.
]

#subquestion()
נרחיב את הפונקציה $f$ לפונקציה $tilde(f) : X arrow Y$ ונראה ש־$tilde(f)$ היא פונקציה רציפה.

#proof[
  מהצפיפות נובע שלכל $x in X$ קיימת סדרה ${x_n}_(n in NN) subset.eq S$ כך ש־$x_n arrow x$ ובסעיפים הקודמים ראינו ש־${f(x_n)}_(n in NN)$ היא סדרת קושי ב־$Y$ ומכך ש־$Y$ שלם נובע ש־$f(x_n) stretch(arrow)_(n arrow infinity) y in Y$ אז נגדיר $tilde(f)(x)=y$ ונראה רציפות: \
  יהי $epsilon>0$, מהרציפות במידה שווה של $f$ על $S$ נובע שקיים $delta>0$ כך שלכל $a,b in S$ אם $d_X (a,b)<delta$ אזי $d_Y (f(a), f(b))<epsilon/3$.\
  יהיו $x,z in X$ עבורם $d_X (x,z) < delta/3$ ויהיו ${x_n}_(n in NN), {z_n}_(n in NN) subset.eq S$ הסדרות המתכנסות ל־$x,z$ בהתאמה ומתקיים $f(x_n) arrow tilde(f)(x), f(z_n) arrow tilde(f)(z)$ ולכן קיים $N$ כך שלכל $n>N$ מתקיימים
  + $d_X (x_n, z_n) < delta$
  + $d_Y (f(x_n), tilde(f)(x_n)) < epsilon/3$
  + $d_Y (f(z_n), tilde(f)(z_n)) < epsilon/3$
  מאי־שיוויון המשולש ומרציפות במידה שווה של $f$ נקבל
  $
    d_Y (tilde(f)(x), tilde(f)(z))<=d_Y (tilde(f)(x), f(x_n)) + d_Y (f(x_n), f(z_n)) + d_Y (tilde(f)(z), f(z_n)) < epsilon/3 + epsilon/3 + epsilon/3 = epsilon
  $
  ולכן $tilde(f)$ רציפה במידה שווה ב־$X$ ובפרט רציפה.
]
