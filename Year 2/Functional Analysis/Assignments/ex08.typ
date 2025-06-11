#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 08 --- אנליזה פונקציונלית, 80417 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#let sgn = math.op("sgn")

#question()
יהי $[a,b]$ קטע. נוכיח שהמרחב $accent(C, tilde)[a,b]$ של פונקציות רציפות המקיימות $f(a)=f(b)$ צפוף בנורמה $norm(dot.op)_2$ במרחב $C[a,b]$ (ולכן גם ב־$L^2[a,b]$).

#proof[
  עלינו להראות שלכל $f in C[a,b]$ ולכל $epsilon > 0$ קיימת $g in accent(C, tilde)[a,b]$ כך שמתקיים
  $ norm(f-g)_2 < epsilon $
  וזה גורר צפיפות גם ב־$L^2[a,b]$ מכך שראינו ש־$C[a,b]$ צפופה ב־$L^2[a,b]$.\
  נגדיר את הקו הישר
  $ phi.alt(x) = f(a) + ((f(b)-f(a)) / (b-a))(x-a) $
  מתקיים $ phi.alt(a)=f(a) \
  phi.alt(b) = f(b) $
  ונגדיר
  $ h(x) = f(x) - phi.alt(x) $
  $h$ כמובן רציפה מאריתמטיקה של פונקציות רציפות ומתקיים $h(a)=0, h(b)=0$ ולכן $h in accent(C, tilde)[a,b]$.\
  נגדיר $psi in C[a,b]$ כך ש־$norm(psi-phi.alt)_2 < epsilon / 2$ (שקיימת כי $C[a,b]$ צפוף ב־$L^2[a,b]$).\
  אז
  $ g(x)=psi(x)-psi(a)+(psi(b)-psi(a)) / (b-a)(x-a) $
  מתקיימים כמה דברים:
  + $g in C[a,b]$
  + $g(a)=psi(a)-psi(a)+0=0$
  + $g(b)=psi(b)-psi(a)+psi(b)-psi(a)=2(psi(b)-psi(a))$
  אז נגדיר שוב
  $ mu(x)=g(x)-g(b) / (b-a)(x-a) $
  ושוב
  + $mu in C[a,b]$
  + $mu(a)=g(a)=0$
  + $mu(b)=g(b)-g(b) / (b-a)(b-a)=0$
  אז
  $ f_epsilon = h+mu $
  ונשים לב $f_epsilon in accent(C, tilde)[-pi,pi]$ כסכום של פונקציות ב־$accent(C, tilde)[-pi,pi]$, אז
  $ norm(f-f_epsilon)_2 = norm(f-(h+mu))_2 = norm(phi.alt - mu)_2 $
  שעבור $psi$ קטן דיו מתקיים $ norm(phi.alt-mu)_2 < epsilon => norm(f-f_epsilon)_2 < epsilon $
]

#question()
נחשב את מקדמי טור פוריה של הפונקציה האינטגרבילית $f(x)=sgn(x) dot.op (pi-abs(x)) / 2$, כאשר
$ sgn(x) = mycases(-1, x<0, 0, x=0, 1, x>0) $

#proof[
  ראשית נשים לב ש־$f(x)$ היא פונקציה אי־זוגית:
  $
    f(-x) = sgn(-x) dot.op (pi - abs(x)) / 2 =_(sgn(-x)=-sgn(x) \
    abs(-x)=abs(x)) -sgn(x) dot.op (pi - abs(x)) / 2 = -f(x)
  $
  בתרגול $8$ ראינו שעבור פונקציה אי־זוגית מתקיים $a_n = 0$ לכל $n in NN union {0}$.\
  כמו־כן, מכפלה של פונקציה אי־זוגית בפונקציה אי־זוגית היא פונקציה זוגית ועבור פונקציה זוגית $g$ מתקיים
  $ integral_(-a)^a g(x) d x = 2 integral_0^a g(x) d x $
  היות ו־$sin(x)$ פונקציה אי־זוגית, אז $f(x) dot.op sin(n x)$ היא פונקציה זוגית. \
  נחשב את $b_n$ לכל $n in NN$ מתקיים
  $
    b_n &= 1 / pi integral_(-pi)^pi f(x) dot.op sin((n x)) d x \
    &= 2 / pi integral_0^pi f(x) dot.op sin(n x) d x \
    &= 2 / (2pi) integral_0^pi (sgn(x) dot.op abs(x) dot.op sin(n x)) d x \
    &= 1 / pi integral_0^pi (pi - x) sin(n x) d x \
    &= 1 / pi (pi integral_0^pi sin(n x) d x - integral_0^pi x sin(n x)) \
    &= 1 / pi ([(-pi dot.op cos(n x)) / n]^pi_0 - [(sin(n x) / n^2 - (x cos(n x)) / n]^pi_0 ) \
    &= 1 / pi ((pi(-(-1)^n+1) / n + (pi(-1)^n) / n) \
    &= (-(-1)^n+1) / n + (-1)^n / n
  $
  עבור $n$ זוגי נקבל
  $ (-1+1) / n + 1 / n = 1 / n $
  ועבור $n$ אי־זוגי נקבל
  $ (1+1) / n + 1 / n = 1 / n $
  אז מצאנו שטור פורייה של $f$ הוא $sum_(n=1)^infinity 1 / n sin(n x)$.
]

#question()
נשתמש בזהות פרסבל על־מנת לחשב את סכומי הטורים בכל סעיף.\
ניזכר בשיוויון פרסבל מההרצאה: אם $f in accent(C, tilde)[-pi, pi]$ אז
$ 1 / (pi) integral_(-pi)^pi f^2(t)d t = abs(a_0)^2 / 2 + sum_(n=1)^infinity (abs(a_n)^2+abs(b_n)^2) $

#subquestion()
הטור $sum_(n=1)^infinity 1 / n^2$ בעזרת הפונקציה $f(x)=x$ ונסיק מהו סכום הטור $sum_(n=1)^infinity 1 / (2n-1)^2$.

#proof[
  נשים לב שמתקיים $f(-x) = -x$, משמע $f(x)$ היא פונקציה אי־זוגית ולכן לכל $n in NN union {0}$ מתקיים $a_n = 0$.\
  בפרט, ניתן להשתמש ב־$f(x)$ מהצפיפות של $accent(C, tilde)$ ב־$C$.\
  כמו־כן, בדומה לשאלה הקודמת מכיוון שמכפלה של פונקציות אי־זוגיות היא פונקציה זוגית, $f(x) sin(n x)$ היא פונקציה זוגית.\
  נחשב את $b_n$ לכל $n in NN$
  $
    b_n = 1 / pi integral_(-pi)^pi f(x) sin(n x) d x= 2 / pi integral_0^pi x sin(n x) d x = 2 / pi [sin(n x) / n-(x cos(n x)) / n]^pi_0 = 2 / (pi n) [sin(n x)-x cos(n x)] =2 / pi dot.op plus.minus pi / n = plus.minus 2 / n
  $
  ומשווין פרסבל
  $ 1 / pi integral_(-pi)^pi x^2 d x = 0^2 / 2 + sum_(n=1)^infinity (0^2+(2 / n)^2) = sum_(n=1)^infinity 4 / n^2 $
  ומצד שני, באגף שמאל רשום
  $ 1 / pi integral_(-pi)^pi x^2 d x = 1 / pi [x^3 / 3]^(pi)_(-pi) = (2pi^2) / 3 $
  ובסך־הכל
  $ (2pi^2) / 3 = sum_(n=1)^infinity 4 / n^2 <==> pi^2 / 6 = sum_(n=1)^infinity 1 / n^2 $
  ואנחנו כבר יודעים שזה אכן ערך הסכום. \
  נעבור ללהסיק את סכום הטור $sum_(n=1)^infinity 1 / (2n-1)^2$.\
  קודם כל נבין שהטור סוכם את החזקות של המספרים האי־זוגיים ובאותו אופן הטור $sum_(n=1)^infinity 1 / (2n)^2=sum_(n=1)^infinity 1 / (4n^2)$ סוכם את החזקות של המספרים הזוגיים. ולכן
  $
    sum_(n=1)^infinity 1 / n^2 = sum_(n=1)^infinity 1 / (2n-1)^2 + sum_(n=1)^infinity 1 / (2n)^2 = sum_(n=1)^infinity 1 / (2n-1)^2 + sum_(n=1)^infinity 1 / (4n^2)
  $
  ולכן
  $
    sum_(n=1)^infinity 1 / n^2 = sum_(n=1)^infinity 1 / (2n-1)^2 + sum_(n=1)^infinity 1 / (4n^2) <==> pi^2 / 6 = sum_(n=1)^infinity 1 / (2n-1)^2 + 1 / 4 dot.op pi^2 / 6 \
    <==> pi^2 / 6 - pi^2 / 24 = sum_(n=1)^infinity 1 / (2n-1)^2 <==> (3pi^2) / 24 = sum_(n=1)^infinity 1 / (2n-1)^2 <==> pi^2 / 8
  $
]

#pagebreak()

#subquestion()
הטור $sum_(n=1)^infinity 1 / (2n-1)^4$ בעזרת הפונקציה $f(x)=abs(x)$.

#proof[
  הפונקציה $f(x)$ היא פונקציה זוגית, ואנחנו יודעים שמכפלה של פונקציה זוגית בפונקציה זוגית היא פונקציה זוגית ומכפלה של פונקציה זוגית בפונקציה אי־זוגית היא פונקציה אי־זוגית.\
  לכן, $f(x) sin(n x)$ היא פונקציה אי־זוגית והאינטגרל שלה על קטע סימטרי הוא $0$, על־כן, $b_n = 0$ לכל $n in NN$. \
  נחשב את $a_n$ לכל $n in NN$
  $
    a_n = 1 / pi integral_(-pi)^pi f(x) dot.op cos(n x) d x = 2 / pi integral_0^pi x dot.op cos(n x) d x = (2((-1)^n-1)) / (pi n^2)
  $
  עבור $a_0$ נקבל
  $
    a_0 = 1 / pi integral_(-pi)^pi f(x) dot.op cos(0 x) d x = 1 / pi integral_(-pi)^pi x d x = 2 / pi integral_(0)^pi x d x = 2 / pi [x^2 / 2]^pi_0 = pi
  $
  נשתמש כעת בשיוויון פרסבל ונקבל
  $
    1 / pi integral_(-pi)^pi f^2 (x)d x = pi^2 / 2 + sum_(n=1)^infinity (abs(((2((-1)^n-1)) / (pi n^2))^2)+0) = pi^2 / 2 + sum_(n=1)^infinity 4 / (pi n^4) abs((-1)^n-1)
  $
  כאשר באגף שמאל יש לנו מהיות $f^2 (x)$ פונקציה זוגית
  $ 1 / pi integral_(-pi)^pi f^2 (x)d x = 2 / pi integral_0^pi x^2 d x = 2 / pi [x^3 / 3]^pi_0 = (2pi^2) / 3 $
  ולכן
  $
    (2pi^2) / 3=pi^2 / 2 + sum_(n=1)^infinity ((2((-1)^n-1)) / (pi n^2)+0) <==> pi^2 / 6 = sum_(n=1)^infinity 4 / (pi n^4) abs((-1)^n-1) \
  $
  נשים לב שעבור $n$ זוגי הערך שיתווסף לסכום הוא $0$ ולכן לא משפיע על ערך הטור, ולכן נסתכל רק על הערכים האי־זוגיים $ a_(2k-1) = -4 / (pi(2k-1)^2) => a^2_(2k-1) = 16 / (pi^2(2k-1)^4) $ ונקבל
  $ pi^2 / 6 = sum_(k=1)^infinity 16 / (pi^2(2k-1)^4) <==> pi^4 / 96 = sum_(k=1)^infinity 1 / (2k-1)^4 $

]

#question()
נוכיח את מבחן ה־$M$ של ויירשטראס: יהיו $I subset.eq RR$ קטע, $(f_n)_(n=1)^infinity$ סדרת פונקציות רציפות בקטע $I$ ו־$(M_n)_(n=1)^infinity subset.eq RR$ כך שלכל $n$ מתקיים $abs(f_n)_infinity < M_n$ בקטע $I$.\
אם הטור $sum_(n=1)^infinity M_n$ מתכנס אז $ f(x) = sum_(n=1)^infinity f_n (x) $
מוגדרת היטב בקטע $I$, רציפה שם והטור מתכנס אליה במידה שווה.

#proof[
  לכל $N in NN$ מתקיים מהנתון $sum_(n=1)^N f_n (x) < sum_(n=1)^N M_n$, לכל $x in I$.\
  אין תלות ב־$x$ ומסנדוויץ' נקבל ש־$f$ מוגדרת בכל $I$ ושההתכנסות היא במידה שווה.\
  נראה ש־$f$ רציפה: יהי $epsilon > 0$, מתקיים
  $
    abs(f(x)-f(y))<=abs(f(x)-sum_(n=1)^N f_n (x))+abs(sum_(n=1)^N (f_n (x)- f_n (y))) + abs(sum_(n=1)^N f_n (y) - f(y))
  $
  מההתכנסות במידה שווה קיים $N in NN$ מקסימלי כך שמתקיים
  $ abs(f(x)-sum_(n=1)^N f_n (x))<=epsilon / 3, space abs(f(y)-sum_(n=1)^N f_n (y))<=epsilon / 3 $
  לכל $n<=N$ מרציפות $f_n$ קיים $delta>0$ כך שלכל $abs(x-y)<delta$ מתקיים
  $ abs(sum_(n=1)^N (f_n (x) - f_n (y)))<=epsilon / 3 $
  ולכן $abs(f(x)-f(y))<=epsilon$ וקיבלנו ש־$f$ רציפה במידה שווה ובפרט רציפה.
]

#question()
תהיי $f in accent(C, tilde)[-pi, pi]$ כך ש־$f' in accent(C, tilde)[-pi, pi]$ (בפרט, $f$ גזירה ברציפות). \
נסמן ב־$a_n^f,b_n^f$ את מקדמי טור פורייה של $f$ וב־$a_n^', b_n^'$ את מקדמי טור פורייה של $f'$.

#subquestion()
נוכיח שלכל $n in NN$ מתקיים $a_n = -1 / n b_n^'$ וכן $b_n = 1 / n a_n^'$.

#proof[
  מתקיים
  $
    a_n^f = 1 / pi integral_(-pi)^pi f(x) dot.op cos(n x) d x=_"אינטגרציה בחלקים"1 / (pi n) [f(x) dot.op sin(n x)]^(pi)_(-pi) - integral_(-pi)^pi f'(x) dot.op sin(n x) d x \
    =_(f in accent(C, tilde)[-pi, pi] \
    sin(x)=-sin(x)) -1 / (pi n) integral_(-pi)^pi f'(x) dot.op sin(n x) = -1 / n b^'_n
  $
  ההוכחה עבור $b_n^f$ זהה.
]

#subquestion()
ניזכר ש־$(a_n^')_(n=1)^infinity,(b_n^')_(n=1)^infinity in l^2$ ונסיק ש־$(a_n)_(n=1)^infinity, (b_n)_(n=1)^infinity in l^1$ ובפרט שטור פורייה של $f$ מתכנס במידה שווה.

#proof[
  מתקיים
  $
    sum_(n=1)^infinity abs(a_n^f) =_"סעיף א'" sum_(n=1)^infinity 1 / n abs(b_n^')<=_"אי־שיוויון קושי־שוורץ" underbrace((sum_(n=1)^infinity 1 / n^2)^(1 / 2), < infinity)underbrace((sum_(n=1)^infinity abs(b_n^')^2)^(1 / 2), < infinity "מהתזכורת") < infinity
  $
  ובאותו אופן
  $
    sum_(n=1)^infinity abs(b_n^f) =_"סעיף א'" sum_(n=1)^infinity 1 / n abs(a_n^')<=_"אי־שיוויון קושי־שוורץ" underbrace((sum_(n=1)^infinity 1 / n^2)^(1 / 2), < infinity)underbrace((sum_(n=1)^infinity abs(a_n^')^2)^(1 / 2), < infinity "מהתזכורת") < infinity
  $
  ונשים לב שגם
  $
    (sum_(n=1)^infinity abs(b_n^')^2)^(1 / 2)<= norm(f')_2, space (sum_(n=1)^infinity abs(a_n^')^2)^(1 / 2)<=norm(f')_2
  $
  ולכן הטור $(a_0^f) / 2 + sum_(n=1)^infinity (a_n^f cos(n x) + b_n^f sin(n x))$ מקיים את תנאי משפט $M$ של ויישטראס ולכן הוא מתכנס במידה שווה ובהחלט
  $
    a_0^f + sum_(n=1)^infinity (a_n^f cos(n x) + b_n^f sin(n x))<=_(abs(sin(x))<=1, abs(cos(x))<=1) a_0^f + sum_(n=1)^infinity (abs(a_n^f) + abs(b_n^f))
  $
]

#subquestion()
נסיק שהטור מתכנס לפונקציה $f$ במידה שווה, כלומר בנורמת $norm(dot.op)_infinity$.

#proof[
  זה נובע ישירות מהסעיף הקודם: מכך ש־$sum_(n=1)^infinity (abs(a_n^f) + abs(b_n^f)) < infinity$ נובע כי הטור מגדיר פונקציה $g in accent(C, tilde)[-pi,pi]$ המוגדרת על־ידי
  $ g(x)=a_0^f / 2+sum_(n=1)^infinity (a_n^f cos(n x) + b_n^f sin(n x)) $
  אבל אז ל־$f$ ול־$g$ יש את אותם מקדמי פורייה, ושתיהן ב־$accent(C, tilde)[-pi,pi]$ ולכן הן חייבות להיות זהות (שכן אחרת, ההפרש שלהן מוביל למקדמי פורייה שמתאפסים ולכן גם לכל $N$ מתקיים ש־$S_N^(f-g)$ מתאפס ואז בפרט $lim_(N arrow.r infinity) norm((f-g)-S_N^(f-g))_infinity = 0$), ולכן
  $norm(S_N^f -f)_infinity arrow.r 0$, כנדרש.
]
