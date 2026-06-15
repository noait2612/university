#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 04 --- תבניות ריבועיות ומספרים $P$־אדיים, 80507 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#let DEG = math.op("DEG")

#question()
יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי ולא טריוויאלי כך שקיים $epsilon = max{norm(x) bar x in cal(M)_norm(dot.op)}$ (נורמה כזאת נקראית בדידה).

#subquestion()
נוכיח ${norm(x) bar x in FF^times } = {epsilon^k bar k in ZZ}$.

#proof[
  מהיות הנורמה בדידה קיים $pi in cal(M)$ כך ש־$abs(pi)=epsilon$.\
  ${epsilon^k : k in ZZ} subset.eq {abs(x) : x in FF^times}$: $pi in FF^times$ ומתקיים $abs(pi)=epsilon$ ולכן מכפליות הנורמה, לכל $k in ZZ$ מתקיים $abs(pi^k)=abs(pi)^k = epsilon^k$, כנדרש.\
  ${abs(x) : x in FF^times} subset.eq {epsilon^k : k in ZZ}$: נניח ללא הגבלת הכלליות ש־$abs(x)<1$ אחרת, נסתכל על $1/x$. אם $abs(x)=1$ אז $abs(x)=epsilon^0$ ואחרת $x in cal(M)$.\
  מכך ש־$epsilon$ הוא המקסימום של הנורמות ב־$cal(M)$ מתקיים $abs(x)<epsilon$.
  אם $abs(x)=epsilon$, סיימנו. אחרת, נסתכל על $abs(x/pi)$ ומתקיים
  $ abs(x/pi) = abs(x)/abs(pi) = abs(x)/epsilon $
  ונמשיך בתהליך זהה: אם $abs(x)!=epsilon^k$ לכל $k$ נקבל סדרה אינסופית של נורמות גדלות שחסומות על־ידי 1 וזה סותר את העובדה ש־$epsilon$ ולכן הוא מקסימום ב־$cal(M)$ ולכן בהכרח $abs(x)=epsilon^k$ עבור $k in ZZ_plus$ (אם $k$ שלילי אז נסתכל על ההופכי ואז הטענה נובעת עבור השלילי גם־כן).
]

#subquestion()
נוכיח שקיים $pi in cal(M)_norm(dot.op)$ כך ש־$cal(M)_norm(dot.op) = pi cal(O)_norm(dot.op)$.

#proof[
  יהי $pi in cal(M)$ איבר המקיים $abs(pi) = epsilon$.\
  $pi cal(O) subset.eq cal(M)$: לכל $a in cal(O)$, מתקיים $abs(a) < 1$. לכן $abs(pi a) = abs(pi) abs(a) < epsilon dot.op 1 = epsilon < 1$, ולכן $pi a in cal(M)$.\
  $cal(M) subset.eq pi cal(O)$: יהי $x in cal(M)$, כלומר $abs(x) < 1$. מכיוון ש$abs(x) < epsilon$ (כי $epsilon$ מקסימלי ב־$cal(M)$), מתקיים $abs(x/pi) = abs(x)/epsilon < 1$. מכאן ש־$x/pi in cal(O)$, כלומר $x in pi cal(O)$ ומכאן $cal(M) = pi cal(O)$.
]

#subquestion()
לכל אידיאל $I$ של $cal(O)_norm(dot.op)$ קיים $n in NN$ כך ש־$I= pi^n cal(O)_norm(dot.op)$.

#proof[
  יהי $I subset.eq cal(O)$ אידיאל.\
  אם $I = {0}$, אז $I = pi^infinity cal(O)$ (או פשוט אידיאל האפס).\
  אם $I != {0}$, נגדיר את הקבוצה $S = { abs(x) : x in I without {0} }$ וזו תת־קבוצה של ערכי הנורמה ${epsilon^k : k in NN union {0}}$ והיא אינה ריקה ולכן קיים לה איבר מקסימלי $epsilon^n$ עבור $n in NN union {0}$.\
  יהי $pi^n in I$ כך ש־$abs(pi^n)=epsilon^n$.\
  $pi^n cal(O) subset.eq I$: מכיוון ש־$pi^n in I$ ו־$I$ אידיאל, לכל $a in cal(O)$ מתקיים $pi^n a in I$.\
  $I subset.eq pi^n cal(O)$: יהי $x in I$. אזי $abs(x) < epsilon^n$ (לפי מקסימליות הנורמה ב־$I$).
  מכאן $abs(x/pi^n) = abs(x)/epsilon^n < 1$, כלומר $x/pi^n in cal(O)$, לכן $x in pi^n cal(O)$ כלומר $I = pi^n cal(O)$.
]

#question()
יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי לא טריוויאלי כך שבקבוצה $S={norm(x) bar x in cal(M)_norm(dot.op)}$ אין איבר מקסימלי. נוכיח ש־$sup S = 1$.

#proof[
  מכיוון שלכל $x in cal(M)$ מתקיים $abs(x) < 1$, הקבוצה $S$ חסומה מלעיל על ידי 1 ולכן קיים לה חסם עליון $L = sup S$ המקיים $L <= 1$.\
  נניח בשלילה כי $L < 1$.
  מהיות הנורמה לא טריוויאלית קיימים איברים ב־$cal(M)$ עם נורמות שונות מ-0. בפרט, קיים איבר $y in cal(M)$ כך ש־$0 < abs(y) < 1$.\
  מכיוון ש־$L$ הוא ה־sup ואין איבר מקסימלי ב־$S$, לכל $r < L$ קיים $r' in S$ כך ש־$r < r' < L$.
  נבחר $z in cal(M)$ המקיים $L dot.op abs(y) < abs(z) < L$ (יש כזה מהגדרת הסופרמום).\
  נתבונן באיבר $w = z/y$. מתקיים
  $abs(w) = abs(z) / abs(y) > (L dot.op abs(y)) / abs(y) = L$ וקיבלנו איבר $w$ כך ש־$abs(w) > L$ ונחלק למקרים:
  + אם $abs(w) < 1$, אזי $abs(w) in S$, וזה סותר את הגדרת $L$ כחסם עליון של $S$.
  + אם $abs(w) >= 1$, זה אומר ש־$abs(z) >= abs(y)$, אבל הנורמה לא טריוויאלית ואין איבר מקסימלי אז תמיד נוכל למצוא איברים שערכי הנורמה שלהם "מטפסים" ומתקרבים ל־1 מה שמכריח את $L$ להיות 1.
  קיבלנו סתירה ולכן $sup S = 1$.
]

#question()
נסמן ב־$PP$ את הקבוצה של כל המספרים הראשוניים.

#subquestion()
נוכיח כי לכל $x in QQ^times$, הקבוצה ${p in PP bar abs(x)_p !=1}$ היא סופית.

#proof[
  יהי $x in QQ^times$ ולכן מהמשפט היסודי של האריתמטיקה
  $x = plus.minus product_(i=1)^k p_i^(n_i)$
  כאשר $p_i$ הם מספרים ראשוניים ו־$n_i in ZZ without {0}$.\
  מהגדרת הנורמה ה־$p$־אדית נובע ש־$abs(x)_p != 1$ אם ורק אם $p$ הוא אחד מהראשוניים ${p_1, dots, p_k}$ המופיעים בפירוק של $x$.
  מכיוון שהפירוק של מספר רציונלי לגורמים ראשוניים הוא סופי נובע שהקבוצה ${p in PP : abs(x)_p != 1}$ היא סופית.
]

#subquestion()
נוכיח שמתקיים $abs(x)product_(p in PP) abs(x)_p = 1$.

#proof[
  נשתמש בפירוק $x = plus.minus product_(p in PP) p^(n_p)$ כאשר $n_p in ZZ$ (ורק מספר סופי מהם שונים מאפס).\
  מהגדרת הנורמה ה־$p$־אדית והנורמה של הערך המוחלט נקבל
  $
    abs(x) dot.op product_(p in PP) abs(x)_p = product_(p in PP) p^(n_p) dot.op product_(p in PP) p^(-n_p) = product_(p in PP) (p^(n_p) dot.op p^(-n_p)) = product_(p in PP) 1 = 1
  $
]

#question()
יהיו $p!=q$ ראשוניים ונוכיח כי קיימת סדרה $(a_n)_(n=1)^infinity$ של מספרים רציונליים שבשדה נורמי $(QQ, abs(dot.op)_p)$ היא מתכנסת ובשדה נורמי $(QQ, abs(dot.op)_q)$ היא לא חסומה.

#proof[
  נגדיר את הסדרה $ a_n = p^n dot.op q^(-n) = (frac(p, q))^n $
  מתקיים
  $
    abs(a_n)_p = abs(p^n/q^n)_p = frac(abs(p^n)_p, abs(q^n)_p) =_(p!=q) frac(abs(p^n)_p, 1) =p^(-n) stretch(arrow)_(n arrow infinity) 0
  $
  והסדרה אכן מתכנסת ל־$0$ ב־$abs(dot.op)_p$. מצד שני מאותם נימוקים,
  $
    abs(a_n)_q = abs(frac(p^n, q^n))_q = frac(abs(p^n)_q, abs(q^n)_q) = frac(1, q^(-n)) = q^n stretch(arrow)_(n arrow infinity) infinity
  $
  ובפרט הסדרה לא חסומה.
]

#question()
יהי $p != q$ ראשוניים, $a,b in ZZ$ ו־$epsilon i RR_plus$. נוכיח כי קיים $z in ZZ$ כך ש־$abs(z-a)_p < epsilon$ וגם $abs(z-b)_q<epsilon$.

#proof[
  נבחר $n in NN$ גדול מספיק כך ש־$p^(-n) <epsilon$ וגם $q^(-n) < epsilon$ ולכן אנחנו צריכים לפתור את מערכת המשוואות
  $ cases(z eq.triple_(mod p^n) a, z eq.triple_(mod q^n) b) $
  שכן מהגדרת הנורמה ה־$p$־אדית, $abs(z-a)_p < p^(-n)$ זה אומר ש־$z-a$ מתחלק ב־$p^n$.
  ממשפט השאריות הסיני נקבל שקיים פיתרון למשוואה לעיל אם ורק אם המודולים זרים, אבל $p != q$ והם ראשוניים אז אכן $gcd(q^n, p^n)=1$ ולכן קיימת סדרה של מספרים $z in ZZ$ המקיימים את המשוואה הזאת.
]

#question()
יהי $p$ ראשוני, $d in QQ$, $x in RR$ ו־$epsilon in RR_plus$. נוכיח שקיים $q in QQ$ כך ש־$abs(q-d)_p < epsilon$ וגם $abs(q-x)<epsilon$.

#proof[
  כמקודם, נבחר $n in NN$ גדול מספיק כך ש־$p^(-n) < epsilon$ והתנאי הראשון $abs(q-d)_p < p^(-n)$ שקול לכך ש־$q eq.triple_(mod p^n) d$.\
  $d in QQ$ ולכן קיימים $a in ZZ, b in NN$ כך ש־$d=a/b$ ו־$p divides.not b$ ולכן זה מוגדר היטב.\
  $QQ$ צפוף ב־$RR$ ולכן לכל $x in RR$ ולכל $epsilon > 0$ קיימת קבוצה אינסופית של מספרים רציונליים בסביבה $epsilon$ של $x$ ואנחנו מחפשים רציונלי מהצורה
  $ q=d+p^n dot.op k $
  עבור $k in QQ$.\
  אם נבחר $k$ כך ש־$abs(p^n dot.op k) < epsilon$ כלומר $abs(k) < epsilon/p^n$ נקבל ש־$abs(q-x)<epsilon$ וגם $abs(q-d)_p < epsilon$ שכן $q-d = p^n k$ והנורמה ה־$p$־אדית של $p^n$ היא לכל היותר $p^(-n)$.
  מהצפיפות ניתן גם לבחור $k$ כך ש־$(x-d)/p^n$ נמצא בסביבה של $k$ ולכן קיים רציונלי כנדרש.
]

#question()
יהי $FF$ שדה ונגדיר $DEG : FF(X) arrow ZZ union {minus infinity}$ על־ידי
$ DEG(frac(f, g)) = mycases(deg(f)-deg(g), frac(f, g) != 0, minus infinity, frac(f, g) = 0) $
כאשר $deg$ היא הדרגה של הפולינום.

#subquestion()
נוכיח כי $DEG$ מוגדר היטב, כלומר אם $f_1, g_1, f_2, g_2 in FF[X]$ כך ש־$g_1, g_2 !=0$ וגם $display(frac(f_1, g_1) = frac(f_2, g_2))$ אזי $display(DEG(frac(f_1, g_1))=DEG(frac(f_2, g_2)))$.

#proof[
  אם $f_1 = 0$, מהיות $g_1 != 0$ נובע כי $frac(f_1, g_1) = 0$ ולכן מהשיוויון בהכרח נובע שגם $f_2 = 0$ כי $g_2 != 0$ ולכן
  $ DEG(frac(f_1, g_1)) = minus infinity = DEG(frac(f_2, g_2)) $
  נניח ש־$f_1, f_2 !=0$ ומהשיוויון הנתון נובע כי $f_1 dot.op g_2 = f_2 dot.op g_1$ ולכן מכפליות הדרגה נקבל
  $
    deg(f_1 dot.op g_2) = deg(f_2 dot.op g_1) <==> deg(f_1) + deg(g_2) = deg(f_2) + deg(g_1) <==> deg(f_1) - deg(g_1) = deg(f_2) - deg(g_2)
  $
  אבל הביטוי משמאל זה בידיוק הגדרת $DEG$, כלומר קיבלנו ש־$DEG$ מוגדרת היטב.
]

#subquestion()
נוכיח שלכל $phi, psi in FF(X)$ מתקיימת כפליות, כלומר
$ DEG(phi psi) = DEG(phi)+DEG(psi) $

#proof[
  יהיו $phi, psi in FF(X)$ פולינומים ששונים מ־$0$ ולכן מהגדרה קיימים $f_1, f_2, g_1, g_2 in FF[X] without {0}$ כך ש־$display(phi = frac(f_1, g_1)), space display(psi= frac(f_2, g_2))$
  אז גם המכפלה שלהם הוא פולינום שנתון על־ידי
  $ phi dot.op psi = frac(f_1, g_1) dot.op frac(f_2, g_2) = frac(f_1 dot.op f_2, g_1 dot.op g_2) $
  ולכן מהגדרת $DEG$ ומכפליות $deg$ נקבל
  $
    DEG(phi dot.op psi) & = deg(f_1 dot.op f_2) - deg(g_1 dot.op g_2) \
                        & = deg(f_1) + deg(f_2) - (deg(g_1) + deg(g_2)) \
                        & = (deg(f_1) - deg(g_1)) + (deg(f_2) - deg(g_2)) \
                        & = DEG(frac(f_1, g_1)) + DEG(frac(f_2, g_2)) \
                        & = DEG(phi) + DEG(psi)
  $
]

#subquestion()
נוכיח שלכל $phi, psi in FF(X)$ מתקיים $ DEG(phi + psi)<=max(DEG(phi), DEG(psi)) $

#proof[
  כמקודם, יהיו $phi, psi in FF(X)$ פולינומים ששונים מ־$0$ ולכן ניתן לכתוב אותם על־ידי מנות של פולינומים בעלי מכנה משותף
  $ phi = frac(f, g) wide psi = frac(h, g) $
  כאשר $f,h,g in FF[X]$ ו־$g!=0$.
  מהגדרת $DEG$ מתקיים
  $ DEG(phi + psi) = DEG(frac(f+h, g)) = deg(f+h) - deg(g) $
  אבל מתכונות הדרגה של פולינום אנחנו יודעים שמתקיים $deg(f+h)<=max(deg(f), deg(h))$ ולכן
  $ DEG(phi+psi) <= max(deg(f), deg(h)) - deg(g) = max(deg(f)-deg(g), deg(h)-deg(g)) = max(DEG(phi), DEG(psi)) $
  ברור אם $psi+phi = 0$ אז $DEG(psi+phi) = minus infinity$ והטענה נכונה באופן טריוויאלי ואם $DEG(phi)=DEG(psi)$ אז יש שיוויון ולא אי־שיוויון.
]

#question()
יהי $FF$ שדה, $alpha in RR$ כך ש־$0<alpha<1$. נגדיר $abs(dot.op)_alpha : FF(X) arrow RR^plus$ על־ידי
$ abs(phi)_alpha = alpha^(-DEG(phi)) = alpha^(-DEG(frac(f, g))) = alpha^(deg(g)-deg(f)) $
נוכיח שהנורמה $abs(dot.op)$ היא נורמה לא ארכימדית על $FF(X)$.

#proof[
  כדי להראות שהנורמה לא ארכימדית עלינו להראות שהיא מקיימת את אי־שיוויון האולטרה מטרי החזק, כלומר שלכל $x,y in FF$ מתקיים
  $ abs(x+y)<=max(abs(x), abs(y)) $
  אז יהיו $phi, psi in FF(X)$. מהגדרת הנורמה
  $ abs(phi+psi) = alpha^(-DEG(phi+psi))<=max(alpha^(-DEG(phi)), alpha^(-DEG(psi))) $
  מהיות $alpha in (0,1)$ נובע כי הפונקציה $t mapsto alpha^(-t)$ היא פונקציה עולה ולכן מספיק להראות שאי־השיוויון מתקיים עבור המעריכים,  אבל זה בידיוק מה שראינו בשאלה הקודמת
  $ DEG(psi+phi) <= max(DEG(phi), DEG(psi)) $
  כלומר אי־שיוויון האולטרה מטרי החזק מתקיים ולכן הנורמה לא ארכימדית.
]

#question()
יהי $FF$ שדה ו־$alpha in RR$ כך ש־$0<alpha<1$. נגדיר $abs(dot.op)_alpha : FF(X) arrow RR^plus$ על־ידי
$ abs(phi)_alpha = alpha^(-DEG(phi)) = alpha^(-DEG(frac(f, g))) = alpha^(deg(g)-deg(f)) $

#subquestion()
נוכיח שמתקיים $cal(O)_abs(dot.op)_alpha = {frac(f, g) bar f,g in FF[X], space g!=0, space deg(f)<=deg(g)}$.

#proof[
  כזכור, הגדרנו $cal(O)_abs(dot.op)_alpha = {phi in FF(X) bar abs(phi)_alpha <=1}$ ונסמן את הקבוצה הנתונה לנו ב־$S$, נוכיח באמצעות הכלה דו־כיוונית.\
  $S subset.eq cal(O)_abs(dot.op)_alpha$: יהי $phi in S$ ולכן קיימים $f,g in FF[X]$ כך ש־$g!=0$, $phi = frac(f, g)$ ו־$deg(f)<=deg(g)$, ולכן
  $ abs(phi)_alpha = alpha^(deg(g)-deg(f)) $
  אבל מהנתון $k = deg(g)-deg(f) >= 0$ מכך ש־$alpha in (0,1)$ נובע ש־$alpha^k <= 1$ (והערך הוא מקסימלי כאשר $k=0$) ולכן $phi in cal(O)_abs(dot.op)_alpha$.\
  $S supset.eq cal(O)_abs(dot.op)_alpha$: יהי $phi in cal(O)_abs(dot.op)_alpha$ ולכן $abs(phi)_alpha <= 1$. נכתוב $phi = frac(f, g)$ עבור $f,g in FF[X]$ כך ש־$g!=0$ (תמיד יש כאלו מהגדרת חוג הפונקציות הרציונליות) ולכן
  $ abs(phi)_alpha = alpha^(deg(g)-deg(f)) <= 1 $
  אבל שוב $alpha in (0,1)$ ולכן $t mapsto alpha^t$ היא פונקציה יורדת ולכן כדי שיתקיים $alpha^(deg(g)-deg(f)) <= 1 = alpha^0$ חייב להתקיים גם $deg(g)-deg(f)>=0$ אבל זה מתקיים אם ורק אם $deg(f)<=deg(g)$ אבל זה בידיוק אומר ש־$phi in S$ לפי הגדרה.\
  מצאנו הכלה דו־כיוונית ולכן יש שיוויון.
]

#subquestion()
נוכיח שמתקיים $cal(M)_abs(dot.op)_alpha = {f/g bar f,g in FF[X], space g!=0, space deg(f)<deg(g)} = 1/X cal(O)_abs(dot.op)_alpha$.

#proof[
  כזכור, הגדרנו $cal(M)_abs(dot.op)_alpha = {phi in FF(X) bar abs(phi)_alpha < 1}$.\
  כמקודם, $alpha^(deg(g)-deg(f)) < 1$ ומכך שהפונקציה יורדת חייב להתקיים $deg(g)-deg(f) > 0$ ולכן $deg(f)<deg(g)$ ובפרט כמקודם החלק הראשון של הטענה נובע.\
  נוכיח ש־$cal(M)_abs(dot.op)_alpha = 1/X cal(O)_abs(dot.op)_alpha$ באמצעות הכלה דו־כיוונית.\
  $1/X cal(O)_abs(dot.op)_alpha subset.eq cal(M)_abs(dot.op)_alpha$: יהי $phi in 1/X cal(O)_abs(dot.op)_alpha$ ולכן $phi = 1/X dot.op psi$ עבור $psi in cal(O)_abs(dot.op)_alpha$.
  מהסעיף הקודם, קיימים $f,g in FF[X]$ כך ש־$psi = frac(f, g)$, $g!=0$ ו־$deg(f)<=deg(g)$.\
  המונה במכפלה שלנו לא השתנה אבל המכנה כן –הוא נהפך להיות $X dot.op g$ אבל $deg(X dot.op g) = deg(X) + deg(g) = 1 + deg(g)$.\
  אבל אם $deg(f) <= deg(g)$ אז בהכרח $deg(f) < deg(g) + 1$ אבל זה בידיוק אומר ש־$phi in cal(M)_abs(dot.op)_alpha$.\
  $1/X cal(O)_abs(dot.op)_alpha supset.eq cal(M)_abs(dot.op)_alpha$: יהי $phi = f/g in cal(M)_abs(dot.op)_alpha$ ולכן $deg(f) < deg(g)$. ניתן לכתוב
  $ phi = 1/X dot.op (frac(f dot.op X, g)) $
  נראה ש־$frac(f dot.op X, g) in cal(O)_abs(dot.op)_alpha$, כמקודם מתקיים $deg(f dot.op X) = deg(f)+1$ ומכיוון ש־$deg(f)<deg(g)$ אזי $deg(f)+1<=deg(g)$ ולכן בביטוי שלנו דרגת המונה קטנה שווה לדרגת המכנה ולכן $frac(f dot.op X, g) in cal(O)_abs(dot.op)_alpha$ כלומר $phi in 1/X cal(O)_abs(dot.op)_alpha$.\
  הראינו הכלה דו־כיוונית ולכן יש שיוויון.
]

#subquestion()
נוכיח שמתקיים $closure(FF(X))_abs(dot.op)_alpha tilde.equiv FF$.

#proof[
  ראינו עד־כה $ closure(FF(X))_abs(dot.op)_alpha = cal(O)_abs(dot.op)_alpha slash cal(M)_abs(dot.op)_alpha = cal(O)_abs(dot.op)_alpha slash 1/X cal(O)_abs(dot.op)_alpha $
  נגדיר $phi:FF(X) arrow FF$ על־ידי
  $ phi(frac(a_n x^n + dots.h.c + a_0 x^0, b_n x^n + dots.h.c + b_0 x^0)) = a_n/b_n $
  שכן מהגדרות $cal(O)_abs(dot.op)_alpha$ ו־$cal(M)_abs(dot.op)_alpha$ על דרגות הפולינומים.\
  $phi$ הומומורפיזם של חוגים והוא על כי כל $c in FF$, הפולינום הקבוע $frac(c, 1)$ מקיים $phi(frac(c, 1))=c$.\
  יתר על־כן, $frac(f, g) in ker phi$ אם ורק אם $a_n = 0$ ואם $a_n =0$ אזי $deg(f) < n = deg(g)$ ולכן $frac(f, g) in cal(M)_abs(dot.op)_alpha$ והאחרון הוא אידיאל מקסימלי ולכן $ker phi = cal(M)_abs(dot.op)_alpha$.\
  ממשפט האיזומורפיזם הראשון לחוגים נקבל ש־$FF tilde.equiv FF(X) slash ker phi = closure(FF(X))_abs(dot.op)_alpha$, כנדרש.
]
