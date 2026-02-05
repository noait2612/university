#import "../../../src/article.typ": *
#show: article.with(
  title: [ הכנה למבחן --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)


#set heading(numbering: "1.1")
#outline(depth: 3)

#pagebreak()
= אריתמטיקות בסיסיות שאת תמיד שוכחת
בהינתן $z=x + i y, w = a + i b$
+ ערך מוחלט
  $ abs(z)=sqrt(z dot.op overline(z))=sqrt((x+i y) dot.op (x-i y)) = sqrt(x^2+y^2) $
+ חילוק
  $ z/w = (z dot.op overline(w))/(w dot.op overline(w)) = (z dot.op overline(w))/abs(w)^2 $
+ זהות אויילר
  $ e^(i z)=cos(z)+i sin(z) $
+ $ e^(pi i)=(-1) wide e^(2pi i)=1, wide e^(i pi/2)=i $
+ $ cos(z) = (e^(i z)+e^(-i z))/2 $
+ $ sin(z) = (e^(i z)-e^(-i z))/(2i) $
+ $ sinh(z)=-i sin(i z)=(e^z-e^(-z))/2 $
+ $ cosh(z)=cos(i z)=(e^z+e^(-z))/2 $
= הגדרות מפה לשם משם לפה
== גזירות מרוכבת
#definition("פונקציה הולומורפית")
#definition("משוואות קושי־רימן")
#definition("פונקציה הרמונית")
#definition("העתקה קונפורמית")
#definition("נגזרת לוגריתמית")[
  אם $f:G arrow.r CC$ לא מתאפסת, הנגזרת הלגוריתמית מוגדרת להיות $f'/f$.
]<log_derivative>

== אינטגרלים קווים
#definition("תחום כוכב")[תחום $G$ נקרא תחום כוכב אם קיים $z_0$ כך שלכל $z in G$ מתקיים $[z_0, z] in G$.]

= משפטים ושאר הירקות
== אינטגרלים קווים
=== הקדמה
#definition(
  "אינטגרל קווי",
)[יהיו $G subset.eq CC$ תחום, $f: G arrow.r CC$ רציפה ו־$gamma$ מסילה $C^1$ שתמונתה מוכלת ב־$G$. האינטגרל המסילתי של $f$ לאורך $gamma$ הוא
  $ integral_gamma f dif gamma colon.eq integral_a^b f(gamma(t))gamma'(t) dif t $]
#theorem("האי־שיוויון האהוב עלינו ממרוכבות")[לכל $f in Hol(G), gamma:I arrow.r G$ מתקיים
  $
    abs(integral_gamma f(z) dif z)<=max_gamma abs(f) dot.op L(gamma) colon.eq max_(t in I) abs(f(gamma(t))) dot.op L(gamma)
  $
]
#theorem[אם $f_n arrow.r f$ במידה שווה מקומית (במידה שווה בכל קבוצה קומפקטית $K subset G$) ב־$G$ אז לכל $gamma:I arrow.r G$ מתקיים
  $ lim_(n arrow.r infinity) integral_gamma f_n (z) dif z = integral_gamma f(z) dif z $
]
#theorem("קירוב פוליגונלי")

=== משפט קושי
#theorem("משפט קושי במשולש")[יהי $T$ משולש סגור ו־$G$ סביבה פתוחה של $T$, אזי לכל $f in Hol(G)$ מתקיים
  $ integral_(partial T) f(z) dif z = 0 $]
#theorem("משפט קושי בקבוצה קמורה")[תהיי $K$ קבוצה קמורה חסומה ו־$G$ סביבה פתוחה של $K$, אז לכל $f in Hol(G)$ מתקיים
  $ integral_(partial K) f(z) dif z = 0 $
  _תזכורת (קבוצה קמורה)_: $K subset RR^k$ נקראת קמורה אם לכל $x,y in K$ מתקיים
  $ [x,y] colon.eq {lambda x + (1-lambda)y bar lambda in [0,1]} subset.eq K $
]
#theorem("משפט קושי בתחום טוב")[יהי $G$ תחום טוב אז לכל $f in Hol(G inter C(overline(G)))$ מתקיים
  $ integral_(partial G) f(z) dif z = 0 $
]
=== מסקנות ממשפט קושי
#theorem("נוסחת אינטגרל קושי")
#theorem("נוסחת אינטגרל קושי לנגזרת")
#theorem("משפט מוררה")
#theorem("משפט ויירטשטראס")
#theorem("אי־שיוויון קושי")[
  תהיי $f in Hol(B(z_0, R))$ אז לכל $n in NN$
  $
    abs(f^(n) (z))=n!/(2pi i) integral_({abs(w-z)=rho}) abs(f(w))/abs(w-z)^(n+1) dif w <= abs(n!/(2pi)) (max_(abs(w-z)=R) abs(f))/R^(n+1) dot.op L({abs(z-w)=R})=n!/R^n max_(abs(w-z)) abs(f)
  $
]
#theorem("משפט ליוביל")[
  אם $f in Hol(CC)$ ו־$f$ חסומה, אז $f$ קבועה.
]
#theorem("המשפט היסודי של האלגברה")[
  יהי $p$ פולינום מרוכב מדרגה של לפחות $1$, אז יש לו שורש.
]
#corollary[
  כל פולינום מדרגה $d$ ניתן לכתיבה כמכפלה $p(z)=a_0 product_(j=1)^d (z-z_k)$ עבור $z_k in CC$.
]
#theorem("משפט ערך הממוצע")[
  אם $f in Hol(G)$, $z in G$ ו־$rho<dist(z, partial G)$ אז
  $ f(z) = 1/(2pi) integral_(-pi)^pi f(z+rho e^(i t)) dif t $
  כלומר, $f(a)$ הוא הממוצע של הערכים ב־$partial B(z, rho)$.]
#theorem("עיקרון המקסימום")[
  אם $f in Hol(G) inter C(overline(G))$ ולא קבועה אז $abs(f)$ מקבלת מינימום ומקסימום גלובאליים על השפה של $G$.
]
#theorem("עיקרון פרגמן-לינדלוף")[
  יהי $G={z, re(z)>0}$ ו־$f in Hol(G)$ פונקציה חסומה המקיימת $abs(f(z))<=M$ לכל $z in partial G$.\
  אז $abs(f)<=M$ על $G$, כלומר $abs(f)$ חסומה על $G$.
]
#theorem("משפט היחידות 1")
#theorem("טענה שלפני משפט היחידות 2")
#theorem("משפט היחידות 2")


= איך פותרים תרגילים
== סינגולריות ומה שביניהם
=== מיפוי נקודות סינגולריות
#definition(
  "נקודה סינגולרית אינטגרבילית",
)[$x_0$ נקראת סינגולרית אינטגרבילית של $f:RR arrow.r RR^d$ אם $f$ רציפה על $RR without {x_0}$ ומתקיים
  $ integral_(x_0-epsilon)^(x_0 + epsilon) abs(f(t)) dif t < infinity $
  #remark[נקודה סינגולרית סליקה היא סינגולרית אינטגרבילית.]
]
#definition[עבור $a in CC$ נסמן ב־$U_a$ סביבה פתוחה של $z$ וב־$U_a^*$ את הסביבה המנוקבת $U_a without {a}$.]
#definition("נקודות סינגולריות")[
  תהיי $f in Hol(U_a^*)$. נסווג את הנקודות הסינגולריות של $f$ ב־$z=a$ באופן הבא
  + סליקה – ניתן להמשיך את $f$ לנקודה $a$ כך שתהיה הולומורפית (כלומר, אם $f|_(U_a^*)$ חסומה)
  + קוטב – הנקודה $a$ איננה סינגולריות סליקה וקיים $m>=1$ כך שלפונקציה $(z-a)^m f(z)$ יש סינגולריות סליקה ב־$a$.\
    נגדיר את סדר הקוטב של $f$ ב־$a$ להיות ה־$m$ המינימלי המקיים זאת.
  + עיקרית – הגבול $lim_(z arrow.r a) f(z)$ איננו קיים במובן הרחב
]
#theorem[
  $a$ קוטב של $f$ אם ורק אם $lim_(z arrow.r f(z)) = infinity$ (כלומר $lim_(z arrow.r a) abs(f(z))=infinity$).
]
#theorem(
  "הקשר בין טור לורן לבין נקודות סינגולריות",
)[
  נניח $f(z) = sum_(n=-infinity)^infinity c_n (z-a)^n$, אז
  + $a$ קוטב אם ורק אם קיים $m>=1$ כך שלכל $n<-m$ מתקיים $c_n = 0$ (כלומר , טור הלורן מכיל רק מספר סופי של חזקות שליליות )
  + $a$ סינגולרית עיקרית אם ורק אם טור הלורן מכיל אינסוף חזקות שליליות
]
#theorem(
  "משפט קורטוזי־ויירשטראס",
)[אם $a$ סינגולרית עיקרית של הפונקציה $f$, אז $V$, סביבה פתוחה של $a$, הקבוצה $f(V without {a})$ צפופה ב־$CC$ (כלומר $overline(f(V without {a}))=CC$).]
=== שאריות
#definition(
  "שארית בנקודה",
)[יהיו $a in CC$ ו־$f in Hol(U_a^*)$. נקבע $epsilon > 0$ כך ש־${0<abs(z-a)<epsilon} subset U_a^*$ ונגדיר את השארית ב־$a$ להיות
  $ res_f (a) = 1/(2pi i) integral_(abs(z-a)=epsilon) f(z) dif z $
]
#theorem(
  "משפט השארית של קושי",
)[יהי $G subset CC$ תחום טוב, $f in Hol((G without {a_1, a_2, dots.h, a_N} ) inter (overline(G) without {a_1, a_2, dots.h, a_N}))$. אזי
  $ 1/(2pi i) integral_(partial G) f(z) dif z = sum_(j=1)^N res_f (a_j) $]
#proposition[אם $f(z) = (phi(z))/(psi(z))$ מקיימת $psi(a)=0, phi(a) !=0, psi'(a) != 0$ אזי $res_f (a) = (phi(a))/(psi'(a))$.]
#proposition[אם $f in Hol(G without {a})$ ו־$a$ קוטב מסדר $n$, אזי
  $ res_f (a) = (((z-a)^n f(z))^(n-1) (a))/(n-1)! $]
#definition(
  "שארית באינסוף",
)[תהיי $f$ הולומורפית בסביבה של $infinity$ (כלומר $f in Hol({z in CC bar abs(z) > R_0})$ ונגדיר
  $ res_f (infinity) = -1/(2pi i) integral_(abs(z)=R) f(z) dif z space (R>R_0) $]
#proposition[השארית של #link(<log_derivative>, "נגזרת לוגריתמית") היא הסדר של האפס.\
]
#pagebreak()

== למצוא כמה פתרונות (כולל ריבויים)
#theorem(
  "משפט רושה",
)[תהיינה $f, g in Hol(G)$ ותהיי $H subset.eq G$ כך ש־$overline(H) subset.eq G$ ו־$H$ תחום טוב.\
  נניח שלכל $z in partial H$ מתקיים $abs(g(z))<=abs(f(z))$, אזי
  $ \# (Z_(f+g) inter H)=\# (Z_f inter H) $]
#corollary(
  "משפט גאוס",
)[תהיי $g(z)=sum_(k=0)^(n-1) a_k z^k$ וניקח $f(z)=a_n z^n$ כאשר $a_n in CC without {0}$. אז ל־$f+g$ יש $n$ אפסים (כולל ריבוי).]
#corollary("ריבויים בטבעת")[בהתאם לתנאי משפט רושה, ובהינתן $A={z in CC bar a < abs(z) < b}$ טבעת, אזי
  $ \#{"zeroes in" a<abs(z)<b}=\# {"zeroes in" abs(z)<b} -\# {"zeroes in" a<abs(z)} $]
#example[
  נמצא כמה פתרונות (כולל ריבועיים) יש למשוואות בתחומים הנתונים.
  + $z^7-5z^4+z^2-2=0$ בדיסק היחידה $DD$
  + $z^4+3z=1$ בטבעת ${z bar 1<abs(z)<2}$
  + $e^z=3z^n$ בחצי מישור ${z in CC bar re(z)<1}$ ו־$n in NN$
]
#solution[
  + נגדיר $p(z) = z^7-5z^4+z^2-2$ כאשר $g(z)=-5z^4$ ו־$f(z)=z^4+z^2-2$, על $abs(z)=1$ מתקיים
    $ abs(g(z))=abs(-5z^4)=5 wide abs(f(z))=abs(z^4+z^2-2)=0 $
    אז מתקיים $abs(f(z))<=abs(g(z))$ ול־$g$ יש אפס אחד בראשית בריבוי 4 ולכן ממשפט רושה נקבל שיש למשוואה $4$ פתרונות.
  + מהמסקנה אודות ריבויים בטבעת, נחלק לשתי בדיקות
    $ \#{"zeroes in" 1<abs(z)<2}=\# {"zeroes in" abs(z)<2} -\# {"zeroes in" 1<abs(z)} $
    + על $abs(z)=2$, נכתוב $p(z)=z^4+(3z-1)$ כאשר $g(z)=z^4$ ו־$f(z)=3z-1$ ומתקיים
      $ abs(g(z))=abs(z)^4=16 wide abs(f(z))=abs(3z-1)=5 $
      כלומר $abs(f(z))<abs(g(z))$ ולכן תנאי משפט רושה מתקיימים ולכן ל־$p$ יש את אותה כמות אפסים כמו ל־$g$ ול־$g$ יש אפס אחד בראשית, אבל עם הכפליות יש לו ארבע.
    + על $abs(z)=1$ נכתוב $p(z)=3z+(z^4-1)$ כאשר $g(z)=3z$ ו־$g(z)=z^4-1$ ומתקיים
      $ abs(g(z))=abs(3z)=3 wide abs(f(z))=abs(z^4-1)=0 $
      כלומר $abs(f(z))<abs(g(z))$ ולכן תנאי משפט רושה מתקיימים ולכן ל־$p$ יש את אותה כמות אפסים כמו ל־$g$ ול־$g$ יש אפס אחד בראשית עם ריבוי אחד.
    בסך־הכל קיבלנו $4-1=3$ כלומר $3$ פתרונות למשוואה הנתונה.
  + נגדיר $F(z)=3z^n-e^z$ ונסתכל קודם כל על דיסק היחידה, על $abs(z)=1$ מתקיים
    $ abs(f(z)) = abs(e^z)=e < 3 wide abs(g(z)) = abs(3z^n) = 3^n = 3 $
    ושוב מתנאי משפט רושה מתקיים $abs(f(z)) < abs(g(z))$ ולכן יש להם את אותה כמות אפסים, ול־$g$ יש ריבוי אחד בראשית עם ריבוי $n$. \
    נבחן מה קורה אם $abs(z)>=1$ ו־$re(z) <1$, אז
    $ abs(f(z))=abs(3z^n) >= 3 wide abs(g(z))=abs(e^z)=e^(re(z)) < e < 3 $
    כלומר
    $ abs(3z^n) > abs(e^z) ==> 3z^n-e^z != 0 $
    כלומר אין התאפסויות בתחום הזה בכלל.\
    לסיכום יש לנו $n$ אפסים, קרי $n$ פתרונות.
]

== טורי לורן
=== פיתוחים שימושים
+ $ abs(w)<1, space 1/(1-w)= sum_(n=0)^infinity w^n $
+ $ 1/(1+w) = sum_(n=0)^infinity (-1)^n w^n $
+ $ 1/(1-w)^k = sum_(n=0)^infinity binom(n+k-1, k-1)w^n $
+ $ e^z = sum_(n=0)^infinity z^n/n! $
+ $ abs(w)<1, space (1+w) = sum_(n=1)^infinity (-1)^(n+1) w^n/n $
+ $ sin(z)=sum_(n=0)^infinity (-1)^n z^(2n+1)/(2n+1)! $
+ $ cos(z)=sum_(n=0)^infinity (-1)^n z^(2n)/(2n)! $
+ $ abs(w)<1, space (1+w)^k sum_(n=0)^infinity binom(k, n)w^n $
=== How To Guide
נזכור שטור לורן הוא חמדן/זללן, ולכן מתכנס *בכל טבעת* שבו הוא רק יכול.\
אז בגדול זה בכל תחום שבו הוא מוגדר היטב (כלומר, הנקודות הסינגולריות שלו הן הנקודות קפיצה).\
לפעמים נרצה לעבור בשיטה של מרים ("שיטת מקדמים לא נקבעים") עם הפונקציות הרציונליות, לדוגמה
$
  z^2/((z-2)(z-4)) = z^2/(z^2-6z+8)=(z^2-6z+8+6z-8)/(z^2-6z+8) = 1 + (-6z+8)/(z^2-6z+8) \
  ==> (-6z+8)/(z^2-6z+8)=A/(z-2) + B/(z-4) = (A(z-4)+B(z-2))/(z^2-6z+8) = (z(A+B)-2(B+2A))/(z^2-6z+8) \
  cases(A+B=6, -2B-4A = -8)
$
פותרים את המערך משוואות, מקבלים פונקציה ומפתחים בהתאם: משתמשים בהגבלות כדי לחסום ולהגיע לטורים ידועים.\
תמיד נרצה להגיע לאחד מהטורים שרשום לעיל כי הם הכי קלים.
== תוכיחי קיום/אי קיום
