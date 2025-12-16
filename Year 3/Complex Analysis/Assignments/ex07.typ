#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 07 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נניח שאם $G$ תחום כוכבי אז לכל $f in Hol(G)$ יש פונקציה קדומה.\
נסיק את משפט קושי בתחום כוכבי: תהיי $S$ תחום כוכבי חסום ו־$G$ סביבה של $S$. אז לכל $f in Hol(G)$ מתקיים $integral_(partial S) f dif gamma = 0$.\
_תזכורת (קבוצה כוכבית)_: קבוצה $S subset.eq RR^n$ נקראת כוכבית אם קיים $x_0 in S$ כך שלכל $x in S$ מתקיים $[x_0, x] subset.eq S$.

#proof[
  #todo
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
