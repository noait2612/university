#import "../../../../src/article.typ": *
#show: article.with(title: [ מבנים אלגבריים 2, 80446 --- בכי לקראת מבחן ], signature: [#align(center)[#image(
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

#set heading(numbering: "1.1")
#outline(depth: 2)

= מלא הגדרות ונגזרותיהן
== הרחבות אלגבריות
#definition(
  "איבר אלגברי, איבר טרנסצנדנטי",
)[בהינתן הרחבה $E slash F$ ו־$alpha in E$, נגיד ש־$alpha$ *אלגברי* מעל $F$ אם קיים $f(t) in F[t]$ כך שמתקיים $f(alpha)=0$, אחרת נגיד ש־$alpha$ נקרא *טרנסצנדנטי* מעל $E$.\
  אם $char(E)=0$ אז $alpha in E$ אלגברי או טרנסצנדנטי אם הוא אלגברי או טרנסצנדנטי מעל $QQ$.\
  נשים לב לתנאי טוב עבור אלגבריות:
  $ [F(alpha) : F]< infinity <==> F "אלגברי מעל" alpha $]

#definition(
  "פולינום מינימלי",
)[*הפולינום המינימלי* של $m_alpha$ של $alpha$ מעל שדה הוא הפולינום המתוקן בעל המעלה המינימלית בתוך שדה הפולינומים שלנו שמאפס את $alpha$.\
  כדי להראות שפולינום הוא מינימלי, צריכה להתקיים השלשה הבאה:
  + $f_(alpha slash F) (alpha) = 0$
  + $f$ פולינום מתוקן
  + $f$ אי־פריק
]

#definition(
  "הרחבה אלגברית",
)[הרחבת שדות $E slash F$ נקראת *אלגברית* אם כל $alpha in E$ הוא אלגברי מעל $F$ (אחרת ההרחבה נקראת *טרנסצנדנטית*).]
#definition(
  "הרחבה נוצרת סופית",
)[הרחבה $E slash F$ נקראת *נוצרת סופית* אם קיימים $alpha_1, dots.h.c, alpha_k in E$ כך שמתקיים $E=F(alpha_1, dots.h.c, alpha_k)$ ]

#theorem("תנאים שקולים להרחבה נוצרת סופית")[
  תהיי $E slash F$ הרחבת שדות אז הבאים שקולים
  + $E slash F$ סופית
  + $E slash F$ נוצרת סופית ואלגבריות
  + $E = F(alpha_1, dots.h.c, alpha_k)$ כאשר $alpha_1, dots.h.c, alpha_k$ אלגבריים
]

#proposition("אריתמטיקה של אלגבריים")[
  + אם $alpha, beta$ אלגבריים מעל $F$ ו־$beta!=0$ אז גם $alpha dot.op beta, alpha plus.minus beta, alpha/beta$ אלגבריים מעל $F$
  + אם $alpha, beta$ אלגבריים מעל $F$ אז $deg(alpha+beta)<=deg(alpha) dot.op deg(beta)$ (זה נובע מהדרגה של הרזולטנטה)
  + אם $K slash F, L slash K$ הרחבות אלגבריות של שדות אז גם $L slash F$ הרחבה אלגברית
]

#definition(
  "הרחבה פרימיטיבית",
)[הרחבה $E slash F$ נקראת הרחבה *פרימטיבית/פשוטה* אם היא נוצרת על־ידי איבר אחד, והאיבר הזה ייקרא *האיבר הפרימיטיבי* של ההרחבה.]

== שדות סגורים אלגברית
#definition("שדה סגור אלגברית (algebraically closed)") [נגיד כי שדה $F$ *סגור אלגברית* אם לכל פולינום ממעלה גדולה מ־$1$ ב־$F[x]$ יש שורש ב־$F$ (כלומר, אם השדה סגור אלגברית אז כל פולינום ניתן לפירוק.\
אם $f$ פולינום מתפרק לגורמים לינאריים נגיד שהוא *מתפצל לחלוטין*.)
#definition(
  "סְגוֹר אלגברי (algebraic closure)",
)[השדה $E$ הוא *סְגוֹר אלגברי* של $F$ אם $E slash F$ הרחבה אלגברית ו־$E$ סגור אלגברית.]

== חבורת האוטומורפיזמים של הרחבת שדות
#definition("חבורת האוטומורפיזמים של הרחבת שדות") $L slash K$ הרחבת שדות
$ Aut(L slash K) = { sigma in Aut(L) bar forall x in K space sigma(x)=x} $
#proposition("חבורת האוטומורפיזמים של הרחבות אלגבריות פשוטות")[
  + אם $L = K(alpha)$ הרחבת שדות פשוטה אז כל $sigma in Aut(L slash K)$ נקבע לחלוטין על־ידי $sigma(alpha)$
  + $L = K(alpha)$ הרחבת שדות אלגברית פשוטה ו־$m_alpha in K[x]$ הפולינום המינימלי של $alpha$ מעל $K$, אז
    + לכל $sigma in Aut(L slash K)$ התמונה $sigma(alpha)$ היא שורש מתוך $L$ של הפולינום המינימלי $m_alpha$
    + לכל $beta$ שורש של $m_alpha$ ב־$L$ קיים ויחיד $sigma in Aut(L slash K)$ כך ש־$sigma(alpha)=beta$
  + $L slash K$ הרחבה אלגברית פשוטה אז $abs(Aut(L slash K))<=[L:K]$ ויש שיוויון אם ורק אם הפולינום המינימלי $m_alpha$ מתפצל לגורמים לינאריים *שונים* ב־$L$
]
#definition(
  $n"שורש יחידה פרימיטיבי מסדר "$,
)[יהי $2<=n in NN$. *שורש יחידה פרימיטיבי מסדר $n$* הוא שורש יחידה שלכל $1<=m<n$ מתקיים $xi^m != 1$.]
#proposition("חבורת האוטומורפיזמים של הרחבות צקלוטומיות")[
  ניקח $K$ שדה ו־$overline(K)$ הסגור האלגברי שלו.\
  עבור $NN in.rev n>=2$, *שורש יחידה פרימיטיבי מסדר $n$* בתוך $overline(K)$ הוא $xi in overline(K)$ שמקיים $xi^n = 1$ אבל $xi^m != 1$ לכל $1<=m<n$.\
  נניח שיש $xi in overline(K)$ שורש יחידה פרימיטיבי מסדר $n$ וניקח $L = K(xi)$, הרחבה זאת נקראת *הרחבה ציקלוטומית*.
  + כל אוטומורפיזם $sigma in Aut(L slash K)$ שולח את $xi$ לאיבר מהצורה $xi^a$ עם $a in (ZZ slash n ZZ)^times$ (חבורת היחידות/כפלית של החוג $ZZ slash n ZZ$)
  + $Aut(L slash K) tilde.eq G <= (ZZ slash n ZZ)^times$
]

== שדה פיצול של פולינום
#definition("שדה פיצול")[
  יהי $f in K[x]$. שדה ההרחבה $L slash K$ ייקרא *שדה פיצול* של $f$ אם
  + $f$ מתפצל ב־$L$ (מתפרק לחלוטין לגורמים לינאריים)
  + $L$ מינימלי עם תכונה זו ביחס להכלת שדות (אם $K subset.eq L' subset.eq L$ ו־$f$ מתפצל כבר מעל $L'$ אז $L'=L$)
  + שדה פיצול של פולינום הוא יחיד עד־כדי איזומורפיזם
]
== הרחבות ספרביליות
#definition(
  "שורש פשוט",
)[נאמר ש־$alpha = alpha_i in L$ הוא *שורש פשוט (simple root)* של $f$ אם הוא מופיע בידיוק פעם אחת בפיצול.\
  כלומר, $(t-alpha) divides f$ אבל $(t-alpha)^2 divides.not f$.]

#definition(
  "שורש מרובה",
)[נאמר ש־$alpha = alpha_i in L$ הוא *שורש מרובה (multiple root)* של $f$ אם הוא מופיע בפיצול לכל הפחות פעמיים.
  \ כלומר אם $(t-alpha)^2 divides f$.]
#definition(
  "פולינום ספרבילי",
)[הפולינום $f in K[t]$ נקרא *ספרבילי/פריד* אם אין לו שורשים מרובים בשדה ההרחבה $L$ בו הוא מתפצל.]
#proposition("תנאים לספרביליות")[
  + פולינום הוא ספרבילי אם ורק אם $gcd(f, f')=1$
  + בשדה ממציין $0$ כל פולינום אי־פריק הוא ספרבילי
]
#definition("איבר ספרבילי")[$alpha in L$ ייקרא *ספרבילי/פריד* מעל $K$ אם הפולינום המינימלי שלו מעל $K$ הוא ספרבילי.]
#definition("הרחבה ספרבילית")[הרחבה $L slash K$ שכל איבריה ספרביליים תקרא *הרחבה ספרבילית*.]
#proposition("טענות על הרחבות ספרביליות")[
  + בשדה ממציין $0$, כל הרחבה אלגברית היא הרחבה ספרבילית
  + ספרביליות היא תכונה טרנזטיבית – אם $L slash K$ הרחבה ספרבילית ו־$K subset.eq M subset.eq L$ הוא שדה ביניים אז $L slash M, M slash K$ הן הרחבות ספרביליות
  + אם אנחנו במציין $p!=0$ ו־$gcd([L:K], p)=1$ אז $L slash K$ הרחבה ספרבילית
  + תנאים שקולים לספרביליות
    + ההרחבה $L slash K$ היא ספרבילית
    + יש קבוצת יוצרים של $L$ מעל $K$ שכל איבריה ספרביליים
    + כל קבוצת יוצרים של $L$ מעל $K$ מורכבת מאיברים ספרביליים
  + פיצול של פולינום ספרבילי הוא הרחבה ספרבילית
  + כל הרחבה סופית פרידה היא פרימיטיבית
]

== הרחבות נורמליות
#definition(
  "הרחבת שדות נורמלית",
)[הרחבת שדות אלגברית $L slash K$ נקראת *נורמלית* אם כל פולינום אי־פריק מעל $K$ עם שורש ב־$L$ מתפצל לחלוטין ב־$L$.\
  בדומה לכך שנורמליות של חבורות זו לא תכונה טרנזטיבית, גם נורמליות של הרחבות איננה טרנזטיבית (יש מקרים תחת תנאים מסויימים שכן, כמו לדוגמה שאם $L slash K$ הרחבה נורמלית סופית ו־$M$ שדה ביניים אז גם $L slash M$ הרחבה נורמלית)]

= איך נעה מפרקת
+ *ל'זנדר*
  #definition("סמל לז'נדר")[
    יהי $p$ מספר ראשוני ($p!=2$) ו־$a in ZZ$, אז
    $
      (a / p) = mycases(
        0, a eq.triple 0 space (mod p),
        1, a eq.triple.not 0 space (mod p) and a eq.triple x^2 space (mod p) space (p"והוא שארית ריבועית מודלו " p"זר ל־" a ),
        -1, a eq.triple.not 0 space (mod p) and a eq.triple.not x^2 space (mod p) space (p"ואינו שארית ריבועית מודלו " p"זר ל־" a )
      )
    $
  ]
  #lemma[
    נניח ש־$p$ ראשוני אי־זוגי.
    + כדי לבדוק אם לפולינום ריבועי $a x^2 + b x +c$ מעל שדה $FF_p$ יש פירוק, מספיק לבדוק אם סמל לז'נדר $((b^2-4a c)/p)$ הוא $1$ או $-1$.\
      אם הוא $1$, זה אומר שיש ב־$FF_p$ שורש ל־$b^2-4 a c$ ואפשר להשתמש בנוסחת השורשים (שנותנת גם פירוק לפולינום מהצורה $a dot.op (x-r) dot.op (x-s)$ כאשר $a$ המקדם המוביל ו־$r,s$ השורשים).
    + כדי לבדוק עבור פולינום מהצורה $x^2-c$, מספיק לבדוק את סמל לז'נדר $(c/p)$ (שאומר לנו האם יש פיתרון למשוואה $x^2=c space (mod p)$)
  ]
  #theorem("משפט ההדדיות הריבועית")[אם $p,q$ ראשוניים אי־זוגיים, מתקיים
    + $ (p/q) (q/p) = (-1)^((p-1)/2 (q-1)/2) $
    + $ (-1/p) = (-1)^((p-1)/2) $
    + $ (2/p) = (-1)^((p^2-1)/8) $
  ]
  היתרון של השיטה – אם גילינו שיש ערך שעבורו סימן ל'זנדר הוא $-1$ אז לא צריך לעבוד יותר וזה לא מתפרק.\
  משפט ההדדיות עוזר מאוד לדברים סימטריים.
+ *קריטריון אייזנשטיין*
  נניח ש־$ZZ[t] in.rev f = sum_(i=0)^n a_i t^i$ ו־$p in NN$ ראשוני כך שמתקיימים הבאים
  + $p divides.not a_n$
  + $p divides a_i$ לכל $0<=i<n$
  + $p^2 divides.not a_0$
  אז $f$ אי־פריק.
  #remark[טריק לאי־פריקות זה לנסות לפעמים עם $x=t-1$]
+ *תנאים לקיום שורש – Rational root theorem* \
  $f in QQ[x]$ עם מקדמים שלמים ונסמן $f(x)=a_n x^n + dots.h.c + a_1 x + a_0$. אם $r/s in QQ$ שורש של $f$ אז $s divides a_n, r divides a_0$
+ *הלמה של גאוס* \
  עבור פולינום $f(t)=sum_(i=0)^n a_i t^i in ZZ[t]$, $cont(f)=gcd(a_0, dots.h.c, a_n)$ ופולינום הוא פרימיטיבי אם ורק אם $cont(f)=1$.\
  מלמת גאוס הראשונה $cont(f g) = cont(f) dot.op cont(g)$ ו־$f g$ פרימיטיבי אם ורק אם $f,g$ פרימטיביים.\
  מלמת גאוס השנייה, $f$ פולינום אי־פריק ב־$ZZ[t]$ אם ורק אם $f$ פרימיטיבי ואי־פריק ב־$QQ[t]$
+ *עם הדיסקרמיננטה* \
  פולינום $f$ מדרגה $2$ הוא אי־פריק אם הדיסקרמיננטה של הפולינום כבר ריבוע בשדה.


= דוגמאות
== דברים עם כמויות
#example("כמה אוטומורפיזמים יש")[
  אם $0<p$ ראשוני, אז עבור $n in NN$ מתקיים
  $Aut(FF_(p^n)) tilde.equiv ZZ slash n ZZ$
]
== איך מוצאים שדה פיצול של פולינום מעל $FF_p$
#example[בדרך־כלל זה שאלות מהסגנון $t^8-1 in FF_7 [t]$ ורוצים שדה פיצול מעל $FF_7$.\
  אנחנו רוצים להרחיב את $FF_7$ כדי ששורש יחידה פרימיטיבי מסדר $8$ יהיה בו, אז חייב להתקיים ש־$8$ מחלק את הסדר של החבורה הכפלית שהיא מסדר $7^n-1$, אז נמצא את ה־$n$ המינימלי כך ש־$8 divides 7^n-1$
  $ 7^1-1 eq.triple_(mod 8) 6, space 7^2-1=48 eq.triple_(mod 8) 0 $
  ולכן שדה הפיצול הוא $FF_49$.
]
== הרחבות לא נורמליות ונורמליות
#example[
  נבנה הרחבות נורמליות $F slash K, L slash F$ כך שההרחבה $L slash K$ לא נורמלית.
  נבחר $K = QQ, F = QQ(sqrt(2)), L = QQ(root(4, 2))$.\
  אנחנו כבר יודעים ש־$F slash K = QQ(sqrt(2)) slash QQ$ היא נורמלית (הרחבה ריבועית היא נורמלית) וגם $L slash K = QQ(root(4, 2)) slash QQ$ היא איננה נורמלית כי הפולינום המינימלי של ההרחבה הוא $x^4-2$ ולא כל השורשים נמצאים בהרחבה ($i root(4, 2), -i root(4, 2)$).\
  נטען כעת שההרחבה $L slash F = QQ(root(4, 2)) slash QQ(sqrt(2))$ היא נורמלית.\
  נסתכל על הפולינום $x^2-sqrt(2)$ הוא אי־פריק מעל $QQ(sqrt(2))$ ושורשיו הם $plus.minus root(4, 2) in QQ(root(4, 2))$ וזו בידיוק ההגדרה לנורמליות (כי הוא מתפצל לחלוטין עכשיו ב־$L$), ולכן $L slash F$ הרחבה נורמלית.
]

== מלא חבורות גלואה
#example[כל שדה פיצול שיש לו $4$ שורשים שהם רק מחליפים סימן ביניהם אז החבורת גלואה היא תת־חבורה מסדר $8$ של $S_4$ ויכולה להיות רק $D_4$ כי היא פועלת טרנזטיבית על השורשים.\
  זה בעצם המסקנה מתרגיל $8$ שאלה $2$ עבור $L$ שדה הפיצול של הפולינום $x^4-7x^2+7 in QQ[x]$ וראינו שהשורשים שלו הם $plus.minus sqrt((7 plus.minus sqrt(21))/2)$.]
#example[]

= משפטים להוכחה במבחן
== תנאים שקולים להרחבה נוצרת סופית
#theorem[
  תהיי $E slash F$ הרחבת שדות אז הבאים שקולים
  + $E slash F$ סופית
  + $E slash F$ נוצרת סופית ואלגברית
  + $E = F(alpha_1, dots.h.c, alpha_k)$ כאשר $alpha_1, dots.h.c, alpha_k$ אלגבריים
]
#proof[\
  $1 => 2$ מהסופיות ברור שמתקיים (מהגדרה) $ [F(alpha) : F]< infinity <==> F "אלגברי מעל" alpha $
  ולכן זו הרחבה אלגברית (בפרט לכל $alpha in E$ מתקיים $[F(alpha):F]<=[E:F]$) ולכן $[E:F]=n$ אז $alpha_1, dots.h.c, alpha_n$ זה בסיס של $E$ מעל $F$ ולכן $E = F(alpha_1, dots.h.c, alpha_n)$ ולכן $E$ נוצרת סופית מעל $F$.\
  $2 => 3$ אם $E slash F$ נוצרת סופית ואלגברית אז יש יש לה קבוצת יוצרים $alpha_1, dots.h.c, alpha_k$ והיות וההרחבה אלגברית בפרט $alpha_1, dots.h.c, alpha_k$ אלגבריים.\
  $3 => 1$ נסמן $n_1, dots.h.c, n_k$ הדרגות של $alpha_1, dots.h.c, alpha_k$ בהתאמה, עלינו להראות $[E:F]<=n_1 n_2 dots.h.c n_k$.\
  לכל $1<=i<=k$ נסמן $E_i = F(alpha_1, dots.h.c, alpha_i)$ וכן $E_0 = F$, נשים לב כי אם מתקיים $[E_i : E_(i-1)] <= n_i$ אז מכפליות הדרגה נקבל
  $
    [E:F] = [E_k : E_(k-1)] dot.op [E_(k-1) : E_(k-2)] dot.op dots.h.c dot.op [E_2 : E_1] dot.op [E_1 : E_0] <= n_k dot.op n_(k-1) dot.op dots.h.c dot.op n_2 dot.op n_1
  $
  נזכר ש־$[E_i : E_(i-1)]$ זו הדרגה של הפולינום המינימלי $g_i$ של $alpha_i$ מעל $E_(i-1)$, אבל $m_(alpha_i) (x)$ הוא הפולינום המינימלי של $alpha_i$ מעל $F$ הוא בפרט פולינום מעל השדה $E_(i-1)$ (שמכיל את $F$) ומתקיים $g_i divides m_(alpha_i)$ ובפרט $[E_i : E_(i-1)] = deg(g_i) <= deg(m_(alpha_i)) = n_i$
]

#pagebreak()

== לכל שדה קיים סגור אלגברי
#theorem[לכל שדה $K$ קיים סגור אלגברי $overline(K) slash K$.]
#proof[נוכיח תחילה למה:
  #lemma[נניח כי $K$ שדה ו־$L slash K$ הרחבה אלגברית, $kappa = abs(K)$. אזי $abs(L) <= max {kappa, א_0}$.\
    לכן, המקרה היחידי שיתקיים $abs(L) > abs(K)$ זה כאשר $K$ סופית ו־$L$ בת־מנייה.]
  #proof[
    נבחן את $K[t]$. קבוצת הפולינומים מדרגה לכל היותר $d$ היא מעוצמה של $kappa^(d+1)$.\
    אם $K$ אינסופית, אז $kappa^n = kappa$ משיקולי עוצמות וזה נכון גם במקרה שבו אנחנו עושים איחוד בן־מנייה של $kappa$, ולכן $abs(K[t]) = kappa$.\
    אם $K$ סופית אזי $abs(K[t]) = א_0$ (ראינו גם בתורת הקבוצות).\
    נגדיר העתקה $L arrow.r K[t]$ על־ידי $alpha mapsto f_(alpha slash K)$ (כל $alpha in L$ ממופה לפולינום המינימלי שלו).\
    נשים לב שהעתקה זאת ממפה לסיבים סופים (שכן המקור של כל פולינום $f in K[t]$ מכיל את כל השורשים שלו ב־$L$), ולכן
    $ abs(L) <= א_0 dot.op max{kappa, א_0} = max{kappa, א_0} $
  ]
  כעת, ניזכר בהגדרה ממבנים $1$:
  #definition("סיב")[
    תהיינה $A, B$ קבוצות ו־$f: A arrow.r B$. *סיב (fiber)* של הפונקציה הוא תת־קבוצה של $A$ שהיא קבוצת המקורות של איבר ב־$B$, כלומר תת־קבוצה מהצורה
    $ f^(-1)(b)={ a in A bar f(a) = b} $
    ניזכר שראינו במבנים 1 שלמת הגרעין (למה 3.13 בספר) אומרת במילים אחרות שהסיבים של הומומורפיזם $phi : G arrow.r H$ הם בידיוק המחלקות של הגרעין $N$ ולכן ל־$G slash N$ יש מבנה של חבורה.
  ]
  נבחר $K subset U$ כך ש־$abs(U) > max{abs(K), א_0}$ (כאשר $U$ מלשון universe).\
  נבחן את $cal(V)$, קבוצת כל השלשות $(L, plus, dot.op)$ משמע קבוצת כל תתי־הקבוצות $K subset.eq L subset U$ ופעולות $dot.op: L^2 arrow.r R, plus : L^2 arrow.r L$ כך שהפעולות הופכות את $L$ לשדה ואפילו להרחבה אלגברית $L slash K$ ובפרט $dot.op_L bar_K = dot_K, plus_L bar_K plus_K$.\
  נסדר באמצעות יחס־סדר חלקי $(L, plus, dot.op) <= (F, plus, dot.op)$ אם $L subset.eq F$ והפעולות על $F$ מסכימות עם הפעולות על $L$ (משמע $F slash L$ הרחבת שדות ולא רק הרחבת קבוצות) ולכן $cal(V)$ היא קבוצה סדורה חלקית.\
  נניח בנוסף כי ${(L_i, plus, dot.op)}_(i in I subset.eq cal(V))$ שרשרת של שדות ולכן קיים לה חסם עליון $L = union_(i in I) L_i$ (ואכן, כל $a, b in L$ מוכל ב־$L_i$ עבור $i$ כלשהו, ונגדיר $a plus_L b = a plus_L_i b$ ובאותו אופן נגדיר מכפלה ואז נקבל כי $L$ הוא שדה וכל $a in L$ מוכל ב־$L_i$ כלשהו ולכן אלגברי מעל $K$).\
  לפי הלמה של צורן, קיים איבר מקסימלי $(overline(K), plus, dot.op) in cal(V)$ ונטען כי $overline(K)$ הוא סגור אלגברית ולכן אלגברי מעל $K$: נניח שלא כך, ולכן קיימת הרחבה אלגברית לא טריוויאלית $L slash overline(K)$. היות ו־$abs(L) < abs(U)$, מהלמה לעיל נובע שקיים שיכון (של קבוצות) $phi : L arrow.r.hook U$ שמרחיב את ההכלה $overline(K) subset U$
  אבל אז $(phi(L), plus, dot.op)$ הוא האיבר המקסימלי, ב־$cal(V)$ וזו סתירה להנחה כי $L$ חסם־עליון.
]

#pagebreak()

== שדה המרוכבים הוא סגור אלגברית
#theorem[השדה $CC$ הוא סגור אלגברית.]
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

#pagebreak()

== על פרובניוס ושדות סופיים מחזקות $p$
#theorem[לכל ראשוני $p$ ולכל $n in NN$ קיים שדה $FF_(p^n)$ עם $p^n$ איברים ו־$Aut_(FF_p) (FF_(p^n))$ היא חבורה ציקלית מסדר $n$ והיוצר שלה הוא העתקת הפרובניוס.]

#proof[
  נסמן $q=p^n$ ונתחיל מלהוכיח את קיום השדה $FF_q$: נתבונן ב-$FF_p$ ונגדיר הרחבה $K$ כשדה פיצול של הפולינום $f(t)=t^q-t$ ונראה שיש ב־$K$ בידיוק $q$ איברים: נסמן ב־$A$ את קבוצת השורשים של $f$ ב־$K$ ומתקיים $f'=-1$ ולכן $gcd(f, f')=1$ והפולינום $f$ ספרבילי. על־כן, $abs(A)=q$ ו־$A$ שדה כי אם נסמן $Fr^q x = x, Fr^q y = y$ אז
  $
    Fr_q (x+y) = Fr_q (x) + Fr_q = x+y space (mod q) \
    Fr_q(x y) = Fr_q x Fr_q y = x y space (mod q)
  $
  וזה מראה ש־$A$ שדה, ולכן $FF_q colon.eq A = K$ הוא שדה וכמובן יחיד עד־כדי איזומורפיזם כשדה פיצול של הפולינום.\
  נסתכל על ההרחבות שדות $FF_(p^n) slash FF_p$, הרחבת שדות סופית מדרגה $n$. \
  נראה בתור התחלה $abs(Aut_(FF_p) (FF_(q)))<=n$, נטען שזו הרחבה פרימיטיבית: $FF_(q)^times$ היא ציקלית ויוצר כלשהו שלה יוצר גם את ההרחבה (מהציקליות), כלומר, $FF_(q) = FF_p (alpha)$.\
  אז $deg_(FF_p) (alpha)=n$ ולכן יש לו לכל היותר $n$ צמודים מעל $FF_p$.\
  כל $sigma in Aut_(FF_(q)) (FF_p)$ חייב לקחת את $alpha$ לאחד הצמודים שלנו, $sigma(alpha)=alpha_i$ והוא נקבע ביחידות על־ידי $sigma(alpha)$ כי $alpha$ יוצר, ולכן קיימים לכל היותר $n$ $FF_p$ אוטומורפיזמים שונים.\
  מצד שני, נשים לב ש־$Fr_p|_(FF_p) = Id$ ולכן $Fr_p in Aut_(FF_p) (FF_(q))$.\
  לכל $0<=i<n$ מתקיים $(Fr_p)^i = Fr_(p^i)$ ול־$Fr_(p^i)$ יש בידיוק $p^i$ נקודות שבת, ו־$i<n$ אז יש $beta in FF_(q)$ כך ש־$Fr_(p^i) (beta) != beta$ ולכן $Fr_(p^i) != Id_(FF_(p^s))$ ולכן הסדר של $Fr_p$ הוא לכל הפחות $n$.\
  לכן יש בידיוק $n$ אוטומורפיזמים, וראינו ש־$Fr_p$ יוצר את חבורת ה־$FF_p$ אוטומורפיזמים, כנדרש.
]
#pagebreak()

== כל הרחבה ספרבילית סופית היא פרימיטיבית
#theorem[
  נניח כי $L slash K$ הרחבה סופית ונניח בנוסף שההרחבה פרידה (ספרבילית). אז היא פרימיטיבית (קיים $alpha in L$ כך ש־$L=K(alpha)$ ו־$alpha$ נקרא *איבר פרימיטיבי*).
]

#proof[
  תחילה נוכיח למה:
  #lemma(
    "משפט האיבר הפרימיטיבי חלק 1",
  )[תהיי $L slash K$ הרחבה סופית. אז $L slash K$ היא הרחבה פרימיטיבית אם ורק אם יש כמות סופית של שדות ביניים.]
  #proof[
    $<==$ תהיי $L slash K$ פרימיטיבית, כלומר $K = L(alpha)$ ויהי $F$ שדה ביניים. אז $f_(alpha slash F) = sum_(i=1)^n a_i t^i$.\
    יהי $K(a_0, dots.h.c, a_n) = E subset F subset L$ אז $f_(alpha slash F) in E[t]$ ולכן $f_(alpha slash E) divides f_(alpha slash F)$ ובפרט הם שווים.\
    לכן $[L:E] = deg(f_(alpha slash E)) = deg(f_(alpha slash F)) = [L:F]$ ולכן $E=F$ (כי $[F:E] = [L : E]/[L:F] = 1$).\
    אז $F = K(a_1, dots.h.c, a_n)$ נקבע ביחידות על־ידי $f_(alpha slash F)$ ואנחנו יודעים ש־$f_(alpha slash F) divides f_(alpha slash K)$ ולכן יש רק כמות סופית של אפשרויות ל־$f_(alpha slash F)$ (מקסימום $2^([L:K]) = 2^(deg(f_(alpha slash K)))$ כי $f_(alpha slash K) = product_(i=1)^n (t-alpha_i) in overline(K)[t]$ ואם אני רוצה פולינום שיחלק, צריך לבחור קבוצה כלשהי של שורשים ויש $2^n$ אפשרויות לכל היותר).\
    $==>$ נניח שיש כמות סופית של שדות ביניים, $K subset F_i subset L$ עבור $1<=i<=m$.\
    אם $K$ סופי, אז אנחנו יודעים ש־$L slash K$ פרימיטיבית , אז נניח ש־$K$ אינסופי ונוכיח באינדוקציה על $[L:K]$:\
    הבסיס של דרגה $1$ הוא טריוויאלי ולכן ניח שהטענה מתקיימת לכל הרחבה מדרגה הקטנה ל־$[L:K]$.\
    נכתוב $L = K(alpha_1, dots.h.c, alpha_r)$ הרחבה סופית וכן $E = K(alpha_1, dots.h.c, alpha_(r-1))$ (ואז $L=E(alpha_r), alpha = alpha_r$).\
    נניח בלי הגבלת הכלליות ש־$L!=E$ (אחרת נזרוק את $alpha_r$ כי הוא מיותר).\
    מהנחת האינדוקציה, $E = K(beta)$ כי ל־$K$ יש רק מספר סופי של תתי־שדות.\
    ניקח סדרה אינסופית (מההנחה ש־$K$ אינסופי) $c_1, c_2, dots.h.c in K$ וניקח $gamma_i = alpha + beta c_i$ (צירופים לינאריים שונים של $alpha, beta$).\
    נגדיר $F_j = K(gamma_j)$ וקיימים $j!=ell$ כך ש־$F_j = F_ell$ (כי יש כמות סופית של שדות ביניים וכמות אינסופית של איברים).\
    מתקיים $beta = ((alpha+beta c_ell)-(alpha + beta c_j))/(c_ell - c_j) = (gamma_ell - gamma_j)/(c_ell - c_j) in F_j = F_ell$ ולכן $alpha = gamma_ell - c_ell beta in F_ell$ ואז $alpha, beta in F_j$, כלומר $ L = K(alpha,beta) subset F_j = K(alpha+c_j beta) = K(gamma_j) $
    וזה בידיוק אומר ש־$L slash K$ פרימיטיבית.
  ]
  אם כך, מספיק להוכיח שיש כמות סופית של שדות ביניים: נסתכל על סגור גלואה $L^(n o r) = L^(gal) slash K$ (הסגור הנורמלי הוא סגור גלואה כי $L slash K$ פרידה) ומספיק להוכיח של־$L^(gal) slash K$ יש כמות סופית של שדות ביניים (כי $L subset L^(gal)$).\
  מהתאמת גלואה לכל $K subset F subset L^(gal)$ מתקיים $F=L^(Gal(L slash F))$ ולכן $F$ נקבע ביחידות על־ידי $Gal(L slash F)<=Gal(L slash K)$ ויש כמות סופית כזאת כי $Gal(L slash K)$ היא חבורה סופית.
]
#pagebreak()

== משפט ארטין
#theorem[$L$ שדה ו־$H <= Aut(L)$ חבורת אוטומורפיזמים סופית כלשהי, נסמן $F=L^H$. אז $L slash F$ הרחבת גלואה ו־$H = Gal(L slash F)$.]

#proof[
  יהי $alpha in L$ ונגדיר $cal(C)_alpha = H alpha = {sigma(alpha)}_(sigma in H)$ ונגדיר $f_alpha = product_(alpha in cal(C)_alpha) (t-alpha)$.\
  כל $sigma in H$ מחליף גורמים ב־$f_alpha$ ולכן $sigma(f_alpha)=f_alpha$ כלומר $f_alpha in F[t]$ אז $f_(alpha slash F) divides f_alpha$ ולכן $f_(alpha slash F)$ הוא פריד מדרגה חסומה על־ידי $abs(H)>=abs(cal(C)_alpha)$.\
  נשאר להראות $[L:F]<=abs(H)$: נניח שלא, אז $[L:F]>abs(H)$.\
  $L slash F$ אלגברית (כי $H$ סופית ומתנאים שקולים) ופרידה, ולכן יש תת־הרחבה סופית $F subset E subset L$ כך שמתקיים $infinity > [E:F] > abs(H)$ ולכן לפי משפט האיבר הפרימיטיבי $E=F(alpha)$.\
  אבל $deg(f_(alpha slash F))<=abs(H)$ בסתירה להנחה.\
  אז $[L:F]<=abs(H)$ וגם $H <=Aut(L slash F)$ אבל תמיד מתקיים $[L:F]<=abs(Aut(L slash F))$ ולכן יש שיוויון, אבל שיוויון מתקיים אם ורק אם $L slash F$ היא הרחבת גלואה והכל שיוויונות ולכן $[L:F] = abs(H), H = Gal(L slash F)$.
]
#pagebreak()

== התאמת גלואה
תהיי $L slash K$ הרחבת גלואה סופית ונסמן $G = Gal(L slash K)$.\
אזי ההעתקות $scr(G)(F) = Gal(L slash F), scr(F)(H) =L^H$ הפוכות אחת לשנייה ומשרות התאמה חד־חד ערכית ועל בין שדות ביניים $L slash F slash K$ לתתי־חבורות $1<=H<=G$.

#proof[
  נוכיח כי לכל שדה ביניים $L slash F slash K$ מתקיים $F=L^(Gal(L slash F))$.\
  ברור כי $F subset.eq L^(Gal(L slash F))$ כי $Gal(L slash F)$ אלו האוטומורפיזמים שמקבעים את $F$.\
  ניקח $alpha in L slash F$ ולכן $alpha$ פריד מעל $F$ כי $L slash K$ פרידה (כי גלואה) ולכן $L slash F$ פרידה ו־$deg_s (alpha) > 1$ ולכן יש לו צמוד $alpha'$ מעל $F$ ולכן קיים \
  $sigma in Aut_F (overline(F))$ כך שיתקיים $sigma(alpha)=alpha'$.\
  מתקיים $sigma|_K = Id_K$ וגם $sigma(L)=L$ מהיות $L slash K$ נורמלית ולכן $sigma|_L in Gal(L slash F)$ כי הוא הזהות על $F$, אבל $sigma(alpha)!=alpha$ ולכן $alpha in L^(Gal(L slash F))$ ולכן קיבלנו שיוויון ומתקיים $F=L^(Gal(L slash F))$.\
  אז מתקיים
  $ scr(F)(scr(G)(F)) = scr(F)(Gal(L slash F)) = L^(Gal(L slash F)) = F => scr(F) compose scr(G) = Id $
  בכיוון השני, נזכר במשפט ארטין:
  #theorem(
    "משפט ארטין",
  )[$L$ שדה ו־$H<=Aut(L)$ חבורת אוטומורפיזמים סופית כלשהי ונסמן $F=L^H$. אז $L slash F$ הרחבת גלואה ו־$H=Gal(L slash F)$.]
  אז ניקח $H<=G$ תת־חבורה ולכן ממשפט ארטין (יחד עם הסופיות!) נקבל $ H = Gal(L slash L^H) = scr(G)(scr(F)(H)) => scr(G) compose scr(F) = Id $
  אז הוכחנו את ההתאמה ונשאר להראות ש־$scr(G), scr(F)$ הופכות שיכונים:\
  נניח כי $H'<=H<=G$ תתי־חבורות של $G$ אז $scr(F)(H)=L^H$ אלו כל האיברים ב־$L$ שנשארים במקום על־ידי פעולת $H$, אבל $H' subset.eq H$ ולכן נובע כי אם איבר נשאר במקום על־ידי $H$ הוא ישאר במקום גם על־ידי $H'$ ולכן $scr(F)(H) subset.eq L^(H')= scr(F)(H')$.\
  ניקח שדות ביניים $L slash F slash F' slash K$ אז $scr(G)(F)=Gal(L slash F)$ אלו אוטומורפיזמים המשמרים את $F$ אבל $F' subset.eq F$ ולכן הם גם משמרים הכרח את $F'$, כלומר $scr(F) = Gal(L slash K) subset.eq Gal(L slash F') = scr(G)(F')$, כנדרש.
]
#pagebreak()


== הלמה השנייה של גאוס
#theorem[
  כל פולינום פרימיטיבי $f(x) in ZZ[x]$ שהוא אי־פריק ב־$ZZ[x]$ הוא גם אי־פריק ב־$QQ[x]$.
]

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
    ניקח את הפירוק $f = g dot.op h$ עבור $g, h in QQ[t]$ וניקח $0<m,n in ZZ$ כך ש־$m dot.op g, n dot.op h in ZZ[t]$ ואז נקבל פירוק $ m dot.op n dot.op f = m dot.op g dot.op n dot.op h $
    נסמן $ell = cont(f), alpha = cont(m dot.op g), beta = cont(n dot.op h)$. מלמת גאוס הראשונה נקבל עם כפליות התכולה
    $ cont(m dot.op n dot.op f) = m dot.op n dot.op ell = alpha dot.op beta = cont(m dot.op g dot.op n dot.op h) $
    אם כך, ניקח $m dot.op n dot.op f = m dot.op g dot.op n dot.op h$ ונחלק ב־$m dot.op n dot.op ell = alpha beta$ ונקבל $1 / ell dot.op f = (m dot.op n dot.op f) / (m dot.op n dot.op ell) = underbrace(m / alpha dot.op g dot.op n / beta dot.op h, in ZZ[t])$ משמע $f = ell m / alpha dot.op g dot.op n / beta dot.op h$.
  ]
  נשאר רק להוכיח את הטענה שלנו: נניח כי $f$ אי־פריק ב־$ZZ[t]$ ולכן $f = cont(f) dot.op f / cont(f)$ פירוק טריוויאלי ונשים לב $deg (f / cont(f)) > 0$ ולכן $cont(f)$ הפיך ולכן $f$ פרימיטיבי.\
  נניח ש־$f$ פריק ב־$QQ[t]$ ולכן יש $f = g dot.op h$ כך ש־$deg(g), deg(h) > 0$ ולכן מהלמה לעיל נקבל $f = c dot.op g dot.op c^(-1) dot.op h$ עם דרגות גדולות מ־0 ב־$ZZ[t]$ משמע הוא פריק בו, וזאת סתירה.\
]

#pagebreak()

== טענה 8.4.2 ברשומות של מיכאל
#theorem[יהי $n in K^times, mu_n subset K$ ו־$L slash K$ הרחבה ציקלית, אז קיים $alpha in L$ כך שמתקיים $L = K(alpha)$ ו־$alpha^n in K$.]
#proof[
  ניזכר בהגדרה
  #definition(
    $n"חבורת שורשי היחידה מסדר ",mu_n"חבורת"$,
  )[עבור $K$ שדה ו־$1<=n in NN$ נגדיר $ mu_n (K) = { xi in K bar xi^n = 1} $
    $ mu_infinity (K) = union.big_n mu_n (K) $
    נשים לב ש־$mu_n (K)$ היא תת־חבורה של $K^times$ מסדר המחלק את $n$ (זוהי כמובן חבורה אבלית עם כפל).\
    עבור $K$ שדה ו־$1<=n in NN$, אם $x^n-1$ מתפצל לחלוטין ב־$K$ נסמן $mu_n (K) = mu_n$ (שכן היא לא תשתנה תחת הרחבה של $K$) ונגיד במקרה זה ש־$mu_n$ מתפצל ב־$K$.]
  _נעבור להוכחה:_\
  מכך שההרחבה ציקלית אנחנו יודעים שההרחבה וסופית ושמתקיים $G=Gal(L slash K) tilde.eq (ZZ slash n ZZ)$ ולכן יש $sigma$ שיוצרת את ההרחבה.\
  נזכר שמהגדרה $ G=Gal(L slash K) = Aut(L slash K) = { sigma in Aut(L) bar forall x in K space sigma(x)=x} $
  נסתכל על ה־$sigma : L arrow.r L$ הזאת כאופרטור $K$־לינארי (כלומר, מכבד את המבנה של $K$, משמע לכל $a, b in K$ ולכל $x,y in L$ מתקיים \
  $sigma(a x + b y) = a sigma(x) + b sigma(y)$).\
  ניקח את $f_sigma (t)$ הפולינום המינימלי של $sigma$.
  היות וההרחבה סופית מדרגה $n$ אז אנחנו יודעים מטעמי סדר שיתקיים $sigma^n = 1$ ומכך ש־$mu_n subset K$, אנחנו מקבלים שהפולינום $t^n-1$ מתפצל לחלוטין ב־$K$.\
  מכך ש־$sigma$ הוא אופרטור $K$־לינארי, מתקיים $sigma^n-1 = 0$ ולכן לפולינום $t^n-1$ יש שורש שהוא $sigma$.\
  מהגדרת הפולינום המינימלי הוא מחלק גם את $t^n-1$ (כי $sigma$ שורש שלו).\
  מכך ש־$t^n-1$ מתפצל לחלוטין ב־$K$ אז הוא מהצורה
  $ t^n-1 = (t-xi_0) (t-xi_1) dot.op dots.h.c dot.op (t-xi_(n-1)) $
  ובהכרח השורשים שלו (שורשי היחידה) הם שונים זה מזה, כי $(t^n-1)' = n t^(n-1)$, אבל השורש היחידי של $n t^(n-1)$ הוא רק עבור $t=0 space (n!=0)$, אז לפי טענה שראינו נובע שאין לו שורשים מרובים ולכן כל השורשים שלו שונים זה מזה, אז כל השורשים שונים זה מזה והפיצול שראינו לעיל הוא פיצול לינארי.\
  ניזכר שבלינארית ראינו שאופרטור הוא אלכסוני מעל שדה אם קיים בסיס של המרחב הוקטורי שמכיל את כל הוקטורים העצמיים של האופרטור, ובמקרה שלנו זה שקול ללהגיד שהפולינום המינימלי של האופרטור מתפצל לחלוטין מעל השדה – כפי שמצאנו.\
  לכן יש לנו בסיס של וקטורים עצמיים $alpha_1, dots.h.c, alpha_n$ עבור הערכים העצמיים $xi_1, dots.h.c, xi_n in mu_n$ בהתאמה כך שמתקיים $sigma(alpha_i) = xi_i alpha_i$.\
  נראה כי ה־$xi_i$ יוצרים את $mu_n$:  $mu_n$ ציקלית, ולכן גם כל תת־חבורה שלה ציקלית אז $angle.l xi_i, dots.h.c, xi_n angle.r = mu_m$ עבור $m<=n$ אז $xi_i^m = 1$ אבל נשים לב שמתקיים אם כך לכל $i$
  $ sigma^m (alpha_i) = xi_i^m alpha_i = 1 dot.op alpha_i = alpha_i $
  ולכן בהכרח $m=n$ ובעצם $angle.l xi_1, dots.h.c xi_n angle.r = mu_n$.\
  מכך ש־$xi_1, dots.h.c, xi_n$ יוצרים את $mu_n$ והיא חבורה ציקלית לכן נוצרת על־ידי איבר אחד, $xi$, נובע שהוא צריך להיות צירוף לינארי שלהם, אז לכל $i$ נתאים את $ell_i$ כך שיתקיים $xi = product_(i=1)^n xi_i^(ell_i)$, נגדיר $alpha = product_(i=1)^n alpha_i^(ell_i)$ ונקבל
  $
    sigma(alpha) = sigma(product_(i=1)^n alpha_i^(ell_i)) = product_(i=1)^n sigma(alpha_i^(ell_i)) =_(sigma(alpha_i)=xi_i alpha_i) product_(i=1)^n xi_i^(lambda_i) alpha_i^(ell_i) = product_(i=1)^n xi_i^(ell_i) product_(i=1)^n alpha_i^(ell_i) = xi alpha
  $
  במילים אחרות, $alpha$ הוא וקטור עצמי של הערך עצמי $xi$, אבל $xi$ הוא שורש פרימיטיבי מסדר $n$, אז הקבוצה ${alpha, xi alpha, xi^2 alpha, dots.h.c, xi^(n-1) alpha}$ היא בעלת $n$ איברים שונים – זאת אומרת ל־$alpha$ יש $n$ צמודים מעל $K$ ונטען שזה מסיים: נסמן $L=K(alpha)$, ואם נבחר $a = alpha^n$ אז עבור כל $sigma_i in G$ נקבל
  $ sigma_i (a) = sigma_i (alpha^n) = (sigma_i (alpha))^n = (xi_i alpha)^n = alpha^n = a $
  וזה בידיוק אומר ש־$a in L^G = {x in L bar forall sigma in G, space sigma(x)=x}$, אבל זה בידיוק אומר ש־$a in K$, כי כל איבר ב־$K$ נשמר תחת כל האוטומורפיזמים של $G$ כי $G$ מהגדרתה מכילה את כל האוטומורפיזמים שמשאירים את $K$ במקום.
]

#pagebreak()

== טענה על הרחבות ציקלוטומיות תחת תנאי יפה
#theorem[
  אם $n in K^times$ אז קיים שורש פרימיטיבי $xi_n in overline(K)$ מסדר $n$, ההרחבה $K(xi_n) slash K$ היא גלואה וישנו שיכון $ Gal(K(xi_n) slash K) arrow.r.hook (ZZ slash n ZZ)^times $
]

#proof[
  נניח ש־$n in K^times$, הפולינום $x^n-1$ הוא ספרבילי ולכן ל־$overline(K)$ יש $n$ שורשי יחידה שונים.\
  ראינו שאם ל־$overline(K)$ יש $n$ שורשי יחידה שונים זה מזה, אז $mu_n tilde.equiv (ZZ slash n ZZ)$, זו חבורה ציקלית ולכן יש לנו שורש יחידה פרימיטיבי $xi_n$ שיוצר אותה.\
  $K(xi_n) slash K$ הוא שדה הפיצול של הפולינום שלנו ולכן ההרחבה נורמלית וספרבילית ולכן זו הרחבת גלואה.\
  כל $sigma in G(L slash K)$ נקבע ביחידות על־ידי $sigma(xi)$ ולכן אנחנו מקבלים שיכון $Gal(L slash K) arrow.r.hook Aut(mu_n)$ על־ידי $sigma mapsto sigma|_(mu_n)$.\
  נגדיר $lambda : (ZZ slash n ZZ) arrow.r Aut(mu_n)$ על־ידי $a mapsto sigma_a$ כאשר $sigma_a (xi)=xi^a$ לכל $a in (ZZ slash n ZZ)^times$ והעתקה הזאת מגדירה את השיכון $ Gal(L slash K) arrow.r.hook (ZZ slash n ZZ)^times $
]
