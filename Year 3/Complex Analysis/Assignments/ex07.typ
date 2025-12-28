#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 07 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נניח ש־$G$ תחום כוכבי ונוכיח שלכל לכל $f in Hol(G)$ יש פונקציה קדומה.\
נסיק את משפט קושי בתחום כוכבי: תהיי $S$ תחום כוכבי חסום עם שפה $C^1$ למקוטעין בעלת אורך סופי (כלומר, ניתן לתאר את השפה בעזרת מסילה גזירה ברציפות ולמקוטעין) ו־$G$ סביבה של $S$. אז לכל $f in Hol(G)$ מתקיים $integral_(partial S) f dif gamma = 0$.\
_תזכורת (קבוצה כוכבית)_: קבוצה $S subset.eq RR^n$ נקראת כוכבית אם קיים $x_0 in S$ כך שלכל $x in S$ מתקיים $[x_0, x] subset.eq S$.

#proof[
  יהי $z_0 in G$ עבורו לכל $z in G$ מתקיים $[z_0, z] subset.eq G$, נעזר ברמז ונגדיר
  $ F(z) = integral_([z_0, z]) f(z) dif z $
  מהיות $f$ אנליטית, אז עבור $z_1 in G$ ו־$epsilon>0$ יש $delta>0$ כך ש־$B_delta (z_1) subset.eq G$ ומתקיים לכל $z_2 in B_delta (z_1)$
  $ (star) space abs(f(z_1)-f(z_2))<epsilon $
  ולכן ניקח $z_2 in B_delta (z_1)$ ונקבל $[z_1,z_2] subset.eq B_delta (z_1) subset.eq G$.\
  ניקח משולש $T$ להיות המשולש עם הקודקודים $z_0, z_1, z_2$.\
  נשים לב שאם $y in T$, יש $x in [z_1, z_2]$ כך ש־$y in [z_0, x]$, אבל $x in G$ ולכן $[z_0, x] subset.eq G$ ו־$y in G$.\
  לכן מתקיימים כל התנאים למשפט קושי במשולש ומתקיים
  $ integral_(partial T) f(z) dif z = 0 $
  נכתוב את המשולש בדרך אחרת מלינארית האינטגרל
  $ integral_([z_0,z_1]) f(z) dif z + integral_([z_1, z_2]) f(z) dif z + integral_([z_2, z_0]) f(z) dif z = 0 $
  וכן
  $
    F(z_2) - F(z_1) = integral_([z_0, z_2]) f(z) dif z - integral_([z_0, z_1]) f(z) dif z = -integral_([z_2, z_0]) f(z) dif z - integral_([z_0, z_1]) f(z) dif z = integral_([z_1, z_2]) f(z) dif z
  $
  ולכן בפרט מתקיים
  $
    abs(F(z_2) - F(z_1) - (z_2-z_1)f(z_1)) = abs(integral_([z_1, z_2]) (f(z)-f(z_1)) dif z) <=_((star)) abs(integral_([z_1, z_2]) epsilon dif z)=epsilon abs(z_2-z_1)
  $
  אבל זה בידיוק אומר
  $ F'(z_1) = lim_(z_2 arrow.r z_1) (F(z_2)-F(z_1))/(z_2-z_1) = f(z_1) $
  וזה נכון לכל $z_1 in G$, כלומר $F$ קדומה של $f$.\
  נעבור לחלק השני – הסקה של משפט קושי בתחום כוכבי: תהיי $gamma : [a,b] arrow.r G$ מסילה סגורה, אז ממה שהוכחנו לעיל מתקיים $f(z)=F'(z)$, אז
  $
    integral_gamma f(z) dif z = integral_a^b f(gamma(t))gamma'(t) dif t = integral_a^b F'(gamma(t))gamma'(t) dif t =_"כלל שרשרת" integral_a^b dif/(dif t) (F(gamma(t))) dif t =_"המשפט היסודי" F(gamma(b))-F(gamma(a)) = 0
  $
  כאשר המעבר האחרון נובע מהיות המסילה מסילה סגורה, כלומר $gamma(b)=gamma(a)$.\
  נסמן $gamma = partial S$, מסילה סגורה ורציפה למקוטעין בעלת אורך סופי והטענה נובעת.
]

#question()
תהיי $f in Hol(B(z_0, R))$ אז לכל $n in NN union {0}$ ולכל $r<R$ ראינו שמתקיים כמסקנה ממשפט קושי
$ abs(f^(n) (z_0))<=n!/r^n M_(f, z_0) (r) $
ונניח ש־$f$ הולומורפית.
_תזכורת_: בהינתן $f : CC arrow.r CC$ רציפה, נגדיר $M_(f,z_0) (r) = max_(z in B(z_0, r)) abs(f(z))$.

#subquestion()
נוכיח שאם $f$ לא קבועה אז לכל $z_0$ קיים קבוע $C$ כך שלכל $r$ גדול מספיק $m_(f, z_0)>=C(r+1)$.

#proof[#todo]

#subquestion()
נוכיח שאם
$ lim_(r arrow.r infinity) (log M_(f, z_0) (r))/log(r) = N < infinity $
אז $N in NN union {0}$

#proof[#todo]


#question()
יהיו $G$ תחום כוכבי ו־$f in Hol(G)$ שלא מתאפסת.\
נוכיח שיש ל־$f$ לוגריתם, כלומר קיימת פונקציה $g in Hol(G)$ כך ש־$e^(g(z))=f(z)$.

#proof[#todo]

#question()
תהיי $f: CC arrow.r CC$ שלמה, כלומר הולומורפית בכל המישור.

#subquestion()
נוכיח כי $f$ קבועה תחת ההנחה שלכל $z in CC$ מתקיים $re(f(z))<=0$.

#proof[
  ניקח $g(z) = e^z$, פונקציה הולומורפית שעומדת בתנאי הרמז.\
  מתקיים  $ abs((g compose f)(z))=e^(re(f(z))) abs(e^(i im(f(z)))) = e^(re(f(z))) dot.op 1 <=_((star)) e^0 = 1 $
  כאשר $(star)$ נובע מההנחה.\
  אז $g compose f$ היא פונקציה הולומורפית (כהרכבה של פונקציות הולומורפיות) וחסומה, ולכן אנחנו עומדים בכל תנאי משפט ליוביל ונקבל ש־$g compose f$ קבועה.\
  לא ייתכן כי $g$ קבועה שכן $g$ היא פונקציית האקספוננט, ולכן נקבל מכך ש־$f$ חייבת להיות קבועה כדי ש־$g compose f$ תהיה קבועה.\
  אז $f$ קבועה, כנדרש.
]

#subquestion()
נוכיח כי $f$ קבועה תחת ההנחה שלכל $z in CC$ מתקיים $abs(f(z))!=1$.

#proof[
  $f$ הולומורפית ולכן רציפה ומהנתון ניתן להסיק שמתקיים $abs(f(z))>1$ או $abs(f(z))<1$ לכל $z in CC$.\
  אם $abs(f(z))<1$ אז $f$ חסומה ושלמה וממשפט ליוביל סיימנו.\
  אם $abs(f(z))>1$ ולכן גם $abs(1/f(z))<1$ לכל $z in CC$ ושוב ממשפט ליוביל $abs(1/f(z))$ חסומה ושלמה ולכן קבועה ולכן גם $f(z)$ קבועה.
]

#subquestion()
לכל $z in CC$ מתקיים $f(z) in.not (-infinity, 0]$.

#proof[
  נעזר ברמז: ל־$f$ יש לוגריתם ולכן שורש, אז ניקח $g(z)=z^i=e^(i Log(z))$ ולכן
  $
    abs((g compose f)(z))=abs(e^(i log abs(z)- Arg(z))) = abs(e^(i log abs(z))) dot.op abs(e^(-Arg(z))) <= 1 dot.op e^pi
  $
  אז בדומה לסעיף א', $g compose f$ הולומורפית, שלמה וחסומה ולכן ממשפט ליוביל קבועה ומשיקולים דומים לסעיף א', $f$ קבועה.
]
