#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 03 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#question()
יהי $(X, cal(A), mu)$ מרחב מידה.

#subquestion()
נוכיח שאם $0<=f<=g$ אזי $integral_E f d mu <= integral_E g d mu$ לכל $E in cal(A)$.

#proof[
  בלי הגבלת הכלליות, $X=E$ אחרת ניקח לכל $E in cal(A)$,  $f dot.op bb(1)_(E), g dot.op bb(1)_(E)$ ועדיין נחשב אינטגרציה על כל $X$.\
  מההגדרה מתקיים
  $ integral f d mu = sup {integral_E s d mu bar 0<=s<=f, " פשוטה" s} $
  מהיות $0<=f<=g$ נובע גם שלכל $s$ כזאת מתקיים $0<=s<=g$ ולכן מתקיים
  $
    {integral_E s d mu bar 0<=s<=f, " פשוטה" s} subset.eq {integral_E s d mu bar 0<=s<=g, " פשוטה" s}
  $
  ובפרט בלקיחת סופרמום
  $
    integral f d mu = sup {integral_E s d mu bar 0<=s<=f, " פשוטה" s} subset.eq sup {integral_E s d mu bar 0<=s<=g, " פשוטה" s} = integral g d mu
  $
]

#subquestion()
נוכיח שאם $A subset.eq B$ ו־$f>=0$ אזי $integral_A f d mu <= integral_B f d mu$.

#proof[
  יהי $x in X$.\
  אם $x in A$ אז $bb(1)_(A)(x)=1$ ומהנתון $A subset.eq B$ מתקיים $bb(1)_(B)(x)=1$.\
  אם $x in.not A$ אזי $bb(1)_(A)(x)=0$ ויש שתי אפשרויות: או ש־$x in B$ או ש־$x in.not B$, כלומר או ש־$bb(1)_(B)(x)=1$ או ש־$bb(1)_(B)(x)=0$.\
  בין כה וכה, מכך ש-$A subset.eq B$ נובע כי בהתאמה מתקיים $bb(1)_(A)(x)<=bb(1)_(B)(x)$ לכל $x in X$.\
  בפרט נובע מכך שלכל $x in X$ מתקיים $f dot.op bb(1)_(A)(x) <= f dot.op bb(1)_(B)(x)$ והם בהתאמה מתאימים מהגדרה ל־$integral_A f d mu, integral_B f d mu$.\
  מהסעיף הקודם נובע אם כך ש־$integral_A f d mu <= integral_B f d mu$ (הסעיף הקודם הוא מונוטוניות האינטגרל) עבור $E = X$.
]

#subquestion()
אם $f>=0$ ו־$0<=c<=infinity$ אז $integral_E c f d mu = c integral_E f d mu$.

#proof[
  תהיי $E in cal(A)$, ותהיי $s<=f$ פונקציה פשוטה כך שמתקיים $s=sum_(i=1)^n alpha_i bb(1)_(E_i)$ עם $alpha_i >=0$ ו־${E_i}$ קבוצות זרות בזוגות ומדידות ב־$E$.\
  ראינו שמתקיים $integral_E s d mu = sum_(i=1)^n alpha_i mu(E_i)$.\
  נבחין שגם $c s$ היא פונקציה פשוטה שכן
  $
    c s (x) = sum_(i=1)^n (c alpha_i) bb(1)_(E_i)(x) ==> integral_E c s(x) d mu = sum_(i=1)^n (c alpha_i) mu(E_i) = c sum_(i=1)^n alpha i mu(E_i) = c integral_E s d mu
  $
  נסמן מהגדרה
  $
    integral_E f d mu = sup { integral_E s d mu bar 0<=s<=f, " פשוטה" s} = S_f \
    integral_E c f d mu = sup {integral_E p d mu bar 0<=p<=c f, " פשוטה" p} = S_(c f)
  $
  נשים לב שלכל $0<=p<=c f$, אם $c>0$ אז אם נגדיר פונקציה פשוטה $0<=s' = p/c <=f$ ומתקיים ממה שראינו לעיל, $ integral_E p d mu = integral_E c s d mu = c integral_E d mu $
  זה נכון לכל $p$ פשוטה כזאת ולכן
  $
    S_(c f) = sup {c integral_E s d mu bar 0<=s<=f, " פשוטה" s} =_"מכפלה עם סופרמה אי־שלילית" c dot.op sup { integral_E s d mu bar 0<=s<=f, " פשוטה" s} = c dot.op S_f
  $
  אם $c=0$, אנחנו רוצים להראות
  $ integral_E 0 dot.op f mu = 0 dot.op integral_E f d mu $
  בצד שמאל יש לנו פשוט את הפונקציה $g eq.triple 0$ וזאת כמובן פונקציה פשוטה ולכן $ integral_E 0 d mu = sum_(i=1)^n alpha_i mu(E_i) = sum_(i=1)^n 0 mu(E_i) = 0 $
  מצד שני, יש לנו $0 dot.op integral_E f d mu$ שתמיד כמובן שווה לאפס בזכות הקונבנציה $0 dot.op infinity = 0$.\
  עבור המקרה של $c=infinity$ התהליך זהה.
]

#question()
יהי $(X, cal(A), mu)$ מרחב מידה. \
נניח כי $N subset.eq X$ מוכלת בקבוצה ממידה אפס וש־$f : N^c arrow.r CC$ ונניח כי $f_1, f_2 :X arrow.r CC$ הרחבות מדידות של $f$ לכל $X$ \
(כלומר $f_1 display(harpoon.tr)_(N^c) = f_2 harpoon.tr_(N^c) = f$).\
נראה כי
$ integral_X f_1 d mu = integral_X f_2 d mu $

#proof[

]

#question()
יהי $(X, cal(A), mu)$ מרחב מידה ו־$(Y, cal(B))$ מרחב מדיד. תהיי $rho:X arrow.r Y$ העתקה מדידה בין שני המרחבים.\
נגדיר את הדחיפה קדימה של $mu$ על $rho$ לכל $E in cal(B)$ להיות
$ rho_*mu (E) colon.eq mu(rho^(-1)(E)) $

#subquestion()
נראה כי $rho_*mu$ היא אכן מידה.

#proof[
  עלינו להראות ש־$rho_*mu$ היא $sigma$־אדיטיבית ואיננה קבועה אינסוף (שקול לדרישה ש־$rho_*mu(emptyset)=0$).\
  ראשית כמובן היא אי־שלילית כי $mu$ מידה ולכן אי־שלילית.
  שנית, $rho$ היא העתקה מדידה ולכן $rho^(-1)(emptyset_Y) in cal(A)$ מהגדרה. בפרט,
  $ rho^(-1)(emptyset) = { x in X bar rho(x) in emptyset_Y} ==> rho^(-1)(emptyset_Y) = emptyset_X $
  כעת,$mu$ מידה ולכן $rho_*mu (emptyset_Y) = mu(rho^(-1)(emptyset_Y)) = mu(emptyset_X) = 0$ וזה סוגר את הלא קבועה אינסוף.\
  נשאר להראות שהיא מקיימת $sigma$־אדיטיביות: תהיי $(E_n)_(n=1)^infinity subset.eq cal(B)$ סדרת קבוצות מדידות זרות בזוגות. מתקיים
  $
    rho_*mu (union.big_(n=1)^infinity E_n) = mu(rho^(-1)(union.big_(n=1)^infinity E_n)) = mu(union.big_(n=1)^infinity rho^(-1)(E_n))
  $
  מהיות כל $E_i inter E_j = emptyset$ לכל $i!=j$ נובע כי $rho^(-1)(E_i) inter rho^(-1)(E_j) = emptyset_X$ מהגדרת $rho$ כפונקציה ולכן מוגדרת היטב, כלומר $(rho^(-1)(E_n))_(n=1)^infinity subset.eq X$ זה אוסף של קבוצות מדידות (כי $rho$ מדידה) שזרות בזוגות, ולכן מהיות $mu$ מידה היא מקיימת $sigma$־אדיטיביות, כלומר
  $ mu (union.big_(n=1)^infinity rho^(-1)(E_n)) = sum_(n=1)^infinity mu(rho^(-1)(E_n)) $
  כלומר קיבלנו שמתקיים  $ rho_*mu (union.big_(n=1)^infinity E_n) = sum_(n=1)^infinity mu(rho^(-1)(E_n)) $
  ולכן $rho_*mu$ היא אכן מידה.
]

#subquestion()
נראה כי לכל $f : Y arrow.r [0,infinity]$ מדידה
$ integral_X (f compose rho) d mu = integral_Y f d rho_*mu $

#proof[
  יהי $E in cal(B)$, נראה קודם כל עבור $f = bb(1)_(E)$:
  $ (f compose rho) (x) = f(rho(x)) = bb(1)_(E)(rho(x)) = mycases(1, rho(x) in E, 0m rho(x) in.not E) $
  אבל $rho(x) in E$ שקול ללהגיד $x in rho^(-1)(E)$, אז $f compose rho$ זה בעצם הפונקציה המציינת של $rho^(-1)(E)$, ואנחנו יודעים שמתקיים
  $ integral_X (f compose rho) = integral_X bb(1)_(rho^(-1)(E)) d mu = mu(rho^(-1)(E)) $
  מצד שני מתקיים מהיות $rho_*mu$ מידה
  $ integral_Y f d rho_*mu = integral_Y bb(1)_(E) d rho_*mu = rho_*mu(E) = mu(rho^(-1)(E)) $
  אז קיבלנו שיוויון במקרה הזה. \
  נעשה באותו האופן גם עבור פונקציות פשוטות: תהיי $s:Y arrow.r [0,infinity]$ פונקציה פשוטה, כלומר $s(y)=sum_(i=1)^n alpha_i bb(1)_(E_i)(y)$ שכמובן $alpha_i >=0$ וכן $E_i$ קבוצות מדידות זרות בזוגות ב־$Y$.\
  $ (s compose rho) (x) = sum_(i=1)^n alpha_1 bb(1)_(E_i)(rho(x)) = sum_(i=1)^(n) alpha_i (bb(1)_(E_i) compose rho)(x) $
  מלינאריות והומוגניות האינטגרל
  $
    integral_X (s compose rho) d mu = sum_(i=1)^(n) alpha_i integral_X (bb(1)_(E_i) compose rho) d mu =_"המקרה הקודם" sum_(i=1)^(n) alpha_i rho_*mu (E_i)
  $
  מצד שני למקרה זה מתקיים
  $ integral_Y s d rho_*mu = integral_Y sum_(i=1)^n alpha_i (bb(1)_(E_i) d rho_*mu = sum_(i=1)^n alpha_i rho_*mu (E_i) $
  כלומר שוב קיבלנו שיוויון ולכן הטענה נכונה גם עבור פונקציות פשוטות.\
  נשאר להראות עבור פונקציות אי־שליליות, אז תהיי $f : Y arrow.r [0,infinity]$ כזאת.\
  בהרצאה ראינו שלכל $f$ מדידה יש סדרת פונקציות פשוטות מונוטונית עולה $(s_n)_(n=1)^infinity$ כך שמתקיים $f = lim_(n arrow.r infinity) s_n$ וכן $s_n<=f$ לכל $n in NN$.\
  נשים לב שממשפט ההתכנסות המונוטונית על המרחב $(X, cal(A), mu)$ נקבל
  $
    f compose rho = lim_(n arrow.r infinity) (s_n compose rho) ==> integral_X (f compose rho) d mu = lim_(n arrow.r infinity) integral_X (s_n compose rho) d mu
  $
  מצד שני אם נפעיל את משפט ההתכנסות המונוטונית על המרחב $(Y, cal(B), rho_*mu)$ נקבל
  $ integral_Y f d rho_*mu = lim_(n arrow.r infinity) integral_Y s_n d rho_*mu $
  אבל ראינו שהטענה נכונה לפונקציות פשוטות, אז
  $ integral_Y s_n d rho_*mu = integral_X (s_n compose rho) d mu $
  וכמובן בפרט בלקיחת גבול
  $ lim_(n arrow.r infinity) integral_Y s_n d rho_*mu = lim_(n arrow.r infinity) integral_X (s_n compose rho) d mu $
  כלומר מטרכיטומיה
  $ integral_X (f compose rho) d mu = integral_Y f d rho_*mu $
  ואז הטענה נכונה לכל $f$ כנ"ל.
]

#subquestion()
נניח כי $X = [0, 2pi]$ ו־$Y=S^1$ שניהם עם $sigma$־אלגבראות בורל עליהם וכי $rho(x)=e^(i x)$.\
כמו־כן, נניח כי מידת לבג על $X$, כלומר מידה המחזירה לכל קטע את אורכו, קיימת ונסמנה ב־$lambda$. \
נתאר במילים את מה המידה $rho_*lambda$ מודדת.

#solution[
  זו בעצם המידה על מעגל היחידה שלוקח לכל קשת מדידה $E$ את האורך שלה.\
  #todo?
]

#question()
יהי $(X, cal(A), mu)$ מרחב מידה סופי. \
נוכיח כי לכל $f : X arrow.r [0,infinity)$ מדידה וחסומה מתקיים
$ integral f d mu = inf {integral phi d mu bar f<=phi, " פשוטה" phi } eq.colon underline(I) $

#proof[
  תהיי $f : X arrow.r [0, infinity)$ מדידה וחסומה.\
  מהחסימות נובע שיש $0<M<infinity$ כך שלכל $x in X$ מתקיים $f(x)<=M$.\
  מהגדרת אינטגרל לבג מתקיים
  $ integral_X f d mu = sup {integral_X psi d mu bar 0<=psi<=f, " פשוטה" phi} eq.colon overline(I) $
  במילים אחרות אנחנו רוצים להראות $underline(I)=overline(I)$ ולכן נראה $underline(I)<=overline(I)$ וכן $overline(I)<=underline(I)$.\
  נבחין שהכיוון $overline(I) <= underline(I)$ הוא ישיר, שכן אם $psi$ היא פונקציה פשוטה המקיימת $psi<=f$ ו־$phi$ היא פונקציה פשוטה המקיימת $f<=phi$ אז בהכרח מתקיים $psi<=phi$.\
  ממונוטוניות האינטגרל (שהוכחנו בשאלה $1$ סעיף א') ומאריתמטיקה של אינפימום וסופרמום מתקיים
  $ overline(I) = sup {integral_X psi d mu bar} <= inf {integral_X phi d mu } = underline(I) $
  שכן אם לכל $phi, psi$ מתקיים $psi<=phi$ אז גם הסופרמום של כל ה־$psi$־ים בהכרח יהיה קטן שווה לאינפימום של כל ה־$phi$־ים.\
  עבור הכיוון השני, נגדיר $g(x) = M - f(x)$ ומהנתון על החסימות של הפונקציה והמידה מתקיים $0<=g(x)<=M$ ומוגדרת היטב (אין חיסור עם אינסוף).\
  מתקיים
  $
    integral_X g d mu = integral_X (M-f) d mu =_((star)) integral_X M dot.op bb(1)_(X) d mu - integral_X f d mu =_((star star)) M mu(X) - overline(I)
  $
  כאשר $(star)$ נובע מלינאריות האינטגרל ומסעיף ב' בשאלה $1$ וכן מאדיטיביות המידה ו־$(star star)$ נובע מכך ש־$M dot.op bb(1)_(X)$ היא פונקציה פשוטה.\
  מצד שני, מתקיים מהגדרת האינטגרל עם סופרמה
  $ underline(I) = integral_X g d mu = sup {integral_X omega d mu bar 0<=omega<=g, " פשוטה" omega} $
  כלומר
  $ underline(I) = sup {integral_X omega d mu bar 0<=omega<=g, " פשוטה" omega} = M mu(X) - overline(I) $
  אם $0<=omega<=g=M - f$ אז $f<=M - omega$ אבל $nu = M - omega$ היא גם־כן פונקציה פשוטה ומתקיים $f<=nu$ ולכן $nu$ היא אחת הפונקציות שהשתמשנו בהן בבניית $underline(I)$, אז
  $ M mu(X) - overline(I) = sup {integral_X omega d mu bar f<=M - omega } $
  ומתקיים
  $
    integral_X omega d mu = integral_X (M - nu) d mu = integral_X M d mu - integral_X nu d mu = M mu(X) - integral_X nu d mu
  $
  אז
  $ M mu(X) - overline(I) = sup {M mu(X) - integral_X nu d mu bar f<=nu} $
  נזכר שעבור $C$ קבוע מתקיים $sup(C-S) = C - inf(S)$ ולכן
  $ M mu(X) - overline(I) = M mu(X) - inf{integral_X nu d mu bar f<=nu} $
  כלומר
  $ M mu(x) - overline(I) = M mu (X) - underline(I) ==> overline(I) = underline(I) $
  ולכן מטריכוטומיה מתקיים
  $ integral f d mu = inf {integral phi d mu bar f<=phi, " פשוטה" phi } $
]

#question()
נראה כי התנאים במשפט ההתכנסות המונוטונית הכרחיים.\
כלומר, נמצא דוגמה למרחב מידה $(X, cal(A), mu)$, לפונקציה מדידה $f:X arrow.r [0,infinity]$ ולסדרת פונקציות אי־שליליות $f_n$ (לאו דווקא מונוטונית ולאו דווקא $f_n <=f$), המתכנסת נקודתית ל־$f$ כך שמתקיים
$ integral f_n d mu arrow.r.not_(n arrow.r infinity) integral f d mu $

#solution[
  ניקח $X=[0,1]$ עם מידת לבג שאנחנו מאמינים שקיימת שנותנת לכל קטע את האורך שלו ונגדיר
  $ f_n (x) = mycases(n, x in (0,1/n], 0 "אחרת") $
  $f_n (x)$ בבירור איננה מונוטונית ולכל $x in [0,1]$ מתקיים
  $ f(x)=lim_(n arrow.r infinity) f_n (x) = 0 $
  אבל
  $
    lim_(n arrow.r infinity) integral_X f_n d mu = lim_(n arrow.r infinity) integral_((0,1/n]) n d mu = lim_(n arrow.r infinity) n dot.op mu((0,1/n]) = lim_(n arrow.r infinity) n dot.op 1/n = 1
  $
  מצד שני
  $ integral_X f d mu = integral_X 0 d mu = 0 $
  וכמובן $1!=0$.
]
