#import "../../../../src/article.typ": *
#show: article.with(
  title: [ מבנים אלגבריים 2, 80446 --- סיכום ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695

#let char = math.op("char")
#let im = math.op("Im")
#let ker = math.op("Ker")
#let deg = math.op("deg")
#let cont = math.op("cont")
#let frac = math.op("Frac")

//#set heading(numbering: "1.")
#outline(depth: 2)

#let waka = state("waka", ())
#show figure.where(kind: "thmenv"): it => {
  waka.update(arr => {
    arr.push(it)
    arr
  })
  it.body
}

= *הרצאה 1 – 24/03*
== מבוא להרחבת שדות
#convention[
  אנחנו עובדים רק בחוג קומוטטיבי עם יחידה (0 הוא חוג עם יחידה) והומומורפיזם של חוגים לוקח 1 ל־1 (מכבד את מבנה החוג). כמו כן, אנחנו עובדים תמיד בתחום שלמות (תחום ללא מחלקי 0).
]
#example("הומומורפיזם של חוגים")[
  $phi: ZZ arrow.r 0$ הוא הומומורפיזם של חוגים.
]
#counterexample("לא הומומורפיזם של חוגים")[
  $phi: 0 arrow.r ZZ$ הוא לא הומומורפיזם של חוגים.
]
#example("שדות")[
  $FF_p = ZZ slash p ZZ,QQ(sqrt(2)), QQ, RR,CC$ עבור $p in NN$ ראשוני בלבד.
]
#counterexample("לא שדות")[
  $0, FF[X], M_(n times n) (FF)$
]

#definition("פולינום מתוקן")[
  יהי $f$ פולינום, ניזכר כי $f = sum_(i=1)^n a_i x^i$.נגיד כי $f$ הוא *מתוקן* אם המקדם המוביל שלו הוא 1.
]
#definition("אי־פריק")[ $R$ תחום שלמות ו־$0!=r in R$. $r$ נקרא *אי־פריק (irreducible)* אם איננו הפיך ואין לו פריק אמיתי. משמע, אם מתוך $r = a b$ נובע ש־$a in R^x$ או $b in R^x$ (משמע $a~r$ או $b~r$).]

== בניות

= *הרצאה 2 – 25/03*

= *הרצאה 3 – 31/03*

= *הרצאה 4 – 07/04*

= *הרצאה 5 – 08/04*
#text(red)[*להשלים הקדמה*]

== למות גאוס
#remark[אנחנו נעבוד עם $ZZ[t]$ אבל ברשומות (פרק 1) מופיע שאפשר לחקור באותה צורה את $R[t]$ כאשר $R$ תחום פריקות יחידה (למשל, תחום ראשי).]
#definition("תכולה")[
  עבור פולינום $f(t) in ZZ[t]$ (תזכורת: $f(t) = sum_(i=0)^n a_i t^i$) נגדיר *תכולה* של $f$ להיות
  $ cont(f) = gcd(a_0, a_1, ..., a_n) $
]
#definition("פולינום פרימיטיבי")[
  פולינום $f(t) in ZZ[t]$ יקרא *פרימיטיבי* אם $cont(f) = 1$.
]
#remark[ לכל פולינום $f$ יש פירוק ב־$ZZ[t]$ הנתון על־ידי $f = cont(f) dot.op f_0 (t)$ כאשר $f_0 (t)$ הוא פולינום פרימיטיבי.]
#theorem("למת גאוס הראשונה")[
  אם $f, g in ZZ[t]$ אזי $cont(f g) = cont(f) dot.op cont(g)$. בפרט, $f g$ פרימיטיבי אם ורק אם $f$ ו־$g$ פרימיטיביים.
]
#proof[
  מההערה לעיל מתקיים $f dot.op g = cont(f) dot.op cont(g) underbrace(f_0 dot g_0, "פרימיטיביים")$ ולכן מספיק להוכיח כי $f_0 dot.op g_0$ הוא פרימיטיבי: \
  נניח שלא ולכן קיים $p in NN$ ראשוני כך שמתקיים $p divides cont(f_0 dot.op g_0)$, אבל $f_0 = sum_(i=0)^n a_i t^i, g_0 =sum_(j=0)^m b_j t^j$ הם פולינומים פרימטיביים (ולכן לא כל $a_i, b_j$ מתחלקים ב־$p$) ולכן נוכל לבחור $m,n$ מינימליים כך ש־$p divides.not a_n$ ו־$p divides.not b_m$.\ נסתכל על המקדם של $ c = sum_(k=0)^(m+n) a_k b_(m+n-k)$ של $t^(m+n)$ ב־$f_0 dot.op g_0$, נכתוב אותו מפרושות:
  $
    underbrace(a_0 b_(m+n) + ... + a_(n-1) b_(m+1),"לכל k<n" p divides a_k "מתחלקים ב־p כי " ) + a_n b_m + underbrace(a_(n+1) b_(m-1) + ... + a_(m+n) + b_0, "לכל k>n" p divides b_k "מתחלקים ב־p כי " )
  $
  אבל $a_n b_m$ זר לחלוקה ב־$p$ ולכן $p divides.not c$ וזאת סתירה.
]
#corollary[כל ראשוני $p in ZZ$ ראשוני ב־$ZZ[t]$ (לא ראינו בהרצאה, מסקנה 1.2.5 בסיכום של מיכאל).]
#proof[
  נשים לב ש־$p in.not ZZ^x = ZZ[t]^x$ ולכן $p$ מחלק פולינום $h in ZZ[t]$ אם ורק אם $p divides cont(h)$.\
  אם $p divides f dot.op g$ אז מלמת גאוס הראשונה נובע $p divides cont(f) dot.op cont(g)$ ולכן $p divides f$ או $p divides g$.
]
#theorem("למת גאוס השנייה")[
  יהי $f in ZZ[t]$ פולינום לא קבוע. נזכור כי $QQ[t]$ הוא $frac(ZZ)$, שדה השברים של $ZZ[t]$. אז
  + אם $f=g dot.op h$ פירוק ב־$QQ[t]$ אזי קיים $0 != c in QQ^x$ כך ש־$c dot.op g, c^(-1) dot h in ZZ[t]$ ולכן $f = (c dot.op g) dot.op (c^(-1) dot.op h)$ פירוק ב־$ZZ[t]$
  + אם $f$ פולינום מתוקן ו־$f = g dot.op h in QQ[t]$ פירוק מתוקן (דהיינו $f, g$ מתוקנים) אזי $g, h in ZZ[t]$
  + אם $f$ פולינום אי־פריק ב־$ZZ[t]$ אם ורק אם $f$ פרימטיבי ואי־פריק ב־$QQ[t]$
]
#proof[
  + ניקח את הפירוק $f = g dot.op h$ עבור $g, h in QQ[t]$ וניקח $0<m,n in ZZ$ כך ש־$m dot.op g, n dot.op h in ZZ[t]$ ואז נקבל פירוק $m dot.op n dot.op f = m dot.op g dot.op n dot.op h$.
    נסמן $ell = cont(f), alpha = cont(m dot.op g), beta = cont(n dot.op h)$. מלמת גאוס הראשונה נקבל עם כפליות התכולה
    $ cont(m dot.op n dot.op f) = m dot.op n dot.op ell = alpha dot.op beta = cont(m dot.op g dot.op n dot.op h ) $
    אם כך, ניקח $m dot.op n dot.op f = m dot.op g dot.op n dot.op h$ ונחלק ב־$ m dot.op n dot.op ell = alpha beta$ ונקבל $1/ell dot.op f = (m dot.op n dot.op f)/(m dot.op n dot.op ell) = underbrace(m/alpha dot.op g dot.op n/beta dot.op h, in ZZ[t])$ משמע $f = ell m/alpha dot.op g dot.op n/beta dot.op h$.
  + נניח ש־$f$ גם מתוקן, ולכן בפרט הוא פרימיטיבי, ולכן קיים פירוק $f = g dot.op h in QQ[t]$ עם $g, h$ מתוקנים.\
    לפי $(1)$ נובע שקיים $c, c^(-1) in ZZ$ כך ש־$c dot.op g dot.op c^(-1) dot.op h in ZZ[t]$ כך ש־$f = c dot.op g dot.op c^(-1) dot.op h$.\
    נסמן $g = sum_(i=1)^n a_i t^i, h = sum_(j=1)^m b_j t^j$. היות ו־$f$ מתוקן נובע כי $a_n b_m = 1$ ולכן בהכרח $a_n = b_m = 1$, ו־$c dot.op g, c^(-1) dot.op h$ עדיין פולינומים מתוקנים ולכן $c = plus.minus 1$ ולכן $g,h in ZZ[t]$.
  + (הוכח בהרצאה 6)\
    $<==$ נניח כי $f$ אי־פריק ב־$ZZ[t]$ ולכן $f = cont(f) dot.op f/cont(f)$ פירוק טריוויאלי ונשים לב $deg (f/cont(f)) > 0$ ולכן $cont(f)$ הפיך ולכן $f$ פרימיטיבי.\
    נניח ש־$f$ פריק ב־$QQ[t]$ ולכן יש $f = g dot.op h$ כך ש־$deg(g), deg(h) > 0$ ולכן מ־$(1)$ לעיל נקבל $f = c dot.op g dot.op c^(-1) dot.op h $ עם דרגות גדולות מ־0 ב־$ZZ[t]$ משמע הוא פריק בו, וזאת סתירה.\
    $==>$ בכיוון השני, נניח ש־$f$ פריק ב־$ZZ[t]$ ולכן $f = g dot.op h$ עם $g ,h$ לא הפיכים. יש 2 מקרים אפשריים:
    + אם $deg(f), deg(g) > 0$ ואז נובע כי $f$ פריק ב־$QQ[t]$ על־ידי פירוק זה וזאת סתירה
    + בלי הגבלת הכלליות $deg(h) = 0, deg(g) > 0$ ולכן $1 < h in ZZ_plus$ אבל אז $f$ לא פרימיטיבי וזאת שוב סתירה
]
#corollary[$ZZ[t]$ הוא חוג פריקות יחידה והראשוניים שלו הם פולינומים פרימטיביים אי־פריקים והראשוניים של $ZZ$.]
#remark[באותה צורה מוכיחים שאם $R$ תחום פריקות יחידה אזי גם $R[t_1, ..., t_n]$ הוא גם תחום פריקות יחידה (באינדוקציה על $n$).]

= *הרצאה 6 – 21/04*
== קריטריונים לאי־פריקות ב־$QQ[t]$
המוטיבציה שלנו היא חקר הרחבות של $QQ[t]$ אבל זה לא פשוט.
אי־פריקות בדרך־כלל קשה להבחנה להבדיל מקיום שורש ב־$QQ$: דוגמה טובה לכך היא $t^4+4$.
#notation[
  $R$ תחום שלמות, בהינתן אידיאל ראשוני $I subset.eq R$ נסמן את התחום $R slash I = overline(R)$ ועבור $a in R$ נסמן $overline(a)$ בתמונה של $overline(R)$. \
  כמו כן, הההומומורפיזם $R arrow.r overline(R)$ מתרחב להומומורפיזם $R[t] arrow.r overline(R)[t]$ כאשר $f = sum_(i=0)^n a_i t^i mapsto sum_(i=0)^n overline(a_i) t^i = overline(f)$.]
#lemma[נניח כי $f in ZZ[t]$ פולינום מתוקן, $p in NN$ ראשוני כך ש־$ overline(f) in FF_p [t](t)$
  (מודלו $p$ זה הומומורפיזם של חוגים) אי־פריק. \
  אזי $f$ פריק ב־$QQ[t]$]
#proof[
  נניח בשלילה כי $f$ מתפרק ב־$QQ[t]$ ולכן קיים פירוק מתוקן $f = g h in QQ[t]$ ($deg g, deg h > 0$).\
  לפי $(2)$ בלמת גאוס השנייה נובע כי $f = g dot.op h in ZZ[t]$ ואז $overline(f) = overline(g) dot.op overline(h) in FF_p [t]$ עם $deg(overline(g)), deg(overline(h)) > 0$ כי הפולינומים מתוקנים וזאת סתירה.
]
#exercise[$FF_p [t] = ZZ[t] slash p ZZ[t]$]
#proof[
  נגדיר $phi: ZZ[t] arrow.r FF_p [t]$ על־ידי $f(t) mapsto accent(f, ~)(t)$, כאשר $accent(f, ~)(t)$ זה הפולינום המתקבל על־ידי הפחת כל מקדם ב־$f(t)$ למודלו $p$.\
  בדיקה קלה מראה כי זה אכן הומומורפיזם ונשים לב כי $ker(phi) = {f(t) in ZZ[t] bar phi(f) = 0 in FF_p [t]}$ אלו כל הפולינומים שבמודלו $p$ הם מתאפסים משמע מתחלקים ב־$p$ ולכן $ker(phi) = p ZZ[t]$. ממשפט האיזומורפיזם הראשון לחוגים נקבל $ ZZ[t] slash ker(phi) tilde.rev.equiv im(phi) = FF_p [t] ==> ZZ[t] slash p ZZ[t] tilde.rev.equiv FF_p [t] $
]
#theorem("קריטריון אייזנשטיין")[
  נניח ש־$ZZ[t] in.rev f = sum_(i=0)^n a_i t^i$ ו־$p in NN$ ראשוני כך שמתקיימים הבאים
  + $p divides.not a_n$
  + $p divides a_i$ לכל $0<=i<n$
  + $p^2 divides.not a_0$
  אז $f$ אי־פריק.
]
#proof[
  נניח בשלילה שלא כך, ולכן מהלמות של גאוס נובע שמתקיים $f = g dot.op h = sum_(j=1)^m b_j t^j sum_(k=1)^l c_k ^ t^k$.\
  היות ו־$a_0 = b_0 c_0$ ו־$p divides a_0$ נובע כי $p divides b_0$ או $p divides c_0$. בלי הגבת הכללית, נניח כי $p divides b_0$ ו־$p divides.not c_0$ (שכן $p divides a_0$ אבל $p divides.not a_0$ ולכן לא ניתן שגם $p divides b_0$ וגם $p divides c_0$).\
  ניקח את ה־$i<=m$ הקטן ביותר כך ש־$p divides b_i$ שקיים מהיות $b_m c_l = a_n$ ולכן $p divides.not b_m$.\
  כעת, בביטוי $a_i = b_i c_0 + underbrace(b_(i-1) c_1  + ... + b_0 c_i, "מתחלקים ב־p")$ אבל אז $p divides.not a_i$ וזאת סתירה.\
  אז $f$ לא מתפרק לגורמים מדרגה גדולה מ־0 ואז $f$ אי־פריק ב־$ZZ[t]$ ומהלמה של גאוס נובע כי הוא גם אי־פריק ב־$QQ[t]$.
]
#example[יהי $x^n - m$ וקיים $p in NN$ כך ש־$p divides m$ ו־$p^2 divides.not m$ אז $x^n - m$ אי־פריק (ולא רק חסר שורשים).]
#counterexample[$x^2-m^2, x^2+4$ תמיד פריקים: אם $p divides m^2$ אז גם $p divides m$.]
#definition("פולינום ציקלוטומי")[
  לפולינום מינימלי של שורש יחידה מעל $QQ$ נקרא *פולינום ציקלוטומי*.\
  לכל $n in ZZ$ מתאים פולינומים ציקלוטומי יחיד $Phi_n$ שהוא פולינום מתוקן בעל מקדמים שלמים והוא הפולינום המינימלי של כל השורשים הפרמיטיביים מסדר $n$. משמע $Phi_n (X) = product_omega (X - omega)$ כאשר $omega$ עובר על כל השורשים הפרימיטיביים מסדר $n$.]
#example[
  $ Phi_1 (x) = x-1, Phi_2 (x) = x+1, Phi_3 (x) = x^2 +x +1, Phi_4 (x) = x^2+1, Phi_5 (x) = x^4+x^3+x^2+x+1 $
  עבור $p in NN$ ראשוני, אז כל הפולינום הציקלוטומי מסדר $p^n$ הוא $(x^p^n-1)/(x^p^(n-1)-1) in QQ[x]$.
]
#lemma[לכל $p in NN$, הפולינום הציקלוטומי $Phi_p (t) = (t^p-1)/(t-1)$ אי־פריק מעל $QQ$.]
#proof[
  זה טריק, נשנה משתנה ל־$x=t-1$ ואז $t=x+1$ ואז נקבל
  $
    Phi_p (t) = ((x+1)^p-1) / x = (x^p+ p x^(p-1) + (p(p-1)) / 2)x^(p-2) +... + p x + 1 -1 / (x)= x^(p-1) + sum_(i=2)^(p-1) binom(p, i) x^(i-1) + p colon.eq f(x)
  $
  אז $f(x)$ אי־פריק לפי קריטריון אייזנשטיין שכן $p$ מקדם חופשי מתוקן ו־$p divides binom(p, i)$ לכל $0<i<p$.\
  אם $Phi_p (t)$ לא אי־פריק, אז קיימים $Phi_p (t) = g(t) dot.op h(t) = g(x+1) dot.op h(x+1)$ וזאת סתירה.
]
#remark[באותה צורה מוכיחים $Phi_(p^n) (t) = (t^p^n-1)/(t^p^(n-1)-1)$ אי־פריק.]

== סגור אלגברי
פרק 5 ברשומות של מיכאל, מוטיבציה: משוואות מסדר 5 לא ניתן לפתור.
#definition("שדה סגור אלגברי")[שדה $K$ נקרא *שדה סגור אלגברית* אם לכל פולינום לא קבוע מעל $K$ יש שורש ב־$K$.]
#definition("פולינום מתפצל לחלוטין")[נגיד $K$ שדה, נגיד כי $f in K[t]$ *פולינום מתפצל לחלוטין* אם הוא מתפרק לגורמים לינאריים. \
  משמע, $display(f=c product_(i=1)^deg(f) (t-a_i))$ כאשר $c in K^x$ ו־$a_i in K$ לכל $i$.]
#lemma[עבור שדה $K$ הבאים שקולים
  + סגור אלגברית
  + כל פולינום $0!= f in K[t]$ מתפצל לחלוטין
  + כל $f in K[t]$ אי־פריק הוא מדרגה 1
  + ל־$K$ אין הרחבות אלגבריות לא טריוויאליות
]
#proof[
  $(2) <==> (3)$ כי תמיד יש פירוק לפולינומים אי־פריקים.\
  $(1) <== (2)$: אם יש פירוק מלא, נובע מהגדרה שיש לי שורש.\
  $(2) ==> (1)$: נובע שלכל $f = g(t-a)$ יש פירוק כאשר $deg g < deg f $ ומסיימים את הטיעון עם אינדוקציה על $deg(f)$.\
  $(1) <== (4)$: אם קיימת הרחבה אלגברית לא טריוויאלית $L slash K$ ניקבל $alpha in L without K$ ואז הפולינום $f_(alpha slash K)$ אי־פריק מדרגה $1 < [K(alpha) : K]$.
  $(4) ==> (1)$: אם $f$ אי־פריק ו־$deg(f) > 1$ נגדיר $L = K[t] slash (f)$ ו־$[L : K] = deg(f) > 1$.
]
#remark[השם סגור אלגברית נובע כי אין עוד הרחבות מעליהם.]

#theorem("המשפט היסודי של האלגברה")[$CC$ סגור אלגברית.]
לא נוכיח כעת את המשפט אלא בהמשך, עד אז נשתמש בו על תנאי או בדוגמאות אך לא נסתמך עליו בהוכחות. יש לו כמה הוכחות (אלגברית, אנליטיות, טופולוגיות) אבל אנחנו נשתמש בכך שלכל פולינום $RR[t]$ מדרגה אי־זוגית יש שורש.

#corollary[
  + כל פולינום לא קבוע ב־$RR[t]$ מתפרק למכפלה של גורמים לינאריים וריבועיים.
  + האי־פריקים ב־$RR[t]$ הם לינאריים וריבועיים עם $op("dic") < 0$ (דיסקרמיננטה)
]
#proof[
  נשים לב $1<==>2$ ברור, ולכן מספיק שנוכיח רק את $1$:
  נשים לב $f = overline(f) = RR[t] subset.eq CC[t]$ ולכן ההצמדה רק מחליפה את השורשים של \ $f = c product_(i=1)^n (t-a_i)$ (נשים לב שההצמדה היא בעצם תמורה, כי ההצמדה רק יכולה לשנות מיקום לשורשים אך לא את השורשים עצמם).\
  לטובת מי מבנינו שמתעב מרוכבים, ניזכר במספר עובדות קצרות. הצמוד המרוכב של מספר ממשי הוא ממשי. כמו־כן, הצמוד המרוכב סגור לחיבור וכפל, כלומר הצמוד של מכפלה שווה למכפלה של צמודים, ואותו הדבר לחיבור.
  המשמעות היא שאם $f in RR[x]$ פולינום ממשי, אז כפולינום מעל המרוכבים נקבל ש־$f = overline(f)$.
  בשל סגירות זו, גם בפירוק לגורמים לינאריים מעל המרוכבים מתקיים
  $ product_(i = 1)^n (x - a_i) = f(x) = overline(f(x)) = product_(i = 1)^n (x - overline(a_i)) $
  נוכל להסיק אם כך שהפירוק הלינארי אינווריאנטי לצמוד, כלומר לכל $1 <= i <= n$ או ש־$a_i in RR$ או ש־$a_i in CC$ וכן $overline(a_i) in { a_i bar 0 <= i <= n }$.
  \
  נסמן את הממשיים כ־$a_i$ ואת המרוכבים כ־$alpha_j$ (תוך מחיקת הצמודים), ונקבל,
  $ f(x) = product_(i = 1)^k (x - a_i) dot.op product_(j = 1)^m (x - alpha_j)(x - overline(alpha_i)) $
  כלומר $f$ הוא מכפלה של גורמים לינאריים ממשיים ושל
  $ (x - alpha_i)(x - overline(alpha_i)) = x^2 - 2 (alpha_i + overline(alpha_i)) + overline(alpha_i) alpha_i $
  אבל כפל של מספר בצמוד שלו הוא ממשי, וכן חיבור מספר מרוכב לצמוד שלו (עוד שתי זהויות חשובות), ולכן זהו גורם ריבועי ממשי.
]
#corollary[
  נניח כי $L slash K$ הרחבה, $L$ סגור אלגברית ונגדיר $F = { alpha in L bar K "אלגברי מעל" alpha}$. \
  אז $F$ סגור אלגברית וזה נקרא *הסגור האלגברי* (Algebraic closure) של $K$ ב־$L$.
]
#proof[
  נניח $F$ לא סגור אלגברית, כלומר $f(t) in F[t]$ אי־פריק עם דרגה גדולה מ־$1$. אז יש ל־$f$ שורש ב־$L$ (כי $L$ סגור אלגברית) עם שורש, אבל $alpha$ אלגברי מעל $F$ ולכן $alpha slash K$ אלגברי ואז $alpha in F$ וזאת סתירה.
]
#example[$overline(QQ)$ הוא הסגור האלגברי של $QQ$ ולכן גם סגור אלגברית מעל $QQ$.]
= *הרצאה 7 – 22/04*

= *הרצאה 8 – 28/04*

= *הרצאה 9 – 29/04*

= Waka, doing some stuff

#context waka.get().join("")
