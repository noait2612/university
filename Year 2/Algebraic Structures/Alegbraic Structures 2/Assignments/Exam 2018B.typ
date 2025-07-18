#import "../../../../src/article.typ": *
#show: article.with(title: [ מבנים אלגבריים 2, 80446 --- פתרון מבחן מועד ב' 2018 ], signature: [#align(center)[#image(
      "../../../../src/duck.png",
      width: 30%,
      fit: "contain",
    )]])

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695

#let char = math.op("char")
#let im = math.op("Im")
#let ker = math.op("ker")
#let Perm = math.op("Perm")
#let deg = math.op("deg")
#let Span = math.op("Span")
#let Hom = math.op("Hom")
#let End = math.op("End")
#let cont = math.op("cont")
#let Frac = math.op("Frac")
#let Aut = math.op("Aut")
#let Id = math.op("Id")
#let Fr = math.op("Fr")
#let Gal = math.op("Gal")
#let gal = math.op("gal")
#let Tr = math.op("Tr")
#let Res = math.op("Res")
#let scr(it) = text(features: ("ss01",), box($cal(it)$))

#question()
נוכיח ששדה המספרים המרוכבים $CC$ סגור אלגברית.

#proof[
  נזכר בשתי טענות:
  + לכל $f in RR[t]$ מדרגה אי־זוגית יש שורש ב־$RR$ – זה נובע ממשפט ערך הביניים: $f$   רציפה ומתקיים  $display(lim_(t arrow.r infinity) f(t) = infinity"," lim_(t arrow.r minus infinity) f(t) = -infinity)$ \
    ולכן בפרט יש שורש.
  + השדה $CC$ סגור להוצאת שורש
  כעת, נניח שלא כך ולכן יש $L slash CC$ הרחבה אלגברית ולכן גם $L slash RR$ אלגברית.\
  היות ו־$char(RR)=char(CC)=0$ נובע שכל פולינום אי־פריק הוא ספרבילי ולכן ההרחבה היא ספרבילית ולכן ניקח $L^(gal) slash RR$ ונגדיר \
  $G = Gal(L^(gal) slash RR)$.\
  ניקח $H<=G$ תת־חבורה $2$־סילו ולכן ${e}<=H<=G$ ונקבל שיש שדה ביניים $L^(gal) slash F slash RR$ כאשר $F=(L^(gal))^H$.\
  אז $[F:RR] = abs(G)/abs(H)$ מספר אי־זוגי, זה מכיוון ש־$H$ חבורת $2$־סילו ולכן לכל $alpha in F$ מתקיים $deg(f_(alpha slash RR))$ אי־זוגי, שכן $ deg(f_(alpha slash RR))=[RR(alpha) : RR] divides [F:RR] $
  לכל פולינום כזה יש שורש ב־$RR$ מהטענה הראשונה מתהזכורת ולכן יש ל־$f_(alpha)$ שורש ב־$RR$ ולכן $alpha in RR$ (אחרת, $f_(alpha)$ פריק בסתירה להנחה).\
  אז $F=RR, H=G$ ולכן $L^(gal) slash RR$ היא הרחבה מסדר זוגי $abs(G)=2^n$ ולכן יש סדרה
  $
    {e} = G_0 triangle.stroked.small.l G_1 triangle.stroked.small.l dots.h.c triangle.stroked.small.l G_n = G wide (abs(G_i)=2^i)
  $
  מהצד השני, מהתאמת גלואה קיבלנו
  $ K_n supset dots.h.c supset K_2 supset K_1 supset RR wide ([K_i : K_(i-1)] = 2) $
  נניח ש־$n<=2$ (בהכרח מתקיים $n>=1$ כי $CC subset L^(gal)$), אבל זו סתירה כי אז נקבל
  $ RR!= K_1 = RR(sqrt(a)) $
  אבל $a in RR$ ולכן בהכרח $a<0$ ואז $K_1 = CC$, אבל $C!=K_2 = CC(sqrt(a + b i))$ אבל זו סתירה לטענה השנייה מהתזכורת, ולכן בהכרח $n=1 => L = CC$ בסתירה לכך ש־$L$ לא טריוויאלית, כנדרש.
]

#question()
נוכיח שכל פולינום פרימיטיבי $f(x) in ZZ[x]$ שהוא אי־פריק ב־$ZZ[x]$ הוא גם אי־פריק ב־$QQ[x]$.

#proof[
  נזכר בשתי הגדרות
  #definition("תכולה")[
    עבור פולינום $f(t) in ZZ[t]$ (תזכורת: $f(t) = sum_(i=0)^n a_i t^i$) נגדיר *תכולה* של $f$ להיות
    $ cont(f) = gcd(a_0, a_1, ..., a_n) $
  ]
  #definition("פולינום פרימיטיבי")[
    פולינום $f(t) in ZZ[t]$ יקרא *פרימיטיבי* אם $cont(f) = 1$.
  ]
  #remark[ לכל פולינום $f$ יש פירוק ב־$ZZ[t]$ הנתון על־ידי $f = cont(f) dot.op f_0 (t)$ כאשר $f_0 (t)$ הוא פולינום פרימיטיבי.]
  וניזכר בלמת גאוס הראשונה:
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
  נוכיח למה שהייתה חלק מלמת גאוס השנייה:
  #lemma[יהי $f in ZZ[t]$ פולינום לא קבוע. נזכור כי $QQ[t]$ הוא $Frac(ZZ)$, שדה השברים של $ZZ[t]$. \
    אם $f=g dot.op h$ פירוק ב־$QQ[t]$ אזי קיים $0 != c in QQ^times$ כך ש־$c dot.op g, c^(-1) dot h in ZZ[t]$ ולכן $f = (c dot.op g) dot.op (c^(-1) dot.op h)$ פירוק ב־$ZZ[t]$.
  ]
  #proof[
    ניקח את הפירוק $f = g dot.op h$ עבור $g, h in QQ[t]$ וניקח $0<m,n in ZZ$ כך ש־$m dot.op g, n dot.op h in ZZ[t]$ ואז נקבל פירוק $m dot.op n dot.op f = m dot.op g dot.op n dot.op h$.
    נסמן $ell = cont(f), alpha = cont(m dot.op g), beta = cont(n dot.op h)$. מלמת גאוס הראשונה נקבל עם כפליות התכולה
    $ cont(m dot.op n dot.op f) = m dot.op n dot.op ell = alpha dot.op beta = cont(m dot.op g dot.op n dot.op h) $
    אם כך, ניקח $m dot.op n dot.op f = m dot.op g dot.op n dot.op h$ ונחלק ב־$m dot.op n dot.op ell = alpha beta$ ונקבל $1 / ell dot.op f = (m dot.op n dot.op f) / (m dot.op n dot.op ell) = underbrace(m / alpha dot.op g dot.op n / beta dot.op h, in ZZ[t])$ משמע $f = ell m / alpha dot.op g dot.op n / beta dot.op h$.
  ]
  נשאר רק להוכיח את הטענה שלנו: נניח כי $f$ אי־פריק ב־$ZZ[t]$ ולכן $f = cont(f) dot.op f / cont(f)$ פירוק טריוויאלי ונשים לב $deg (f / cont(f)) > 0$ ולכן $cont(f)$ הפיך ולכן $f$ פרימיטיבי.\
  נניח ש־$f$ פריק ב־$QQ[t]$ ולכן יש $f = g dot.op h$ כך ש־$deg(g), deg(h) > 0$ ולכן מהלמה לעיל נקבל $f = c dot.op g dot.op c^(-1) dot.op h$ עם דרגות גדולות מ־0 ב־$ZZ[t]$ משמע הוא פריק בו, וזאת סתירה.\
]

#question()
בכל סעיף נקבע האם הטענה נכונה או לא נכונה וננמק לספורט.

#subquestion()
אם $K$ שדה ממציין $p>0$ כך ש־$K^p = K$ אז ההעתקה $f:K arrow.r K$ הנתונה על־ידי $x^(1/p)$ היא אוטומורפיזם של $K$.

#proof[
  הטענה *נכונה*.\
  כדי להראות אוטומורפיזם עלינו להראות שזה הומומורפיזם, חד־חד ערכי ועל:
  + זה הומומורפיזם
    + ניזכר שמהבינום כמו תמיד נקבל $f(x+y)=(x+y)^p = x^p+y^p$ אבל בגלל שהשדה פרפקטי מתקיים $ (x+y)^(1/p) = (x^p+y^p)^(1/p) <==> (x+y)^(1/p)=(x^(1/p)+y^(1/p)) $ ולכן $f(x+y)=f(x)+f(y)$
    + $f(x y) = (x y)^(1/p) = x^(1/p)y^(1/p) = f(x)f(y)$
  + חד־חד ערכי כי מההנחה על היות השדה מושלם, לכל איבר יש שורש מסדר $p$ ייחודי כי $ f(x)=f(y) <==> x^(1/p) = y^(1/p) <==> (x^(1/p))^p=(y^(1/p))^p <==> x=y $
  + על כי אם ניקח $z in K$ ונבחר $x=z^p$ אז $f(x)=(z^p)^(1/p)=z$
  אז זה אוטומורפיזם (הוא כמובן משמר גם את שדה הבסיס כי לכל $a in FF_p$ מתקיים $f(a)=a^(1/p) = a$).
]

#subquestion()
יהיו $K,L,F$ שדות כך ש־$K subset.eq L subset.eq overline(K)$ ו־$K subset.eq F subset.eq overline(K)$.\
אם $L slash K, F slash K$ הן הרחבות גלואה סופיות אז גם $(F L) slash K$ היא גלואה סופית ו־$Gal((F L) slash K)$ היא תת־חבורה של $Gal(F slash K) times Gal(L slash K)$.

#proof[
  הטענה *נכונה*.\
  ראינו אותה בהרצאה אבל אין לי מושג על מה מדובר.
]

#subquestion()
לשדה $FF_p (t)$ יש הרחבה לא פרידה עם מעלת הרחבה $p$.

#proof[
  הטענה *נכונה*.\
  ניקח $f(x)=x^p-a$ עם $a in FF_p$, זה פולינום מדרגה $p$ ובשדה $FF_p$ אין לו $p$ שורשים שונים (כי $f'(x) = p x^(p-1) eq.triple_(mod p) 0$ וזה אומר שכל השורשים שלו כפולים, זאת־אומרת הפולינום אי־פריד).\
  אנחנו רוצים שבשדה הרחבה השורשים של הפולינום שלנו יהיו $alpha = a^(1/p)$, אז ניקח את ההרחבה $FF_p (alpha)$ והפולינום שלנו זה הפולינום המינימלי שלה ולכן ההרחבה היא מדרגה $p$.
]

#subquestion()
כל הרחבות שדות סופית $K slash QQ$ היא גלואה.

#proof[
  הטענה *לא נכונה*.\
  ניקח $K = QQ(root(3, 2))$ זו הרחבה מדרגה $3$ שאיננה נורמלית (ולכן בהכרח אינה גלואה) כי $root(3, 2) xi_3 in.not QQ(root(3, 2))$ למרות שהשורש הזה צמוד ל־$root(3, 2)$ ולכן ההרחבה לא מכילה את הפיצול של הפולינום ולכן לא נורמלית.
]

#question()
נבנה הרחבות נורמליות $F slash K, L slash F$ כך שההרחבה $L slash K$ לא נורמלית.

#proof[
  נבחר $K = QQ, F = QQ(sqrt(2)), L = QQ(root(4, 2))$.\
  אנחנו כבר יודעים ש־$F slash K = QQ(sqrt(2)) slash QQ$ היא נורמלית (הרחבה ריבועית היא נורמלית) וגם $L slash K = QQ(root(4, 2)) slash QQ$ היא איננה נורמלית כי הפולינום המינימלי של ההרחבה הוא $x^4-2$ ולא כל השורשים נמצאים בהרחבה ($i root(4, 2), -i root(4, 2)$).\
  נטען כעת שההרחבה $L slash F = QQ(root(4, 2)) slash QQ(sqrt(2))$ היא נורמלית.\
  נסתכל על הפולינום $x^2-sqrt(2)$ הוא אי־פריק מעל $QQ(sqrt(2))$ ושורשיו הם $plus.minus root(4, 2) in QQ(root(4, 2))$ וזו בידיוק ההגדרה לנורמליות (כי הוא מתפצל לחלוטין עכשיו ב־$L$), ולכן $L slash F$ הרחבה נורמלית.
]

#question()
נמצא את חבורת הגלואה של הרחבת השדות $F_11 (xi_7) slash F_11$ כאשר $xi_7$ הוא שורש יחידה פרימיטיבי מסדר $7$.

#proof[
  קודם כל
  $ F_11^times = {1, dots.h.c, 10} tilde.equiv C_10 $
  אז אנחנו רוצים את החזקה המינימלית שבה נמצא את כל שורשי היחידה מסדר $7$, וזה יקרה מתי שיתקיים $7 divides 11^k-1$, עכשיו $11 mod 7 = 4$ אז ואנחנו צריכים למצוא חזקה של $4$ שבמודלו $7$ מביאה לנו $1$ (כי אנחנו רוצים $xi_7 in angle.l xi_(11^n-1) angle.r$)
  $
    underbrace(4^1 = 4 mod 7, crossmark), underbrace(4^2 = 16 mod 7 = 2, crossmark), underbrace(4^3 = 64 mod 7 = 1, checkmark)
  $
  ולכן $F_11 (xi_7) = FF_(11^3)$ כי עבור חזקת $3$ זו החזקה המינימלית מעל השדה שבו $x^7-1$ מתפצל לחלוטין ומתקיים $[FF_(11^3) : FF_11] = 3$.\
  ראינו שהשדה $FF_(p^n)$ הוא הרחבת גלואה של $FF_p$ ושכל הרחבה סופית של שדה סופי היא גלואה וראינו ש־$G=Gal(FF_(p^n) slash FF)$ היא חבורה ציקלית הנוצרת על־ידי אוטומורפיזם פרובניוס $Fr(x) = x^p$ (בסיכומי הרצאות של מיכאל טענה $6.2.6$, וזו הרחבת גלואה באמצעות מסקנה $17.4$ בספר – $FF_(p^n)$ הוא הרחבת גלואה של $FF_p$ מהיותו שדה פיצול של פולינום $x^p^n-x$ מעל כל שדה ביניים $FF_p subset.eq M subset.eq FF_(p^n)$ ולכן הוא גם גלואה מעל $M$ וזה שדה פרפקטי)
  במקרה שלנו מתקיים $abs(G)=[FF_(p^3) : FF_p] = 3$ ולכן $G tilde.equiv ZZ slash 3 ZZ$ עבור $Fr(x) = x^11$.\
]

#question()
$sqrt(2), root(3, 3)$ השורשים הממשיים החיובים, נוכיח שההרחבה $QQ(sqrt(2)+root(3, 3)) slash QQ$ איננה נורמלית.

#proof[
  נסמן
  $ overline(QQ) = { alpha in CC bar QQ "אלגברי מעל" alpha} $
  ניזכר ש־$overline(QQ)$ הוא שדה סגור אלגברית ו־$overline(QQ) slash QQ$ הרחבת שדות אלגברית, אז
  $ Aut(overline(QQ) slash QQ) = {sigma in Aut(overline(QQ)) bar forall x in QQ, sigma(x)=x} $
  ואנחנו יודעים ש־$sqrt(2), root(3, 3) in overline(QQ)$ עבור הפולינומים $x^2-2, x^3-3$ וכמובן $sqrt(2), root(3, 3) in.not QQ$ ולכן יש $sigma in Aut(overline(QQ) slash QQ)$ כך שמתקיים $ sigma(sqrt(2)) = plus.minus sqrt(2), sigma(root(3, 3))=root(3, 3) xi_3 $ אז בפרט $sigma(QQ(sqrt(2) + root(3, 3))) in.rev plus.minus sqrt(2) + root(3, 3) xi_3$
  זאת אומרת בהכרח יש לנו צמוד של $sqrt(2)+root(3, 3)$ שלא נמצא בהרחבה ועל־כן בפרט ההרחבה איננה נורמלית.
]

#question()
נמצא $alpha$ אלגברי מעל $QQ$ כך ש־$QQ(alpha) slash QQ$ היא הרחבת גלואה ו־$Gal(QQ(alpha) slash QQ) = ZZ slash 5 ZZ$.

#proof[
  הכי קל לקחת הרחבה ציקלוטומית ונוסיף שורש יחידה מסדר כלשהו שיתן לנו הרחבה בגודל המתאים אז $alpha = xi_n$ כלשהו (זה יהיה אלגברי כי זה שורש של הפולינום $x^n-1$).\
  ניזכר ש־$ [QQ(xi_n) : QQ] = phi_"אויילר" (n) = abs({k bar 1<=k<=n, gcd(k, n) = 1}) $
  המועד הראשון הוא $n=5$ אבל $phi_"אויילר" (5) = abs({1,2,3,4}) = 4 != 5 = abs(ZZ slash 5 ZZ)$.\
  נעבוד באלימות כי אין לי רעיון אחר:
  $
    crossmark phi_"אויילר" (6) = abs({1,5}) = 2 != 5 = abs(ZZ slash 5 ZZ) \
    crossmark phi_"אויילר" (7) = abs({1,2,3,4,5,6,7}) = 7 != 5 = abs(ZZ slash 5 ZZ) \
    crossmark phi_"אויילר" (8) = abs({1,3,5,7}) = 4 != 5 = abs(ZZ slash 5 ZZ) \
    crossmark phi_"אויילר" (9) = abs({1,2,4,5,7,8}) = 6 != 5 = abs(ZZ slash 5 ZZ) \
    crossmark phi_"אויילר" (10) = abs({1,3,7,9}) = 4 != 5 = abs(ZZ slash 5 ZZ)
    crossmark phi_"אויילר" (11) = abs({1,2,3,4,5,6,7,8,9,10}) = 10 != 5 = abs(ZZ slash 5 ZZ)
  $
  אז אולי לא.\
  אנחנו רוצים למצוא הרחבת גלואה עם חבורת גלואה $ZZ slash 5 ZZ$, אז אנחנו שואלים עבור איזה $n$ נקבל ש־$(ZZ slash n ZZ)^times$ הוא חבורה ציקלית עם סדר שמתחלק ב־$5$ כדי שתהיה תת־חבורה ציקלית מסדר $5$.\
  ובידיוק מהרשימה שלנו למעלה זה קורה כאשר מסתכלים על ההרחבה $[QQ(xi_11) : QQ] = 10$ ואז $Gal(QQ(xi_11) slash QQ) tilde.equiv ZZ_10$, ואנחנו יודעים ממשפט השאריות הסיני
  $ ZZ_10 tilde.eq ZZ_2 times ZZ_5 $
  אנחנו צריכים עכשיו להשתמש בהתאמת גלואה כדי לקבל את היחסים ההפוכים בין תתי־חבורות לבין תתי־שדות בהרחבה.\
  כמובן שכל $sigma in G$ מזיזה רק את $xi_11$ אז אם נסתכל על
  $ H = angle.l xi_11 mapsto xi_11^2 angle.r = { xi_11 mapsto xi_11^(2n) bar 1<=n<=5} $
  היא כמובן מסדר $5$ שכן (למה? כובע) אז אם נבחר $alpha=xi_11 + overline(xi_11)$ מסיים.
]
