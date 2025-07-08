#import "../../../../src/article.typ": *
#show: article.with(title: [ מבנים אלגבריים 2, 80446 --- סיכום ], signature: [#align(center)[#image(
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
#let Tr = math.op("Tr")
#let Res = math.op("Res")
#let scr(it) = text(features: ("ss01",), box($cal(it)$))

#set heading(numbering: "1.1")
#outline(depth: 2)

= *הרצאה 1 – 24/03*
== מבוא להרחבת שדות

#convention[
  אנחנו עובדים רק בחוג קומוטטיבי עם יחידה (0 הוא חוג עם יחידה) והומומורפיזם של חוגים לוקח 1 ל־1 (מכבד את מבנה החוג).\
  כמו כן, אנחנו עובדים תמיד בתחום שלמות (תחום ללא מחלקי 0).
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
  $0, FF[X], M_(n times n) (FF)$.
]

#definition("פולינום מתוקן")[
  יהי $f$ פולינום, ניזכר כי $f = sum_(i=1)^n a_i x^i$.נגיד כי $f$ הוא *מתוקן* אם המקדם המוביל שלו הוא 1.
]

#definition(
  "אי־פריק",
)[
  $R$ תחום שלמות ו־$0!=r in R$. $r$ נקרא *אי־פריק (irreducible)* אם איננו הפיך ואין לו פריק אמיתי.\
  משמע, אם מתוך $r = a b$ נובע ש־$a in R^times$ או $b in R^times$ (משמע $a~r$ או $b~r$, במבנים1 קראנו לזה יחס *חברות*).]

#corollary[$K$־הומומורפיזם של שדות הוא תמיד שיכון.]

#proof[אפשר לראות זאת מכלים של לינארית ישירות, או מהעובדה שהומומורפיזם של שדות הוא בפרט הומומורפיזם של חוגים, ולכן הגרעין שלו הוא אידיאל,
  אבל האידיאלים היחידים בשדה הם אידיאל האפס (הטריוויאלי) או כל השדה.]

== בניות

#definition("שדה מנות")[$R$ תחום שלמות, נגדיר *שדה מנות*
  $ Frac(R) = {s/r} bar s,r in R, r!=0 } slash tilde $
  כאשר $tilde$ הוא יחס שקילות המקיים $s_1/r_1 tilde s_2/r_2 <==> s_1r_2 = s_2r_1$.
]

#lemma[לכל שיכון $R arrow.r.hook K$ כאשר $K$ שדה, קיים ויחיד פיקטור $R subset Frac(R) arrow.r.hook K$.]

#definition(
  "שדה פונקציות רציונליות",
)[אם $K$ שדה ו־$S$ קבוצת משתנים (בדרך־כלל סופית אך אפשר גם אינסופית), נגדיר $ K(S) colon.eq Frac(K[S]) $ זה *שדה פונקציות רציונליות מעל $K$ במשתנים של $S$*.]

#remark[$Frac(K(S)) = {P / Q bar P, Q in K[S], Q!=0}$, כאשר $Frac$ זהו השדה הקטן ביותר שמכיל את $K[S]$.]

#exercise[מתקיים $K(y)(x)=K(x)(y)$.]

#proof[$K[x,y]=K[y,x]$ ולכן $Frac(K[x,y])=K(x,y)=K(y,x) = K(x)(y) = K(y)(x)$.]

#proposition(
  "תזכורת: תנאים שקולים לבניית שדות ממנה",
)[
  + אם $R$ חוג ו־$M$ אידיאל מקסימלי אז $K = R slash M$ הוא שדה
  + אם $K$ שדה ו־$f(t)$ פולינום אי־פריק מעליו אזי $K[t] slash (f(t))$ הוא שדה
]

#remark[מהלמה של צורן נובע כי בכל חוג יש אידיאל מקסימלי.]

#example[
  + $CC = RR[t] slash (t^2+1)$ (במילים אחרות, הוספנו $t$ וחייבנו $t^2+1=0 => t=i$)
  + $QQ(sqrt(2)) = QQ(t) slash (t^2-2)$
  + $QQ(root(3, 3)) = QQ(t) slash (t^3-3)$
]

#exercise[
  + $FF_3 (t) slash (t^2+1) = FF_9 = FF_3 [sqrt(-1)]$
  + $FF_2 (t) slash (t^2+t+1) = FF_4 (FF_4 != ZZ slash 4ZZ )$
]

#proof[
  + נשים לב שב־$FF_3$, אם נסתכל על הפולינום $t^2+1$ אז מתקיים $t^2+1 = 0 <==> t^2=-1$ אבל $-1 eq.triple 2 (mod 3)$ ולכן $t^2=2$, ולפולינום $t^2+1$ אין שורשים ב־$FF_3$ (פשוט להציב $t in {1,2,3}$).\
    כעת, $FF_3(t) slash (t^2+1)$ מכיל את האיברים מהצורה $a+b t$ עבור $a,b in FF_3$, קומבינטורית יש לנו $3 times 3 = 9$ אפשרויות לסכומים שונים, ואנחנו כבר יודעים מלינארית שזה גם הגודל של השדה $FF_9$ ועל־כן הם שקולים.\
    המקרה של $F_3 (t) slash (t^2+1) = FF_3[sqrt(-1)]$ ברור מכך ש־$t^2=-1$.
  + על אותו רעיון כמו המקרה הקודם.
]

== שדות ראשוניים

#definition(
  "שדה ראשוני",
)[נגיד ששדה הוא *שדה ראשוני* אם הוא מהרשימה $QQ, FF_2, FF_3, dots.h.c, FF_p$ כאשר $p$ ראשוני בלבד.]

#lemma[לכל שדה $K$ קיים ויחיד תת־שדה ראשוני $K_0 subset.eq K$ ובפרט שדות ראשוניים הם מנימליים ביחס להכלה.]

#proof[
  נשים לב כי לכל חוג $R$ קיים ויחיד הומומורפיזם $ZZ arrow.r R$ (כי $1_ZZ mapsto 1_R$ מהגדרת הומומורפיזם של חוגים).\
  בפרט, יש הומומורפיזם יחיד $phi : ZZ arrow.r K$ ו־$ZZ arrow.r ZZ slash ker(phi) subset R$, שכן $ZZ$ תחום אוקלידי וולכן תחום ראשי ואז $ker(phi)=(n)$ ונחלק למקרים:
  + $n=0$ אזי $ZZ arrow.r.hook R$ ולכן גם $Frac(ZZ) = QQ arrow.r.hook R$
  + אם $n!=0$ אז $n=p$ ראשוני כי $ZZ slash p ZZ subset R$ תחום וזה אומר ש־$FF_p = ZZ slash p arrow.r.hook K$
  כמובן, אף $FF_p$ או $QQ$ לא מכיל שדה אחר מהרשימה ואי־אפשר לשכן אחד בשני.
]

#definition("המציין")[*המציין* של שדה $K$ הוא
  + $char(K)=0$ אם $QQ subset.eq K$
  + $char(K)=p$ אם $FF_p subset.eq K$
]

#definition(
  "הגדרה אלטרנטיבית למציין",
)[$char(K)$ הוא המספר החיובי $p$ הקטן ביותר כך ש־$0=p in K$ ו־$char(K)=0$ אם לא קיים כזה.]

#remark[מהלמה שראינו $ker(ZZ arrow.r K) = (char(K))$.]

#remark("אזהרה")[בשדה ממציין $p$ הדבר *הכי* חשוב לעשות זה *לא* לחלק ב־$p$.]

#lemma[אם $phi : K arrow.r R$ הומומורפיזם של חוגים, $K$ שדה ו־$R!=0$ אזי $phi$ חד־חד ערכית.]

#proof[
  $I = ker(phi) subset.eq K$ אידיאל. \
  אם $I = 0$ אז $phi$ חד־חד ערכית וסיימנו, או שמתקיים $I = R$ ואז $0=1$ ולכן $R=0$ וזו סתירה.
]

#definition("אנדומורפיזם, אוטומורפיזם")[הומומורפיזם $phi : K arrow.r K$ נקרא *אנדומורפיזם* ומסומן *$End(K)$*.\
  אם $phi$ הפיך אז $phi$ נקרא *אוטומורפיזם* ומסומן ב־ *$Aut(K)$* (שזו כמובן חבורה)]

#example[
  נניח ש־$char(K) = p != 0$, אזי $Fr(x)=x^p$ מגדיר אנדומורפיזם שנקרא לו *פרובניוס* מ־$K$ לעצמו (עוד נתעסק בו בהמשך).
]

#proof[
  אכן $1 mapsto 1, 0 mapsto 0$ ו־$(x y)^p=x^p y^p$ ובחיבור נשתמש בנוסחת הבינום $(x+y)^p = sum_(i=0)^p binom(p, i) x^i y^(p-i)$ ונשים לב ש־$binom(p, i)$ מתחלק ב־$p$ כמספר שלם כאשר $i in.not {0,p}$ ואז $(x+y)^p = x^p+y^p$ בכל שדה שבנו $p=0$.
]

#example[
  ב־$FF_3$ מתקיים $(x+y)^3 = x^3+3x^2y+3x y^2 + y^3$
]

#exercise[
  אם $FF$ שדה סופי עם $char(FF)=p$ אז $Fr_FF in Aut(FF)$.
]
#proof[
  היות ו־$FF_r$ הוא חד־חד־ערכי (העתקה מתוך שדה), והשדה הוא סופי אז בהכרח הוא על, ולכן אוטומורפיזם.
]

#example[
  $FF_p (t) arrow.r^Fr FF_p (t)$ לא הפיכה כי אין $t=p$.
]

= *הרצאה 2 – 25/03*
== הרחבת שדות
פרק 3 ברשומות של מיכאל.

#definition(
  "הרחבת שדות",
)[אם $L$ שדה ו־$K subset.eq L$ הוא תת־שדה (קבוצה סגורה לפעולות) אז אומרים ש־$L slash K$ היא *הרחבת שדות*.]

#remark[
  בדרך־כלל, נרצה להתחיל מ־$K$ ולבנות הרחבות אבל כמעט תמיד אנחנו בונים שיכון שדות $K arrow.r.hook L$ במקום, אבל בפועל מהשיכון \
  $phi: K arrow.r L$ אפשר לבנות הרחבה על־ידי החלפה של $phi(K)$ ב־$K$.
]

#definition(
  "K־הומומורפיזם בין שדות",
)[אם $L slash K, F slash K$ שתי הרחבות של $K$ אזי *$K$־הומומורפיזם* מ־$F$ ל־$L$ זה הומומורפיזם $phi: F arrow.r L$ כך שמתקיים $phi|_K = Id$.]

#notation[$L slash K$ הרחבת שדות, נסמן את חבורת כל $K$־אוטומורפיזמים של $L$ ב־$Aut_K (L)$ או ב־$Aut(L slash K)$]

#example[
  + $Aut_RR (CC) = ZZ slash 2ZZ$ (כי שורשים של פולינום הולכים בינם לבין עצמם)
  + $Aut_QQ (CC)$ הוא ענק ולא נחמד
  + $Aut_CC (CC) = 1$
  + $Aut_QQ (QQ(sqrt(2))) = ZZ slash 2ZZ$ עם ההצמדה $a+b sqrt(2) mapsto a-b sqrt(2)$ והזהות
]

== יוצרים של הרחבות

#definition("K[S], K(S)")[נניח ש־$L slash K$ הרחבת שדות ($K subset.eq L$) ו־$S subset.eq L$ תת־קבוצה, אז
  + $K[S]$ *תת־חוג* של $L$ שמכיל את $K$ ו־$S$ והוא הקטן ביותר
  + $K(S)$ *תת־השדה* הקטן ביותר המכיל את $K$ ואת $S$
]

#remark[הם קיימים ושווים לחיתוך של כל תתי־חוגים / שדות המכילים את שניהם (כמו ש־$Span$ של מרחב וקטורי קיים).]

#lemma[בהינתן הרחבת שדות $L slash K$, יהיו $S subset.eq L$ ו־$phi : K[x_s]_(s in S) arrow.r L$ הומומורפיזם שהוא הזהות על $K$ ו$x_s mapsto s in S subset.eq L$, אז מתקיים
  + $K[S] = { f(s) bar f in K[x_s]_(s in S)}$
  + $K(S) = Frac(K[S]) = {f(S)/g(S) bar f(x),g(x) in K[x_s]_(s in S), g(S)!=0}$
]

#proof[#text(red)[*להשלים, למה 3.1.23 אצל מיכאל.*]]

#remark[בדרך־כלל אין הומומורפיזם $K(X_s)_(s in S) arrow.r L$ כי עלולים לקבל "$infinity$" (לחלק ב־$0$).]

#definition(
  "הרחבה נוצרת סופית",
)[הרחבה $L slash K$ נקראת *נוצרת סופית* אם קיים $L supset.eq S = {alpha_1, dots.h.c, alpha_n}$ סופית כך שמתקיים $K[S] = L$.]

#example[
  $CC = RR + i RR$ ו־$CC = RR[i]=RR(i)$ ואפילו $CC slash RR$ מרחב וקטורי נוצר סופית.\
  $CC (t) slash CC$ נוצר סופית כשדה אבל לא נוצר סופית כחוג (דורש הוכחה) ואפילו $CC[t] slash CC$ לא נוצר סופית כפולינומים.
]

#definition(
  "דרגת הרחבה",
)[אם $L slash K$ הרחבת שדות, אז *הדרגה של ההרחבה* שנסמנה *$[L: K]$* שווה למימד של $L$ כמרחב וקטורי מעל $K$ ולכן $dim_K L = [L:K]$.]

#example[
  + $[QQ(sqrt(3)) : QQ] = 2$ (כמו ש־$[CC : RR] = 2$)
  + נראה בהמשך שמתקיים $[QQ(root(3, 2) : QQ)] = 3$
  + $[K(t) : K] = infinity$
]

#definition("הרחבת שדות סופית")[הרחבה $L slash K$ נקראת *הרחבה סופית* אם $[L:K]<infinity$.]

#convention[$infinity dot.op n = infinity, infinity dot.op infinity = infinity$]

#lemma("כפליות הדרגה")[
  אם $F slash L slash K$ הוא מגדל של הרחבות שדות אזי מתקיים
  $ [F:K] = [F : L] dot.op [L:K] $
  ובפרט, $F slash K$ הרחבה סופית אם ורק אם $L slash K, F slash K$ הרחבות סופיות.
]

#proof[
  אם $F slash L, L slash K$ לא הרחבות סופיות בבירור גם $F slash K$ לא הרחבה סופית.\
  אם $F slash K$ סופי, אז הבסיס של $F slash K$ הוא גם בסיס מעל $L$ ולכן $F slash L$ סופי ו־$L$ תת־מרחב וקטורי ב־$F$ ולכן גם הוא נוצר סופית מעל $K$.\
  נשאר להראות שאם $F slash L, L slash K$ הרחבות סופיות אז השיוויון ממתקיים. נראה זאת באמצעות בניית בסיס:\
  נניח שמתקיים $[L:K]=n, [F:L]=m$ ונבחר בסיסים $alpha_1, dots.h.c, alpha_n$ בסיס של $L slash K$ ו־$beta_1, dots.h.c, beta_m$ בסיס של $F slash L$, נוכיח ש־$gamma_(i j) = alpha_i beta_j$ מהווה בסיס של $F slash K$, עלינו להראות שפורש ובלתי־תלוי לינארית:\
  כל $c in F$ ניתן לייצוג על־ידי $c=sum_(j=1)^m b_j beta_j$ עם $b_j in L$, אז $b_j = sum_(i=1)^n a_(i j) alpha_i$ עם $a_(i j) in K$, אז
  $ c = sum_(j=1)^m (sum_(i=1)^n a_(i j) alpha_i) beta_j = sum_(i,j) a_(i j) gamma_(i j) $
  ולכן $gamma_(i j)$ פורש את $F slash K$.\
  אם נניח ש־$a_(i j) in K$ כך שמתקיים $sum_(i, j) a_(i j) gamma_(i j) = 0$, אז
  $ 0 = sum_(i, j) a_(i j) alpha_i beta_j = sum_(j=1)^m (sum_(i=1)^n a_(i j) alpha_i) beta_j $
  אבל $beta_j$ בלתי־תלויים לינארית מעל $L$ אז $sum_i a_(i j) alpha_i in L$ הם כולם אפסים, אבל $alpha_i$ בלתי־תלויים לינארית מעל $K$, אז $a_(i j)$ הוא הביטוי שנעלם ולכן $gamma_(i j)$ הם בלתי־תלויים לינארית מעל $K$ ולכן זה מהווה בסיס מעל $F$.
]

= *תרגול 1 – 26/03*

== חוג הפולינומים – תזכורת

== בניית שדות בעזרת מנות של חוגי פולינומים

== חישוב בשדה $E=F[x] slash (f)$
#text(red)[*להשלים*]

= *תרגיל 1*
== טריקים
#text(red)[*להשלים*]

== מסקנות
#text(red)[*להשלים*]

= *הרצאה 3 – 31/03*
== הרחבות אלגבריות
פרק 3.2 ברשומות של מיכאל.

#definition(
  "איבר אלגברי, איבר טרנסצנדנטי",
)[בהינתן הרחבה $L slash K$ ו־$alpha in L$, נגיד ש־$alpha$ *אלגברי* מעל $K$ אם קיים $f(t) in K[t]$ כך שמתקיים $f(alpha)=0$, אחרת נגיד ש־$alpha$ נקרא *טרנסצנדנטי* מעל $K$.\
  אם $char(L)=0$ אז $alpha in L$ אלגברי או טרנסצנדנטי אם הוא אלגברי או טרנסצנדנטי מעל $QQ$.]

#example[
  אלגבריים ב־$CC$: $1/778, root(3, 5), root(5, 3)+root(3, 5)$ ובהמשך נוכיח שגם $i$.\
  טרנסצנדנטי ב־$CC$: $e, pi$ (עובדה מעניינת: לא ידוע אפילו אם $e+pi$ הוא טרנסצנדנטי או אלגברי, כי- זה מספר אי־רציונלי).\
  נשים לב ש־$e$ אלגברי מעל $CC$ ו־$RR$ ואפילו מעל $QQ(e), QQ(e^5+e)$ (ברור שלהיות איבר אלגברי או טרנסצנדנטי תלוי בשדה שאני עליו).\
  הרעיון הכללי הוא שאם יש ל־$alpha$ קירובים רציונליים "טובים מדי" אז $alpha$ טרנסצנדנטי – כמו לדוגמה מספר ליוביל.
]

#definition(
  $overline(QQ)$,
)[$overline(QQ)$ ב־$CC$ קבוצת כל האיברים האלגבריים מעל $QQ$ ונראה היום שהוא שדה ואף בן־מנייה (הבן־מנייה הגיוני: יש מספר בן־מנייה של פולינום מעל $QQ$ ולכן יכולים להיות רק מספר בן־מנייה של שורשים ולכן יש מספר בן־מנייה של מספרים אלגבריים מעל $QQ$).]

#definition(
  "פולינום מינימלי",
)[תהיי $L slash K$ הרחבה ו־$alpha in L$, והוכחנו ש־$K[alpha] = K[t] slash I$ כאשר $I = {f in K[t] bar f(alpha)=0}$ ב־$L$.\
  $I$ הוא אידיאל ראשי (נוצר על־ידי איבר אחד) כך ש־$K[t]$ חוג ראשי ו־$I$ ראשוני, כי $K[alpha] subset.eq L$ תחום שלמות (אם $0=h(alpha)g(alpha)$ ב־$L$ אז $g(alpha)=0$ או $h(alpha)=0$ אז אם $h g in I$ אז $h in I$ או $g in I$ וראינו ש־$I$ אידיאל ראשוני אם ורק אם $R slash I$ תחום שלמות).\
  מכאן, או $I = (f_alpha (t))$ כאשר $f_alpha$ הוא אי־פריק או $I=0$ (בכלל זה אידיאל מקסימלי).\
  אם $I=0$ אז $alpha$ טרנסצנדנטי ואם $f_alpha$ הוא אי־פריק אז $alpha$ אלגברי.\
  אם קיימים פולינומים שונים מאפס שמתאפסים ב־$alpha$ אז יש פולינום מתוקן מינימלי כזה, קוראים ליוצר זה *הפולינומים המינימלי של $alpha$ מעל $K$* ונסמנו $f_alpha$ או $f_(alpha slash K)$ כדי להדגיש מעל איזה שדה אנחנו מדברים (כאשר האחרון זו הצורה המועדפת), ברשומות מדי פעם זה מופיע גם בתור $f_(alpha, K)$.
]

#proposition("תנאים לפולינום מינימלי")[
  על־מנת להגיד ש־$f_(alpha slash K)$ הוא פולינום מינימלי, צריך להתקיים:
  + $f_(alpha slash K) (alpha) = 0$
  + $f$ פולינום מתוקן
  + $f$ אי־פריק
]

#example[$t^2-2 = f_(sqrt(2) slash QQ)$ עם $deg(f) = 2$, $t-sqrt(2) = f_(sqrt(2) slash QQ(sqrt(2)))$ עם $deg(f) = 1$ (שדה יותר גדול => פולינום יותר קטן).]

#lemma[
  אם $F slash L slash K$ מגדל הרחבות ו־$alpha in F$ איבר אלגברי מעל $K$ הוא הוא גם אלגברי מעל $L$ והפולינום המינימלי של $alpha$ מעל $L$ מחלק את הפולינום המינימלי של $alpha$ מעל $K$, ובסימונים $f_(alpha slash L) divides f_(alpha slash K)$.
]

#proof[$f_(alpha slash K) in L[t]$ וגם $f_(alpha slash K) (alpha) = 0$ ולכן הוא מתחלק ב־$f_(alpha slash L)$.]

#notation[$f_(alpha slash K) dot.op K[t] = m_(alpha slash K)$ האידיאל של כל הפולינומים מעל $K$ שמתאפסים ב־$alpha$ (או $0 = m_(alpha slash K)$ אם $alpha$ הוא טרנסצנדנטי).]

#lemma[תהיי $L slash K$ הרחבה ו־$alpha in L$
  + אם $alpha$ אלגברי עם פולינום מינימלי $f_alpha = f_(alpha slash K)$ ו־$d = deg f_alpha$ אזי $K(alpha) = K[alpha] = K[t] slash (f_alpha)$ ו־$1, alpha, dots.h.c, alpha^(d-1)$ מהווים בסיס של $K(alpha) slash K$ ובפרט מתקיים $d = [K(alpha) : K]$
  + אם $alpha$ טרנסצנדנטי אז $K(t) tilde.eq_(t mapsto alpha) K(alpha)$ ו־$[K(alpha) : K] = infinity$
]

#proof[
  + כבר הוכחנו ש־$K[alpha] = K[t] slash (f_alpha)$ והיות ו־$f_alpha$ הוא אי־פריק אז $m_alpha$ הוא מקסימלי ולכן $K[alpha]$ שדה ו־$K(alpha)=K[alpha]$.\
    עכשיו נחשב את המימד של $K(alpha) = K[t] slash (f_alpha)$ ונראה שמתקיים $dim_K K[t] slash (f) = deg(f)$ לכל $f!=0$:\
    לכל $h in K[t]$ פולינום קיימים ויחידים $q_h, r_h$ כך ש־$h = q_h dot.op f_alpha + r_h$ וגם $deg(r_h)<d = deg(f)$ כאשר $r_h$ היא החלוקה עם שארית.\
    זה נותן לנו העתקה $r : K[t] arrow.r K[t]_(<d)$, נראה שזו העתקה לינארית:\
    לכל $g,h in K[t]$ מתקיים $r_(g+h) = r(r_g + r_h)$ ולכן $r_(g+h) = r_g + r_h$, אותו הדבר לכפל בסקלר וקיבלנו העתקה לינארית ועל.\
    מתקיים שהגרעין הוא $f_alpha dot.op K[t] = m_alpha$ ולכן (כמרחבים וקטורים) $K[alpha] tilde.eq K[t] slash m_alpha tilde.eq K[t]_(<d)$ והבסיס כאן הוא $1, t, dots.h.c, t^(d-1)$ ואז $1, alpha, dots.h.c, alpha^(d-1)$ הוא בסיס.
  + מתקיים $K[t] tilde.eq K[alpha]$ (כי $K[t] tilde.eq K[t] slash m_alpha tilde.eq K[alpha]$) ולכן $K[t] = Frac(K[t]) tilde.eq Frac(K[alpha]) = K(alpha) subset L$ ו־$K[alpha] subset K(alpha)$ והמימד שלנו הוא $infinity$.
]

#remark[$K[t] arrow.r K[t]_(<d)$ הוא *לא* הומומורפיזם של חוגים כי $K[t]_(<d)$ הוא לא חוג, הוא אפילו לא סגור לכפל.]

#definition(
  "הרחבה פרימיטיבית",
)[$L slash K$ נקראת *הרחבה פרימטיבית* אם היא נוצרת על־ידי איבר אחד, כלומר קיים $alpha in L$ כך שמתקיים $L = K(alpha)$.]

#lemma[אם $K$ שדה ו־$f in K[t]$ אי־פריק אז קיימת הרחבה פרימיטיבית $L slash K$ כך של־$f$ יש שורש ב־$L$.]

#proof[$L' = K[t] slash (f(t))$ זה שדה, ולכן יש $phi : K arrow.r L'$ שהוא שיכון כך ש־$L' slash phi(K)$ הוא הרחבה פרמיטיבית הנוצר על־ידי שורשי $f$, מלמה שלא ראינו בהרצאות (3.1.17 ברשומות של מיכאל), יש הרחבה $L slash K$ שאיזומורפית ל־$L' slash phi(K)$ ולכן $L slash K$ היא הרחבה פרימיטיבית הנוצרת על־ידי שורש של $f$ ואז $f_alpha divides f => f_alpha = f$.]

#definition(
  "דרגה של איבר",
)[עבור $alpha slash K$ אלגברי, *הדרגה של $alpha slash K$* היא $deg_K (alpha) = deg(f_(alpha slash K))$ (מהלמה שראינו זה אומר $K[alpha]:K$).]

#definition(
  "הרחבה אלגברית",
)[תהיי $L slash K$ הרחבות שדות. נגיד שההרחבה היא *אלגברית* אם כל $alpha in L$ הוא אלגברי מעל $K$.]

#lemma[
  תהיי $L slash K$ הרחבות שדות, אז
  + אם $[L:K]=d$ אז לכל $alpha in L$ אלגברי, $deg_K (alpha) divides d$ (ומתקיים במקרה זה ש־$L slash K$ אלגברי)
  + אם $L = K(alpha_1, dots.h.c, alpha_n)$ אזי $[L:K] = <= product_(i=1)^n deg_K (alpha_i)$ כאשר $alpha_1, dots.h.c, alpha_n$ אלגבריים
]

#proof[
  + בין $1, alpha, dots.h.c, alpha^d$ (יש כאן $d+1$ איברים) יש תלות לינארית וזה נותן פולינום מדרגה קטנה/שווה ל־$d$ שמתאפס ב־$alpha$.\
    בדרך אחרת אפשר לראות את זה $deg_K (alpha) = [K(alpha) : K] divides [L:K]$ מכפליות הדרגה
  + מתקיים
    $
      [L:K] = [K(alpha_1) : K] dot.op [K(alpha_1, alpha_2) : K(alpha_1)] dot.op dots.h.c dot.op [L:K(alpha_1, dots.h.c, alpha_n)]
    $
    אז כל אחד מהם נוצר על־ידי איבר בודד ולכן פרימיטיבי, אז
    $
      [L:K] = product_(i=1)^n [K(alpha_1, dots.h.c alpha_i) : K(alpha_1, dots.h.c, alpha_(i-1))] = product_(i=1)^n deg_(K(alpha_1, dots.h.c, alpha_(i-1))) (alpha_i) <= product_(i=1)^n deg_K (alpha_i)
    $
]

#corollary[אם $L slash K$ הרחבה ו־$alpha, beta in L$ אלגבריים מעל $K$, אזי גם $alpha+beta, alpha-beta, alpha dot.op beta, alpha/beta$ (אם האחרון מוגדר) אלגבריים מעל $K$ מדרגה שקטנה שווה ל־$deg_K (alpha) dot.op deg_K (beta)$, ובפרט קבוצת כל המספרים האלגבריים ב־$L$ מעל $K$ היא שדה.]

#proof[ניקח $K(alpha,beta) subset.eq L$ ולכן לפי הלמה לעיל $deg_K (alpha) dot.op deg_K (beta) >= [K(alpha, beta) : K]$ ולכן כל $gamma in K(alpha, beta)$ אלגברי ואפילו יש חסם על הדרגה שלו, $deg_K (gamma) <=deg_K (alpha) dot.op deg_K (beta)$.]

#exercise[
  $deg_QQ (root(3, 3) + sqrt(2))=6$.
]

#proof[זה נובע מכך ש־$root(3, 3), sqrt(2)$ הם שניהם אלגבריים בהרחבה (השורשים של הפולינומים $x^3-3, x^2-2$) ולכן מהמסקנה $deg_QQ (root(3, 3) + sqrt(2))<=6$.\
  השיוויון נובע מכך שהם בלתי־תלויים לינארית (או אלגברית?) כי הם פתרונות של שורשים ממעלות שונות ולכן כל קשר ביניהם הוא רק הקשר הטריוויאלי (עם הנחה בשלילה וקצת עבודה נוכל לקבל שיש איבר אלגברי אחר שמאפס את הפולינומים הללו ואז זו סתירה להיות הפולינומים שמצאנו כפולינומים המינימליים).]

#notation[$overline(QQ) = {x in CC bar CC"אלגברי ב־ " x }$]

#remark[הוכחנו שזה שדה לפי הגדרה ולכן $overline(QQ) slash QQ$ היא *הרחבה אלגברית* אך כמובן לא נוצרת סופית.]

#corollary[עבור הרחבת שדות $L slash K$, הבאים שקולים
  + $L slash K$ סופית
  + $L slash K$ אלגברית נוצרת סופית
  + $L$ נוצרת על־ידי איברים אלגבריים $alpha_1, dots.h.c, alpha_n$
]

#proof[
  $1=>2$: נניח ש־$L slash K$ סופית אז היא אלגברית (מהלמה על הדרגות שראינו לעיל) ונוצרת סופית (אפילו כמרחב וקטורי).\
  $2=>3$: מיידי מהגדרה.\
  $3=>1$: נניח ש־$L = K(alpha_1, dots.h.c, alpha_n)$ כאשר $alpha_1, dots.h.c, alpha_n$ אלגבריים. אזי מהלמה שראינו $[L:K]<= product_(i=1)^n deg_K (alpha_i) < infinity$ ולכן סופית.
]

#corollary(
  "תנאי לטרנזטיביות הרחבות אלגבריות",
)[יהיה $F slash L slash K$ מגדל הרחבות. אזי $F slash K$ אלגברי אם ורק אם $F slash L$ ו־$L slash K$ אלגבריים]

#proof[
  $<==$ נניח ש־$F slash K$ אלגברית אז ברור ש־$L slash K, F slash L$ הרחבות אלגבריות ישירות מהגדרה.\
  $==>$ נניח ש־$F slash L$ ו־$L slash K$ אלגבריות ונוכיח כי כל $alpha in F$ אלגברי מעל $K$: $alpha$ אלגברי מעל $L$ ולכן קיים $f=f_(alpha slash L) !=0$ כך שמתקיים $f(alpha)=0=alpha^d+beta_1 alpha^(d-1) + dots.h.c + beta_d = 0$ עם $beta_1, dots.h.c, beta_d in L$.\
  היות ו־$beta_1, dots.h.c, beta_d$ אלגבריים מעל $K$, השדה $E=K(beta_1, dots.h.c, beta_d)$ הוא סופי מעל $K$ עם הלמה לעיל.\
  היות ו־$alpha$ הוא אלגברי מעל $E$, ההרחבה $E'=E(alpha) slash E = K(alpha, beta_1, dots.h.c, beta_d) slash K(beta_1, dots.h.c, beta_d)$ היא הרחבה סופית גם־כן.\
  נשים לב שקיבלנו מגדל הרחבות סופיות ($E'$ סופית כי פרימטיבית מהיות $alpha$ אלגברי)
  $ K(alpha, beta_1, dots.h.c, beta_d) slash K(beta_1, dots.h.c, beta_d) slash K $
  אז מהלמה שראינו על כפליות הדרגה
  $ deg_K (d) <= [K(alpha, beta_1, dots.h.c, beta_d) : K] < infinity $
]

#definition(
  $"מחלקה יציבה" cal(C)$,
)[נסמן ב־$cal(C)$ את המחלקה של הרחבות שדות. $cal(C)$ נקראת *יציבה* (ברשומות לפעמים שלמה) אם לכל מגדל $F slash L slash K$ של הרחבות, $F slash K in cal(C)$ אם ורק אם $F slash L, L slash K in cal(C)$.\
  נשים לב שהוכחנו שמחלקות של הרחבות סופיות ואלגבריות היינן שלמות.]

= *תרגול 2 – 02/04*
== משהו
#text(red)[*להשלים*]

= *הרצאה 4 – 07/04*
== שימושים בסיסיים של תורת השדות – בניות עם סרגל ומחוגה
אני לא אוהבת לצייר, אז אני אוותר.

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
#text(red)[*להשלים*]

= *תרגיל 2*
== טריקים
#text(red)[*להשלים*]

== מסקנות
#text(red)[*להשלים*]

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
#lemma[לכל $p in NN$ ראשוני, הפולינום הציקלוטומי $Phi_p (t) = (t^p-1) / (t-1)$ אי־פריק מעל $QQ$.]
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
#exercise(
  "תרגיל 10.108 בספר",
)[יהי $p in NN$ ראשוני ויהי $f in ZZ[x]$ פולינום מתוקן. נסמן ב־$overline(f) in FF_p [x]$ את הפולינום המתקבל על־ידי פעולת מודלו $p$ על כל מקדם בנפרד.
  + הוכיחו כי אם $f$ פריק, אז גם $overline(f)$ פריק.
  + הוכיחו כי ההפך הוא לא נכון – אם $overline(f)$ פריק, לאו דווקא $f$ פריק.
]
#proof[
  #text(red)[*להשלים*].
]

== סגור אלגברי
פרק 5 ברשומות של מיכאל, מוטיבציה: משוואות מסדר 5 לא ניתן לפתור.
#definition("שדה סגור אלגברי")[שדה $K$ נקרא *שדה סגור אלגברית* אם לכל פולינום לא קבוע מעל $K$ יש שורש ב־$K$.]
#definition(
  "פולינום מתפצל לחלוטין",
)[נגיד $K$ שדה, נגיד כי $f in K[t]$ *פולינום מתפצל לחלוטין* אם הוא מתפרק לגורמים לינאריים. \
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
#definition(
  "מקרה פרטי של שדה פיצול",
)[יהי $f in QQ[x]$. *שדה הפיצול של $f$* הוא תת־השדה המינימלי של $CC$ שמכיל את שורשי $f$.]
#example[השורשים של $f(x) = x^2-2 in QQ[x]$ הם $root(3, 2), omega root(3, 2), omega^2 root(3, 2)$ כאשר $omega = 1 / 2 + sqrt(3 / 4)i$. \
  אז שדה הפיצול של $f$ הוא
  $L = QQ(root(3, 2), omega root(3, 2), omega^2 root(3, 2))$]
#exercise[
  מה הם כל השדות $K$ כך שמתקיים $QQ subset.eq K subset.eq L$?
]
#solution[
  מתקיים $[L : QQ] = [L : QQ(root(3, 2))] dot.op [QQ(root(3, 2)) : QQ]$
]
#text(red)[*להשלים*]

= *הרצאה 8 – 28/04*
== קיום ויחידות סגור אלגברי – המשך
#lemma(
  "bootstrap ללמת ההרמה",
)[בנוסף להנחות של למת ההרמה, נניח כי גם מתקיים $alpha in L$ ו־$beta in E$ הוא השורש של הפולינום המינימלי $f_alpha in K[t]$ ב־$E$. אזי ניתן לבחור את ה־$K$ שיכון $phi : L arrow.r.hook E$ כך שמתקיים $phi(alpha) = beta$.]
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
#definition(
  "איברים צמודים",
)[עבור הרחבת שדות $L slash K$, נגיד כי $alpha, beta in L$ הם *צמודים* אם $f_(alpha slash K) = f_(beta slash K)$.]
#definition(
  "מחלקת צמידות",
)[עבור הרחבת שדות $L slash K$ ו־$alpha in L$. אם $f_alpha$ מתפצל לחלוטין ב־$L$ אז קבוצת כל השורשים שלו (קבוצת כל הצמודים של $alpha$) מסומנת ב־$C_alpha$, *מחלקת צמידות* של $alpha$.]
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
#definition(
  "שורש פשוט",
)[נאמר ש־$alpha = alpha_i in L$ הוא *שורש פשוט (simple root)* של $f$ אם הוא מופיע בידיוק פעם אחת בפיצול.\
  כלומר, $(t-alpha) divides f$ אבל $(t-alpha)^2 divides.not f$.]
#definition(
  "שורש מרובה",
)[נאמר ש־$alpha = alpha_i in L$ הוא *שורש מרובה (multiple root)* של $f$ אם הוא מופיע בפיצול לכל הפחות פעמיים.
  \ כלומר אם $(t-alpha)^2 divides f$.]
#definition(
  "פולינום פריד (ספרבילי",
)[הפולינום $f in K[t]$ נקרא *פריד (ספרבילי, Separable)* אם אין לו שורשים מרובים בשדה ההרחבה $L$ שבו הוא מתפצל.]
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
#definition(
  "הרחבה אלגברית נורמלית",
)[הרחבה אלגברית $L slash K$ נקראת *נורמלית* אם לכל $K$־שיכון $sigma: L arrow.r.hook overline(K)$ אותה התמונה $sigma(L) subset.eq overline(K)$ (לא תלוי בבחירת $overline(K) slash K$).]
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
#example(
  "טרנזטיביות/אי־טרנזטיביות של הרחבות נורמליות",
)[בדומה לכך שנורמליות היא לא תכונה טרנזטיביות בין חבורות, גם מחלקת ההרחבות הנורמליות היא לא שלמה, בכמה דרכים: נניח כי $L slash F slash K$ מגדל הרחבות.
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
#definition(
  $L^(n o r)$,
)[נניח $L slash K$ הרחבה אלגברית, ניקח (תלוי גם ב־$K$), *$L^(n o r)$* שדה פיצול של $P = { f_(alpha slash K) bar alpha in L}$ ($P$ יחידה עד־כדי איזומורפיזם).\
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
#definition(
  $n" שורש יחידה מסדר"$,
)[יהי $n in NN$. *שורש יחידה מסדר $n$* בתוך $overline(K)$ הוא $xi in overline(K)$ שמקיים $xi^n = 1$.]
#definition(
  $n"חבורת שורשי היחידה מסדר ",mu_n"חבורת"$,
)[עבור $K$ שדה ו־$1<=n in NN$ נגדיר $ mu_n (K) = { xi in K bar xi^n = 1} $
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
    #figure(table(
      columns: 2,
      stroke: none,
      table.header(

      )[$2. space Phi_2 (x) = x+1 => deg(Phi_2 (x)) = 1$][$1. space Phi_1 (x) = x-1 => deg(Phi_1 (x)) = 1$],

      [$4. space Phi_4 (x) = x^2+1 => deg(Phi_4 (x)) = 2$], [$3. space Phi_3 (x) = x^2+x+1 => deg(Phi_3 (x)) = 2$],
      [$6. space Phi_6 (x) = x^2-x+1 => deg(Phi_6 (x)) = 2$],
      [$5. space Phi_5 (x) = x^4+x^3+x^2+x+1 => deg(Phi_5 (x)) = 4$],
    ))
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
#definition(
  $n"שורש יחידה פרימיטיבי מסדר "$,
)[יהי $2<=n in NN$. *שורש יחידה פרימיטיבי מסדר $n$* הוא שורש יחידה שלכל $1<=m<n$ מתקיים $xi^m != 1$.]
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
#text(red)[*להשלים*]

= *תרגיל 4*
== טריקים
#text(red)[*להשלים*]
== מסקנות
#text(red)[*להשלים*]

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
  + $abs(Aut_K (L)) = [L:K]$ ובפרט $Aut_K (L) = mu_n$ אם ורק אם $t^n-a$ הוא אי־פריק (זה קורה אם ורק אם $C_(alpha slash K = mu_(n alpha) )$)
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
#remark[במקרה כללי כאשר $n in K^times$ אבל לא בהכרח ש’־$mu_n subset.eq K$ אז $L$ שדה הפיצול של $t^n-a$ הוא $K(xi_n, alpha = a^(1/n))$ ו־$Aut subset.eq mu_n$]

= *תרגול 6 – 14/05*
== שדות קומפוזיטום
#text(red)[*תשלימי*]

= *תרגיל 5*
== טריקים
#text(red)[*תשלימי*]

== מסקנות
#text(red)[*תשלימי*]

= *הרצאה 14 – 19/05*
== הרחבות רדיקליות – הרחבות ארטין־שרייר
פרק 6.4 ברשומות של מיכאל.
#definition("הרחבות ארטין־שרייר")[
  נניח ש־$char(K)=p>0$ אז $mu_p = {1}$ ופולינומים $t^p-a$ לא ספרביליים לחלוטין (יש שורש $1$, אין אוטומורפיזמים, הרחבות אי־פרידות), אז במקרה זה יש לנו תחליף: פולינום מהצורה $t^p-t-a in K[t]$ נקרא *ארטין־שרייר* ועבור כל שורש $alpha$ של פולינום זה, ההרחבה $L = K(alpha) slash K$ נקראת *הרחבת ארטין־שרייר*
]
#exercise[$f(t)=t^p-t-a$ הוא אדטיבי, משמע $f(alpha+beta)-f(alpha)+f(beta)$ (זה לא אמור לקרות לפולינומים מדרגה יותר מ־$1$ במציין $0$).
]
#solution[
  נשים לב שמתקיים בגלל שאנחנו במציין $p$
  $ (alpha+beta)^p = alpha^p + beta^p $
  אז (נתעלם ממהקבוע $a$ כי הוא בכל־מקרה יעלם כשנחסר בין אגפים)
  $ f(alpha+beta) = alpha^p+beta^p-alpha-beta= (alpha^p-alpha)+(beta^p-beta)-f(alpha)+f(beta) $
]
#lemma[
  יהי $K$ שדה ממצויין $0<p, a in K$ ו־$alpha in overline(K)$ המקיים $alpha^p-alpha=a$ (במילים אחרות, $alpha$ הוא שורש של פולינום ארטין־שרייר).\
  אזי $alpha+FF_p = {alpha, alpha+1, dots.h.c, alpha+p-1}$ (זו חבורה אדטיבית ולא כפלית), היא קבוצת השורשים של הפולינום $f(t)=t^p-t-a$ ו־$L=K(alpha) slash K$ שדה פיצול של $f(t)$.\
  $alpha in K$ לא מעניין כי הוא מתפצל לחלוטין, ולכן אם $alpha in.not K$ אזי $p=[L:K]$ ויש איזומורפיזם של חבורות $Aut_K (L) tilde.eq FF_p (=ZZ slash p)$ המקיים $sigma mapsto sigma(alpha)-alpha$
]
#proof[
  עבור כל $i in FF_p$, מהתרגיל, $(alpha+i)^p-(alpha+i)-a = underbrace(alpha^p-alpha-a, =0)+underbrace(i^p-i, =0) = 0$ כאשר $i^p-i=0$ נובע מכך שהפרובניוס קבוע כל $FF_p$ וכן כי כל $alpha+FF_p$ היא קבוצת שורשים של $f(t)$ ו־$a+FF_p subset.eq K(alpha)=L$ ולכן זה שדה פיצול של $f(t)$.\
  נניח $alpha in.not K$ אז ניקח $f_(alpha slash K)$ שדרגתו גדולה מ־$1$ ולכן יש לו עוד שורש $alpha'$, ולכן יש $sigma in Aut_K (L)$ כך שמתקיים $sigma(alpha)=alpha'$ ולכן $sigma(alpha)=alpha+i (i in FF_p^times)$ ו־$sigma^m=alpha+m i$ ואז $FF_p subset ZZ i$ ולכן כל $alpha+i$ צמוד של $alpha slash K$, כלומר $C_alpha = alpha+FF_p$.\
  נקבל אם כך ש־$p=[L:K]=deg f_(alpha slash K)$ והאוטומורפיזמים $sigma mapsto^lambda i \ sigma' mapsto i'$ כך שמתקיים $sigma(alpha)=alpha+i$ אז
  $
    sigma(sigma'(alpha)) = sigma(alpha+i) = sigma(alpha)+sigma(i) = alpha + (i + i') => lambda(sigma sigma') = lambda(sigma)+lambda(sigma')
  $
]
== הרחבות פרידות (ספרביליות)
פרק 7.1 ברשומות של מיכאל.
#definition(
  "דרגה פרידה, דרגה אי־פרידה",
)[עבור הרחבה סופית $L slash K$ נגדיר *דרגה פרידה (ספרבילית)* של $L slash K$ על־ידי $ [L:K]_s = abs(Hom_K (L, K)) $ זה בעצם מספר ה־$K$־שיכונים.
  נגדיר *דרגה אי־פרידה* כ־$[L:K]_i = [L:K]/[L:K]_s$ (בתור התחלה זה ב־$QQ$ אבל בהמשך נראה שזה שלם).]
#lemma[
  נניח ש־$L = K(alpha) slash K$ הרחבה פרמיטיבית, אזי $[L:K]_s = deg_(K, s) (alpha)$ ו־$[L:K]_i = deg_(K, i) (alpha)$.\
  בפרט, $1 = [L:K]_i$ אם $char(K)=0$ ו־$p^n=[L:K]_i$ אם $char(K)=p$.
]
#proof[
  $[L:K]_S = abs(Hom_K (K(alpha), overline(K)))=abs(C_alpha)$ שכן לכל צמוד יש $K$־שיכון יחיד שלוקח את $alpha mapsto alpha'$ ו־$deg_(K,s) (alpha) = abs(C_alpha)$.\
  השיוויון השני נובע מכך שמתקיים $[L:K]=deg_K (alpha)$ ולכן $[L:K]_i = [L:K]/[L:K]_s = (deg_K (alpha))/(deg_(K,s) (alpha)) = deg_(K, i) (alpha)$, ישירות מהגדרה, כאשר
  $ deg_(K,i) (alpha) = 1 <==> char(K)= 0, deg_(K, i) (alpha) = p^n <==> char(K)=p $
]
#lemma("כפליות הדרגות הפרידות והאי־פרידות במגדל הרחבות")[
  לכל מגדל הרחבות סופיות $L slash F slash K$ מתקיים
  + $[L:K]_s = [L:F]_s dot.op [F:K]_s$
  + $[L:K]_i = [L:F]_i dot.op [F:K]_i$
]
#proof[
  נשים לב שמספיק להוכיח את הראשון כי מכפליות הדרגה אוטומטית נקבל את השני.\
  היות ו־$abs(Hom_K (L, overline(K)))=[L:K]_s$, לכל $sigma : L arrow.r.hook overline(K)$ נגדיר צמצום $sigma|_F : F arrow.r.hook overline(K)$ וזה נותן לנו העתקה $ lambda : Hom_K (L, overline(K)) arrow.r Hom_K (F, overline(K)) $
  ניקח $tau in Hom_K (F, overline(K))$ ונחשב את גודל הסיב $lambda^(-1) (tau)$ כקבוצות: נזהה את $F$ עם $sigma(F)$ ואז $overline(K)=overline(K)$ (כי זה סגור אלגברי גם של כל הרחבה) ואז הסיב נהיה איזומורפי ל־$Hom_F (L, overline(K))$.\
  מכאן, בכל סיב של $lambda$ יש בידיוק $[L:F]_s = abs(Hom_F (L, overline(K)))$ איברים ולכן
  $ [L:K]_s = abs(Hom_K (L, overline(K))) = underbrace(abs(Hom_F (L, overline(K))), =[L:F]_s) dot.op [L:F]_s $
]
#corollary[
  לכל הרחבה סופית $L slash K$, $[L:K]_i = 1$ אם $char(K) = 0$ ו־$[L:K]_i in p^NN$ אם $char(K)=p>0$.
]
#proof[
  זה נובע ישירות מכך שכל הרחבה סופית היא מגדל של הרחבות פרימטיביות:
  כי אם $L = K (alpha_1, dots.h.c, alpha_n)$ אז
  $ K = K_0 subset K_1 = K_0 (alpha_1) subset dots.h.c $
  ואז מהלמה לעיל
  $ [L:K]_i = [L : K_(n-1)] dot.op [K_(n-1) : K_(n-2)]_i dot.op dots.h.c dot.op [K_1 : K_0]_i $
  כל אחד מהם או $1$ או $p^n$ ולכן גם המכפלה שלהם.
]
#definition(
  "הרחבה פרידה",
)[הרחבה אלגברית $L slash K$ נקראת *הרחבה פרידה (ספרבילית)* אם לכל $alpha in L$ היינו פריד מעל $L$.\
  נובע ישירות מהגדרה ש־$L slash K$ היא הרחבה פרידה אם ורק אם כל תת־הרחבה סופית היא הרחבה פרידה.]

#theorem[
  עבור הרחבה סופית $L slash K$ הבאים שקולים:
  + $L slash K$ הרחבה פרידה
  + $L = K(alpha_1, dots.h.c alpha_n)$ כך ש־$alpha_1, dots.h.c, alpha_n$ פרידים מעל $K$
  + $[L:K]_s = [L:K]$
  + $[L:K]_i = 1$
]
#proof[
  ראשית, בבירור $1 => 2 => 3 => 4$ ישירות מהגדרה וגם $3<==>4$ מהגדרת הדרגה.\
  $2 => 4$: נגדיר $K_j = K(alpha_1, dots.h.c alpha_j)$ כך ש־$K=K_0$ ו־$L=K_n$
  #text(red)[*תמשיכי!*]

]

= *הרצאה 15 – 20/05*
== הרחבות פרידות (ספרביליות) – המשך
#text(red)[*תשלימי*]

== שדות פרפקטים (Perfect Fields)
#definition(
  "שדה פרפקט",
)[שדה $K$ נקרא *פרפקט* אם $char(K) = 0$ או $char(K) = p$ ו־$K = K^p$ (זה שקול לכך ש־$Fr_p$ הוא אוטומורפיזם ו־$K=K^p$).]
#remark[במציין $p$ יש סדרה $K^(1 / p) tilde.eq K tilde.eq^(Fr) K^p tilde.eq K^p^2$ ולכן $... supset.eq K^(1 / p) supset.eq K supset.eq K^p^2 ...$. ]
#example[כל שדה סופי (כי $Fr$ זה אנדומורפיזם ומשיקולי סדר נקבל שהוא גם על וגם מתקיים $K supset.eq FF_(p^n) = {x bar x^p^n = x}$, נקודות השבת של פרובניוס).]
#counterexample[$K$ במציין $p$, נסתכל על $K[t]$ אבל הוא לא שדה פרפקטי כי $t in.not K^p$.]
#theorem[יהי $K$ שדה אזי
  + $K$ פרפקטי אם ורק אם כל הרחבה אלגברית $L slash K$ היא ספרבילית
  + אם $K$ פרפקטי אזי לכל הרחבה אלגברית $L slash K$, $L$ פרפקטי
]
#proof[
  + אפשר להניח ש־$char(K) = p !=0$ כי בשדה ממציין $0$ כל הרחבה היא ספרבילית.\
    נניח כי $K$ לא פרפקטי ולכן קיים $a in K slash K^p$ ולכן $a^(1 / p) = alpha in overline(K) without K$, נסמן $L = K(alpha)$ ו־$f_(alpha slash K) divides t^p-a = (t^p-a^p)$ ולכן $f_(alpha slash K) = (t-alpha)^m$ עבור $1<m<=p$ (כי $alpha in.not K$) ולכן $alpha$ אי־פריד ונקבל ש־$[L : K]_i = m > 1$ ואפילו $m=p$ אבל אז ההרחבה לא פרידה.\
    בכיוון השני, נניח שקיימת הרחבה $L slash K$ אי־פרידה וזה קורה אם ורק אם קיים $alpha in L$ שהוא אי־פריד מעל $K$ וניקח $K[t] in.rev f = f_(alpha slash K)$ הפולינום המינימלי. לפי משפט קודם, $f = g(t^p^n)$ כאשר $g$ פריד ולכן $n>0$ $f = h^p$ עבור $h=sum_(i=0)^m a_i^(1 / p) t^i$, אבל $f$ אי־פריק ב־$K[t]$ ולכן $a_i^(1 / p) in.not K$ אבל אז $K^p!=K$
  + נניח כי $K$ פרפקטי ו־$L slash K$ אלגברית. אז לכל $F slash L$ אלגברית, $F slash K$ פרידה (פרפקטי => פרידה לפי $(1)$) ולכן $F slash L$ פרידה. אבל זה אומר שכל הרחבה של $L$ היא פרידה ולפי $(1)$ נקבל ש־$L$ פרפקטי.
]
#definition(
  "פרפקטיזציה",
)[לכל שדה $K$ במציין $0 < p$ נגדיר *פרפקטיזציה* $K^(1 / p^infinity) = union.big_(n in NN) K^(1 / p^n)$.]
#definition("p-רנק")[לכל שדה $K$ במציין $0<p$ נגדיר *$[p]$־רנק* על־ידי $[K:K^p]=p^n$0 (אולי $infinity$)]
#exercise[
  + להראות ש־$K^(1 / p^infinity)$ הוא השדה פרפקט המינימלי המכיל את $K$
  + להראות שמתקיים $[K : K^p] = [K^(1 / p) : K] = [K^p^l : K^p^(l+1)]$ לכל $l in ZZ$ (רמז: פרובניוס)
  + להראות שאם $K slash K^p$ סופי אז $[K:K^p]_s = 1$ ולכן $p$־רנק הוא מספר טבעי
]

= *תרגול 7 – 22/05*
== משהו
#text(red)[*תשלימי*]


= *תרגיל 6*
== טריקים
#text(red)[*תשלימי*]

== מסקנות
#text(red)[*תשלימי*]

= *הרצאה 16 – 26/05*
== הרחבות אי־פרידות בטהרה (purely inseparable)

== תורת גלואה

== התאמת גלואה

= *הרצאה 17 – 27/05*
== התאמת גלואה – המשך

= *תרגול 8 – 28/05*
== משהו

= *תרגיל 7*
== טריקים
== מסקנות

= *הרצאה 18 – 03/06*
== המשפט היסודי של תורת גלואה

= *תרגול 9 – 04/06*
== פולינומים סימטריים
#definition(
  "פולינומים סימטריים אלמנטריים",
)[יהי $F$ שדה ו־$L=F(t_1, dots.h.c, t_n)$, יש פעולה $S_n arrow.cw L$ על־ידי $sigma dot.op t_i = t_(sigma(i)), space sigma dot.op P(t_1, dots.h.c, t_n) = P(t_(sigma(1), dots.h.c sigma(n)))$.\
  נסמן ב־$K = L^(S_n)$ את שדה נקודות השבת של הפעולה, ובהרצאה ראינו שמתקיים $Gal(L slash K) tilde.eq S_n$.\
  נגדיר $f(x) = product_(i=1)^n (x-t_i) in L[x]$ ונכתוב $f(x)=x^n-s_1x^(n-1)+s_2x^(n-2) + dots.h.c + (-1)^n s_n$, כאשר $-s_1, s_2, (-1)^n s_n$ הם מקדמי $f$, ומתקיים
  $
    -s_1 = -t_1 - t_2 - dots.h.c - t_n => s_1 = sum_(i=1)^n t_i \
    s_2 = sum_(1<=i<j<=n) t_i t_j, space s_k = sum_(1<=i_1<i_2< dots.h.c i_k<=n) t_i dot.op dot.op dot.op t_k
  $
  הביטויים $s_1, dots.h.c s_n$ נקראים *הפולינומים הסימטריים האלמנטריים (ל־$n$ משתנים)* והם שייכים ל־$L^(S_n)$ (הם רק משנים את סדר הגורמים אבל זה לא משנה את $f$).
]
#proposition[
  $K$ (שדה השבת על $L$ תחת הפעולה של $S_n$ מההגדרה לעיל) מקיים $L=F(s_1, dots.h.c, s_n)$.
]
#proof[
  את ההכלה $supset.eq$ כבר ראינו, עבור הכיוון השני: $L$ הוא שדה פיצול של $f$ מעל $F(s_1, dots.h.c,s_n)$ אז $[L : F(s_1, dots.h.c, s_n)] <=deg(f)! =n!$ ומצד שני, $[L:F(s_1, dots.h.c, s_n)]=underbrace(
    [L:K], =n!\
    "ממשפט ארטין " \
    S_n "וסדר החבורה"
  ) dot.op [K : F(s_1, dots.h.c, s_n)]$
  וביחד לאחר צמצום ב־$n!$ נקבל $[K:F(s_1, dots.h.c, s_n)] <=1$ ולכן בהכרח מתקיים מהגדרת הדרגה $[K:F(s_1, dots.h.c, s_n)]=1$.
]

נרצה להראות ש־$F(s_1, dots.h.c, s_n) tilde.eq F(x_1, dots.h.c, x_n)$ כאשר $x_i mapsto s_i$ (הערה: חשוב איזומורפיזם ולא זהות, הדוגמה הכי טובה היא $F(x^2) subset.eq F(x)$ שהם איזומורפיים עם $y=x^2$ אבל הם לא זהים!), נראה זאת לא ישירות אלא באמצעות טענה על פולינומים.

#theorem(
  "המשפט היסודי של הפולינומים הסימטריים",
)[$F[t_1, dots.h.c t_n]^(S_n) = F[s_1, dots.h.c, s_n]$ ויש איזומורפיזם $F[x_1, dots.h.c x_n] arrow.tilde F[s_1, dots.h.c, s_n]$ כך ש־$P(x_1, dots.h.c, x_n) mapsto P(s_1, dots.h.c s_n)$.]
#remark[זה יוביל אותנו להוכחה הרצוייה עם מעבר לשדה שברים.]
את ההוכחה של המשפט נחלק לשניים: נראה את "יש איזומורפיזם" ואז נראה את המיפוי, לשם כך נצטרך כמה הגדרות וטענות נוספות:\
איברי $F[t_1, dots.h.c t_n]^(S_n)$ נקראים פולינומים סימטריים. בפולינום סימטרי, אם אחד המונומים הוא $t_1^(a_1) dots.h.c t_n^(a_n)$ אז גם $t_(sigma(1))^(a_1) dots.h.c t_(sigma(n))^(a_n)$ הוא מונום של אותו פולינום (זאת אומרת, אם ניקח את $f(t_1, t_2) = t_1 + t_1t_2^2 + dots.h.c$ יהיה סימטרי אם גם $t_2$ וגם $t_2t_1^2$ נמצאים ב־$dots.h.c$).
#definition("הסדר הלקסיגורפי על המונומים")[
  נתון על־ידי $t_1^(a_1) dot.op t_2^(a_2) dot.op dots.h.c dot.op t_n^(a_n) > t_1^(b_1) dot.op t_2^(b_2) dot.op dots.h.c. dot.op t_n^(b_n)$ אם:
  + $a_1 + dots.h.c + a_n > b_1 + dots.h.c b_n$
  + $a_1 + dots.h.c + a_n = b_1 + dots.h.c b_n$ וגם ה־$i$ הראשון כך ש־$a_i !=b_i$ מקיים $a_i > b_i$
]
#proposition("תכונות הסדר הלקסיגורפי על המונומים")[
  + אם $m,_1, m_2$ מונומים וגם $m_1', m_2'$ מונומים כך ש־$m_1>m_2$ וגם $m_1' >m_2'$ אז $m_1m_1' > m_2m_2'$
  + לכל מונום יש מספר סופי של מונומים שקטנים ממנו
]
#corollary("מתכונה 1")[
  אם יש לנו קבוצת פולינומים $f_1, dots.h.c, f_k$ אז המונום המוביל של $f_1 dot.op dots.h.c dot.op f_k$ הוא מכפלת המונומים המובילים. בפרט, המונום המוביל של $s_1^(a_1) dot.op dots.h.c dot.op s_n^(a_n)$ הוא $t_1^(a_1) dot.op (t_1t_2)^(a_2) dot.op (t_1t_2t_3)^(a_3) dot.op dots.h.c =t_1^(a_1+a_2 + dots.h.c + a_n) dot.op t_2^(a_2 + dots.h.c a_n) dot.op dots.h.c dot.op t_n^(a_n)$.\
  לכן למונומים שונים ב־$s_i$־ים, במונחי ה־$t_i$־ים, יש מונומים מובילים שונים.\
  כמסקנה ישירה נקבל שאם $F[x_1, dots.h.c, x_n] in.rev P != 0$ אז $P(s_1, dots.h.c, s_n) !=0$ למה? כי $P$ הוא צירוף לינארי לא טריוויאלי של מונומים ב־$x_i$־ים, כשנציב את ה־$s_i$־ים נקבל צירוף לינארי לא טריוויאלי של מונומים ב־$s_i$־ים, מתוך אלו, כשנשכתב למונחי $t_i$־ים, רק לאחד יש דרגה מקסימלית במונחי$t_i$־ים והוא לא יכול להצטמצם עם שום דבר.\
  זה מביא לנו את "היש איזומורפיזם" מהמשפט היסודי.
]
#example[ניקח $f_1 = t_1 + t_2^2, space f_2 = t_1t_2+t^2_2$. מהגדרת הסדר הלקסיגורפי, $t_2^2$ הוא מונום מוביל של $f_1$ ו־$t_1t_2$ הוא מונום מוביל של $f_2$. \
  אז $f_1f_2 = t_1^2t_2 + t_1t_2^2 + t_1t_2^3+t_2^4$ והמונום המוביל יהיה $t_1t_2^3$.
]
כעת, בהינתן $f$ פולינום סימטרי, אחנו רוצים להראות שקיים $p in F[x_1, dots.h.c x_n]$ כך ש־$f=P(s_1, dots.h.c, s_n)$.\
ניקח את המונום המוביל של $f$: $c dot.op t_1^(a_1) dot.op dots.h.c dot.op t_n^(a_n)$ ומכיוון ש־$f$ סימטרי אז $a_1 >= a_2 >= dots.h.c >= a_n$ (אם $a_i < a_(i+1)$ ל־$i$ כלשהו, אז ניתן להחליף בין $t_i$ לבין $t_(i+1)$ ולקבל מונום גדול יותר, גם הוא ב־$f$). נשים לב שזה בידיוק המונום המוביל של $c dot.op s_1^(a_1-a_2) dot.op s_2^(a_2-a_3) dot.op dots.h.c dot.op s_n^(a_n)$ וזה פולינום סימטרי. \
המונום המוביל של $f-c dot.op s_1^(a_1-a_2) dot.op s_2^(a_2-a_3) dot.op dots.h.c dot.op s_n^(a_n)$ קטן יותר.\
אחרי מספר סופי של צעדים נגיע ל־$0$ (כי יש רק מספר סופי של מונומים שקטנים יותר מהמונום $c dot.op s_1^(a_1-a_2) dot.op s_2^(a_2-a_3) dot.op dots.h.c dot.op s_n^(a_n)$ וכל פעם אנחנו מקטינים ממש את המונום המוביל), ולכן כשנגיע ל־$0$ זה אומר שהבענו את $f$ כצירוף לינארי של מונומים ב־$s_1, dots.h.c s_n$.
#example[
  ניקח $f = t_1^2+t_2^2$ ומהגדרת הסדר הלקסיגורפי נקבל ש־$t_1^2$ הוא מונום מוביל, ונכתוב את $f$ כביטוי בפופלנומים סימטריים אלמנטריים.\
  בצעד הראשון, ניקח את $s_1^2 = (t_1+t_2)^2=t_1^2+2t_1t_2+t_2^2$ ואז $f-s_1^2=t_1^2+t_2^2-t_1^2-2t_1t_2-t_2^2 = -2t_1t_2=P_1$.\
  בצעד השני ניקח אז את $P_1-2s_2$ כאשר $2s_2=2 sum_(1<=i<j<=2) t_i t_j = 2t_1t_2$ ואז $P_1-2s_2 = 2t_1t_2 - 2s_2 = 0$.\
  ולכן $f=s_1^2-2s_2$.
]

== Norm, Trace
#definition("עקבה ונורמה של הרחבה סופית")[
  תהיי $L slash K$ הרכחבה סופית ו־$alpha in L$ ונגדיר העתקה $M_alpha : L arrow.r L$ אופרטור $K$־לינארי (ההרחבה סופית) על־ידי $M_alpha (x) = alpha dot.op x$.\
  נגדיר את *העקבה* על־ידי $Tr_(L slash K) (alpha) = tr(M_alpha)$ ואת *הנורמה* נגדיר על־ידי $N_(L slash K) (alpha) = det(M_alpha)$.
]
#example[
  $K=QQ, L = QQ(sqrt(7))$. בסיס ל־$L slash K$ הוא למשל $cal(B)=(b_1 = 1, b_2 = sqrt(7))$ ועבור $alpha = x+y sqrt(7)$ נקבל ש־$M_alpha$ ביחס לבסיס $cal(B)$ היא $[M_alpha]_(cal(B)) = mat(delim: "[", x, 7y; y, x)$ כאשר $alpha b_2=7y+x sqrt(7)$ ואז
  $ Tr_(L slash K) (alpha) = 2x, N_(L slash K) (alpha) = det mat(delim: "[", x, 7y; y, x) = x^2-7y^2 $
]
#proposition[
  אם $alpha_1, dots.h.c alpha_n$ הם הצמודים של $alpha$ אזי
  $
    Tr_(L slash K) (alpha) = [L:K]/d sum_(i=1)^d alpha_i, space N_(L slash K) (alpha) = (product_(i=1)^d alpha_i)^([L:K]/d)
  $
]
#proof[בתרגיל בית $9$.]

= *תרגיל 8*
== טריקים
== מסקנות

= *שעת קבלה של גבע – 05/06*
== מסקנות

= *הרצאה 19 – 09/06*
== עוד עובדות על התאמת גלואה

== שימושים של תורת גלואה

= *הרצאה 20 – 10/06*
== בניות של מצולעים משוכללים

= *תרגול 10 – 11/06*
== הדיסקרמיננטה
לאורך התרגול, $F$ שדה, $char(F)!=2,f in F[x]$ ו־$L$ שדה פיצול של $f$.\
ב־$L$ מתקיים $f(x)=alpha product_(i=1)^n (x-alpha_i)$ כאשר $alpha$ הוא המקדם המוביל ו־$alpha_i$ שורשים.\
נניח לבנתיים ש־$f$ אי־פריק ומתוקן, נסמן $G = Gal(L slash F)$ וראינו ש־$G$ משתכנת ב־$S_n$ על השורשים.\
נסמן $sigma in G$ את $sigma(alpha_i)=alpha_(sigma(i))$ ונגדיר $L in.rev R = product_(1<=i<j<=n) (alpha_i - alpha_j)$.
#lemma[$sigma(R)= plus.minus R$ לכל $sigma in G$ ו־$sigma(R)=R$ אם ורק אם $sigma in A_n$.]
#proof[מתקיים $ sigma(R)=product_(1<=i<j<=n) (alpha_sigma(i) - alpha_sigma(j)) $ שכן $sigma$ הוא אוטומורפיזם ולכן מכבד כפל.\
  יש כאן את אותם הגורמים כמו ב־$R$ בפרט אולי לסימן ולכן $sigma(R)=plus.minus R$, כאשר הסימן הוא $(-1)^ell$ כאשר $ ell=abs({(i,j) bar i<j and sigma(i) > sigma(j)}) $ וידוע ש־$op("sgn")(sigma) = (-1)^ell$.]

#definition(
  "הדיסקרמיננטה",
)[נסמן ב־$D_f = R^2$ את *הדיסקרמיננטה של $f$* ונשים לב ש־$sigma(D_f)=D_f$ לכל $sigma in G$ ולכן $D_f in L^G=F$.\
  במילים אחרות, $D_f$ אינווריאנטי תחת כל אוטומורפיז
  $ sigma(D_f)=sigma(R^2) = sigma(R)^2 = (plus.minus R)^2=R^2 = D_f =>_(forall sigma) D_f in L^G =_"מהתאמת גלואה" F $
]
#corollary[
  $G subset.eq A_n$ אם ורק אם $D_f$ היא ריבוע ב־$F$ (כלומר, יש לה שורש ב־$F$).
]
#proof[
  $<==$ אם $G subset.eq A_n$ אז $sigma(R)=R$ לכל $sigma in G$ ולכן $R in L^G=F$ ולכן $R in F$ הוא שורש ריבועי של $D_f$.\
  $==>$ אם ל־$D_f$ יש שורש ב־$F$ אז $R in F = L^G$ אז $sigma(R)=R$ לכל $sigma in G$ ולכן $sigma in A_n$ לכל $sigma in G$.
]
#remark[זו תחת ההנחה ש־$f$ פולינום מתוקן ו־$char F !=2$. אם הוא לא היה מתוקן, היה אפשר לחלק בגורם המוביל ולקבל את אותה ההרחבה.]
#example[
  $ f = (x-alpha_1)(x-alpha_2) $
  ולכן $ R = alpha_1-alpha_2, space R^2=(alpha_1-alpha_2)^2=alpha_1^2+alpha_2^2-2alpha_1alpha_2 $
  אז נוכל לכתוב
  $ f = x^2-(alpha_1+alpha_2)x-2alpha_1alpha_2 colon.eq x^2+b x+c $
  כאשר
  $ c = -2alpha_1alpha_2, b = -(alpha_1+alpha_2) $
  ולכן
  $ D_f = R^2 = (b^2-2c)-2c = b^2-4c $
  אז אם $D_f$ כן ריבוע ב־$F$ אז $G subset.eq A_2$ אבל $A_2 = {e}$ ולכן $f$ מתפצל כבר ב־$F$ וקיבלנו קריטריון חדש לפריקות או אי־פריקות לפולינום מתוקן מדרגה $2$.
]
#corollary[$F(sqrt(D_f)) subset.eq L$ אז $Gal(L slash F(sqrt(D_f))) = G inter A_n$.]
#proof[ישירות מ התאמת גלואה.]
כל זה היה תתחת ההנחה ש־$f$ מתוקן והוכחנו תכונות של $D_f$ אבל אין לנו ביטוי יפה עבורו, אז המטרה שלנו זה להביע את $D_f$ כפולינום במקדמי $f$.
#definition(
  "הרזולטנטה",
)[יהיו $f,g in F[x]$ הנתונים על־ידי $f=a_0x^n+a_1x^(n-1)+dots.h.c+ a_n, space g=b_0x^n+b_1x^(n-1)+dots.h.c+ b_n$.\
  *הרזולטנטה* של $f,g$ היא המטריצה הריבועית מסדר $m+n times m+n$ (דרגות $f,g$ בהתאמה) הנתונה על־ידי
  $
    Res(f, g) = det
    mat(
      delim: "[", a_0, a_1, dots.h.c, a_n, 0, dots.h.c, 0;
      0, a_0, a_1, dots.h.c, a_n, dots.h.c, 0;
      dots.v, dots.down, dots.down, dots.down, dots.down, dots.down, dots.v;
      0, dots.h.c, 0, a_0, a_1, dots.h.c, a_n;
      b_0, b_1, dots.h.c, dots.h.c, b_m, dots.h.c, 0;
      dots.v, dots.down, dots.down, dots.down, dots.down, dots.down, dots.v;
      0, dots.h.c, b_0, b_1, dots.h.c, dots.h.c, b_m
    )
  $]
#lemma[$Res(f, g)=0$ אם ורק אם ל־$f,g$ יש גורם משותף מדרגה חיובית.]
#proof[
  נסמן $f=a_0x^n + dots.h.c + a_n, space g = b_0x^m + dots.h.c + b_m$, אז
  $
    Res(f, g)=det
    mat(
      delim: "[", a_0, a_1, dots.h.c, a_n, 0, dots.h.c, 0;
      0, a_0, a_1, dots.h.c, a_n, dots.h.c, 0;
      dots.v, dots.down, dots.down, dots.down, dots.down, dots.down, dots.v;
      0, dots.h.c, 0, a_0, a_1, dots.h.c, a_n;
      b_0, b_1, dots.h.c, dots.h.c, b_m, dots.h.c, 0;
      dots.v, dots.down, dots.down, dots.down, dots.down, dots.down, dots.v;
      0, dots.h.c, b_0, b_1, dots.h.c, dots.h.c, b_m
    )
  $
  כמקודם זו מטריצה $m+n times m+n$, כאשר $(a_0, a_1, dots.h.c, a_n, 0 dots.h.c, 0)$ הוא וקטור המקדמים של $x^(n-1)f$.\
  וקטור המקדמים של $x^i f=0 dot.op x^(m+n) + dots.h.c +a_0x^(n+i)+ dots.h.c + a_n x^i + 0$ לכל $0<i<=m$ הוא $(0_((m+n)), dots.h.c, 0_((n+i+1)), a_0, dots.h.c, a_n, 0, dots.h.c, 0)$ כאשר בסוגריים זה האינדקס ובאותו אופן גם עבור $g$ בהצבה של $b$ במקום $a$ ו־$m+i+1$ במקום$n+i+1$.\
  $Res(f, g)=0$ אם ורק אם יש תלות לינארית בין השורות וזה קורה אם ורק אם יש תלות בין הפולינומים $ x^(m-1) dot.op f, x^(m-2) dot.op f, dots.h.c, f, x^(n-1) dot.op g, x^(n-2) dot.op g, dots.h.c, g $
  כלומר
  $
    0 = sum_(i=0)^(m-1) c_i x^i f + sum_(i=0)^(n-1) d_i x^i g=(sum_(i=0)^(m-1) c_i x^i)f+(sum_(i=0)^(n-1) d_i x^i)g => (sum_(i=0)^(m-1) c_i x^i)f=(-sum_(i=0)^(n-1) d_i x^i)g
  $
  זו כפולה משותפת של $f,g$ מדרגה קטנה ממש מ־$m+n$ והיא שונה מ־$0$ אם ורק אם התלות לא טריוויאלית.\
  יש כפולה כזאת אם ורק אם ל־$f,g$יש גורם משותף מדרגה חיובית: אחרת, הם זרים, וכפולה משותפת חייבת להיות מכפלה של כל הגורמים האי־פריקים של שניהם ובפרט מדרגה של לפחות $m+n$.
]
#example[
  $Res(x+8, x^2+1)=0, space Res(x+1, 2x+2)=det mat(delim: "[", 1, 1; 2, 2)=0$
]
#theorem[אם $f = a_0 product_(i=1)^n (x-alpha_i)$ ו־$g=b_0 product_(i=1)^m (x-beta_i)$ בשדה פיצול כלשהו, אז
  $
    Res(f, g)=a_0^m b_0^n product_(i,j)(alpha_i-beta_j)= (-1)^(m n) b_0^n product_(i=1)^m f(beta_i)=a_0^m product_(i=1)^n g(alpha_i)
  $]
#proof[טכני מאוד.]
#remark("תזכורת – נגזרת פורמלית וכלל לופיטל לנגזרת פורמלית")[\
  עבור $f =a_0x^n + a_1x^(n-1) + dots.h.c + a_n$ מתקיים
  $f'= n a_0x^n(n-1)+(n-1)a_1x^(n-2) + dots.h.c + a_(n-1)$ כלל לופיטל לנגזרת פורמלית אומר שמתקיים $f'(alpha_i)=product_(j!=i) (alpha_i-alpha_j)$.
]
#definition[יהי $f = a_0x^n + dots.h.c + a_n$ ונסמן $n'=deg(f')$, אז הדיסקרמיננטה של $f$ היא $ (-1)^((n(n-1)) / 2) dot.op a_0^(n-n'-2) dot.op Res(f, f') colon.eq D_f $]
#lemma[
  $D_f = a_0^(2n-2) dot.op product_(1<=i<j<=n) (alpha_i-alpha_j).$ ובפרט, גם ביחס להגדרה לעיל ו־$D_f$ הוא ריבוע ב־$F$ אם ורק אם $Gal(L slash F) subset.eq A_n$.
]
#proof[בתרגיל בית $10$.]
= *תרגיל 9*
== טריקים
== מסקנות

= *הרצאה 21 – 16/06*
== סכומי גאוס
#remark[יש קצת מלחמה ולכן ההרצאות מכאן והלאה עוברות בזום ולא בצורה להיט. אז רוב התוכן מפה והלאה הוא תרגום של הרשומות של מיכאל והוספות מהספר/גוגל.]
פרק 8.3 ברשומות של מיכאל.\

יהי $p$ ראשוני ונבחן את $L=QQ(xi_p)$, ראינו שמתקיים $G = Gal(L slash QQ) tilde.eq (ZZ slash p ZZ)^times tilde.eq ZZ slash (p-1)ZZ colon.eq G^(a d)$.\
ראינו שב־$G$ יש תת־חבורה יחידה $H$ מאינדקס $2$, שסימנו אותה $H=G^2$ וזו ההרחבה של כל הריבועים ב־$G$.

#corollary[לכל $d divides p-1$ יש תת־חבורה יחידה מסדר $d$ והיא $G^((p-1) / d)$.]
#corollary[תת־חבורה מאינדקס $2$ היא $G^2 <= G$ עבור $p!=2$.]
#example[
  עבור $p=5$ נקבל $G={1,2,3,4}, G^2 = {1,4}$.
]

#definition("סימן לז'נדר מודלו p")[
  יהי $p$ מספר ראשוני ($p!=2$) ו־$a in ZZ$, אז
  $
    (a / p) = mycases(
      0, a eq.triple 0 (mod p),
      1, a eq.triple.not 0 (mod p) and a eq.triple x^2 (mod p) (p"והוא שארית ריבועית מודלו " p"זר ל־"a ),
      -1, a eq.triple.not 0 (mod p) and a eq.triple.not x^2 (mod p) (p"ואינו שארית ריבועית מודלו " p"זר ל־"a )
    )
  $
  ובסימונים של מיכאל
  $ (a / p) = mycases(1, a in G^2, -1, a in G without G^2, 0, (p divides.not a )" אחרת") $
  זה כמובן הומומורפיזם $G mapsto G slash H = {plus.minus 1}$, בעצם $a mapsto a H$ והגרעין הוא בידיוק $G^2$.
]

#example[עבור $p=5$ מתקיים
  #figure(table(
    stroke: (x, y) => if y == 0 {
      (bottom: 0.7pt + black)
    },
    columns: 2,
    table.header()[$(a / p)$][a],
    [$0$], [$0$],
    [$1$], [$1$],
    [$-1$], [$2$],
    [$-1$], [$3$],
    [$1$], [$4$],
    [$0$], [$5$],
  ))]

#exercise[
  ב־$F_p$ להראות שמתקיים
  + $(a / p) = a^((p-1) / 2)$
  + $((a b) / p) = (a / p)(b / p)$
]
#proof[
  + זה מבחן אויילר.
  + נובע ישירות מסעיף א' וחוקי חזקות
  $ ((a b) / p) = (a b)^((p-1) / 2) = a^((p-1) / 2)b^((p-1) / 2) = (a / p)(b / p) $
]

#definition("סכום גאוס")[ $S_p = sum_(a=1)^(p-1) (a / p) xi_p^a$.]
#theorem[יהי $2<p$ ראשוני ו־$S = S_p$.\
  אם $p = 4n+1$ אז $S^2 = p$ ו־$QQ(sqrt(p))$ היא תת־ההרחבה הריבועיות היחידה של $QQ(xi_p)$.\
  אם $p = 4n + 3$ אז $S^2 = -p$ ו־$QQ(sqrt(-p))$ היא תת־ההרחבה הריבועית היחידה של $QQ(xi_p)$.
]
#proof[
  מההגדרה של $S_p$, מספיק שנחשב את
  $
    (star) space S^2 = (sum_(a=1)^(p-1)(a / p)xi_p^a)^2 = sum_(a=1)^(p-1) sum_(b=1)^(p-1) (a / p)(b / p) xi^(a+b) = sum_(a=0)^(p-1) c_a xi_p^a = c_0 + sum_(a=1)^(p-1) c_a xi_p^a
  $
  הסדר סכימה עבר להיות מ־$0$ כי $(0 / p)=0$ לכל $p$ שנבחר ונשים לב ש־$S^2 in QQ$.\
  _ננמק למה $S^2 in QQ$:_ לכל $k in (ZZ slash p ZZ)^times$ (בגלל התאמת גלואה) ונסתכל על האוטומורפיזם $sigma_k : xi mapsto xi^k$, נחשב
  $
    sigma_k (S_p) = sum_(a=1)^(p-1) (a / p) xi^(a k) =_(b = a k mod p) sum_(b=1)^(p-1) ((b k^(-1)) / p) xi^b = (k^(-1) / p) sum_(b=1)^(p-1) (b / p) xi^b =_(k^(-1) eq.triple k^(p-2) mod p \
    "ומהכפליות מהתרגיל") (k / p) sum_(b=1)^(p-1) (b / p) xi^b = (k / p) S_p
  $
  ולכן
  $ sigma_k (S_p^2) = (sigma_k(S_p))^2 = ((k / p) S_k)^2 = (k / p)^2 S_p^2 =_((k / p) in {plus.minus 1}) S_p^2 $
  ולכן כל $sigma$ בחבורת גלואה משמרת את $S_p^2$ ולכן $S_p^2 in QQ$.\
  נחזור להוכחה שלנו: ב־$S$ יש לנו $(p-1) / 2$ פעמים את $1$ ו־$(p-1) / 2$ פעמים את $-1$ ולכן כאשר נפתח סוגריים נקבל $sum_(a=0)^(p-1) c_a = 0$.\
  נרצה לחשב את $c_0$, שהוא נתון על־ידי (פשוט מהגדרה/פתיחת סוגריים)
  $
    c_0 = sum_(a+b=0 mod p\
    1<=a, b<=p-1) (a / p)(b / p)
  $
  במילים אחרות, $ a+b eq.triple 0 (mod p) <==> b eq.triple -a (mod p) $
  אז מכך ש־$b in {1, dots.h.c p-1}$ נקבל ש־$-a in {1, dots.h.c p-1}$ גם־כן, ואז
  $
    c_0 & = sum_(a=1)^(p-1) (a / p)(-a / p) =_("מהכפליות מהתרגיל") sum_(a=1)^(p-1) (a / p)(a / p) (-1 / p)               \
        & = sum_(a=1)^(p-1) (a / p)^2(-1 / p) =_((a / p)^2 = 1 forall x eq.triple.not 0 (mod p)) sum_(a=1)^(p-1)(-1 / p) \
        & = (p-1)((-1) / p) =_("מהתרגיל") (p-1)(-1)^((p-1) / 2)
  $
  ולכן אם $p eq.triple 1 mod 4$ אז $(-1 / p)=1$ ואם $p eq.triple 3 mod 4$ אז $(-1 / p) = -1$.\
  _למה $p mod 4$?_ כי זו פשוט דרך מהירה לקבל האם החזקה תניב $(-1)$ או $1$, נחלק למקרים:
  + אם $p eq.triple 1 mod 4$ אז $p = 4n+1$ ואז $(p-1) / 2=2n$ ואז יש לנו חזקה זוגית ונקבל $(-1)^(2n) = 1$
  + אם $p eq.triple 3 mod 4$ אז $p=4n+3$ ואז $(p-1) / 2=2n+1$ ואז יש לנו חזקה אי־זוגית ונקבל $(-1)^(2n+1)=(-1)$

  עכשיו בחזרה ל־$(star)$, ראינו כי $c_0 in QQ$ וגם $S^2 in QQ$ ולכן $c_0 + (p-1)c_1 = 0$ (כי $c_1 = dots.h.c c_(p-1)$) ולכן $ -c_1 = c_0 / (p-1) = (p-1)(((-1) / p)) / (p-1) = ((-1) / p) $
  ובסך־הכל
  $ S^2 = c_0 + sum_(a=1)^(p-1) = (p-1)((-1) / p)+((-1) / p) =p((-1) / p) = p(-1)^((p-1) / 2) $
]
#remark[ההוכחה לעיל אומרת גם ש־$QQ subset.eq QQ(sqrt(-p)) subset.eq QQ(xi_p), QQ subset.eq QQ(sqrt(p)) subset.eq QQ(xi_p)$
  הן תתי־ההרחבות שראינו בהקדמה.]
#remark[גאוס הוכיח שאם $xi = e^((2 pi i) / p)$ אזי $S_p = sqrt(p)$ אם $p = 4n+1$ ו־$S_p = sqrt(p)i = sqrt(-p)$ כאשר $p=4n+3$.]
#example[
  נוכיח כי $(2 / p)=(-1)^((p^2-1) / 8)$.\
  הטריק הוא לבטא את $sqrt(2)$ באמצעות $xi_8$: נחשב כמה תתי־הרחבות ריבועיות יש ב־$QQ(xi_8 slash QQ)$: מתקיים $ G = Gal(xi_8 slash QQ) = (ZZ slash 8 ZZ)^times = {1,3,5,7} tilde.eq (ZZ slash 2 ZZ)^2 $
  ולכן יש לנו $3$ תתי־הרחבות ריבועיות (כי יש $3$ תתי־חבורות מאינדקס $2$): נשים לב שמתקיים
  $
    xi_8^2 = (e^((2pi i) / 8))^2=e^((2pi i) / 8+(2pi i) / 8)=e^((4pi i) / 8)=e^((pi i) / 2) = i \
    xi_8 + xi_8^(-1) = sqrt(2) \
    xi_8 =e^((2 pi i) / 8) = cos(pi / 4)+i sin(pi / 4) = sqrt(2) / 2(1+i)
  $
  ולכן ההרחבות המדוברות הן $QQ(sqrt(2)), QQ(sqrt(-2)), QQ(i)$.\
  לכן אם $p eq.triple plus.minus 1 mod 8$ אז $8 divides p^2-1$ ולכן ב־$FF_(p^2)^times$ (ציקלית!) קיים איבר $xi_8$ מסדר $8$ ולכן $FF_(p^2) (xi_8) subset.eq FF_(p^2)$ וגם $ plus.minus sqrt(2) = (sqrt(2))^p = xi_8^p + xi_8^(-p) $
]
== הרחבות ציקליות ופתירות ברדיקלים
פרק 8.4 ברשומות של מיכאל.\
נרצה לחקור הרחבות שניתן לבטא בעזרת $root(n, a)$ (ושורשים של ארטין־שרייר במציין $p$).
#definition[במציין $0$ נגדיר $root(infinity, K)$ כשדה הקטן ביותר המכיל את $K$ וסגור לשורש $root(n, dot.op)$ כלשהו.]
#remark[נראה כי $root(infinity, QQ) subset.neq QQ$.]
#definition(
  "הרחבה ציקלית",
)[הרחבת שדות $L slash K$ נקראת *ציקלית* אם זו הרחבת גלואה סופית ־$G=Gal(L slash K)$ היא ציקלית.]
#theorem[תהיי $L slash K$ הרחבת שדות מדרגה $n$ ונניח כי $mu_n subset K$ ו־$n in K^times$.\
  אזי $L slash K$ היא הרחבה ציקלית מדרגה $n$ אם ורק אם $L = K(alpha)$ עבור $alpha=a^(1 / n)$ עבור $a in K$.]
#proof[
  $==>$ נניח כי $L = K(a^(1 / n))$, מלמה שראינו, $L slash K$ היא הרחבת גלואה ו־$G = Gal(L slash K)$ משוכן לתוך $mu_n$ (שכן צמודים של $a^(1 / n)$ הם מהצורה $a^(1 / n) xi^i$) ולכן $G = mu_n$ היא ציקלית (כי $K(a^(1 / n) slash L$ פרידה ונורמלית ומשיוויון דרגות נקבל את השיוויון).\
  $<==$ נניח כי $L slash K$ הרחבת שדות ציקלית ולכן $Gal(L slash K) tilde.eq ZZ slash n ZZ$ ויהי $sigma$ יוצר של ההרחבה, עלינו למצוא יוצר $alpha=a^(1 / n)$ של $L slash K$.\
  נסתכל על $sigma$ כאופרטור לינארי $sigma : L arrow.r L$: מכך ש־$sigma^n = 1$, הפולינום המינימלי $f_sigma (t) divides t^n-1$ ומההנחה $t^n-1$ ספרבילי ומתפרק לחלוטין\
  ב־$K$ (מתקיים $t^n-1 = product_(xi_i in mu_n) (t-xi_i)$).\
  מלינארית (כי הפולינום המינימלי מתפרק לגורמים לינאריים שונים) אנחנו יודעים ש־$sigma$ לכסין מעל $K$, ולכן קיים בסיס $alpha_1, dots.h.c alpha_n$ כך ש־$sigma(alpha_i)=xi_i alpha_i$ עבור $xi_i in mu_n$.\
  בטח שכל $xi_i$ מייצרים את $mu_n$: הם יוצרים תת־חבורה $mu_m$ כך ש־$sigma^m=1$ ולכן $m=n$.\
  ולכן אם $alpha = alpha_1 dot.op dots.h.c dot.op alpha_i$ אז $sigma(alpha)=underbrace((xi_1 dot.op dots.h.c dot.op xi_n), "יוצר " xi in mu_n)alpha$.\
  מכאן נקבל $sigma^j alpha = xi^j alpha !=alpha$ עבור $0<j<n$ ולכן ל־$alpha$ יש $n$ צמודים שונים ולכן $L = K(alpha)$ מדרגה $n$ ובנוסף $sigma(alpha^n)=xi^n alpha^n=alpha^n$ ולכן $alpha^n in L^(Gal(L slash K))=_("ארטין") K$.
]

= *הרצאה 22 – 17/06*
== הרחבות ציקליות ופתירות ברדיקלים – המשך
#remark[
  אם $p = char(K)$ אז ההרחבות המעניינות מדרגה $p$ הן ארטין־שרייר שזה בעצם $L = K(alpha)$ כאשר $alpha^p-alpha=a$, $alpha = scr(p)$ (זה שורש ארטין־שרייר, שורש מסדר $p$ שהוא פריד וברגע שמצאנו אחד מצאנו את כולם) ונוכיח שאלו כל ההרחבות הציקליות מדרגה $p$.\
  ב־$L = K(a^(1 / n))$, זה $mu_n$ כפול שורש בודד $a^(1 / n) = mu_n dot.op alpha$ וחבורת גלואה היא $mu_n$.\
  ב־$L = K(alpha)$ זה $alpha+Fr_p$ עבור $alpha = scr(a)$ וחבורת הגלואה היא $FF_p$.
]
#theorem[אם $char(K)=p$ ו־$[L:K]=p$ אז $L slash K$ ציקלית (גלואה) אם ורק אם $L = K(alpha)$ כאשר $alpha^p-alpha-a=0$ לכל $a in K$, זאת אומרת $L = K(scr(a))$ (זאת־אומרת אם $L slash K$ היא הרחבת ארטין־שרייר).]
#proof[
  $==>$ אם $L = K(alpha)$ אז $Aut(L slash K)=(FF_p, +)$ גלואה כי יש שם $p$ אוטומורפיזמים (ראינו כשדיברנו על הרחבות ארטין־שרייר).
  $<==$ נניח כי $L slash K$ ציקלית וניקח $0!=sigma in Aut(L slash K) = ZZ slash p ZZ$ שהוא כמובן יוצר.\
  נתבונן איך $sigma$ פועל $sigma:L arrow.r L$, מכך שהוא יוצר מתקיים $sigma^p = Id$ ולכן הפולינום האופייני של $sigma$ מחלק את $t^p-1$ $f_sigma divides underbrace(t^p-1, =(t-1)^p)$.\
  לכן $sigma - Id$ נילפוטנטי ולא $0$ וקיים $beta in L$ כך ש־$sigma(beta)!=beta$.\
  נסמן $b=sigma(beta)-beta!=0$ אבל $sigma(b)-b=0$ ולכן $b in L^sigma = L^(angle.l sigma angle.r)=L^G = K$, כלומר $b in K$ ($beta in.not K$ כי $sigma(beta)!=beta$).\
  ניקח $alpha = beta / b$ ואז $sigma(alpha)-alpha=(sigma(beta)-beta) / b=1$.\
  לסיכום, הפעולה של $G$ על ${alpha mapsto^sigma alpha, 1 mapsto^sigma alpha+2 dots.h.c}$, כלומר זו קבוצת הצמודים של $alpha$ (הם הצמודים על המסלול $sigma(alpha)=alpha+1$ כמו ארטין־שרייר).\
  ואז הפולינום המינימלי
  $ f_alpha = (t-alpha) dot.op (t-alpha-1) dot.op dots.h.c dot.op (t-alpha-p+1) $
  נסמן $a=alpha^p-p$ ונטען ש־$f_alpha=t^p-t-a$: נראה לשכל $i in FF_p$ מתקיים $f(alpha+i)=(alpha+i)^p-(alpha+i)-a=0$.\
  מתקיים
  $ (alpha+i)^p = alpha^p + i^p =_(i^p =i (i in FF_p"כי ")) alpha^p +i $
  ולכן נקבל
  $ f(alpha+i)=(alpha+i)^p-(alpha+i)=alpha^p+i-alpha-i-a=alpha-alpha-a=_(a=alpha^p-alpha) 0 $
  ולכן לכל $i in FF_p$, $(alpha+i)$ שורש של $t^p-t-a$.\
  השורשים של $t^p-t-a$ זה כל $alpha_i$ כך ש־$alpha_i^p-alpha=a$, זו בידיוק הקבוצה ${alpha, alpha+1, dots.h.c, alpha+i-1}$ ולכן יש $p$ שורשים שונים \
  ואז $f_alpha = t^p-t-a$.\
  נסיק $a in K$: $ sigma(a)=sigma(alpha^p-alpha)=(sigma(alpha))^p-sigma(alpha)=(alpha+1)^p-(alpha+1)=alpha^p-alpha=a in K $
  ובזאת סיימנו כי זו הרחבת ארטין־שרייר.
]
#remark[מספיק להגיד בהוכחה לעיל גלואה ולא ציקלית כי מהתאמת גלואה בכל־מקרה חבורת גלואה היא מסדר $p$ ראשוני וזה יהיה ציקלית כך או כך.]
#remark[יש משפט שמתאר הרחבות ציקליות מסדר $p^n$ אבל הוא הרבה יותר כבד.]

כעת, נרצה לחקור הרחבות פתירות (גלואה פתירות) והרחבות פתירות ברדיקלים ובעצם נוכיח שזה אותו הדבר.

#definition(
  "מגדל רדיקלי",
)[הרחבה סופית $L slash K$ נקראת *מגדל רדיקלי* אם היא מתפצלת למגדל $L=K_n slash K_(n-1) slash dots.h.c slash K_0=K$\
  כך ש־$K_(i+1) = K_i (alpha)$ עבור $alpha$ שורש יחידה ($omega_n=alpha$) של $a^(1 / n)$ עבור $n in K^times$ או $alpha=scr(P)(a)$ שורש ארטין־שרייר.
]

#definition("סגור רדיקלי")[$root(infinity, K) = union.big_(L_i slash K "מגדל רדיקלי")L_i$]
#exercise[
  $root(infinity, K)$ הוא השדה הקטן ביותר שמכיל את $K$ וסגור להוצאת שורש והוצאת שורש ארטין־שרייר ($root(n, dot.op)$).
]
#definition("הרחבה רדיקלית")[הרחבה אלגברית $L slash K$ נקראת *רדיקלית* אם $L subset.eq root(infinity, K)$.\
  כמובן, אם $L slash K$ סופית אז $L slash K$ רדיקלית אם רק אם $L subset.eq F$ כך ש־$F slash K$ מגדל רדיקלי (כי איחוד של כל המגדלים זה הסגור הרדיקלי)]
#remark[יכול להיות ש־$L slash K$ לא מגדל בעצמה; למשל אם $L slash K$ הרחבה ריבועית ולא גלואה ו־$mu_3 subset.eq K$ ו־$char(K)!=3$.
]
#exercise[
  אם $K subset.eq L subset.eq F$ מגדל ריבועי אז $L slash K$ מגדל ריבועי (גלואה וחבורת $p$).\
  רמז: צריך לקחת סגור גלואה שזה עדיין מגדל ריבועי ובסגור גלואה להשתמש (בתרגום משדות לחבורות) בטענה שאם יש לי $H <= G$ חבורת $p$ אז קיימת שרשרת $H_1 subset H_2 subset dots.h.c subset G$ מאינדקס $p$.
]

= *תרגול 11 – 18/06*
== משהו

= *תרגיל 10*
== טריקים
== מסקנות
