#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מבחן 2025א' --- תורת הקבוצות, 80200 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)
#show sym.lt.eq: math.scripts


#question()
#subquestion()
הגדירו מהי קבוצה סופית.

#proof[
  תהיי $A$ קבוצה, נגיד כי $A$ סופית אם קיים $n in NN$ כך שמתקיים $abs(A) = abs([n])$ כאשר $[n] = {0, 1, dots.h.c, n-1}$ ושיוויון עוצמות אומר שקיימת פונקציה $f: A arrow.r [n]$ שהיא חד־חד ערכית ועל.
]

#subquestion()
נוכיח כי לכל קבוצה סופית $A$, אם $F: A arrow.r A$ היא חד־חד ערכית אז $F$ על.

#proof[\
  מהיות $A$ סופית נובע שקיים $n in NN$ כך שמתקיים $abs(A)=abs([n])$.\
  אם $n=0$ הטענה נכונה באופן ריק ולכן נניח ש־$n!=0$.\
  יהי $n_0$ המספר הטבעי המינימלי עבורו קיימת פונקציה $F:A arrow.r [n_0]$ חד־חד ערכית ונטען ש־$F$ על: \
  נניח בשלילה שיש $k in.not op("range")(F)$ ונסתכל על $H : [n_0] arrow.r [n_0]$ המחליפה בין $k$ לבין $n_0-1$, כלומר $ H(j) = mycases(k, j=n_0-1, n_0-1, j=k, j, j!=n_0-1 and j!=k) $
  נסתכל על $H compose F$, נבחין ש־$H compose F: A arrow.r [n_0-1]$ והיא חד־חד ערכית.\
  מתקיים $n_0-1 in.not op("range")(H compose F)$ (כי $k in.not op("range")(F)$ ולכן לא ייתכן שנקבל $(H compose F)(x) = n_0-1$ כי $F(x) != k$), ולכן $H compose F$ היא פונקציה חד־חד ערכית מ־$A$ ל־$[n_0-1]$, בסתירה למינימליות $n_0$ וקיבלנו סתירה להנחה כי $F$ לא על.\
  כלומר $abs(A)=abs([n_0])$ (מהגדרת שיוויון עוצמות), אבל $abs(A)=abs([n])$ ולכן $abs([n])=abs([n_0])$, כלומר $n_0=n$.\
  את הטענה האחרונה צריך להראות בגדול באינדוקציה, אבל זה נובע מכיוון ש־$abs([n])=abs([n_0]) ==> abs({0, dots.h.c, n-1})=abs({0, dots.h.c, n_0-1})$.
]

#question()
#subquestion()
נחשב את עוצמת הקבוצה ${f: NN arrow.r NN bar "חד־חד ערכית" f}$.

#solution[
  נסמן $A colon.eq {f: NN arrow.r NN bar "חד־חד ערכית" f}$.\
  *באמצעות משפט קנטור־שרדר־ברנשטיין*:\
  ראשית נבחין שמתקיים $A subset.eq {f : NN arrow.r NN} colon.eq B = NN^NN$ וונטען שמתקיים $abs(NN^NN) = 2^(aleph_0)$:\
  ניקח את $NN$ להיות נציג של $aleph_0$ ואת $[2]$ להיות נציג של $2$.\
  $>=$: נשים לב שמתקיים $[2]^NN subset.eq NN^NN$ כלומר $abs([2]^NN)<= abs(NN^NN)$ כלומר $2^(aleph_0) <= abs(NN^NN)$.\
  $<=$: נשים לב שמתקיים $NN^NN subset.eq cal(P)(NN times NN)$ שכן $f : NN arrow.r NN$ היא סדרת הזוגות הסדוריים ${(n, f(n)) bar n in NN }$ כלומר $f : NN arrow.r NN subset.eq NN times NN$.\
  ראינו שמתקיים $abs(NN times NN) = abs(NN)$ ולכן $abs(NN^NN) <= abs(cal(P)(NN times NN)) = abs(cal(P)(NN)) = 2^(aleph_0)$.\
  ממשפט קנטור־שרדר־ברנשטיין מתקיים $abs(NN^NN) = aleph_0$, ומהיות $A subset.eq B$ מתקיים $abs(A) <= 2^(aleph_0)$.\
  בשביל הצד השני, נבחין כי $C={0,1}^NN$ סט כל הסדרות הבינאריות האינסופיות $(b_0, b_1, dots.h.c)$.\
  נגדיר $phi : {0,1}^NN arrow.r A$ כך שלכל רצף $b$ מתקיים $f_b (n) = 2n + b_n$; כלומר, אם $b_n=0$ אז $f_b (n)$ זוגי ואחרת אי־זוגי.\
  נבחין שכל $f_b (n)$ היא חד־חד ערכית ממונוטוניות עולה ממש בגלל $n$.\
  אם $b!=b'$ אז יש $k$ כך שמתקיים $b_k != b'_k$, כלומר $f_b (k) != f_(b') (k)$ ולכן $f_b != f_(b')$ ולכן $phi$ פונקציה חד־חד ערכית ומתקיים $abs({0,1}^NN)<=abs(A)$.\
  כעת נטען שמתקיים $abs({0,1}^NN)=2^(aleph_0)$ וזה פשוט נובע מאריתמטיקה של עוצמות שכן $abs({0,1}) = 2$ ולכן $abs({0,1}^NN)=2^(aleph_0)$.\
  ראינו שמתקיים $abs(A)<=2^(aleph_0)$ וגם שמתקיים $2^(aleph_0) <=abs(A)$ ולכן ממשפט קנטור־שרדר־ברנשטיין מתקיים $abs(A)=2^(aleph_0)$.\
  *באמצעות טיעון אלכסון*: \
  נניח בשלילה ש־$A$ בת־מנייה ולכן יש $sigma: NN arrow.r A$ פונקציה על ונסמן $sigma(n) = sigma_n$.\
  נגדיר $f:NN arrow.r NN$ בצורה רקורסיבית:
  $ f(0)=min NN without {sigma_0 (0)} $
  כלומר, $0$ אם $sigma_0 (0) != 0$ ו־$1$ אם אחרת.\
  נגדיר
  $ f(n+1) = min NN without {f(0), dots.h.c, f(n), sigma_(n+1) (n+1)} $
  נטען ש־$f:NN arrow.r NN$ היא חד–חד ערכית ושונה מכל $sigma_n$.\
  לכל $n in NN$ מתקיים $sigma_n (n) != f(n)$ ונשאר רק להראות שהיא חד־חד ערכית: נניח שהיא לא חד־חד ערכית, אז יהי $n$ המינימלי כך שעבורו קיים $m<n$ המקיים $f(n)=f(m)$,
  אבל $f(n)=f((n-1)+1)$, כלומר $f(n) in.not {f(0), dots.h.c, f(n-1)}$ וזו סתירה ולכן $f$ חד־חד ערכית וזו סתירה להיות $sigma$ על, ולכן $A$ לא בת־מנייה.
]

#subquestion()
נחשב את עוצמת הקבוצה $A colon.eq {f : NN arrow.r RR bar "חד־חד ערכית" f}$.

#solution[
  ראשית נשים לב שמתקיים $A subset.eq {f : NN arrow.r RR}=RR^NN$ ומאריתמטיקה של עוצמות $ abs(RR^NN)=(2^(aleph_0))^(aleph_0) = 2^(aleph_0 dot.op aleph_0) =_((star)) 2^(aleph_0) $ כאשר $(star)$ נובע מכך שראינו $abs(NN times NN) = abs(NN)$ (מטלה 1).\
  מצד שני, ניזכר שמתקיים $abs(RR) = abs((0,1))=2^(aleph_0)$, ולכל $a in (0,1)$ נגדיר $f_a : NN arrow.r RR$ על־ידי $f_a (n)+n+a$ ו־$f_a$ חד־חד ערכית.\
  בפרט, לכל $a_1 != a_2 in (0,1)$ מתקיים לכל $n in NN$
  $ f_(a_1) (n) = a_1 + n != a_2 + n = f_(a_2) $
  נגדיר $B$ להיות אוסף הפונקציות הנ"ל ונקבל $abs(B)=2^(aleph_0)$.\
  נבחין שמתקיים $B subset.eq A$ ולכן $abs(B)=2^(aleph_0)<=abs(A)$.\
  ראינו שמתקיים $abs(A)<=2^(aleph_0)$ וגם שמתקיים $2^(aleph_0) <=abs(A)$ ולכן ממשפט קנטור־שרדר־ברנשטיין מתקיים $abs(A)=2^(aleph_0)$.\
]
