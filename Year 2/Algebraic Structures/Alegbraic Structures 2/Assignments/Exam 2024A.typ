#import "../../../../src/article.typ": *
#show: article.with(title: [ מבנים אלגבריים 2, 80446 --- פתרון מבחן מועד א' 2024 ], signature: [#align(center)[#image(
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
תהיי $E slash F$ הרחבת שדות. נוכיח כי $E slash F$ הרחבה סופית אם ורק אם $E slash F$ הרחבה נוצרת סופית ואלגברית.

#proof[
  $<==$ נניח כי $E slash F$ הרחבת שדות סופית ונוכיח כי היא נוצרת סופית ואלגברית.\
  מהסופיות ברור שמתקיים (מהגדרה) $ [F(alpha) : F]< infinity <==> F "אלגברי מעל" alpha $
  ולכן זו הרחבה אלגברית (בפרט לכל $alpha in E$ מתקיים $[F(alpha):F]<=[E:F]$) ולכן $[E:F]=n$ אז $alpha_1, dots.h.c, alpha_n$ זה בסיס של $E$ מעל $F$ ולכן $E = F(alpha_1, dots.h.c, alpha_n)$ ולכן $E$ נוצרת סופית מעל $F$.\
  $==>$ נניח כי $E slash F$ הרחבה נוצרת סופית ואלגברית ונראה שהיא סופית.\
  אם $E slash F$ נוצרת סופית ואלגברית אז יש יש לה קבוצת יוצרים $alpha_1, dots.h.c, alpha_k$ והיות וההרחבה אלגברית בפרט $alpha_1, dots.h.c, alpha_k$ אלגבריים.\
  נסמן $n_1, dots.h.c, n_k$ הדרגות של $alpha_1, dots.h.c, alpha_k$ בהתאמה, עלינו להראות $[E:F]<=n_1 n_2 dots.h.c n_k$.\
  לכל $1<=i<=k$ נסמן $E_i = F(alpha_1, dots.h.c, alpha_i)$ וכן $E_0 = F$, נשים לב כי אם מתקיים $[E_i : E_(i-1)] <= n_i$ אז מכפליות הדרגה נקבל
  $
    [E:F] = [E_k : E_(k-1)] dot.op [E_(k-1) : E_(k-2)] dot.op dots.h.c dot.op [E_2 : E_1] dot.op [E_1 : E_0] <= n_k dot.op n_(k-1) dot.op dots.h.c dot.op n_2 dot.op n_1
  $
  נזכר ש־$[E_i : E_(i-1)]$ זו הדרגה של הפולינום המינימלי $g_i$ של $alpha_i$ מעל $E_(i-1)$, אבל $m_(alpha_i) (x)$ הוא הפולינום המינימלי של $alpha_i$ מעל $F$ הוא בפרט פולינום מעל השדה $E_(i-1)$ (שמכיל את $F$) ומתקיים $g_i divides m_(alpha_i)$ ובפרט $[E_i : E_(i-1)] = deg(g_i) <= deg(m_(alpha_i)) = n_i$
]

#question()
נקבע את נכונות הטענה שאם $F subset.eq K subset.eq E$ כך ש־$E slash K$ ו־$K slash F$ הן הרחבות גלואה סופיות אז גם $E slash F$ הרחבת גלואה.

#proof[\
  *בהתחלה חשבתי*:
  $E slash K$ היא הרחבת גלואה ולכן זו הרחבה נורמלית וספרבילית.\
  באותו אופן גם $K slash F$ היא הרחבת גלואה ולכן נורמלית וספרבילית.\
  אנחנו יודעים שספרביליות היא טרנזטיבית, ולכן אם $K slash F$ ו־$E slash K$ הן הרחבות ספרביליות אז $E slash F$ היא הרחבה ספרבילית.\
  היות ו־$E slash K$ היא גלואה, אז $E$ הוא שדה פיצול של פולינום $f in K[x]$.\
  היות וההרחבה $K slash F$ היא נורמלית, אז כל פולינום אי־פריק ב־$F[x]$ שיש לו שורש ב־$K$ הוא מתפצל לחלוטין ב־$K$.\
  המקדמים של $f$ הם מ־$K$ שהיא הרחבה נורמלית מעל $F$ ועל־כן כל הצמודים של השורשים של $f$ מעל $F$ הם ב־$E$ ולכן $E$ אבל זה בידיוק גורר ש־$E slash F$ היא נורמלית.\
  אז $E slash F$ היא הרחבה ספרבילית ונורמלית ולכן גלואה.\
  *אבל:*
  $ E = QQ(root(4, 2)), K = QQ(sqrt(2)), F = QQ $
  ואכן
  $E slash K$ גלואה כי זה שדה פיצול של הפולינום $x^2-sqrt(2)$ וגם $K slash F$ גלואה כי זה שדה פיצול של $x^2-2$ אבל $E slash F$ לא גלואה כי $i root(4, 2)$ הוא צמוד של $root(4, 2)$ שאיננו.
]

#question()
יהי $E$ שדה הפיצול של $x^4+3 in QQ[x]$ ונמצא באופן מפורש את כל התתי–שדות של $E$.

#proof[
  ראשית נשים לב
  $ x^4+3 = (x^2+sqrt(3)i)(x^2-sqrt(3)i) $
  ובגלל שאני אמורה לדעת מורכבים אני אמורה לדעת $-3 = 3e^(i pi)$ ולכן מהנוסחה למציאת שורש של מספר מורכב
  $ z_k = r^(1/n) e^((i(theta+2k pi))/n) $
  ובמקרה שלנו $r = 3, theta = pi, n =4$ ולכן השורשים שלנו הם
  $ root(4, 3)e^((i pi)/4),root(4, 3)e^((3i pi)/4),root(4, 3)e^((5i pi)/4),root(4, 3)e^((7i pi)/4) $
  שדה הפיצול הוא שדה ההרחבה המינימלי ביחס להכלה שיכיל את השורשים, ולכן מהאי־תלות זה יהיה $E = QQ(root(4, 3), i)$.\
  נבחן את דרגת ההרחבה, אנחנו כבר יודעים ממגדל הרחבות וכד' שמתקיים
  $ [QQ(root(4, 3), i) : QQ] = [QQ(root(4, 3), i) : QQ(root(4, 3))] dot.op [QQ(root(4, 3) : QQ)] = 4 dot.op 2 = 8 $
  כמובן שההרחבה הזו היא ספרבילית ונורמלית ולכן הרחבת גלואה מדרגה $8$ ומהתאמת גלואה יש התאמה חד־חד ערכית ועל בין תתי־קבוצות של $Gal(E slash QQ)$ לבין שדות ביניים $Q subset.eq F subset.eq E$.\
  אנחנו יודעים שמהתאמת גלואה, כל אוטומורפיזם חייב לשלוח את $root(4, 3)$ אל אחד מהבאים ${plus.minus root(4, 3), plus.minus i root(4, 3)}$ ואת $i mapsto plus.minus i$ ויש לכך $8$ אפשרויות.\
  אז היא ההתאמת גלואה איזומורפית כנראה ל־$D_4$ (זה פשוט מתאמי מבנה).\
  אנחנו "יודעים" שיש ל־$D_4$ בידיוק 8 תתי־חבורות לא טריוויאליות ולכן מהתאמת גלואה יש $8$ שדות ביניים.
  $ D_4 = angle.l a,b bar a^4=b^2=e, a b = b a^(-1) angle.r $
  ולכן התתי־חבורות הן ${e, a, a^2, a^3}, {e, a^2}, {e, b}, {e, b a}, {e, b a^2}, {e, b a^3}, {e, a^2, b, b a^2}, {e, a^2, b a, b a^3}$ (תודה לגוגל).\
  בהתאמה, $b = i$ ו־$a = root(4, 3)$ ולכן
  ${e, root(4, 3), root(4, 3)^2, root(4, 3)^3}, {e, root(4, 3)^2}, {e, i}, {e, i root(4, 3)}, {e, i root(4, 3)^2}, {e, i root(4, 3)^3}, {e, root(4, 3)^2, i, i root(4, 3)^2}, {e, root(4, 3)^2, i root(4, 3), i root(4, 3)^3}$

]
