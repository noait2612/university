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
#let ker = math.op("ker")
#let deg = math.op("deg")
#let cont = math.op("cont")
#let Frac = math.op("Frac")
#let Aut = math.op("Aut")
#let Id = math.op("Id")
#let Fr = math.op("Fr")

#set heading(numbering: "1.1")
#outline(depth: 2)

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
#definition("אי־פריק")[ $R$ תחום שלמות ו־$0!=r in R$. $r$ נקרא *אי־פריק (irreducible)* אם איננו הפיך ואין לו פריק אמיתי. משמע, אם מתוך $r = a b$ נובע ש־$a in R^times$ או $b in R^times$ (משמע $a~r$ או $b~r$).]
#definition($"־הומומורפיזם"K$)[#text(red)[*להשלים*]]
#corollary[$K$־הומומורפיזם של שדות הוא תמיד שיכון.]
#proof[#text(red)[*להשלים*]]

== בניות

== שדות ראשוניים

= *הרצאה 2 – 25/03*
== הרחבת שדות

== יוצרים של הרחבות

= *תרגול 1 – 26/03*
== משהו

= *הרצאה 3 – 31/03*
== הרחבות אלגבריות

= *תרגיל 1*
== טריקים
== מסקנות

= *תרגול 2 – 02/04*
== משהו

= *הרצאה 4 – 07/04*
== שימושים בסיסיים של תורת השדות – בניות עם סרגל ומחוגה

= *הרצאה 5 – 08/04*
== שימושים בסיסיים של תורת השדות – בניות עם סרגל ומחוגה – המשך
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
  נניח שלא ולכן קיים $p in NN$ ראשוני כך שמתקיים $p divides cont(f_0 dot.op g_0)$, אבל $f_0 = sum_(i=0)^n a_i t^i, g_0 =sum_(j=0)^m b_j t^j$ הם פולינומים פרימטיביים (ולכן לא כל $a_i, b_j$ מתחלקים ב־$p$) ולכן נוכל לבחור $m,n$ מינימליים כך ש־$p divides.not a_n$ ו־$p divides.not b_m$.\ נסתכל על המקדם של $c = sum_(k=0)^(m+n) a_k b_(m+n-k)$ של $t^(m+n)$ ב־$f_0 dot.op g_0$, נכתוב אותו מפרושות:
  $
    underbrace(a_0 b_(m+n) + ... + a_(n-1) b_(m+1), "לכל k<n" p divides a_k "מתחלקים ב־p כי ") + a_n b_m + underbrace(a_(n+1) b_(m-1) + ... + a_(m+n) + b_0, "לכל k>n" p divides b_k "מתחלקים ב־p כי ")
  $
  אבל $a_n b_m$ זר לחלוקה ב־$p$ ולכן $p divides.not c$ וזאת סתירה.
]
#corollary[כל ראשוני $p in ZZ$ ראשוני ב־$ZZ[t]$ (לא ראינו בהרצאה, מסקנה 1.2.5 ברשומות של מיכאל).]
#proof[
  נשים לב ש־$p in.not ZZ^times = ZZ[t]^times$ ולכן $p$ מחלק פולינום $h in ZZ[t]$ אם ורק אם $p divides cont(h)$.\
  אם $p divides f dot.op g$ אז מלמת גאוס הראשונה נובע $p divides cont(f) dot.op cont(g)$ ולכן $p divides f$ או $p divides g$.
]
#theorem("למת גאוס השנייה")[
  יהי $f in ZZ[t]$ פולינום לא קבוע. נזכור כי $QQ[t]$ הוא $Frac(ZZ)$, שדה השברים של $ZZ[t]$. אז
  + אם $f=g dot.op h$ פירוק ב־$QQ[t]$ אזי קיים $0 != c in QQ^times$ כך ש־$c dot.op g, c^(-1) dot h in ZZ[t]$ ולכן $f = (c dot.op g) dot.op (c^(-1) dot.op h)$ פירוק ב־$ZZ[t]$
  + אם $f$ פולינום מתוקן ו־$f = g dot.op h in QQ[t]$ פירוק מתוקן (דהיינו $f, g$ מתוקנים) אזי $g, h in ZZ[t]$
  + אם $f$ פולינום אי־פריק ב־$ZZ[t]$ אם ורק אם $f$ פרימטיבי ואי־פריק ב־$QQ[t]$
]
#proof[
  + ניקח את הפירוק $f = g dot.op h$ עבור $g, h in QQ[t]$ וניקח $0<m,n in ZZ$ כך ש־$m dot.op g, n dot.op h in ZZ[t]$ ואז נקבל פירוק $m dot.op n dot.op f = m dot.op g dot.op n dot.op h$.
    נסמן $ell = cont(f), alpha = cont(m dot.op g), beta = cont(n dot.op h)$. מלמת גאוס הראשונה נקבל עם כפליות התכולה
    $ cont(m dot.op n dot.op f) = m dot.op n dot.op ell = alpha dot.op beta = cont(m dot.op g dot.op n dot.op h) $
    אם כך, ניקח $m dot.op n dot.op f = m dot.op g dot.op n dot.op h$ ונחלק ב־$m dot.op n dot.op ell = alpha beta$ ונקבל $1 / ell dot.op f = (m dot.op n dot.op f) / (m dot.op n dot.op ell) = underbrace(m / alpha dot.op g dot.op n / beta dot.op h, in ZZ[t])$ משמע $f = ell m / alpha dot.op g dot.op n / beta dot.op h$.
  + נניח ש־$f$ גם מתוקן, ולכן בפרט הוא פרימיטיבי, ולכן קיים פירוק $f = g dot.op h in QQ[t]$ עם $g, h$ מתוקנים.\
    לפי $(1)$ נובע שקיים $c, c^(-1) in ZZ$ כך ש־$c dot.op g dot.op c^(-1) dot.op h in ZZ[t]$ כך ש־$f = c dot.op g dot.op c^(-1) dot.op h$.\
    נסמן $g = sum_(i=1)^n a_i t^i, h = sum_(j=1)^m b_j t^j$. היות ו־$f$ מתוקן נובע כי $a_n b_m = 1$ ולכן בהכרח $a_n = b_m = 1$, ו־$c dot.op g, c^(-1) dot.op h$ עדיין פולינומים מתוקנים ולכן $c = plus.minus 1$ ולכן $g,h in ZZ[t]$.
  + (הוכח בהרצאה 6)\
    $<==$ נניח כי $f$ אי־פריק ב־$ZZ[t]$ ולכן $f = cont(f) dot.op f / cont(f)$ פירוק טריוויאלי ונשים לב $deg (f / cont(f)) > 0$ ולכן $cont(f)$ הפיך ולכן $f$ פרימיטיבי.\
    נניח ש־$f$ פריק ב־$QQ[t]$ ולכן יש $f = g dot.op h$ כך ש־$deg(g), deg(h) > 0$ ולכן מ־$(1)$ לעיל נקבל $f = c dot.op g dot.op c^(-1) dot.op h$ עם דרגות גדולות מ־0 ב־$ZZ[t]$ משמע הוא פריק בו, וזאת סתירה.\
    $==>$ בכיוון השני, נניח ש־$f$ פריק ב־$ZZ[t]$ ולכן $f = g dot.op h$ עם $g ,h$ לא הפיכים. יש 2 מקרים אפשריים:
    + אם $deg(f), deg(g) > 0$ ואז נובע כי $f$ פריק ב־$QQ[t]$ על־ידי פירוק זה וזאת סתירה
    + בלי הגבלת הכלליות $deg(h) = 0, deg(g) > 0$ ולכן $1 < h in ZZ_plus$ אבל אז $f$ לא פרימיטיבי וזאת שוב סתירה
]
#corollary[$ZZ[t]$ הוא חוג פריקות יחידה והראשוניים שלו הם פולינומים פרימטיביים אי־פריקים והראשוניים של $ZZ$.]
#remark[באותה צורה מוכיחים שאם $R$ תחום פריקות יחידה אזי גם $R[t_1, ..., t_n]$ הוא גם תחום פריקות יחידה (באינדוקציה על $n$).]

= *תרגול 3 – 09/04*
== משהו

= *תרגיל 2*
== טריקים
== מסקנות

= *הרצאה 6 – 21/04*
== קריטריונים לאי־פריקות ב־$QQ[t]$
המוטיבציה שלנו היא חקר הרחבות של $QQ[t]$ אבל זה לא פשוט.
אי־פריקות בדרך־כלל קשה להבחנה להבדיל מקיום שורש ב־$QQ$: דוגמה טובה לכך היא $t^4+4$.
#notation[
  $R$ תחום שלמות, בהינתן אידיאל ראשוני $I subset.eq R$ נסמן את התחום $R slash I = overline(R)$ ועבור $a in R$ נסמן $overline(a)$ בתמונה של $overline(R)$. \
  כמו כן, הההומומורפיזם $R arrow.r overline(R)$ מתרחב להומומורפיזם $R[t] arrow.r overline(R)[t]$ כאשר $f = sum_(i=0)^n a_i t^i mapsto sum_(i=0)^n overline(a_i) t^i = overline(f)$.]
#lemma[נניח כי $f in ZZ[t]$ פולינום מתוקן, $p in NN$ ראשוני כך ש־$overline(f) in FF_p [t](t)$
  (מודלו $p$ זה הומומורפיזם של חוגים) אי־פריק. \
  אזי $f$ אי־פריק ב־$QQ[t]$.]
#proof[
  נניח בשלילה כי $f$ מתפרק ב־$QQ[t]$ ולכן קיים פירוק מתוקן $f = g h in QQ[t]$ ($deg g, deg h > 0$).\
  לפי $(2)$ בלמת גאוס השנייה נובע כי $f = g dot.op h in ZZ[t]$ ואז $overline(f) = overline(g) dot.op overline(h) in FF_p [t]$ עם $deg(overline(g)), deg(overline(h)) > 0$ כי הפולינומים מתוקנים וזאת סתירה.
]
#exercise[$FF_p [t] = ZZ[t] slash p ZZ[t]$]
#proof[
  נגדיר $phi: ZZ[t] arrow.r FF_p [t]$ על־ידי $f(t) mapsto accent(f, ~)(t)$, כאשר $accent(f, ~)(t)$ זה הפולינום המתקבל על־ידי הפחת כל מקדם ב־$f(t)$ למודלו $p$.\
  בדיקה קלה מראה כי זה אכן הומומורפיזם ונשים לב כי $ker(phi) = {f(t) in ZZ[t] bar phi(f) = 0 in FF_p [t]}$ אלו כל הפולינומים שבמודלו $p$ הם מתאפסים משמע מתחלקים ב־$p$ ולכן $ker(phi) = p ZZ[t]$. ממשפט האיזומורפיזם הראשון לחוגים נקבל $ ZZ[t] slash ker(phi) tilde.equiv im(phi) = FF_p [t] ==> ZZ[t] slash p ZZ[t] tilde.equiv FF_p [t] $
]
#theorem("קריטריון אייזנשטיין (Eisenstein's criterion)")[
  נניח ש־$ZZ[t] in.rev f = sum_(i=0)^n a_i t^i$ ו־$p in NN$ ראשוני כך שמתקיימים הבאים
  + $p divides.not a_n$
  + $p divides a_i$ לכל $0<=i<n$
  + $p^2 divides.not a_0$
  אז $f$ אי־פריק.
]
#proof[
  נניח בשלילה שלא כך, ולכן מהלמות של גאוס נובע שמתקיים $f = g dot.op h = sum_(j=1)^m b_j t^j sum_(k=1)^l c_k^t^k$.\
  היות ו־$a_0 = b_0 c_0$ ו־$p divides a_0$ נובע כי $p divides b_0$ או $p divides c_0$. בלי הגבלת הכלליות, נניח כי $p divides b_0$ ו־$p divides.not c_0$ (שכן $p divides a_0$ אבל $p divides.not a_0$ ולכן לא ניתן שגם $p divides b_0$ וגם $p divides c_0$).\
  ניקח את ה־$i<=m$ הקטן ביותר כך ש־$p divides b_i$ שקיים מהיות $b_m c_l = a_n$ ולכן $p divides.not b_m$.\
  כעת, בביטוי $a_i = b_i c_0 + underbrace(b_(i-1) c_1 + ... + b_0 c_i, "מתחלקים ב־p")$ אבל אז $p divides.not a_i$ וזאת סתירה.\
  אז $f$ לא מתפרק לגורמים מדרגה גדולה מ־0 ואז $f$ אי־פריק ב־$ZZ[t]$ ומהלמה של גאוס נובע כי הוא גם אי־פריק ב־$QQ[t]$.
]
#example[יהי $x^n - m$ וקיים $p in NN$ כך ש־$p divides m$ ו־$p^2 divides.not m$ אז $x^n - m$ אי־פריק (ולא רק חסר שורשים).]
#counterexample[$x^2-m^2, x^2+4$ תמיד פריקים: אם $p divides m^2$ אז גם $p divides m$.]
#definition("פולינום ציקלוטומי")[
  לפולינום מינימלי של שורש יחידה מעל $QQ$ נקרא *פולינום ציקלוטומי*.\
  לכל $n in ZZ$ מתאים פולינומים ציקלוטומי יחיד $Phi_n$ שהוא פולינום מתוקן בעל מקדמים שלמים והוא הפולינום המינימלי של כל השורשים הפרמיטיביים מסדר $n$. משמע $Phi_n (X) = product_omega (X - omega)$ כאשר $omega$ עובר על כל השורשים הפרימיטיביים מסדר $n$.]
#example[
  $ Phi_1 (x) = x-1, Phi_2 (x) = x+1, Phi_3 (x) = x^2 +x +1, Phi_4 (x) = x^2+1, Phi_5 (x) = x^4+x^3+x^2+x+1 $
  עבור $p in NN$ ראשוני, אז כל פולינום הציקלוטומי מסדר $p^n$ הוא $(x^p^n-1) / (x^p^(n-1)-1) in QQ[x]$.\
  _השלמה מויקיפדיה_ עבור $n$ ראשוני, אז $Phi_n (x) = sum_(k=0)^(n-1) x^k$.\
  עבור $n = 2p$ עבור $2!=p$ ראשוני מתקיים $Phi_n = Phi_(2p) = sum_(k=0)^(p-1) (-x)^k$.
]
#pagebreak()
#lemma[לכל $p in NN$, הפולינום הציקלוטומי $Phi_p (t) = (t^p-1) / (t-1)$ אי־פריק מעל $QQ$.]
#proof[
  זה טריק, נשנה משתנה ל־$x=t-1$ ואז $t=x+1$ ואז נקבל
  $
    Phi_p (t) = ((x+1)^p-1) / x = (x^p+ p x^(p-1) + (p(p-1)) / 2)x^(p-2) +... + p x + 1 -1 / (x)= x^(p-1) + sum_(i=2)^(p-1) binom(p, i) x^(i-1) + p colon.eq f(x)
  $
  אז $f(x)$ אי־פריק לפי קריטריון אייזנשטיין שכן $p$ מקדם חופשי מתוקן ו־$p divides binom(p, i)$ לכל $0<i<p$.\
  אם $Phi_p (t)$ לא אי־פריק, אז קיימים $Phi_p (t) = g(t) dot.op h(t) = g(x+1) dot.op h(x+1)$ וזאת סתירה.
]
#remark[באותה צורה מוכיחים $Phi_(p^n) (t) = (t^p^n-1) / (t^p^(n-1)-1)$ אי־פריק.]
#exercise("תרגיל 10.104 בספר")[הסיקו מקריטריון אייזנשטיין ששורש כלשהו של מספר ראשוני אינו שייך ל־$QQ$. \
  כלומר, הראו ש־$root(n, p) in.not QQ$ לכל $p$ ראשוני ו־$NN in.rev n>=2$.]
#proof[
  #text(red)[*להשלים*].
]
#exercise("תרגיל 10.108 בספר")[יהי $p in NN$ ראשוני ויהי $f in ZZ[x]$ פולינום מתוקן. נסמן ב־$overline(f) in FF_p [x]$ את הפולינום המתקבל על־ידי פעולת מודלו $p$ על כל מקדם בנפרד.
  + הוכיחו כי אם $f$ פריק, אז גם $overline(f)$ פריק.
  + הוכיחו כי ההפך הוא לא נכון – אם $overline(f)$ פריק, לאו דווקא $f$ פריק.
]
#proof[
  #text(red)[*להשלים*].
]

== סגור אלגברי
פרק 5 ברשומות של מיכאל, מוטיבציה: משוואות מסדר 5 לא ניתן לפתור.
#definition("שדה סגור אלגברי")[שדה $K$ נקרא *שדה סגור אלגברית* אם לכל פולינום לא קבוע מעל $K$ יש שורש ב־$K$.]
#definition("פולינום מתפצל לחלוטין")[נגיד $K$ שדה, נגיד כי $f in K[t]$ *פולינום מתפצל לחלוטין* אם הוא מתפרק לגורמים לינאריים. \
  משמע, $display(f=c product_(i=1)^deg(f) (t-a_i))$ כאשר $c in K^times$ ו־$a_i in K$ לכל $i$.]
#lemma[עבור שדה $K$ הבאים שקולים
  + סגור אלגברית
  + כל פולינום $0!= f in K[t]$ מתפצל לחלוטין
  + כל $f in K[t]$ אי־פריק הוא מדרגה 1
  + ל־$K$ אין הרחבות אלגבריות לא טריוויאליות
]
#proof[
  $(2) <==> (3)$ שכן תמיד יש פירוק לפולינומים אי־פריקים.\
  $(1) <== (2)$: אם יש פירוק מלא, נובע מהגדרה שיש לי שורש.\
  $(2) ==> (1)$: נובע שלכל $f = g(t-a)$ יש פירוק כאשר $deg g < deg f$ ומסיימים את הטיעון עם אינדוקציה על $deg(f)$.\
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
  #colbreak()

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
#example[
  + $overline(QQ)$ הוא הסגור האלגברי של $QQ$ ולכן גם סגור אלגברית מעל $QQ$
  + $CC = overline(RR) = overline(CC)$
  + $overline(QQ) = overline(QQ(root(3, 2) + root(3, 5)))$
]

= *הרצאה 7 – 22/04*
== קיום ויחידות סגור אלגברי
פרקים 5.3, 5.4 ברשומות של מיכאל.
המטרה שלנו בזמן הקרוב זה להראות שלכל שדה $K$ *קיים ויחיד עד־כדי איזומורפיזם* $overline(K)$, סגור אלגברי.
#remark[סגור אלגברי $overline(K) slash K$ הוא הרחבה אלגברית ולפי הגדרה מקסימלית ביחס להכלה. לכן, טבעי לבנות אותו על־ידי הלמה של צורן (אינדוקציה בעייתית לנו כי לא בהכרח זה בן־מנייה) ונעבוד עם חסימה של העוצמה.]
#definition("סיב")[
  תהיינה $A, B$ קבוצות ו־$f: A arrow.r B$. *סיב (fiber)* של הפונקציה הוא תת־קבוצה של $A$ שהיא קבוצת המקורות של איבר ב־$B$, כלומר תת־קבוצה מהצורה
  $ f^(-1)(b)={ a in A bar f(a) = b} $
  ניזכר שראינו במבנים 1 שלמת הגרעין (למה 3.13 בספר) אומרת במילים אחרות שהסיבים של הומומורפיזם $phi : G arrow.r H$ הם בידיוק המחלקות של הגרעין $N$ ולכן ל־$G slash N$ יש מבנה של חבורה.
]
#lemma[נניח כי $K$ שדה ו־$L slash K$ הרחבה אלגברית, $kappa = abs(K)$. אזי $abs(L) <= max {kappa, א_0}$.\
  לכן, המקרה היחידי שיתקיים $abs(L) > abs(K)$ זה כאשר $K$ סופית ו־$L$ בת־מנייה.]
#proof[
  נבחן את $K[t]$. קבוצת הפולינומים מדרגה לכל היותר $d$ היא מעוצמה של $kappa^(d+1)$.\
  אם $K$ אינסופית, אז $kappa^n = kappa$ משיקולי עוצמות וזה נכון גם במקרה שבו אנחנו עושים איחוד בן־מנייה של $kappa$, ולכן $abs(K[t]) = kappa$.\
  אם $K$ סופית אזי $abs(K[t]) = א_0$ (ראינו גם בתורת הקבוצות).\
  נגדיר העתקה $L arrow.r K[t]$ על־ידי $alpha mapsto f_(alpha slash K)$ (כל $alpha in L$ ממופה לפולינום המינימלי שלו).\
  נשים לב שהעתקה זאת ממפה לסיבים סופיםם (שכן המקור של כל פולינום $f in K[t]$ מכיל את כל השורשים שלו ב־$L$), ולכן
  $ abs(L) <= א_0 dot.op max{kappa, א_0} = max{kappa, א_0} $
]
#theorem("קיום סגור אלגברי")[
  לכל שדה $K$ קיים סגור אלגברי $overline(K) slash K$.
]
#proof[
  נבחר $K subset U$ כך ש־$abs(U) > max{abs(K), א_0}$ (כאשר $U$ מלשון universe).\
  נבחן את $cal(V)$, קבוצת כל השלשות $(L, plus, dot.op)$ משמע קבוצת כל תתי־הקבוצות $K subset.eq L subset U$ ופעולות $dot.op: L^2 arrow.r R, plus : L^2 arrow.r L$ כך שהפעולות הופכות את $L$ לשדה ואפילו להרחבה אלגברית $L slash K$ ובפרט $dot.op_L bar_K = dot_K, plus_L bar_K plus_K$.\
  נסדר באמצעות יחס־סדר חלקי $(L, plus, dot.op) <= (F, plus, dot.op)$ אם $L subset.eq F$ והפעולות על $F$ מסכימות עם הפעולות על $L$ (משמע $F slash L$ הרחבת שדות ולא רק הרחבת קבוצות) ולכן $cal(V)$ היא קבוצה סדורה חלקית.\
  נניח בנוסף כי ${(L_i, plus, dot.op)}_(i in I subset.eq cal(V))$ שרשרת של שדות ולכן קיים לה חסם עליון $L = union_(i in I) L_i$ (ואכן, כל $a, b in L$ מוכל ב־$L_i$ עבור $i$ כלשהו, ונגדיר $a plus_L b = a plus_L_i b$ ובאותו אופן נגדיר מכפלה ואז נקבל כי $L$ הוא שדה וכל $a in L$ מוכל ב־$L_i$ כלשהו ולכן אלגברי מעל $K$).\
  לפי הלמה של צורן, קיים איבר מקסימלי $(overline(K), plus, dot.op) in cal(V)$ ונטען כי $overline(K)$ הוא סגור אלגברית ולכן אלגברי מעל $K$: נניח שלא כך, ולכן קיימת הרחבה אלגברית לא טריוויאלית $L slash overline(K)$. היות ו־$abs(L) < abs(U)$, מהלמה לעיל נובע שקיים שיכון (של קבוצות) $phi : L arrow.r.hook U$ שמרחיב את ההכלה $overline(K) subset U$
  אבל אז $(phi(L), plus, dot.op)$ הוא האיבר המקסימלי, ב־$cal(V)$ וזו סתירה להנחה כי $L$ חסם־עליון.
]
#remark[השתמשנו בהוכחה לעיל ש־$L slash overline(K)$ הרחבה אלגברית שכן $L slash overline(K) slash K$ מגדל הרחבות.]
#lemma("למת ההרמה")[
  נניח כי $K$ שדה ו־$L slash K$ הרחבה אלגברית הנוצרת על־ידי $S subset.eq L$ ו־$E slash K$ הרחבת שדות כך שהפולינום המינימלי לכל $alpha in S$ מתפצל לחלוטין מעל $E$. אזי קיים $K$־שיכון של שדות $phi.alt: L arrow.r.hook E$.]
#proof[
  נטען כי קיימת הרמה מקסימלית $K arrow.r.hook E$ לתת־שדה $L$: נסתכל על הקבוצה $cal(V)$ המכילה את כל ה־$K$ תתי־שדות $F_i subset.eq L$ ושיכון של $K$־שדות $phi.alt_i : F_i arrow.r.hook E$, זוהי קבוצה עם סדר חלקי: $(F_1, phi.alt_1) <= (F_2, phi.alt_2)$ אם $F_1 subset.eq F_2$ ו־$phi.alt_2 bar_L_1 = phi_1$, ויותר מזה לכל שרשרת ${(F_i, phi.alt_i)}_(i in I)$ יש חסם עליון הנתון על־ידי $F = union_i in I F_i$ ו־$phi.alt : L arrow.r.hook E$ כך שמתקיים $phi.alt bar_L_i phi.alt_i$ לכל $i$.\
  מהלמה של צורן קיים איבר מקסימלי $(F, phi.alt) in cal(V)$ ונטען כי $F=L$ ולכן $phi.alt$ הוא השיכון $L arrow.r.hook E$ המבוקש:\
  נניח בשלילה שלא, ולכן קיים $alpha in S$ כך ש־$alpha in.not F$, אבל $f_(alpha slash F) divides f_(alpha slash K)$ (מההנחה שהפולינום המינימלי לכל $alpha in S$ מתפצל לחלוטין מעל $E$) ולכן בפרט $phi.alt(f_(alpha slash F)) divides phi.alt(f_(alpha slash K)) <==> f_(phi.alt(alpha) slash F) divides f_(phi.alt(alpha) slash K)$ ולכן ל־$phi.alt(f)$ יש שורש $beta in E$ ואז $phi.alt(F) = F' subset.eq E$ המקיים $ F(alpha) = F[t] slash (f_alpha) arrow.r.tilde F'[t] slash (phi.alt(f_alpha)) = F'(beta) $
  משמע אנחנו יכולים להרים את $phi.alt$ אל $F(alpha)$ על־ידי שליחה של $alpha$ ל־$beta$, משמע $psi: F(alpha) arrow.r.tilde F'(beta) subset.eq E$, אבל זאת סתירה למקסימליות של $(F, phi.alt)$
]
#remark[ההוכחה לעיל התחילה בהרצאה של ה־22/04 הסתיימה ב־28/04.]

= *תרגול 4 – 23/04*
== שדות פיצול
#definition("מקרה פרטי של שדה פיצול")[יהי $f in QQ[x]$. *שדה הפיצול של $f$* הוא תת־השדה המינימלי של $CC$ שמכיל את שורשי $f$.]
#example[השורשים של $f(x) = x^2-2 in QQ[x]$ הם $root(3, 2), omega root(3, 2), omega^2 root(3, 2)$ כאשר $omega = 1 / 2 + sqrt(3 / 4)i$. \
  אז שדה הפיצול של $f$ הוא
  $L = QQ(root(3, 2), omega root(3, 2), omega^2 root(3, 2))$]
#exercise[
  מה הם כל השדות $K$ כך שמתקיים $QQ subset.eq K subset.eq L$?
]
#solution[
  מתקיים $[L : QQ] = [L : QQ(root(3, 2))] dot.op [QQ(root(3, 2)) : QQ]$
]
= *הרצאה 8 – 28/04*
== קיום ויחידות סגור אלגברי – המשך
#lemma("bootstrap ללמת ההרמה")[בנוסף להנחות של למת ההרמה, נניח כי גם מתקיים $alpha in L$ ו־$beta in E$ הוא השורש של הפולינום המינימלי $f_alpha in K[t]$ ב־$E$. אזי ניתן לבחור את ה־$K$ שיכון $phi : L arrow.r.hook E$ כך שמתקיים $phi(alpha) = beta$.]
#proof[
  היות ו־$beta$ הוא שורש של פולינום אי־הפיך $f_alpha$, יש לנו $f_beta = f_alpha$ ולכן יש הומומורפיזם $phi.alt_0 : K(alpha) arrow.r.tilde K(beta) subset.eq E$.\
  $S$ יוצרת את $L$ מעל $K(alpha)$ והפולינום המינימלי של כל $gamma in S$ מעל $K(beta)$ מחלק את הפולינום המינימלי של $gamma$ מעל $K$ ולכן מתפצל לחלוטין מעל $E$.\
  לכן, מלמת ההרמה ההומומורפיזם $phi.alt_0 : K(alpha) arrow.r.hook E$ מורם להומומורפיזם $phi.alt L arrow.r.hook E$ ומבנייה קיבלנו את $phi.alt$ הנדרש.
]
#theorem("אי־יחידות של סגור אלגברי")[
  יהי $K$ שדה ו־$overline(K) slash K$ ו־$overbrace(K)' slash K$ סגורים אלגבריים של $K$. אז קיים $K$־איזומורפיזם $phi.alt : overline(K) arrow.r.tilde overline(K)'$.\
  יתרה מכך, אם $f in K[t]$ הוא פולינום אי־פריק עם שורשים $alpha in overline(K)$ ו־$alpha' in overline(K)'$, אז ניתן לבחור $phi.alt$ כך שיתקיים $phi(alpha)=alpha'$.
]
#proof[
  מהיות $overline(L) slash L$ הרחבה אלגברית וכל פולינום $f in K[t]$ מתפצל לחלוטין מעל $overline(K)'$, מלמת ההרמה נתקבל $K$־שיכון $phi.alt : overline(K) arrow.r.hook overline(K)'$.\
  אבל $phi.alt(overline(K))$ הוא סגור אלגברית ו־$overline(K)' slash phi.alt(overline(K))$ הוא אלגברי, נקבל כי $phi.alt(overline(K))=overline(K)'$ ואז $phi.alt$ הוא איזומורפיזם, ומלמת ההרמה (bootstrap) נקבל $phi.alt(alpha) = alpha'$.\
  למה $phi.alt$ הוא על? אם לא, יש $x in overline(K)' without overline(K)$ לא אלגברי מעל $overline(K)$ כי $overline(K)$ סגור אלגברית ואז הוא לא אלגברי מעל $K$, אבל הנחנו שההרחבה $overline(K)' slash K$ היא אלגברית וזו סתירה.
]
#remark[סגור אלגברי $overline(K)$ היינו יחיד עד־כדי איזומורפיזם $sigma$, אבל $sigma$ לא יחיד:\
  ניתן לקחת את $QQ$ ולבנות ממנו את $RR$, אבל אין לו אוטומורפיזמים.
  \ אם נבנה ממנו את $CC$, נקבל כמה אוטומורפיזמים – לדוגמה אוטומורפיזם ההצמדה $alpha mapsto overline(alpha)$ ואז אין $CC$ "נכון".]

== אוטומורפיזמים של $overline(K) slash K$
פרק 5.5 ברשומות של מיכאל.
#notation[עבור הרחבת שדות $L slash K$ נסמן את $Aut(L slash K)$ לפעמים גם בתור $Aut_K (L)$.]
#definition("איברים צמודים")[עבור הרחבת שדות $L slash K$, נגיד כי $alpha, beta in L$ הם *צמודים* אם $f_(alpha slash K) = f_(beta slash K)$.]
#definition("מחלקת צמידות")[עבור הרחבת שדות $L slash K$ ו־$alpha in L$. אם $f_alpha$ מתפצל לחלוטין ב־$L$ אז קבוצת כל השורשים שלו (קבוצת כל הצמודים של $alpha$) מסומנת ב־$C_alpha$, *מחלקת צמידות* של $alpha$.]
#theorem[אם $K$ שדה ו־$overline(K) slash K$ סגור אלגברי שלו, אז לכל $alpha in overline(K)$ המסלול שלו תחת הפעולה של $Aut(overline(K) slash K)$ היינה מחלקת צמידות של $C_alpha$.]
#proof[
  בכיוון הראשון, אם $Aut(overline(K) slash K) in.rev sigma : overline(K) arrow.r K$ אז $sigma(f_(alpha slash K)) = f_(sigma(alpha) slash K)$ שכן $sigma bar_K = Id_K$ (כי אם $sum a_i alpha^i = 0$ אז $sum sigma(a_i) sigma(alpha)^i$), ולכן $sigma(alpha) in C_alpha$ ולכן המסלול של $alpha$ שייך ל־$C_alpha$.\
  בכיוון השני, עבור כל $alpha' in C_alpha$ (שורש אחר של $f_alpha$), קיים $sigma : overline(K) arrow.r overline(K)$ (bootstrap) כך ש־$sigma(alpha) = overline(alpha)$. מהיות $overline(K)$ סגור אלגברית ואלגברי מעל $K$, ההרחבה $overline(K) slash sigma(overline(K))$ היא טריוויאלית ולכן $sigma$ הוא אוטומורפיזם.
]
#lemma[נניח כי $L = K(alpha) slash K$ הרחבה אלגברית פשוטה (נוצרת על־ידי איבר אחד) מדרגה $d$ ונניח כי $F slash K$ הרחבה.
  \ אזי כל $K$־שיכון $phi.alt : L arrow.r.hook F$ לוקח את $alpha$ לשורש $phi.alt(alpha)$ של $f_(alpha slash K)$, וזה משרה העתקה חד־חד ערכית
  $ op("Hom")_K (L, F) tilde.eq {beta in F bar f_alpha (beta) = 0} $
  ובפרט מתקיים $abs(op("Hom")_K (L, F)) <= d$ (חסם על כמות ההרמות).
]
#proof[
  אכן $phi.alt(alpha)$ הוא שורש של $phi(f_(alpha slash K)) = f_(alpha slash K)$ ולכל $beta in F$ שורש של $f_(alpha slash K)$ מתקיים
  $ L = K(alpha) tilde.eq^(phi.alt)_beta K(t) slash f_alpha tilde.eq K(beta) subset.eq F $
  $phi.alt_beta$ נקבע ביחידות על־ידי $beta$ כי ${1, alpha, ..., alpha^(d-1)}$ זה בסיס של $L$ מעל $K$ ולכן לכל $a in L$ יש יצוג יחיד $sum_(i=0)^(n-1) a_i alpha^i$ ואז כל הומומורפיזם
  \ $phi.alt' : L arrow.r F$ כך ש־$phi.alt'(alpha)=beta$ מקיים $phi.alt'(alpha) = sum_(i=0)^(d-1) a_i beta^i$.
]

#definition("דרגה ספרבילית, דרגה אי־ספרבילית")[יהי $alpha in L$ אלגברי מעל $K$ עם דרגה $d$.\
  *הדרגה הספרבילית* של $alpha$ מעל $K$ שתסומן $deg_s (alpha) = deg_(K, s) (alpha)$ היא העוצמה של מחלקות הצמידות של $alpha in overline(K)$ (בסימוני ההרצאות של מיכאל $deg_s (alpha) = deg_(K, s) (alpha) = abs(C_alpha)$).\
  *הדרגה האי־ספרבילית* של $alpha$ מעל $K$ שתסומן $deg_i (alpha) = deg_(K, i) (alpha)$ היא הריבוי של $alpha$ ב־$f_alpha$: #text(red)[*להשלים*]
]
#remark[#text(red)[*להשלים*]]
#example[#text(red)[*להשלים*]]
#example[#text(red)[*להשלים*]]

= *הרצאה 9 – 29/04*
== אוטומורפיזמים של $overline(K) slash K$ – המשך
יהיו $K$ שדה, $f in K[t]$ פולינום ממעלה $n$ ו־$L slash K$ הרחבת שדות שבה $f$ מתפצל, כלומר
$ f = c(x-alpha_1) dot.op (t-alpha_2) dot.op ... dot.op (t-alpha_n) in L[t] $
#definition("שורש פשוט")[נאמר ש־$alpha = alpha_i in L$ הוא *שורש פשוט (simple root)* של $f$ אם הוא מופיע בידיוק פעם אחת בפיצול.\
  כלומר, $(t-alpha) divides f$ אבל $(t-alpha)^2 divides.not f$.]
#definition("שורש מרובה")[נאמר ש־$alpha = alpha_i in L$ הוא *שורש מרובה (multiple root)* של $f$ אם הוא מופיע בפיצול לכל הפחות פעמיים.
  \ כלומר אם $(t-alpha)^2 divides f$.]
#definition("פולינום פריד (ספרבילי")[הפולינום $f in K[t]$ נקרא *פריד (ספרבילי, Separable)* אם אין לו שורשים מרובים בשדה ההרחבה $L$ שבו הוא מתפצל.]
#remark("מסקנה 14.7 בספר")[תכונת הספרביליות של פולינום אינה תלויה בשדה ההרחבה $L$ שבו הוא מתפצל.]
#lemma[יהי $K$ שדה, אזי $f in K[t]$ הוא פריד אם ורק אם $gcd(f, f')=1$ (כאשר $f'$ הוא הנגזרת של $f$).]
#proof[
  $==>$ נניח כי $gcd(f, f') = 1$.\
  מההנחה נובע $1 = u f + v f' in K[t]$ ולכן גם ב־$overline(K)$.\
  נניח $f$ אי־פריד נובע כי $t-alpha)^2 divides f in overline(K)[t]$ ולכן $(t-alpha) divides f'$ ולכן $t-a divides 1 = u f + v g$, סתירה.\
  $<==$ נניח כי $f in K[t]$ הוא פריד.\
  נסמן $f' = ((t-a_i) g)' = g'(())$. מתקיים $ f' = ((t-alpha_i) g)' = g' (t-a_i)+g(t-alpha_i) + g $ אבל
  $ (t-a_i) divides f' = g'(t-a_i) + g <==> (t-alpha_i) divides g $
  אבל זה קורה אם ורק אם $(t-alpha_i)$ שורש מרובה.
]
#remark[ברשומות של מיכאל, ההוכחה המפורטת בכיוון $<==$ היא: \
  $<==$ נניח כי $f in K[t]$ הוא פריד.\
  מתקיים $f' = ((t-alpha_i) g)' = g' (t-a_i)+g$
  נניח בשלילה כי $gcd(f, f')!=1$ ונסמן ב־$g in K[t]$ מחלק אי־פריק. אז $f = g h$ ו־$g divides f' = h'g + h g'$.\
  נובע מכך ש־$g divides h g'$ ולכן או ש־$g divides h$ או ש־$g divides g'$.\
  במקרה הראשון, $g^2 divides f$ ולכן נקבל כי $f$ אי־פריד וזו סתירה.\
  במקרה השני, $g$ מחלק פולינום ממעלה נמוכה יותר ולכן $g'=0$ (כי אחרת נקבל ש־$g$ הוא פולינום פריק מטעמי דרגות וזו סתירה), אבל אז כל המונומים (שלא אפסים) של $g = sum_(i=0)^d c_i t^i$ הם מהצורה $c_(p j) t^(p j)$ כאשר $p = char(K) > 0$, אבל אז $g = (sum_(j=0)^(d / p) c_(p j)^(1 / p) t^j)^p$ הוא אי־פריד וזו סתירה.
]
#exercise[$f$ ו־$f'$ הוא אותו פולינום הן ב־$K[t]$ והן ב־$overline(K)[t]$.]
#proof[
  #text(red)[*להשלים*]?
]

#theorem[נניח כי $f in K[t]$ פולינום אי־פריק ומתוקן ו־$alpha in overline(K)$ שורש של $f$. אזי
  + אם $char(K) = 0$ אז $f$ ו־$alpha$ הם פרידים ואז $deg_i (alpha) = deg(f) = deg_K (alpha)$
  + אם $char(K) = p$ אז קיים פולינום אי־פריק ופריד $g in K[t]$ ו־$l >=0$ כך ש־$f(t) = g(t^p^l)$.\
    יתרה מכך, אם $beta_1, ..., beta_n$ הם השורשים של $g$ כאשר $n = deg(g)$ אז ל־$f$ יש $n$ שורשים שונים זה מזה $alpha_j = beta_j^(1 / p^l)$ וכל אחד מהם הוא מריבוי של $p^l$ (משמע $f = product_(i=1)^n (t-alpha_i)^p^l$).\
    בפרט, מתקיים $deg_s (alpha) = n, deg_i (alpha) = p^l, deg(alpha) = n p^l$.
]
#proof[
  נסמן $d = deg(f)$ ונניח כי $d>1$ שכן אחרת הכל טריוויאלי.\
  ראינו ש־$f$ אי־פריד אם ורק אם $gcd(f, f')$
  $f$ פריד אם ורק אם $gcd(f, f')=1$. אם זה קורה ו־$f'!=0$ אז $0 < deg gcd(f, f') <= deg f' < deg f$ ולכן ל־$f$ יש גורם לא טריוויאלי וזו סתירה (כי $f$ אי־פריד) ולכן $gcd(f, f')!=1$ אם ורק אם $f'=0$.\
  מכאן, אם $char(K) = 0$ אז $f'!=0$ ולכן $deg f' = deg f -1$ ולכן $f$ פריד.\
  אם $char(K) =p$, אז $f$ פריד וסיימנ או ש־$f'=0$.\
  נניח כי $f = sum_(i=0)^d a_i t^i$ אז אם $0 = f' = sum_(i=1)^d i a_i t^i$, אז לכל $i > 0$ בהכרח מתקיים $i a_i = 0 in K$ ולכן רק המקדמים $a_(p j)!=0$.\
  במילים אחרות מתקיים
  $ f' = 0 <==> f = sum_(j=-)^(d / p) a_(p j) t^(p j) $
  ואז $g(x) = sum a_(p j) x^j$ ו־$f = g(t^p)$. אבל $g$ הוא אי־פריק: אחרת $g(x) = g_1 (x) g_2 (x)$ ואז $f(t)=g(t^p) = g_1 (t^p) g_2 (t^p)$ וזו כמובן סתירה.\
  אז $g$ אי־פריק ובאינדוקציה על $deg(g) < deg(f)$ נקבל $g = h(t^p^m)$ ו־$h$ פריד ולכן $f = h(t^p^(m+1))$.\
  נסמן $p^l = p^(m+1), n = deg(h) = d / p^l$. $h$ פריד ולכן $h(x) = product_(i=1)^n (x-beta_i)$ ויש לו $n$ שורשים שונים, ואם נבחר $x=t^p^l$ נקבל $f = product_(i=1)^n (t^p^l-beta_i)$, וניקח $alpha_i = beta_i^(1 / p^l) in overline(K)$ ואז המכפלה שלנו (פרובניוס) היא $product_(i=1)^n (t-alpha_i)^p^l=f$ וסיימנו.
]

== הרחבות נורמליות
פרק 5.6 ברשומות של מיכאל.
#definition("הרחבה אלגברית נורמלית")[הרחבה אלגברית $L slash K$ נקראת *נורמלית* אם לכל $K$־שיכון $sigma: L arrow.r.hook overline(K)$ אותה התמונה $sigma(L) subset.eq overline(K)$ (לא תלוי בבחירת $overline(K) slash K$).]
#theorem[עבור הרחבה אלגברית $L slash K$ הבאים שקולים
  + $L slash K$ נורמלית
  + אם $overline(L) slash L$ סגור אלגברי של $L$, אזי $Aut(overline(L) slash L)$ לוקחת את $L$ לעצמו (לא מזיזה אותו)
  + לכל $alpha in L$, $f_(alpha slash K)$ מתפצל לחלוטין ב־$L$
]
#proof[
  $1 => 2$: בעצם, $overline(L)$ זה גם סגור אלגברי של $K$ (מיחידות עד־כדי איזומורפיזם), ואז כל $sigma in Aut(overline(L) slash K)$ נותן שיכון אחר $sigma(L) subset.eq overline(L)$ ולכן $sigma(L) = L$. \
  $2 => 3$: ניקח $alpha' in overline(L)$ שהוא שורש אחר של $f_(alpha slash K)$ ולכן לפי משפט שראינו על חבורות $Aut(overline(L) slash K)$ (להשלים #text(red)[*להשלים*]),
  קיים $sigma in Aut(overline(L) slash K)$ כך ש־$sigma(alpha)=alpha'$ וזה בידיוק אומר ש־$f_(alpha slash K)$ מתפצל לחלוטין ב־$L$.\
  $3 => 1$: ניקח $K$־שיכון $sigma: L arrow.r overline(K)$ ולכן לכל $alpha in L$ מתקיים $f_(alpha slash K) = f_(sigma(alpha) slash K)$ וכל שורשיו $C_(sigma(alpha)) = C_alpha subset.eq L$ לפי ההנחה, ולכן $sigma(L) = union_(alpha in L) C_(f_(alpha slash K))$ לא תלוי בשיכון.
]
#remark[את הכיוון $2 => 1$: מיכאל הוכיח ברשומות שלו בשלילה: נניח ש־$L slash K$ היא לא נורמלית ולכן קיים $K$־שיכון $phi.alt: L arrow.r.tilde overline(L)$ כך שמתקיים $phi.alt(L) !=L$.\
  מלמת ההרמה, $phi.alt$ מורחב ל־$K$־שיכון של שדות $sigma : overline(L) arrow.r.tilde overline(L)$ שחייב להיות איזומורפיזם שכן $overline(L) slash sigma(overline(L))$ זו הרחבה אלגברית של סגור אלגברי של שדות, ולכן הרחבה טריוויאלית. \
  לכן $sigma in Aut_K (overline(L))$ לא משמר את $L$, אבל זו סתירה להנחה של $(2)$.]

= *תרגיל 3*
== טריקים
+ הבינום של ניוטון ככלי לחלוקת פולינומים (אפשר גם סכום סדרה הנדסית)
+ היה גם בהרצאה, אבל בשביל קריטריון אייזנשטיין כדאי להשתמש בטריק $x mapsto x+1$
+ לפשט ביטויים בתוך שורש, לדוגמה $ sqrt(11+6sqrt(2)) = sqrt(9 + 6 sqrt(2) + 2) = sqrt(9 + 6 sqrt(2) + sqrt(2)^2) = sqrt((3+sqrt(2))^2) = 3 + sqrt(2) $
+ פולינום יכול להיות אי־פריק אבל לא לקיים את קריטריון אייזנשטיין (אני מניחה שזה ככל הנראה המקרים בהם $a_n = 1$)
== מסקנות
+ עבור $p_1, ..., p_n$ ראשוניים שונים זה מזה מתקיים $[QQ(sqrt(p_1), ..., sqrt(p_n)) : QQ] = 2^n$ ובסיס ל־$QQ(sqrt(p_1), ..., sqrt(p_n))$ הוא
$ cal(B) = { sqrt(product_(i in S) p_i) bar S subset.eq {1, ..., n}} $

= *הרצאה 10 – 05/05*
== הרחבות נורמליות – המשך
#corollary[אם $alpha in L$ ו־$L slash K$ נורמלית, אזי $f_(alpha slash K)$ מתפצל לחלוטין ($C_alpha subset L$) ו־$Aut(L slash K)$ פועלת טרנזטיבית על $C_alpha$.]
#proof[#text(red)[*להשלים*]]
#example[עבור $QQ(root(3, 2)) slash QQ$, חבורת האוטומורפיזמים היא רק הזהות.]
#example("טרנזטיביות/אי־טרנזטיביות של הרחבות נורמליות")[בדומה לכך שנורמליות היא לא תכונה טרנזטיביות בין חבורות, גם מחלקת ההרחבות הנורמליות היא לא שלמה, בכמה דרכים: נניח כי $L slash F slash K$ מגדל הרחבות.
  + נניח $L slash F$ ו־$F slash K$ הרחבות נורמליות, נטען כי $L slash K$ לא הרחבה נורמלית: $QQ(root(4, 2)) slash QQ(sqrt(2)) slash QQ$
  + נניח $L slash K$ נורמלי ונטען שלא בהכרח $F slash K$ נורמלית – #text(red)[*להשלים*]
  + נניח כי $L slash K$ נורמלית ונטען כי $L slash F$ *כ* נורמלית #text(red)[*להשלים*]
]
#exercise[$L slash K$ הרחבה ריבועית גורר כי $L slash K$ נורמלית (אנלוגי לחבורה מאינדקס $2$ היא נורמלית).]
#proof[#text(red)[*להשלים*]]

== שדות פיצול
פרק מספר 5.6 ברשומות של מיכאל.
#definition("שדה פיצול")[נניח $K$ שדה ו־$L slash K$ הרחבה ו־$P subset.eq K[t]$ קבוצת פולינומים שונה מ־$0$.\
  $L$ נקרא *שדה פיצול של $P$* אם כל $f in P$ מתפצל לחלוטין ב־$L$ ו־$L = K(S)$ כאשר $S = {f in P "כל השורשים של"}$.\
  בפרט, $L slash K$ אלגברית שכן היא נוצרת על־ידי השורשים.
]
#lemma[אם $K$ שדה ו־$P subset.eq K[t]$ קבוצת פולינומים שונה מ־$0$ אזי שדה פיצול של $P$ מעל $K$ קיים ויחיד עד־כדי איזומורפיזם (שבדרך־כלל אינו יחיד).]
#proof[
  ניקח $overline(K)$ ו־${f in P "כל השורשים של"} = S subset.eq overline(K)$ ואז $K(S) = L subset.eq overline(K)$ שדה פיצול.\
  אם $L'$ שדה פיצול אחר, קיים הומומורפיזם $phi.alt : L arrow.r.hook L'$ מלמת ההרמה ($L$ נוצר על־ידי $S$ ו־$L'$ מפצל כל $f in P$) ולבסוף $K(phi.alt(S)) = L'$ כאשר $phi.alt(S)$ הם השורשים ולכן $L arrow.r.tilde L'$.
]
#remark[סגור אלגברי הוא שדה פיצול של כל הפולינומים.]
#theorem[
  + הרחבה אלגברית $L slash K$ היינה נורמלית אם ורק אם $L$ הוא שדה פיצול של $P subset.eq K[t]$ שאינם $0$
  + ההרחבה אלגברית $L slash K$ היינה נורמלית וסופית אם ורק אם $L$ הוא שדה פיצול של $f in K[t]$ פולינום בודד (ואולי אף פריק)
]
#proof[
  + $<==$ $L slash K$ נורמלית אזי $L$ הוא שדה פיצול של ${ f_(alpha slash K) bar alpha in L}$ כי כל $f_(alpha slash K)$ מתפצל לחלוטין.\
    $==>$ נניח $L$ שדה פיצול של $P$ ולכן $L = K(S)$ כאשר $S = {f in P "שורשי"}$.
    נסתכל על $overline(K) arrow.ccw in Aut(overline(K) slash K)$, מתקיים $sigma(S) = S$ ולכן $K(sigma(S)) = K(S)$ משמע $sigma(L) = L$, ולכן לפי התנאים השקולים לנורמליות נקבל ש־$L slash K$ נורמלית.
  + $<==$ $L slash K$ נורמלית סופית וניקח יוצרים $L = K(alpha_1, ..., alpha_n)$ וניקח $f = product_(i=1)^n f_(alpha_i slash K)$, אז כל $alpha_i$ שורשים של $f$ ו־$f$ מתפצל לחלוטין. \
    $==>$ אם $L slash K$ שדה פיצול של $f in K[t]$ אז $L = K(alpha_1, ..., alpha_n)$ כאשר $alpha_1, ..., alpha_n$ הם השורשים של $f$ וחלכן $L slash K$ אלגברית וגם נוצרת סופית ולכן סופית.
]
#definition($L^(n o r)$)[נניח $L slash K$ הרחבה אלגברית, ניקח (תלוי גם ב־$K$), *$L^(n o r)$* שדה פיצול של $P = { f_(alpha slash K) bar alpha in L}$ ($P$ יחידה עד־כדי איזומורפיזם).\
  $L^(n o r)$ זה הסגור הנורמלי של $L$ מעל $K$.]
#lemma[$L^(n o r) slash K$ זו הרחבה נורמלית מינימלית (ביחס להכלה) המכילה את $L$.]
#proof[
  $L^(n o r) slash K$ שדה פיצול (של $P$) ולכן נורמלית.\
  כמובן, $L^(n o r) = K(S)$ כאשר $S$ זה שורשי $L subset P$ ולכן $L subset.eq L^(n o r)$.\
  לבסוף, אם $L^(n o r) supset.eq F supset.eq L supset.eq K$ כאשר $F slash K$ נורמלית, נובע כי כל $f_(alpha slash K) in P$ מתפצל לחלוטין ב־$F$ ולכן $F = L^(n o r)$.
]
#example[$QQ(root(3, 2), omega) = L^(n o r) slash L = QQ(root(3, 2)) slash K = QQ$.\
  #text(red)[*להשלים*] ציור?]
#example[$L = QQ(root(4, 2))$ ואז $L^(n o r) = QQ(root(4, 2), i)$ ואז
  #text(red)[*להשלים*] ציור?]
#lemma[יהי $K$ שדה, $f in K[t]$ פולינום מדרגה $d > 0$ (פולינום לא קבוע) ו־$L$ שדה פיצול של $f$. נסמן $C_f = {f" כל שורשי"}$ אזי
  + $[L : K] <= d!$
  + כל $sigma in Aut_K (L) = Aut(L slash K)$ משרה תממורה על $C_f$ והומומורפיזם הצמצום מ־$Aut_K (L) arrow.r op("Perm") C_f = Aut(C_f) = S_n$ הוא שיכון.
]
#proof[
  #text(red)[*להשלים*]
]

== שורשי יחידה
פרק 6.1 ברשומות של מיכאל.\
#definition($n" שורש יחידה מסדר"$)[יהי $n in NN$. *שורש יחידה מסדר $n$* בתוך $overline(K)$ הוא $xi in overline(K)$ שמקיים $xi^n = 1$.]
#definition($n"חבורת שורשי היחידה מסדר ",mu_n"חבורת"$)[עבור $K$ שדה ו־$1<=n in NN$ נגדיר $ mu_n (K) = { xi in K bar xi^n = 1} $
  $ mu_infinity (K) = union.big_n mu_n (K) $
  נשים לב ש־$mu_n (K)$ היא תת־חבורה של $K^times$ מסדר המחלק את $n$ (זוהי כמובן חבורה אבלית עם כפל).
]
#notation[עבור $K$ שדה ו־$1<=n in NN$, אם $x^n-1$ מתפצל לחלוטין ב־$K$ נסמן $mu_n (K) = mu_n$ (שכן היא לא תשתנה תחת הרחבה של $K$) ונגיד במקרה זה ש־$mu_n$ מתפצל ב־$K$.]
#example[
  $ mu_infinity (RR) = mu_infinity (QQ) = {plus.minus 1} = mu_2 $
  $ mu_infinity = mu_infinity (CC) = {e^((2pi i m) / n) bar 1<= m<=n, (m, n) = 1} $
]
#exercise[
  (בהרצאה מיכאל נתן את זה כדוגמה ופירט קצת, ברשומות שלו זה מופיע כתרגיל אז נוכיח במסודר)\
  + נראה שמתקיים $mu_infinity (QQ(sqrt(-3))) = mu_6$
  + נראה שמתקיים $mu_infinity (QQ(sqrt(-3))) = mu_4$ אם $d=-1$
  + נראה שמתקיים $mu_infinity (QQ(sqrt(d))) = mu_2$ לכל $d in.not {-1, -3}$
  + נראה ש־$x mapsto e^((2pi i x)$ משרה איזומורפיזם $QQ slash ZZ arrow.r.tilde mu_infinity (CC)$
]
#proof[
  + נשים לב שמתקיים
    $
      mu_6 = {xi bar xi^6 = 1} = {e^((2pi i k) / 6) bar 0<=k<=5}=_(omega = e^(2 pi i) / 3) {1, omega, omega^2, -1, -omega, -omega^2}
    $
    נשים לב שמתקיים $QQ(omega) = QQ(sqrt(-3))$ שכן $omega^2+omega+1=0$, משמע כל השורשים שראינו ב־$mu_6$ נמצאים ב־$QQ(sqrt(-3))$.
  + מתקיים $i = e^(pi i) / 2$ ולכן $i^4 = 1$, ובגלל ש־$mu_4 = {1, -1, i, -i}$ נובע ישירות ש־$mu_4 subset QQ(i)$ ולכן $mu_4 subset.eq mu_infinity (QQ(i))$. \
    עבור ההכלה בכיוון השני, ניזכר ש־$[QQ(i) : QQ] = 2$ ולכן נבחן את כל הפולינומים הציקלוטומיים שדרגתם קטנה או שווה ל־$2$.\
    נשים לב שהחל מ־$n=7$ כל הפולינומים הציקלוטומיים הם מדרגה גדולה מ־$6$, ולכן מספיק שנסתכל על $n in {1,2,3,4,5,6}$:
    #figure(
      table(
        columns: 2,
        stroke: none,
        table.header[$2. space Phi_2 (x) = x+1 => deg(Phi_2 (x)) = 1$][$1. space Phi_1 (x) = x-1 => deg(Phi_1 (x)) = 1$],

        [$4. space Phi_4 (x) = x^2+1 => deg(Phi_4 (x)) = 2$], [$3. space Phi_3 (x) = x^2+x+1 => deg(Phi_3 (x)) = 2$],
        [$6. space Phi_6 (x) = x^2-x+1 => deg(Phi_6 (x)) = 2$],
        [$5. space Phi_5 (x) = x^4+x^3+x^2+x+1 => deg(Phi_5 (x)) = 4$],
      ),
    )
    ולכן המועמדים היחידים שלנו הם $n in {1,2,3,4,6}$.\
    אנחנו יודעים כבר ש־$Phi_3 (x), Phi_6 (x)$ לא אפשריים, כי כפי שראינו בתרגול במקרה זה מתקיים $(plus.minus 1 plus.minus sqrt(-3)) / 2 in.not QQ(i)$, אבל ה־$4$ האחרים כן ב־$QQ(i)$ כי בידיוק ${plus.minus 1, plus.minus i}$ ולכן נקבל גם את ההכלה השנייה.\
    בסה"כ מצאנו כי $mu_infinity (QQ(i)) = mu_4$.
  + בהמשך לבדיקה מהסעיף הקודם, אנחנו כבר יודעים להגיד שלא ייתכן תחת ההנחה ש־$d in.not {-1, -3}$ ש־$ mu_infinity (QQ(sqrt(d))) = mu_6 or mu_infinity (QQ(sqrt(d))) = mu_3 or mu_infinity (QQ(sqrt(d))) = mu_4 $
    ובגלל ש־$[QQ(sqrt(d)) : QQ] <=2$, נישאר רק עם $mu_infinity (QQ(sqrt(d))) = mu_2$ או $mu_infinity (QQ(sqrt(d))) = mu_1$.\
    אבל בבירור לא ייתכן ש־$mu_infinity (QQ(sqrt(d))) = mu_1$ שכן $xi = -1 in QQ subset QQ(sqrt(d))$ ולכן בסך־הכל נקבל $mu_infinity (QQ(sqrt(d))) = mu_2$.
  + נגדיר $phi: QQ slash ZZ arrow.r mu_infinity (CC)$ על־ידי $phi(x+ZZ)=e^(2pi i x)$.\
    ראשית זה מוגדר היטב, כי אם $x eq.triple y mod ZZ$ אז $ x-y in ZZ => e^(2pi i x) = e^(2pi i y) dot.op e^(2pi i (x-y)) = e^(2pi i y) dot.op 1 = e^(2pi i y) $
    זה גם אכן הומומורפיזם
    $
      phi((x+ZZ) + (y+ZZ)) = phi((x+y)+ ZZ)=e^(2pi i (x+y)) = e^(2pi i x) dot.op e^(2pi i y) = phi(x+ZZ) dot.op phi(y+ZZ)
    $
    הוא גם חד־חד ערכי כי הגרעין הוא טריוויאלי, שכן מתקיים
    $ phi(x+ZZ) = 1 <==> e^(2pi i x) = 1 <==> x in ZZ => x+ZZ = 0 + ZZ $
    והוא גם אכן על, כי כל $xi in mu_infinity (CC)$ הוא שורש יחידה, ולכן הוא מהצורה $xi = e^(2pi i k / n)$ עבור $n$ כלשהו, ולכן מספיק שנבחר $k in ZZ$ כך שמתקיים $phi(k / n + ZZ) = xi$.
]
נתזכר כמה הגדרות ממבנים 1 בשביל הסדר, כי הנושאים הללו עלו בהרצאה ולא התעמקנו בהם:
#definition("איבר פיתול")[תהיי $G$ חבורה. איבר $g in G$ נקרא *איבר פיתול (torison)* אם הסדר של $g$ סופי.]
#definition("חבורת־פיתול")[*חבורת פיתול* היא חבורה שכל איבריה הם איברי פיתול.]
#definition("חסרת־פיתול")[חבורה *חסרת־פיתול (torison free)* היא חבורה שכל איבריה, פרט ליחידה, אינם איברי פיתול.]
#example[
  + כל חבורה סופית היא חבורת פיתול
  + $QQ, ZZ$ הן חבורות חסרות פיתול
]
#lemma[עבור $A$ חבורת אבלית, קבוצת איברי הפיתול של $A$
  $ A_(t o r) = { a in A bar exists m in NN_(>=1) space s.t. space m a = 0} $
  היא תת־חבורה והמנה $A slash A_(t o r)$ היא חסרת־פיתול.]
#remark[לא רק שחבורת שורשי היחידה היא חבורה אבלית תחת הכפל, זו תת־חבורת פיתול של חבורת ספירת היחידה $ SS^1 = TT = {z in CC bar abs(z)=1} $ ]

#definition($H[p]$)[עבור חבורה אבלית $H$ נגדיר $H[p]$ כתת־החבורה של כל האיברים שסדרם הוא $p$
  $ H[p] = {h in H bar h^p=1} $
  אז $H$ ציקלית אם ורק אם לכל $p divides abs(H)$ יש $p$ איברים ב־$H[p]$. \
  בעצם, $H[p]$ היא תת־חבורת פיתול.
]
#lemma[יהי $K$ שדה ו$G lt.eq.slant K^times$ עם $n$ איברים. אזי $G$ ציקלית ובעצם $G = mu_n (K) = mu_n$ ובפרט כל $mu_n$ היא ציקלית.]
#proof[
  אם $p$ ראשוני כך ש־$p divides n$ אזי $G[p] subset {x^p-1 in K " שורשים של"}$ ולכן יש לכל היותר $p$ שורשים, ולכן $G$ ציקלית (כי יש $alpha in G[p]$ שהסדר שלו לא מחלק את המעלה, ולכן הוא מסדר גדול יותר, משמע יוצר של $G[p]$).
]
#remark[בכל שדה $K$ ממציין $0<p$, מתקיים $mu_p (K) = 1$ כי לפולינום $x^p^n-1=(x-1)^p^n$ יש רק שורש אחד, $x=1$.]
#lemma[יהי $K$ שדה ו־$n>=1$ כך ש־$mu_n = mu_n (K)$(דהיינו, $x^n-1$ מתפצל לחלוטין ב־$K$) ויהי $m in K^times$ הגורם הגדול ביותר של $n$.\
  במילים אחרות:
  + אם $char(K) = 0$ נבחר $n=m$
  + אם $char(K) = p$ נבחר $n = p^l m$ כאשר $gcd(m, p)=1$
  אז מתקיים $mu_n arrow.r.tilde ZZ slash m ZZ$.]
#proof[ל־$x^m-1=f$ יש $m$ שורשים $(m in K^times)$ כי $f' = m x^(m-1)$ והשורשים הם רק $0$ ול־$x^m-1$ אנחנו יודעים ש־$0$ הוא לא שורש.\
  לכן $gcd(f, f')=1$ ולפי טענה שראינו נובע כי $f$ פריד עם $m$ שורשים, ולכן ל־$mu_m$ יש $m$ איברים.\
  אם $char(K) = 0$ סיימנו ואם $char(K)=p$ נבחר $mu_n = mu_m plus.circle mu_p^l = mu_m$, שכן
  $ (t^(p^l m) -1) = (t^m-1)^p^l => mu_(p^l m) = mu_m $
]
= *הרצאה 11 – 06/05*
== שורשי יחידה – המשך
#definition($n"שורש יחידה פרימיטיבי מסדר "$)[יהי $2<=n in NN$. *שורש יחידה פרימיטיבי מסדר $n$* הוא שורש יחידה שלכל $1<=m<n$ מתקיים $xi^m != 1$.]
#example[עבור $K = QQ$ ו־$2<=n$ ראשוני, המספר $xi = e^((2pi i) / p) in CC$ הוא שורש יחידה פרימיטיבי מסדר $p$ ואז $L = QQ(xi)$ שדה הרחבה מעל $QQ$. \
  ראינו גם שהפולינום המינימלי של $xi$ מעל $QQ$ הוא
  $ m_xi = x^(p-1) + x^(p-2) + ... + x +1 $
]
#corollary[אם $K$ שדה סגור אלגברית ו־$n>=1$ אז שורש פרימיטיבי של יחידה מסדר $n$ קיים ב־$K$ אם ורק אם $n$ הוא הפיך ב־$K$ משמע אם ורק אם $n in K^times$.]
#exercise[
  נניח כי $K$ סגור אלגברית ונראה שמתקיימים
  + אם $char(K) = 0$ אז $mu_infinity (K) tilde.eq.rev QQ slash ZZ$
  + אם $char(K) = p > 0$ אז $mu_infinity (K) tilde.eq.rev QQ slash ZZ[1 / p]$
]
#proof[
  + $K$ סגור אלגברית ולכן מכיל את כל שורשי היחידה $xi_n$ לכל $n$.
    \כל $a / n in QQ slash ZZ$ הוא מסדר סופי ולכן $QQ slash ZZ$ היא חבורת פיתול עם "עותק" לכל $ZZ slash n ZZ$ לכל $n>=1$, וזה בידיוק $mu_infinity (K)$: אם נסתכל על האיזומורפיזם שהגדרנו בתרגיל הקודם, ונחדד אותו להיות $phi : QQ slash ZZ arrow.r mu_infinity (K)$ הנתון על־ידי $phi(a / n + ZZ) = e^((2pi i a) / n) in mu_n (K)$, זה מגדיר באמת איזומורפיזם כמו שראינו.
  + יהי $xi in K$ שורש יחידה מסדר $p^n$, משמע $xi^p^n = 1$ ולכן $xi$ הוא שורש של $x^p^n-1$, אבל $(x^p^n-1)' = 0$ כי $char(K) = p$ ולכן $gcd(x^p^n-1, (x^p^n-1)') = 1$ ולכן זהו פולינום פריד.\
    מנגד, כל השורשי יחידה במציין $p$ חייבים להיות מסדר זר ל־$p$, ולכן
    $ mu_infinity (K) = union.big_(n>=1,\ gcd(n, p)=1) mu_n (K) $
    אבל זה בידיוק אומר ש־$mu_infinity(K) tilde.eq.rev QQ slash ZZ [1 / p]$, שכן כל $x in QQ slash ZZ$ הוא מהצורה $x = a / n + ZZ$, ואם $p divides n$ אז $xi_n in.not K$, ולכן נשאר רק עם $n$־ים שעבורם $gcd(n, p)=1$, משמע
    $ mu_infinity (K) tilde.eq.rev union.plus.big_(n>=1,\ gcd(n, p)=1) ZZ slash n ZZ tilde.eq.rev QQ slash ZZ[1 / p] $
]
#remark[מיכאל אמר שהאיזומורפיזמים הללו הם לא יחידים ולא קנונים, כי הם "לא טבעיים" – הם תלויים בבחירה של $K$ ו־$xi_n in K$ ומצריך לקבע שורשי יחידה פרימיטיביים בצורה ספציפית לכל $n$.]

== שדות סופיים
פרק 6.2 ברשומות של מיכאל.\
אנחנו אוהבים שדות סופיים כי בשדה סופי כל האיברים הם שורשי יחידה.
#lemma("אנדומורפיזם פרובניוס")[
  נניח ש־$K$ שדה עם $char(K) = p > 0$.\ נגדיר $Fr(x) = x^p$ וזהו אנדומורפיזם (הומומורפיזם $Fr: K arrow.r K$) הנקרא *אנדומורפיזם פרובניוס*.\
  עבור שדות סופיים עם $char(K) = p$ ראשוני, זה $Fr$ הוא אוטומורפיזם.\
  את התמונה של $Fr^n$ נסמן ב־$K^p^n$.
]
#proof[
  + $ Fr(a b) = (a b)^p = a^p b^p = Fr(a) Fr(b) $
  + מנוסחת הבינום של ניוטון
    $ Fr(a+b) = (a+b)^p = sum_(i=0)^p binom(p, i) a^i b^(p-i) = a^p + b^p = Fr(a) + Fr(b) $
  + בגלל שאנחנו בתחום שלמות ואין מחלקי אפס, זה גם חד־חד ערכי שכן $Fr(a) = a^p = 0 <==> a=0$
]
#remark[את הלמה לעיל לא ראינו בהרצאה אבל מיכאל הזכיר אותה, 3.1.12 ברשומות של מיכאל.]
#theorem[לכל ראשוני $p in NN$ ו־$q = p^n$ עבור $n>=1$, קיים שדה $FF_q$ עם $q$ איברים והוא יחיד עד־כדי איזומורפיזם (שאינו יחיד).\
  בפרט, כל שדה סופי הוא איזומורפי ל־$FF_q$ כאשר $q$ חזקה של ראשוני.]
#proof[
  ניקח $FF_p$ ונגדיר הרחבה $K$ כשדה פיצול של $t^(q-1)-1$ שכן השורשים שלו הם בידיוק $FF_q without {0} = mu_q$.\
  נראה שבתוך $K$ יש $q$ איברים – ניקח את כל ה־$x$־ים כך ש־$x^q = 0$ וזה בעצם $Fr^q(x) = x$.\
  נטען שכל האיברים שלקחנו הוא מהווים שדה: $Fr^q (x) = x$ וגם $Fr^q (y) =y$ ולכן $Fr^q (x+y)=x+y$ ובאותו אופן נקבל גם כפל.\
  לכן נקבל ${x bar x^q=x} =FF_q subset K$ ובדיעבד $K = FF_q$.\
  הערה: כל הפתרונות שונים שכן $(x^q-x)'=1$ והפולינום שלנו פריד (פולינום הוא פריד אם ורק אם $gcd(f, f')=1$).\
  מכאן, $FF_q$ יחיד עד־כדי איזומורפיזם כי הוא שדה פיצול של $t^q-t$ מעל $FF_q$.\
  לבסוף אם $FF$ שדה סופי אזי $F$ מכיל את $FF_p$ כאשר $char F = p$ (ראינו בהרצאה $1$) ולכן $F approx FF_p^n$ כמרחב וקטורי מעל $FF_p$ ולכן $abs(F) = p^n$ ולכן $F approx FF_(p^n) = FF_q$.
]
#exercise[
  + $FF_9 = FF_3 (i)$
  + $FF_4 = FF_2 (alpha)$ כאשר $alpha^2 + alpha + 1 = 0$ (זה שוב האוטומורפיזם $alpha mapsto alpha+1$).
]
#proof[
  + ראשית מהמשפט לעיל נובע כי $FF_9$ הוא ההרחבת שדות היחידה (עד־כדי איזומורפיזם) של $FF_3$ מדרגה $2$ ($[FF_9 : FF_3] = 2$).\
    נבחן את הפולינום $x^2+1$, נשים לב שהוא לא מתאפס לאף $a in FF_3$ והוא אי־פריק מעל $FF_3$.\
    נשים לב שכל איבר ב־$FF_3 (i)$ הוא מהצורה $a + b i in FF_3$ וגם $i^2 = 2$, ויש לנו $9$ צירופים אפשריים מקומבינטוריקה.\
    מהמשפט לעיל נקבל כי $FF_9 = FF_3 (i)$.
  + נבחר את הפולינום $x^2+x+1$ ואנחנו כבר יודעים שהוא אי־פריק מעל $FF_2 [x]$ כי אין לו פיתרונות ב־$FF_2$ (ולכן הוא גם ראשוני) ונבחר $alpha$ המקיימת $alpha^2+alpha+1=0$.\
    עכשיו, $FF_2 [alpha] = FF_2 [x] slash (x^2+x+1)$ ונשים לב שהוא מכיל $4$ איברים ${0, 1, alpha, alpha+1}$ כצירופים לינאריים של $1$ ו־$alpha$ ונטען שהאיברים ${1, alpha, alpha+1}$ מהווים חבורה כפלית מסדר $3$:\
    מההנחה על $alpha$ שבחרנו נובע $alpha^2 = alpha+1$ ולכן
    $ alpha^3 = alpha^2 + alpha = (alpha+1) + alpha = 2 alpha + 1 = 1 (mod 2) $
    אז זה סגור לחיבור, כפל ויחידה וקיבלנו שזה אכן שדה.\
    מצאנו שדה עם $4$ איברים ומהטענה לעיל מתקיים $FF_2 [x] slash (x^2+x+1) = FF_4$.

]
#corollary[אם $FF_q$ שדה סופי אז לכל $n>=1$ יש בידיוק הרחבה אחת $K slash FF_q$ מדרגה $n$ והיא יחידה עד־כדי איזומורפיזם ובנוסף הרחבה זו היא פרימיטיבית (קיים $alpha$ כך ־ש$FF_q [alpha] = FF_(q^n)$ כאשר $alpha$ פריד).]
#proof[מהמשפט לעיל קיימת ויחידה ההרחבה $FF_(q^n) slash FF_q$, וההרחבה נוצרת על־ידי $alpha$ שהוא יוצר של $FF_(q^n)^times$.\
  מתקיים גם $f_(alpha slash FF_q) divides t^q^n - t = f$, אבל $f$ הוא פריד כי $f'=-1$ ולכן $f_(alpha slash FF_q)$ הוא פריד ו־$deg(f_(alpha slash FF_q)) = n$.
]
#corollary[נניח $FF_q, FF_r$ שדות סופיים. הבאים שקולים:
  + קיים שיכון $FF_q arrow.r.hook FF_r$
  + $r = q^d$ עבור $d in NN$
  + $r=p^n$ ו־$q=p^m$ עבור $m divides n$
]
#proof[
  $2 <==> 3$ ברור.\
  $1 ==> 2$ אם $phi.alt: FF_q arrow.r.hook FF_r$ קיים, אז $FF_r arrow.r.tilde (FF_q)^d$ כמרחב וקטור כאשר $d= [FF_r : FF_q]$ ולכן $r=q^d$.\
  $2 ==> 1$ נניח כי $r=q^d$ משמע שתי ההרחבות הן הרחבות שדה השדה ראשוני $FF_p$. אבל $q-1 divides r-1=q^d-1$ ולכן $x^(q-1) -1 divides x^(r-1)-1$ ואז שדה הפיצול $FF_r$ של $x^r-x$ מכיל את שדה הפיצול $FF_q$ של $x^q-x$ ומהיחידות סיימנו.
]
#theorem[נניח ש־$FF_(q^d) slash FF_q$ הרחבת שדות סופית מדרגה $d$ אז $Aut_(FF_q) (FF_(q^d))$ היא ציקלית עם $d$ איברים ויוצר $Fr_q$. \ (זאת אומרת $q=p^n, Fr_q (x)=x^q=(Fr_q)^n=Fr_q$)]
#remark[${1, Fr_q, ..., Fr_(q^(d-1))} = ZZ slash d ZZ tilde.eq Aut_(FF_q) (FF_(q^d))$]
#proof[
  $FF_(q^d) = FF_q (alpha)$ עבור $alpha$ פריד מדרגה $d$ ($deg(f_(alpha slash FF_q))=d$) ולכן $d = abs(C_alpha)$ ו־$abs(hom_FF_q ( FF_q (alpha), FF_q (alpha))) = 1$, שכן $sigma$ נקבעת ביחידות על־ידי $sigma(alpha) in C_alpha$.\
  נותר להוכיח שהיא ציקלית ולתאר אותה: כל $Fr_q^i$ עבור $0<=i<=d-1$ הוא הזהות על $FF_q$ ואינו הזהות על $FF_(q^d)$ שכן ${ x bar Fr_q^i (x) = x} = { x bar x^q^i=x}$ ויש בידיוק $q^i<q^d$ איברים כאלו.\
  משמע ${ x bar Fr_q^i (x) = x} arrow.r Aut_FF_q (FF_(q^d))= {1, Fr_q, ..., Fr_(q^(d-1))}$ כאשר $1$ הוא זהות ו־$Fr_q$ הוא יוצר.
]
#proof("טיפה שונה מהרשומות של מיכאל")[
  מהמסקנה שראינו לעיל, ההרחבה היא פרימיטיבית ולכן $G = Aut_(FF_q) (FF_(q^d))$ וממסקנה שראינו נובע כי היא מדרגה של לכל היותר $d$ (#text(red)[*לקשר למסקנה*]).\
  כל $a in FF_q$ מקיים $Fr_q (a) = a^q = a$ ולכן $Fr$ הוא איבר של $G$.\
  מאותה סיבה, $Fr_q)^d = 1 in G$ וגם $(Fr_q)^i != 1$ לכל $i<d$ שכן $(Fr_q)^i$ מקבע לכל היותר $q^i$ איברים. \
  לכן $Fr_q$ יוצרת את תת־חבורה ציקלית $H$ מסדר $d$ ומכיוון ש־$abs(G)<=d$ נובע כי $H=G$.
]
#remark[$overline(FF_p) = union.big_(n>=1) FF_(p^n)$ הוא יחיד עד־כדי $Aut_(FF_p) (overline(FF_p))$ כי אנחנו צריכים לבחור איך לשכן את התתי־שדות.\
  נראה ונוכיח בהמשך שבעצם מתקיים $Aut_(FF_p) (overline(FF_p)) = Fr_q^(hat(ZZ))$.]

= *תרגול 5 – 07/05*
== משהו

= *תרגיל 4*
== טריקים
== מסקנות

= *הרצאה 12 – 12/05*
== הרחבות ציקלוטומיות
פרק 6.3 ברשומות של מיכאל.\
המטרה שלנו היא לחשב את הדרגה של $[QQ(xi_n) : QQ] = phi(n)$ כאשר $phi(n)$ היא פונקציית אויילר, נרצה לפרק את $t^n-1 (= phi.alt_n (t))$, לדבר על מכפלות ציקליות ולחשב את $Aut_QQ (QQ(xi_n))$.
#definition("הרחבה ציקלוטומית")[
  הרחבה $L slash K$ נקראת *הרחבה ציקלוטומית* אם $L = K(xi)$ (נוצר על־ידי $xi$ שורש יחידה).\
  יהי $n$ הסדר של $xi$ ($xi^n = 1$, דהיינו $xi$ שורש פרימיטיבי), אז כל הצמודים של $xi$ מעל $K$ הם גם־כן שורשי יחידה פרימיטיביים מסדר $n$ (שכן, $xi^n = 1$ וגם $exists.not 0<m<n space (m in NN) space s.t. space xi^m=1$).\
  ממסקנה שראינו (#text(red)[*לקשר*]), כל $K$־אוטומורפיזם $sigma in Aut_K (L)$ נקבע ביחידות על־ידי $sigma(xi)=xi'$, ולכן יש הומומורפיזם צמצום $sigma bar_mu_n$ כחבורה (למה? כי $mu_in subset L^times = angle.l xi angle.r$), ולכן $Aut_K (L) arrow.r.hook Aut(mu_n)$.
]
#exercise("6.3.2 ברשומות של מיכאל")[
  + $a in ZZ slash n ZZ$ הוא הפיך אם ורק אם $gcd(a, n)=1$
  + תהיי $(H, +)$ חבורה ציקלית מסדר $n$ עם יוצר $g$. להראות כי $a g$ הוא יוצר של $H$ אם ורק אם $(a,n)=1$
  + להראות שיש הומומורפיזם קאנוני $(Z slash n ZZ)^times arrow.r.tilde Aut (H)$ כך ש־$a mapsto sigma_a$ הנתון על־ידי $sigma_a (h) = a h$ עבור $h in H$
]
#proof[
  + בכיוון הראשון נניח ש־$gcd(a, n)=1$, מזהות בז'ו נובע שקיימים $x,y$ כך שמתקיים $a x + n y = 1$ ולכן $a x eq.triple 1 mod n$, ולכן $x$ הוא ההופכי הכפלין של $a$ ב־$ZZ slash n ZZ$ ולכן $a$ הפיך.\
    בכיוון השני, נניח ש־$a$ הפיך ולכן קיים $b$ כך ש־$a b eq.triple 1 mod n$, ולכן קיים $k$ כך שמתקיים $a b = 1 + k n$ משמע $a b - k n =1$. אבל צד שמאל הוא צירוף לינארי של $a, n$ ולכן עבור $d = gcd(a, n)$ נובע כי $d$ מחלק גם כל צירוף לינארי של $a,n$ ובפרט $d divides a b - k n$,אבל אז $d divides 1$ ולכן $d=1$.
  + בכיוון הראשון נניח ש־$gcd(a, n)=1$ ונסתכל על תת־החבורה הנוצרת על־ידי $a g$ שכל איבריה הם מהצורה $k(a g)$ עבור $k in ZZ$.\
    הסדר של $a g$ הוא ה־$m in NN$ המינימלי כך ש־$m(a g) = 0$, אבל $g$ הוא יוצר של $H$ ולכן $g$ הוא $0$ אם ורק אם $m a$ הוא כפולה של $n$ ולכן אנחנו מחפשים $m a eq.triple 0 mod n$, וזה נתון על־ידי $m = n / gcd(a, n) = n / 1 = n$ ולכן הסדר של $a g$ הוא $n$ ו־$a g$ הוא יוצר של $H$.\
    בכיוון השני, נניח ש־$a g$ הוא יוצר של $H$, ולכן $o(a g)=n$, אבל זה גם ה־$m in NN$ המינימלי כך ש־$m(a g) = 0$ והוא כפולה של $n$, אבל ה־$m$ המינימלי שמקיים את זה נתון על־ידי $m = n / gcd(a, n)$, ולכן $n / gcd(a, n) = n <==> gcd(a, n)=1$.
    + #text(red)[*להשלים?*]
]
#lemma[
  יהי $L = K(xi)$ הרחבה ציקלוטומית מסדר ו־$n$ הסדר של $xi$ (כאשר $L slash K$ הרחבה נורמלית). אזי
  + $xi^a$ הוא שורש פרימיטיבי מסדר $n$ אם ורק אם $gcd(n, a)=1$
  + הומומורפיזם הצמצום מקיים $Aut_K (L) arrow.r.hook Aut(mu_n) arrow.r.tilde (ZZ slash n ZZ)^times$ (הוא שיכון) ו־$sigma mapsto a$ אם ורק אם $sigma(eta) = eta^a$ עבור $eta in mu_n$
]
#text(red)[*להשלים כמה טענות לא ברורות בהקשר להוכחה לעיל :(*]
#remark("תזכורת – משפט השאריות הסיני")[
  עבור $m, n in NN$ מתקיים $ ZZ_(m n) tilde.equiv ZZ_m times ZZ n <==> gcd(m, n)=1 $
  באינדוקציה אפשר להוכיח שהטענה נכונה לכל $n_1,..., n_r$ זרים בזוגות.\
  עוד מסקנה שנובעת ממשפט השאריות הסיני עם תוספת קטנה זה שעבור $n = product_(i=1)^r n_i$ זרים בזוגות מתקיים
  $ (ZZ_(n))^times tilde.equiv (ZZ_n_i)^times times ... times (ZZ_n_r)^times $
  זה נובע ממשפט השאריות הסיני ויחד עם ההוכחה שעבור $R,S$ חוגים מתקיים $(R times S)^times tilde.equiv R^times times S^times$ (פשוט לפתוח מהגדרות וישר יש איזומורפיזם).]
#lemma[
  יהי $1<n in NN$.
  + אם $p in NN$ ראשוני כך ש־$p!=2$ אז $(ZZ slash p^n ZZ)^times$ היא ציקלית מסדר $p^n(p-1)$
  + החבורה $(ZZ slash 2^n ZZ)^times tilde.equiv ZZ slash 2^(n-2) ZZ times ZZ slash 2ZZ$
]
#proof[
  בתור התחלה להוכחה, ניקח את שני המקרים בחשבון. נסתכל על הומומורפיזם הצמצום עם מודלו $p$ ואז $lambda : G_(p^n) arrow.r G_P = FF^times_p$
]
#text(red)[*יש פה הרבה מה להשלים...*]

= *הרצאה 13 – 13/05*
== הרחבות ציקלוטומיות – המשך
#text(red)[*תשלימי*]

== הרחבות רדיקליות
פרק 6.4 ברשומות של מיכאל.\
#definition("הרחבה רדיקלית")[הרחבת שדות $L slash K$ נקראת *הרחבה רדיקלית* אם $L = K(a^(1 / n))$.\
  לפעמים נראה אותה בתור $K(alpha) slash K$ עבור $alpha$ המקיים $alpha^n-a = 0$.]
#remark("פתולוגיה")[כבר ראינו שתי בעיות שיכולות לקרות בהרחבות מהסוג הזה:
  + הפולינום $f(t)=t^n-a$ נגזרתו היא $f'(t) = n t^(n-1)$ ולכן הפולינום הוא פריד אם ורק אם $n in K^times$ ו־$a!=0$ או $n=1$ ו־$a=0$
  + ההרחבה $QQ(root(3, 2)) slash QQ$ לא מעניינת, שכן אין לה אוטומורפיזמים (זה כי $mu_3 in.not QQ$)
  בלי שתי החריגות הללו, התורה שנתעסק בה היא מאוד יפה.
]
#lemma[נניח ש־$K$ הוא שדה, $n in K^times$ (אם $char(K) = 0$ או $gcd(n, char(K)) = 1$) כך ש־$mu_n subset K$ ו־$a in K$. אז הבאים שקולים
  + נגדיר $L = K(alpha)$ כאשר $alpha=a^(1 / n)$ (ההרחבה הנוצרת על־ידי שורש בודד) אז $L$ הוא שדה פיצול של $t^n-a$ (מההכלה $mu_n subset K$ נובע שאם הוספתי שורש $1$, פיצלתי הכל) ו־$mu_n alpha = {alpha, xi_n alpha, ..., xi_n^(n-1) alpha}$ קבוצת כל השורשים ב־$K$
  + כל $sigma in Aut_K (L)$ משמר את $mu_n alpha$, זאת־אומרת פועל על קבוצה זו על־ידי כפל באיבר $xi_sigma in mu_n$ ונקבע לחלוטין על־ידי $xi_sigma$. בפרט, יש לנו שיכון טבעי $Aut_K (L) arrow.r mu_n$
  + $abs(Aut_K (L)) = [L:K]$ ובפרט $Aut_K (L) = mu_n$ אם ורק אם $t^n-a$ הוא אי־פריק
]
#proof[
  + מכך ש־$n in K^times$, $mu_n$ מכילה $n$ איברים. \
    כל $xi alpha in mu_n alpha$ הוא השורש ה־$n$־י של $a$.\
    לפולינום $t^n-a$ יש לכל היותר $n$ שורשים, ולכן שורשי הפולינום הם בידיוק $mu_n alpha$.\
    כעת, $mu_n in K$ ולכן $mu_n alpha in L = K(alpha)$ דהיינו הפולינום מתפצל לחלוטין ב־$L$ (כל השורשים שם) ולכן $L$ הוא שדה פיצול של הפולינום הזה (בפרט, הוא נוצר על־ידי שורש אחד)
  + אוטומורפיזם $sigma$ לוקח את $alpha$ לצמוד שלו, שגם הוא שורש של $t^n-a$ ולכן $sigma(alpha) = xi_sigma alpha$ עבור $xi_sigma in mu_n$.\
    יתרה מכך, לכל שורש אחר $xi alpha in mu_n alpha$ מתקיים
    $ sigma(xi alpha) = sigma(xi) sigma(alpha) = xi xi_sigma alpha = xi_sigma dot.op (xi sigma) $
    משמע $sigma$ מכפילה כל שורש ב־$xi sigma$ ונקבל העתקה $lambda : Aut_K (L) arrow.r mu_n$ שלא תלויה בבחירה של השורש $a^(1 / n)$.\
    יתרה מכך, $sigma$ פועלת לפי $xi_sigma$ ו־$tau$ פועלת לפי $xi_tau$ אז $sigma tau$ פועלת לפי $xi_sigma xi_tau$ כי $ (sigma tau)(alpha) = sigma(tau(alpha)) = sigma(xi_tau alpha) = xi_sigma xi_tau alpha $
    ולכן $lambda$ זה הומומורפיזם. \
    לבסוף, כל $sigma in Aut_K (L)$ נקבעת ביחידות לפי $sigma(alpha)$ שכן $alpha$ יוצר את $L$ מעל $K$ ולכן $sigma$ נקבעת לפי $xi_sigma$ ולכן $lambda$ חד־חד ערכית וקיבלנו שיכון
  + יהי $f(t)$ גורם אי־פריק של $t^n-a$ כך ש־$alpha$ שורש שלו.\
  אז $[L : K] = deg(f)$ הוא מספר השורשים של הפולינום הפריד $f$, ולכן ל־$alpha$ יש בידיוק $[L:K]$ הצמדות ב־$L$ והעוצמה לפי למה שראינו (לקשר) היא בידיוק $abs(Aut_K (L))$
]
#remark[את הלמה וההוכחה לעיל התחלנו לראות בהרצאה של ה־13/05 וסיימנו ב־19/05.]


= *תרגול 6 – 14/05*
== משהו

= *תרגיל 5*
== טריקים
== מסקנות

= *הרצאה 14 – 19/05*
== הרחבות רדיקליות – המשך
#exercise("6.4.5 ברשומות")[#todo]
#proof[#todo]

