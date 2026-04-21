#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 02 --- מבוא לטופולוגיה, 80516 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
בכל אחד מהסעיפים נמצא מפורשות את $A^circle.small$ ואת $partial A$.

#subquestion()
$X=RR$, $tau$ הטופולוגיה הנוצרת על־ידי הבסיס $A=(0,1), space cal(B)={[a,b) bar a,b in RR}$.

#solution[
  מהגדרת הבסיס $cal(B)$ הקבוצות הפתוחות הן איחוד של קטעים מהצורה $[a,b)$.\
  בשביל הפנים של $A$, אנחנו רוצים את כל $x in (0,1)$ כך שקיים צירוף של הבסיס המקיים $[x, x+epsilon) subset.eq (0,1)$ וזה יניב ש־$x in interior(A)$.\
  עבור $0<x<1$ נוכל לבחור כל $epsilon>0$ קטן דיו המקיים $[x, x+epsilon) subset (0,1)$.\
  אם $x=0$ אז כל סביבה היא מהצורה $[0, epsilon)$ עבור כל $epsilon>0$ אבל $0 in.not (0,1)$ ולכן $x in.not interior(A)$ ובאופן דומה עבור $x=1$ נקבל $x in.not interior(A)$.\
  בסך־הכל קיבלנו $interior(A)=(0,1)$.\
  בשביל הסגור, כל $x in closure(A)$ אם כל סביבה של $x$ נחתכת עם $A$.\
  עבור $0<x<1$ ברור ש־$x in closure(A)$, אם $x=0$ אז לכל $epsilon>0$ מתקיים $[0, epsilon) inter (0,1) != emptyset$ ולכן $0 in closure(A)$ אבל אם $x=1$ אז לכל $epsilon>0$ מתקיים \
  $[1, 1+epsilon) inter (0,1) = emptyset$ ולכן $1 in.not closure(A)$.\
  בסך־הכל קיבלנו $closure(A)=[0,1)$.\
  נשאר למצוא את השפה והיא $boundary(A)=closure(A) without interior(A)=[0,1) without (0,1)={0}$.
]

#subquestion()
$X=RR$ עם $tau$ הטופולוגיה הקו־סופית על $X$ ו־$A=(0,1)$.

#solution[
  $x in A$ היא נקודה פנימית אם קיימת $U$ פתוחה כך ש־$x in U subset.eq A$ ונניח ש־$U subset.eq (0,1)$ פתוחה ולא ריקה ומהיותה פתוחה נובע מהטופולוגיה הקו־סופית ש־$RR without U$ היא סופית ולכן $U$ מכילה אינסוף מספרים ממשיים אבל $(0,1)$ זה קטע חסום וזו סתירה ולכן $interior(A)=emptyset$.\
  בטופולוגיה הקו־סופית על $RR$ הקבוצות הסגורות הן הקבוצות הסופיות או $RR$ ולכן כל קבוצה סגורה היא מהצורה $F=RR without U$ כאשר $U$ פתוחה ואנחנו מחפשים את כל הקבוצות הסגורות $F$ עבורן $(0,1) subset.eq F$.\
  ברור כי קבוצה סופית לא מכילה את $(0,1)$ משיקולי עוצמות ולכן הקבוצה הסגורה היחידה שמכילה את $A$ היא $RR$ ולכן $closure(A)=RR$.\
  נשאר למצוא את השפה והיא $boundary(A)=closure(A) without interior(A)=RR without emptyset=RR$.
]

#subquestion()
$X=(0,1) union [2,3]$ עם $tau$ הטופולוגיה המושרית מהטופולוגיה הסטנדרטית על $RR$ ו־$A=X$.

#solution[
  ראשית נציין שבכל מרחב טופולוגי $(X, tau)$ מתקיים ש־$X, emptyset$ הן קבוצות סגוחות (גם סגורות וגם פתוחות) כי מהגדרת הטופולוגיה, $X,emptyset$ הן קבוצות פתוחות והן המשלים אחת של השנייה ולכן נובע שהן גם סגורות.\
  הגדרנו את הפנים של $A$ להיות הפתוחה המקסימלית המוכלת ב־$A$ ולכן $interior(A)=interior(X)=X=(0,1) union [2,3]$.\
  הגדרנו את הסגור של $A$ להיות הסגורה המינימלית שמכילה את $A$ ולכן $closure(A)=closure(X)=X=(0,1) union [2,3]$.\
  נובע מכך ש־$boundary(A)=closure(A) without interior(A)=X without X = emptyset$.
]

#subquestion()
$A={f in C([0,1]) bar f(0)=0}, space X=C([0,1])={f : [0,1] arrow RR bar "רציפה" f}$ עם $tau$ הטופולוגיה המושרית מהמטריקה
$ d(f,g) = sup_(x in [0,1]) abs(f(x)-g(x)) $

#solution[
  תהיי $f in A$, אם $f in interior(A)$ יש $epsilon>0$ כך ש־$B_epsilon (f) subset.eq A$ ונסתכל על $g(x)=f(x)+epsilon/2$.\
  נבחין כי $g(x) in B_epsilon (f)$ כי $d(f,g)=epsilon/2 < epsilon$ אבל מתקיים $g(x) in.not A$ כי $g(0)=f(0)+epsilon/2 = epsilon/2 !=0$ וזה נכון לכל $epsilon>0$ ולכן לא ייתכן כדור כזה ונקבל $interior(A)=emptyset$.\
  נשים לב שאנחנו במרחב מטרי ובמרחב מטרי קבוצה היא סגורה אם ורק אם היא מכילה את כל הנקודות הגבוליות שלה:
  תהיי $(f_n)_(n=1)^infinity in A$ ולכן לכל $n in NN$ מתקיים $f_n (0) = 0$ ונניח ש־$f_n arrow f in C([0,1])$ תחת המטריקה הנתונה אבל המטריקה הנתונה גוררת התכנסות במידה שווה ולכן לכל $x$ מתקיים $f_n (x) arrow f(x)$ ובפרט $f_n (0) arrow f(0)$ מכך ש־$f_n (0) = 0$ לכל $n in NN$ נובע $f(0)=0$ ולכן $f in A$ וקיבלנו ש־$A$ סגורה ולכן $closure(A)=A$.\
  נובע מכך ש־$boundary(A)=closure(A) without interior(A)=A without emptyset=A$.
]

#subquestion()
$X=RR$ עם $tau$ הטופולוגיה הסטנדרטית על $RR$ ו־$A=((0,1) inter QQ) union [2,3]$.

#solution[
  שוב הפנים הוא האיחוד של כל הקטעים הפתוחים $(a,b) in A$ ונסמן $A_1 = (0,1) inter QQ, space A_2 = [2,3]$.\
  מהגדרת הפנים, לא ניתן להכיל אף קטע $(a,b) in ((0,1) inter QQ)$ כי כל קטע $(a,b) in RR$ מכיל מספר אי־רציונלי ולכן $interior(A_1) = emptyset$ ונשים לב שמהגדרה $interior(A_2) = (2,3)$ ומהיות הפנים הקבוצה הפתוחה המקסימלית המוכלת ב־$A$ נובע כי $interior(A)=(2,3)$.\
  ראינו בתרגול שמתקיים $closure(A)=closure(A_1) union closure(A_2)$ ומכך ש־$closure(A_2)=A_2$ (כי היא קבוצה סגורה ב־$RR$), נשאר רק למצוא את $closure(A_1)$ שמדרך חישוב זהה לסעיף א' נקבל $closure(A)=[0,1]$.\
  בסך־הכל קיבלנו $closure(A)=[0,1] union [2,3]$.\
  נובע מכך ש־$boundary(A)=closure(A) without interior(A) = ([0,1] union [2,3]) without (2,3) = [0,1] union {2,3}$.
]

#question()
יהיו $(X, tau_X), (Y, tau_Y)$ מרחבים טופולוגיים.\
יהיו $A subset.eq X, B subset.eq Y$ תתי־קבוצות ויהיו ${S_i}_(i in I)$ אוסף של תתי־קבוצות של $X$.

#subquestion()
נפריך את הטענה שמתקיים $union.big_(i in I) closure(S_i)=closure(union.big_(i in I) S_i)$.\

#proof[
  ניקח $X=RR$ עם הטופולוגיה הסטנדרטית וניקח $S_n = {1/n}$.\
  כל $S_n$ הוא יחידון ולכן סגור ועל־כן $closure(S_n) = S_n$ ובפרט $union.big_(n in NN) closure(S_n)={1/n bar n in NN}$ ומצד שני מתקיים $closure(union.big_(n in NN) S_n) = {1/n bar n in NN} union {0}$ ולכן לא מתקיים שיוויון.\
]

#subquestion()
נפריך את הטענה שמתקיים $inter.big_(i in I) closure(S_i)=closure(inter.big_(i in I) S_i)$.

#proof[
  ניקח $X=RR$ עם הטופולוגיה הסטנדרטית ונגדיר $S_n = (0,1/n)$.\
  מצד אחד מתקיים $closure(S_n)=[0, 1/n]$ ולכן $inter.big_(n in NN) closure(S_n) = {0}$ ומצד שני מתקיים $inter.big_(n in NN) S_n = emptyset$ ולכן $closure(inter.big_(n in NN) S_n)=closure(emptyset)=emptyset$ כמובן מתקיים ${0} != emptyset$ ולכן לא מתקיים שיוויון.
]

#subquestion()
נוכיח את הטענה $interior(A) times interior(B) = interior((A times B))$ כשבצד ימין הפנים הוא ביחס לטופולוגיית המכפלה על $X times Y$.

#proof[
  הגדרנו את טופולוגיית המכפלה על $X times Y$ להיות הטופולוגיה הנוצרת על־ידי הבסיס $cal(B) = {U times V bar U in tau_X, space V in tau_Y}$.\
  בכיוון הראשון, יהי $(x,y) in interior(A) times interior(B)$ ולכן קיימות $U subset.eq A, space V subset.eq B$ פתוחות עם $x in U, space y in V$ ולכן $U times V subset.eq A times B$ ומהגדרת הבסיס של טופולוגיית המכפלה $U times V$ פתוחה ב־$X times Y$ ולכן $(x,y) in interior((A times B))$.\
  בכיוון השני, יהי $(x,y) in interior((A times B))$ ושוב מהגדרת הבסיס יש $U times V subset.eq A times B$ פתוחה עבורה $(x,y) in U times V$.\
  מכך ש־$U subset.eq A$ ו־$V subset.eq B$ נובע אם־כך $x in interior(A)$ ו־$y in interior(B)$ (אפשר לראות גם עם פונקציות ההטלות שרציפות) ולכן $(x,y) in interior(A) times interior(B)$.\
  הראינו הכלה דו־כיוונית ולכן יש שיוויון.
]

#question()
#subquestion()
יהי $X=RR^n$ ונסיים את ההוכחה לכך שהאוסף
$ cal(F)={Z(S) bar S subset.eq RR[t_1, dots.h, t_n]} $
מגדיר אוסף של קבוצות סגורות ביחס לטופולוגיה על $RR^n$.\
_תזכורת:_ בהינתן קבוצת פולינומים ב־$n$ משתנים $S subset.eq RR[t_1, dots.h, t_n]$ קבוצת האפסים של $S$ מוגדרת להיות
$ Z(S) colon.eq {x in RR^n bar forall f in S, space f(x)=0} = inter.big_(f in S) f^(-1)(0) $

#proof[
  נשאר להראות שהאוסף $cal(F)$ סגור לחיתוכים: נוכיח שאם ${S_i}_(i in I)$ קבוצות של פולינומים אזי $ inter.big_(i in I) Z(S_i) = Z(union.big_(i in I) S_i) $
  יהי $x in inter.big_(i in I) Z(S_i)$ ולכן לכל $i in I$, $x in Z(S_i)$ ולכל $f in S_i$ מתקיים $f(x)=0$ ולכן בפרט $f(x)=0$ לכל $f in union.big_(i in I) S_i$ ולכן \
  $x in Z(union.big_(i in I) S_i)$.\
  בכיוון השני, יהי $x in Z(union.big_(i in I) S_i)$ ולכן לכל $f in union.big_(i in I) S_i$ מתקיים $f(x)=0$.\
  בפרט, לכל $i$ ולכל $f in S_i$ מתקיים $f(x)=0$ ולכן לכל $i$ מתקיים $x in Z(S_i)$ ולכן $x in inter.big_(i in I) Z(S_i)$.
]

#subquestion()
נראה שטופולוגיית זריסקי על $RR$ היא הטופולוגיה הקו־סופית.

#proof[
  נגדיר לכל $S subset.eq RR[t]$
  $ Z(S)={x in RR bar forall f in S, space f(x) = 0} $
  ובטופולוגיה הקו־סופית הקבוצות הסגורות הן כל תתי־הקבוצות הסופיות של $RR$ ו־$RR$ עצמו.\
  אנחנו יודעים שלפולינום שאיננו $0$ ב־$RR[t]$ יש כמות סופית של שורשים ב־$RR$ ולכן $Z(f)$ הוא סופי או ש־$Z(f)=RR$ כאשר $f eq.triple 0$.\
  אם $f in S$ ו־$f eq.triple.not 0$ מתקיים
  $ Z(S) = inter.big_(g in S) Z(g) subset.eq Z(f) $
  ולכן $Z(S)$ היא קבוצה סופית ונקבל מכך $tau_("Zariski") subset.eq tau_("confinite")$.\
  נרצה להראות את הכיוון השני ולכן ניקח $F={a_1, a_2, dots.h, a_k} subset.eq RR$ ונגדיר את הפולינום
  $ f(t)=(t-a_1)(t-a_2) dots.h.c (t-a_k) $
  ולכן $Z(f)=F$ ובפרט $Z(0)=RR$ ולכן $tau_("Zariski") supset.eq tau_("confinite")$.\
  הראינו הכלה דו־כיוונית ולכן $tau_("Zariski") = tau_("confinite")$.
]

#question()
יהי $(X, tau)$ מרחב טופולוגי ותהיי $A subset.eq X$.

#subquestion()
יהי $x in X$, נוכיח ש־$x in boundary(A)$ אם ורק אם לכל סביבה $x in E$ מתקיים $E inter A eq.not emptyset$ וגם $E inter A^c eq.not emptyset$.

#proof[
  בכיוון הראשון נניח ש־$x in boundary(A)$ כלומר $x in closure(A)$ ו־$x in.not interior(A)$ ותהיי $E$ סביבה של $x$ ולכן קיימת $U$ פתוחה כך ש־$x in U subset.eq E$.\
  נניח בשלילה ש־$E inter A=emptyset$ ולכן מהגדרה $E subset.eq A^c$ ומכך ש־$U subset.eq E$ נובע $U subset.eq A^c$ ולכן $U inter A = emptyset$ כלומר $A subset.eq U^c$.\
  $U$ פתוחה ולכן מהגדרת הסגור נובע $closure(A) subset.eq U^c$ אבל $x in closure(A)$ ולכן $x in U^c$ וזו סתירה לכך ש־$x in U$ ולכן $E inter A != emptyset$.\
  נניח בשלילה ש־$E inter A^c=emptyset$ כלומר $E subset.eq A$ ולכן $U subset.eq A$ ומהגדרת הפנים נובע ש־$U subset.eq interior(A)$ ובפרט $x in interior(A)$, אבל זאת סתירה לכך ש־$x in.not interior(A)$ ולכן $E inter A !=emptyset$.\
  בכיוון השני נניח שלכל סביבה $x in E$ מתקיים $E inter A eq.not emptyset$ וגם $E inter A^c eq.not emptyset$ ומספיק שנראה ש־$x in closure(A)$ וגם $x in.not interior(A)$ ונקבל $x in boundary(A)$.\
  נניח בשלילה ש־$x in.not closure(A)$ ולכן $x in (closure(A))^c$ וזו קבוצה פתוחה ולכן $E = closure(A)^c$ זו סביבה של $x$ ומההנחה $E inter A = emptyset$.\
  אבל $A subset.eq closure(A)$ ולכן גם $(closure(A))^c subset.eq A^c$ ונובע מכך ש־$E inter A = (closure(A))^c inter A subset.eq A^c inter A = emptyset$ וזאת סתירה ולכן $x in closure(A)$.\
  נניח בשלילה ש־$x in interior(A)$ ולכן מהגדרה $interior(A) subset.eq A$ וזו קבוצה פתוחה אז נגדיר $E=interior(A)$ זו סביבה של $x$ ומההנחה שלנו נובע ש־$E inter A^c!=emptyset$ אבל $E inter A^c subset.eq A inter A^c = emptyset$ וזאת סתירה ולכן $x in.not interior(A)$.
]

#subquestion()
נוכיח $boundary(A)=closure(A) inter closure((X without A))$.

#proof[
  בכיוון הראשון, יהי $x in boundary(A)$ כלומר $x in closure(A)$ וגם $x in.not interior(A)$ ולכן לכל סביבה פתוחה $U$ של $x$ מתקיים $U inter (X without A) !=emptyset$ ומהסעיף הקודם מתקיים$x in closure((X without A))$ ולכן $x in closure(A) inter closure((X without A))$.\
  בכיוון השני, יהי $x in closure(A) inter closure((X without A))$ ולכן כל סביבה $U$ של $x$ מקיימת $U inter A != emptyset$ וגם $U inter (X without A) !=emptyset$ ובפרט $x in.not interior(A)$ אזי $x in closure(A) without interior(A)$ כלומר $x in boundary(A)$.
]

#subquestion()
נוכיח $boundary((X without A))= partial A$.

#proof[
  מהסעיף הקודם עבור $A = X without A$ ומהיות החיתוך קומוטטיבי
  $
    boundary((X without A))= closure((X inter A)) inter closure((X without (X without A)))=closure((X without A)) inter closure(A) = closure(A) inter closure((X without A))
  $
]

#subquestion()
נוכיח $boundary((closure(A))) subset.eq boundary(A)$ ונמצא דוגמה שבה יש הכלה ממש.

#proof[
  מסעיף ב' נקבל
  $
    boundary((closure(A)))= closure(closure(A)) inter closure((X without closure(A))) = closure(A) inter closure((X without closure(A)))
  $
  מכך ש־$A subset.eq closure(A)$ נובע
  $ X without closure(A) subset.eq X without A $
  וממונוטוניות הסגור
  $ overline(X without closure(A)) subset.eq closure(X without A) $
  ולכן
  $
    boundary(closure(A)) = closure(A) inter closure(X without closure(A)) = closure(A) inter closure((X without A)) = boundary(A)
  $
  בשביל הדוגמה הנגדית ניקח $A = QQ inter [0,1]$ ומצפיפות והשאלה האחרונה מתקיים $ closure(A)=[0,1], space
  boundary(A)=[0,1], space
  boundary(closure(A))={0,1}, space
  [0,1] subset.eq.not {0,1} $
]

#question()
#subquestion()
נוכיח ש־$QQ$ צפופה ב־$RR$ ביחס לטופולוגיה הסטנדרטית.

#proof[
  הטופולוגיה הסטנדרטית על $RR$ היא האחת הנוצרת על־ידי קטעים פתוחים $(a,b)$ עבור $a,b in RR$ ו־$a<b$.\
  תהיי $U in tau$ כך ש־$U!=emptyset$ ונרצה להראות ש־$U inter QQ != emptyset$ וזה יספיק כי $U inter QQ supset.eq (a,b) inter QQ$ כי אם $U!=emptyset$ קיימים $a<b$ כך שמתקיים $(a,b) subset.eq U$.\
  אז מספיק שנמצא $q in (a,b)$ ונשתמש בארכימדיות של $RR$: לכל $x in RR$ קיים $n in NN$ כך ש־$n>x$.\
  אז עבור $b-a>0$ קיים $n in NN$ כך שמתקיים $1/n <_((star)) b-a$ ונסתכל על הקבוצה
  $ {k in ZZ bar k/n > a} $
  זו קבוצה לא ריקה מאינסופיות השלמים ולכן מעיקרון הסדר הטוב יש לה מינימום $k_0$ כך שמתקיים
  $ k_0/n > a, wide (k_0-1)/n <=a $
  ולכן
  $ k_0/n <= a+1/n <_((star)) a+(b-a)=b $
  כלומר
  $ a < k_0/n < b ==> k_0/n in (a,b) $
  וזה מספר רציונלי ולכן $U inter QQ != emptyset$ וקיבלנו ש־$QQ$ צפופה ב־$RR$ ביחס לטופולוגיה הסטנדרטית.
]

#subquestion()
נתאר את כל הקבוצות הצפופות ב־$ZZ$ ביחס לטופולוגיה הקו־סופית.

#proof[
  תהיי $A subset.eq ZZ$ צפופה ב־$A$.\
  כל קבוצה פתוחה לא ריקה $U$ בטופולוגיה הקו־סופית מקיימת ש־$ZZ without U$ היא סופית ולכן $U=ZZ without F$ עבור $F$ סופית כלשהי.\
  מהגדרת הצפיפות אנחנו מחפשים $(ZZ without F) inter A !=emptyset$ כלומר $A subset.eq.not F$ ולכן לא ייתכן ש־$A$ מוכלת בקבוצה סופית כלשהי.\
  אם $A$ סופית אז ניקח $U=ZZ without A$ שהיא פתוחה ולא ריקה מסופיות $A$ ולכן $U inter A = emptyset$ ולכן קבוצות סופיות הן לא צפופות.\
  נניח ש־$A$ קבוצה אינסופית ולכן אם ניקח $U = ZZ without F$ כאשר $F$ סופית נובע $A subset.eq.not F$ ולכן $A inter (ZZ without F)!=emptyset$ כלומר $U inter A !=emptyset$ וקיבלנו את ההגדרה לצפיפות.\
  לכן כל תתי־הקבוצות הצפופות ב־$ZZ$ ביחס לטופולוגיה הקו־סופית זה כל תת־קבוצה אינסופית של $ZZ$.
]
