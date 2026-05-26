#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 03 --- תבניות ריבועיות ומספרים $P$־אדיים, 80507 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
#question()
#question()

#question()
#question()
#question()

#question()
#question()
יהי $FF$ שדה סופי ו־$norm(dot.op) : FF arrow RR^plus$ נורמה, נוכיח כי $norm(dot.op)$ טריוויאלית.

#proof[
  עלינו להראות ש־$norm(x)=1$ לכל $0!=x in FF$ וכמובן מתקיים תמיד מהגדרת הנורמה $norm(0)=0$.\
  נסמן $m = abs(FF^times)=abs(FF without {0})$ ובגלל שהשדה סופי $m=abs(FF)-1$.\
  לפי משפט לגראנז' מחבורות לכל $x in FF^times$ מתקיים
  $ x^m=1 $
  אם ניקח נורמה, מכפליות הנורמה נקבל
  $ norm(x^m) = norm(1) <==> norm(x)^m = 1 $
  אבל $norm(x) in RR^plus$ והמספר הממשי החיובי היחידי שמעלים בחזקת $m>=1$ מקבלים $1$ הוא $1$ בלבד ולכן $norm(x)=1$ והנורמה טריוויאלית.
]

#question()
יהי $FF = QQ,RR,CC$ ויהי $alpha in RR$ כך ש־$0<alpha<1$ ונגדיר $norm(dot.op) : FF arrow RR^plus$ על־ידי $norm(a)=abs(a)^alpha$. נוכיח כי $norm(dot.op)$ היא נורמה ארכימדית.

#proof[
  עלינו קודם להראות שזוהי נורמה ואכן
  + הפונקציה אי־שלילית ולכל $a in FF$ מתקיים
    $ norm(a) = 0 <==> abs(a)^alpha = 0 <==> abs(a) = 0 <==> a =0 $
  + כפליות – לכל $a,b in FF$ מתקיים
    $
      norm(a dot.op b) = abs(a dot.op b)^alpha = (abs(a) dot.op abs(b))^alpha = abs(a)^alpha dot.op abs(b)^alpha = norm(a) dot.op norm(b)
    $
  + אי־שיוויון המשולש – יהיו $a,b in FF$ ומאי־שיוויון המשולש הסטנדרטי מתקיים $abs(a+b)<=abs(a)+abs(b)$.\
    הפונקציה $f(x)=x^alpha$ היא פונקציה קעורה עבור $0<alpha<1$ ומהתת־אדטיביות של פונקציות קעורות אי־שליליות מתקיים
    $ f(x+y) <= f(x)+f(y) ==> (x+y)^alpha <= x^alpha + y^alpha $
    ולכן
    $ (abs(a)+abs(b))^alpha <= abs(a)^alpha + abs(b)^alpha = norm(a)+norm(b) $
    כלומר
    $ norm(a+b)<=norm(a)+norm(b) $
  בהרצאה ראינו ש־$(FF, norm(dot.op))$ ארכימדי אם ורק אם קיים $n in NN$ כך ש־$norm(n)>1$ כלומר $lim_(n arrow.r infinity) norm(n)=infinity$.\
  נבחר $n=2$ ולכן $ norm(2)=abs(2)^alpha = 2^alpha $
  מכך ש־$0<alpha<1$ נובע ש־$2^alpha > 1$ ולכן מהטענה מההרצאה קיבלנו ארכימדיות.
]

#question()
יהי $(FF, norm(dot.op))$ שדה נורמי ו־$a in FF$. נוכיח כי $norm(a)<1$ אם ורק אם $lim_(n arrow.r infinity) a^n = 0$.

#proof[
  כזכור מאינפי1, אם $(a_n)_(n=1)^infinity$ סדרה אזי
  $ lim_(n arrow.r infinity) a_n = 0 <==> lim_(n arrow.r infinity) abs(a_n) = 0 $
  ובאותו אופן
  $ lim_(n arrow.r infinity) a_n = 0 <==> lim_(n arrow.r infinity) norm(a_n)=0 $
  $<==$ נניח ש־$norm(a)<1$ ולכן
  $ lim_(n arrow.r infinity) norm(a^n) = lim_(n arrow.r infinity) norm(a)^n = 0 $
  כאשר השיוויון הראשון זה מכפליות הנורמה והשיוויון השני זה מאריתמטיקה של גבולות של אינפי1 ואפשר לראות זאת כי זו גם סדרה הנדסיתץ.\
  מהתזכורת לעיל נובע גם $lim_(n arrow.r infinity) a^n = 0$.\
  $==>$ נניח ש־$lim_(n arrow.r infinity) a^n = 0$ ולכן מהתזכורת בפרט $lim_(n arrow.r infinity) norm(a)^n = 0$.\
  נניח בשלילה שהטענה לא נכונה ולכן נחלק למקרים
  + אם $norm(a)=1$ אז זו סדרה קבועה של $1$ ובפרט הגבול שלה לא יכול להיות אפס
  + אם $norm(a)>1$ אז מאריתמטיקה של גבולות מאינפי1 מתקיים $lim_(n arrow.r infinity) norm(a)^n = infinity$ כי הסדרה מתבדרת אבל זאת שוב סתירה
  אז ייתכן רק ש־$norm(a)<1$.
]

#question()
יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי ויהיו $a in FF, 0<r in RR$ ו־$b in B_r (a)$ כאשר $B_r (a) colon.eq {x in FF bar norm(x-a)<r}$. נוכיח כי $B_r (a) = B_r (b)$.

#proof[
  מהיות השדה הנורמי לא ארכימדי הוא מקיים את אי־השיוויון האולטרה מטרי, כלומר $norm(a+b)<=max(norm(a), norm(b))$.\
  נשים לב שמספיק שנוכיח $B_r (a) subset.eq B_r (b)$ כי הכיוון השני יהיה סימטרי ברגע שנוכיח ש־$b in B_r (a)$ ואז החלפת תפקידים מראה את הנדרש.\
  $B_r (a) subset.eq B_r (b)$: יהי $c in B_r (a)$ ולכן $norm(a-c)<r$, נרצה להראות ש־$norm(b-c)<r$ גם כן
  $ norm(b-c) = norm(b-a + a-c) = norm((b-a) + norm(a-c))<=_("אי־שיוויון האולטרה מטרי") max(norm(b-a), norm(a-c)) $
  אבל $norm(a-c) < r$ וגם $norm(b-a)$ כי $b in B_r (a)$ ולכן $norm(b-c)<r$ כלומר $c in B_r (b)$ וקיבלנו את ההכלה והטענה נובעת.
]

#question()
יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי ויהיו $a in FF, 0<r in RR$.

#subquestion()
נוכיח שהקבוצה $B_r (a) colon.eq {x in FF bar norm(x-a)<=r}$ היא קבוצה פתוחה.

#proof[
  יהי $b in B_r (a)$ כלומר $norm(b-a)<=r$ ונגדיר
  $ B_r (b) colon.eq {x in FF bar norm(x-b)<r} $
  מתקיים $B_r (b) subset.eq B_r (a)$ כי אם $c in B_r (b)$ אז $norm(c-b)<r$. מכיוון שהשדה לא ארכימדי מתקיים אי־שיוויון האולטרה מטרי ונקבל
  $ norm(c-a)=norm((c-b)+(b-a)) <= max(norm(c-b), norm(b-a)) <= r $
  כי $norm(c-b)<r$ ו־$norm(b-a)<=r$ כלומר $c in B_r (b)$ וקיבלנו $B_r (b) subset.eq B_r (a)$ ולכן לכל נקודה ב־$B_r (a)$ יש סביבה פתוחה המוכלת בקבוצה כלומר הקבוצה פתוחה.
]

#subquestion()
נוכיח שהקבוצה $B_r (a) colon.eq {x in FF bar norm(x-a)<r}$ היא קבוצה סגורה.

#proof[
  קבוצה היא סגורה אם המשלים שלה הוא קבוצה פתוחה, אז נבחן את
  $ C_r (a) = (B_r (a))^c = {x in FF bar norm(x-a)>=r} $
  נשחזר את ההוכחה מהסעיף הקודם, יהי $b in C_r (a)$ ולכן $norm(b-a)>=r$.\
  נגדיר $B_r (b) colon.eq {x in FF bar norm(x-b)<r}$ ונראה כי $B_r (b) subset.eq C_r (a)$: אם בשלילה זה לא נכון נובע שקיימת $c in B_r (a)$ כלומר $c in B_r (b)$ עבורה מתקיימים
  $ cases(c in B_r(b) ==> norm(c-b)<r, c in B_r (a) ==> norm(c-a)<r) $
  ושוב מאי־שיוויון המשולש האולטרה מטרי
  $ norm(b-a)=norm((b-c)+(c-a))<=max(norm(b-c), norm(c-a)) < r $
  אבל זאת סתירה להנחה ש־$b in C_r (a)$ וקיבלנו סתירה להנחת השלילה ולכן $B_r (b) subset.eq C_r (a)$ ולכן מהגדרה $C_r (a)$ היא פתוחה ומהגדרת המשלים, $B_r (a)$ סגורה.
]

#question()
יהי $(FF, norm(dot.op))$ שדה נורמי לא ארכימדי ויהיו $a,b in FF$ עם $a!=b$.\
נוכיח כי קיימות קבוצות פתוחות $S,T subset.eq FF$ כך שמתקיים $a in S, b in T$ עבורן $S inter T = emptyset$ ו־$S union T = FF$.

#proof[
  ראשית נבחין שמכיוון ש־$a!=b$ כמובן נובע $norm(a-b)>0$ אז נבחר $r=norm(a-b)$ ולכן נוכל להגדיר
  $
    S=B_r (a) = {x in FF bar norm(x-a)<r} \
    T = S^c = (B_r (a))^c = {x in FF bar norm(x-a)>=r}
  $
  אז ברור כמובן ש־$S inter T = emptyset$ וכן $S union T = FF$ ואכן $a in S$ שכן $norm(a-a)=0<r$ ובאופן טריוויאלי גם $b in T$ שכן $norm(a-b)=r>=r$.\
  $S$ פתוחה ככדור פתוח ובשאלה הקודמת ראינו שהיא גם סגורה ולכן המשלים שלה שהוא אינו אלא $T$ הוא קבוצה פתוחה גם כן והטענה נובעת.
]
