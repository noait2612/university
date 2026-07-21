#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 05 --- תבניות ריבועיות ומספרים $P$־אדיים, 80507 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהי $FF$ שדה, $a in RR$ כך ש־$0<alpha<1$. נסמן ב־$FF((X^(-1)))$ את ההשלמה של $FF(X)$ ביחס לנורמה $abs(dot.op)_alpha$ ונסמן ב־$FF[[X^(-1)]]$ את חוג השלמים ב־$FF((X^(-1)))$.

#subquestion()
נוכיח שלכל $s in ZZ$ ולכל סדרה $(a_n)_(n=s)^infinity subset.eq FF$ הטור $sum_(n=s)^infinity a_n X^(-n)$ מתכנס ב־$FF((X^(-1)))$.

#proof[
  בשדה עם נורמה לא ארכימדית שלם טור מתכנס אם ורק אם האיבר הכללי שלו שואף ל־$0$.\
  נשים לב כי הנורמה של $X^(-1)$ היא $alpha$ והנורמה על $F$ מוגדרת כנורמה הטריוויאלית (כלומר $abs(a)_alpha <= 1$ לכל $a in F$) ולכן
  $ abs(a_n X^(-n))_alpha = abs(a_n)_alpha dot.op abs(X^(-1))_alpha^n <= 1 dot.op alpha^n = alpha^n $
  מכיוון שנתון $0 < alpha < 1$, מתקיים $lim_(n arrow infinity) alpha^n = 0$ לכן האיבר הכללי שואף לאפס, והטור $sum_(n=s)^infinity a_n X^(-n)$ מתכנס ב־$F((X^(-1)))$.
]

#subquestion()
נוכיח שלכל $phi.alt in FF[[X^(-1)]]$ ולכל $k in NN$ קיימים $a_0, dots.h, a_(k-1) in FF$ יחידים כך שמתקיים
$ abs(phi.alt - (a_0 + dots.h.c + frac(a_(k-1), X^(k-1))))_alpha <= alpha^k $

#proof[
  מכיוון ש־$phi.alt in F[[X^(-1)]]$, מתקיים $abs(phi.alt)_alpha <= 1$ ולכן $phi.alt$ ניתן לייצוג כטור מתכנס $sum_(n=0)^infinity c_n X^(-1)$ עבור $c_n in F$.\
  נגדיר $a_n = c_n$ עבור $0 <= n <= k-1$ ונשים לב
  $ phi.alt - (a_0 + dots.h + a_(k-1) X^(-(k-1))) = sum_(n=k)^infinity c_n X^(-1) $
  לפי אי־שוויון המשולש האולטרה-מטרי, הנורמה של הסכום חסומה על ידי המקסימום של נורמות האיברים
  $
    abs(sum_(n=k)^infinity c_n X^(-1))_alpha <= max_(n>=k) abs(c_n X^(-n))_alpha <= max_(n>=k) alpha^n = alpha^k
  $
  בשביל היחידות נניח בשלילה שקיימים מקדמים אחרים $b_0, dots.h, b_(k-1)$ המקיימים את התנאי אז הנורמה של $sum_(i=0)^(k-1) (a_i - b_i) X^(-i)$ חייבת להיות קטנה או שווה ל־$alpha^k$.\
  אם קיים $i < k$ שבו $a_i != b_i$, הנורמה של ההפרש היא בדיוק $alpha^j$ עבור ה־$j$ המינימלי שבו יש שוני ומכיוון ש־$j < k$ וכמו כן $0 < alpha < 1$, מתקבל $alpha^j > alpha^k$, בסתירה.
]

#subquestion()
נוכיח שלכל $phi.alt in FF[[X^(-1)]]$ קיימת סדרה $(a_n)_(n=0)^infinity subset.eq FF$ כך שמתקיים $phi.alt = sum_(n=0)^infinity frac(a_n, X^n)$.

#proof[
  מהסעיף הקודם לכל $k in NN$ קיימים מקדמים יחידים $a_0, dots.h, a_(k-1)$ שנותנים קירוב עד כדי $alpha^k$. יחידות המקדמים מבטיחה כי עבור צעד $k+1$, המקדמים $a_0, dots.h, a_(k-1)$ נשארים זהים ורק מתווסף אליהם $a_k$.\
  לכן ניתן לבנות סדרה אינסופית $(a_n)_(n=0)^infinity$ כך שסדרת הסכומים החלקיים $S_k = sum_(n=0)^(k-1) a_n X^(-n)$ מקיימת $abs(phi.alt - S_k)_alpha <= alpha^k$.\
  אבל אז מתקיים $alpha^k stretch(arrow)_(k arrow infinity) 0$, ולכן הגבול מתכנס ונקבל $phi.alt = lim_(k arrow infinity) S_k = sum_(n=0)^infinity a_n X^(-1)$.
]

#subquestion()
נוכיח שלכל $phi.alt in FF((X^(-1)))^times$ קיימים $s in ZZ$ וסדרה $(a_n)_(n=s)^infinity subset.eq FF$ כך ש־$a_s != 0$ וגם $phi.alt = sum_(n=0)^infinity a_n X^(-n)$.

#proof[
  יהי $phi.alt in F((X^(-1)))^times$ ומהגדרה הנורמה שלו היא מהצורה $alpha^s$ עבור $s in ZZ$ כלשהו (שכן קבוצת הערכים של הנורמה היא חזקות של $alpha$).\
  לכן האיבר $phi.alt X^(-s)$ הוא בעל נורמה $abs(phi.alt X^(-s))_alpha = abs(phi.alt)_alpha dot.op alpha^(-s) = alpha^s dot.op alpha^(-s) = 1$ כלומר $phi.alt X^(-s) in F[[X^(-1)]]^times$.\
  הסעיף הקודם ניתן לכתוב $phi.alt X^(-s) = sum_(n=0)^infinity c_n X^(-1)$ עם $c_0 != 0$ (אחרת הנורמה הייתה קטנה מ־1).\
  נכפול ב־$X^s$ ונקבל $phi.alt = sum_(n=0)^infinity c_n X^(-(n-s))$. על ידי החלפת אינדקס $m = n-s$ (כלומר $n = m-s$) ונקבל $phi.alt = sum_(m=s)^infinity c_(m-s) X^(-m)$.
  נסמן $a_m = c_(m-s)$ ונקבל את הדרוש כאשר $a_s = c_0 != 0$.
]

#question()
הפיתוח ה־$3$־אדי הקנוני של מספר רציונלי היינו $dots.h 21212121$.\
נמצא את המונה והמכנה של השבר המצומצם המייצג את המספר.

#proof[
  בעולם ה־$p$־אדי זה בסיס $3$ אז הספרה הכי ימנית היא תמיד החזקה של $3^0$, זו שמשמאלה היא חזקה של $3^1$, משמאלה היא $3^2$ וכן הלאה.\
  כלומר נתון לנו
  $
    x & = 1 dot.op 3^0 + 2 dot.op 3^1 + 1 dot.op 3^2 + 2 dot.op 3^3 + 1 dot.op 3^4 + 2 dot.op 3^5 + dots.h.c \
      & = (1+2 dot.op 3) + (1 dot.op 3^2 + 2 dot.op 3^3) + (1 dot.op 3^4 + 2 dot.op 3^5) + dots.h.c \
      & = (1+6) + 3^2 (1+6) + 3^4 (1+6) + dots.h.c
  $
  כלומר $a=7, q = 3^2=9$ וזה טור גיאומטרי אינסופי, אז מהנוסחה הידועה
  $ x = frac(a, 1-q) = frac(7, -8) = - frac(7, 8) $
]

#question()
נמצא את הפיתוח ה־$3$־אדי הקנוני של $frac(1, 4) in QQ_3$.

#proof[
  כלומר אנחנו רוצים להציג אותו כטור
  $ frac(1, 4) = a_0 + a_1 dot.op 3^1 + a_2 dot.op 3^2 + a_3 dot.op 3^3 + dots.h.c $
  כאשר כל $a_i in (0,1,2)$.\
  מנוסחה של טור גיאומטרי אינסופי $ frac(a, 1-q) $
  ומתקיים $4=1+3$ ולכן
  $ frac(1, 4) = frac(1, 1-(-3)) $
  אבל
  $ frac(1, 1-q) = 1 + q+q^2 + q^3 + dots.h.c $
  אז עבור $q=-3$ נקבל
  $
    frac(1, 4) = 1-3+9-27+81-243 + dots.h.c = 1 + (-3+9) + (-27+81) + dots.h.c = 1 + 6 + 54 + dots.h.c = 1 + 2 dot.op 3^1 + 2 dot.op 3^3 + 2 dot.op 3^5
  $
  כאשר קצת שיחקנו עם הסדר של הסכום אבל מותר להכניס סוגריים כי זה טור מתכנס.\
  אנחנו רוצים לבנות ביטוי שמכיל את כל החזקות רק שלהן המקדם יהיה אפס ולכן
  $ frac(1, 4)= 1 dot.op 3^0 + 2 dot.op 3^1 + 0 dot.op 3^2 + 2 dot.op 3^3 + 0 dot.op 3^4 + dots.h.c $
  קיבלנו פיתוח שבו כל המקדמים $a_i in (0,1,2)$ כנדרש.\
  הסדרה של המקדמים היא $(1, 2, 0, 2, 0, 2, dots.h)$, ובכתיבה 3־אדית מקוצרת המספר נכתב כ־$dots.h 202021$.
]

#question()
יהי $F((X^(-1)))$ שדה נורמי לא ארכימדי שלם המוגדר בשאלה 1.\
נמצא סדרה $(a_n)_(n=0)^infinity subset.eq FF$ כך שמתקיים $ frac(1, X-1) = sum_(n=0)^infinity frac(a_n, X^n) $

#solution[
  נרצה לפתח את $frac(1, X-1)$ לטור חזקות ב־$X^(-1)$, מתקיים
  $ frac(1, X-1) = frac(1, X(1 - X^(-1))) = frac(X^(-1), 1 - X^(-1)) $
  נשתמש בנוסחה לטור הנדסי אינסופי (שמתכנס מכיוון ש־$abs(X^(-1))_alpha = alpha < 1$)
  $
    frac(X^(-1), 1 - X^(-1)) = X^(-1) sum_(n=0)^infinity (X^(-1))^n = sum_(n=0)^infinity X^(-(n+1)) = sum_(n=1)^infinity X^(-n)
  $
  מכאן נסיק ש־$a_0 = 0$, ולכל $n >= 1$ מתקיים $a_n = 1$ אז סדרת המקדמים היא $(0, 1, 1, 1, dots.h)$.
]

#question()
נבחן בכל סעיף האם לפולינום $f=x^2+x+1$ יש שורש בשדה הנתון.

#subquestion()
נוכיח שאין ל־$f$ שורש בשדה $QQ_5$.

#proof[
  נתחיל מלגזור
  $ f^prime = 2x + 1 $
  מבדיקה ידנית קצרה נקבל
  $
    cases(
      f(0) = 1 eq.triple_(mod 5) 1,
      f(1) = 1+1+1 eq.triple_(mod 5) 3,
      f(2) = 4+2+1 = 7 eq.triple_(mod 5) 2,
      f(3) = 9+3+1 = 13 eq.triple_(mod 5) 3,
      f(4) = 16+4+1 = 21 eq.triple_(mod 5) 1
    )
  $
  נניח בשלילה שקיים $alpha in QQ_5$ כך ש־$alpha^2+alpha+1 = 0$ ונניח ש־$v_5 (alpha) < 0$ ולכן
  $ v_5 (alpha^2) = 2v_5 (alpha) < v_5 (alpha) < 0 $
  ולכן האיבר בעל ההערכה הנמוכה ביותר בפולינום הוא $alpha^2$ אבל בשדה לא ארכימדי אם יש איבר יחיד בעל הערכה מינימלית בסכום ההערכה של הסכום היא אותה הערכה ולכן $v_5 (alpha^2+alpha+1) = v_5 (alpha^2) < 0$ בסתירה להנחה (לאפס יש הערכה אינסופית) ולכן בהכרח $v_5 (alpha) >=0$ ו־$alpha in ZZ_5$.\
  אם $alpha in ZZ_5$ אז $overline(alpha) in FF_5$ והמשוואה שלנו לאחר הרדוקציה נהפכת להיות
  $ overline(alpha)^2 + overline(alpha) + 1 = 0 in FF_5 $
  לכן אם יש שורש ב־$QQ_5$ חייב להיות גם שורש ב־$FF_5$ אבל מהחישוב לעיל אין אף ערך שנותן $0$ ולכן לפולינום אין שורש ב־$FF_5$ וזאת סתירה.
]

#subquestion()
נוכיח שיש ל־$f$ שורש ב־$QQ_7$.

#proof[
  נרצה להשתמש בלמה של הנזל ולכן נגדיר את הפולינום $f(x) = x^2+x+1$ ונסתכל על $w_0 = 2 in ZZ_7$.\
  מתקיים $overline(f(w_0)) = 2^2 + 2 + 1 = 7 eq.triple_(mod 7) 0$ והנגזרת היא $f^prime (x) = 2x+1$ נקבל $overline(f^prime (w_0)) = 2(2) + 1 = 5 eq.triple.not_(mod 7) 0$.\
  מכיוון ש־$overline(f(w_0)) = 0$ וגם $overline(f^prime (w_0)) != 0$ על פי הלמה של הנזל קיים $w in ZZ_7$ יחיד כך ש־$overline(w) = overline(w_0) = 2$ וגם $f(w) = 0$.\
  כיוון שיש שורש ב־$ZZ_7$, ודאי שיש שורש ב־$QQ_7$.
]



#question()
נמצא פולינום $f in ZZ_3 [X]$ ללא שורשים ב־$ZZ_3$ כך שלרדוקציה שלו ב־$FF_3 [X]$ יש שורשים ב־$FF_3$ כלומר קיים $w_0 in ZZ_3$ כך ש־$f(w_0) eq.triple_(mod 3) 0$.

#solution[
  נגדיר $f(x) = x^2 - 3$ ומודולו 3 הפולינום הוא $overline(f)(x) = x^2 in FF_3[x]$ שלו יש שורש $overline(w_0) = 0$, שכן $0^2 eq.triple_(mod 3) 0$.\
  עם זאת, נניח בשלילה כי קיים שורש $w in ZZ_3$ כך ש־$w^2 - 3 = 0$, כלומר $w^2 = 3$.\
  אם נפעיל את ההערכה ה־3־אדית $v_3$ על שני אגפי המשוואה, נקבל
  $ v_3(w^2) = v_3(3) <==> 2 v_3(w) = 1 $
  הערכה של מספר ב־$ZZ_3$ חייבת להיות ב־$ZZ_plus$ אבל $2 v_3(w) = 1$ גוררת $v_3(w) = 0.5 in.not ZZ$ וזו סתירה.\
  לכן לפולינום $f(x) = x^2 - 3$ אין שורשים ב־$ZZ_3$ אבל יש לו שורשים ב־$FF_3$.
]


#question()
נוכיח כי לפולינום $f(x) = x^2-2$ יש שני שורשים ב־$QQ_7$ ונמצא שלוש ספרות אחרונות בפיתוח ה־$7$־אדי הקנוני של כל אחד מהם.

#proof[
  מתקיים
  $
    0^2 eq.triple_(mod 7) 0, quad 1^2 eq.triple_(mod 7) 1, quad 2^2 eq.triple_(mod 7) 4, quad 3^2 eq.triple_(mod 7) 2, quad 4^2 eq.triple_(mod 7) 2, 5^2 eq.triple_(mod 7) 4, quad 6^2 eq.triple_(mod 7) 1
  $
  אז יש שני שורשים $x_0 eq.triple_(mod p) 3, x_0 eq.triple_(mod p) 4$.\
  נשים לב שמתקיים
  $ f^prime (x) = 2x ==> f^prime (3) = 6 eq.triple.not_(mod 7) 0, quad f^prime (4) = 8 eq.triple.not_(mod 7) 0, quad $
  מהלמה של הנזל כל אחד מהשורשים עם רדוקציה לשורש יחיד ב־$ZZ_7 subset QQ_7$.\
  אנחנו מחפשים רק שלוש ספרות ראשונות בפיתוח ולכן נכתוב
  $ x = 3 + 7a + 49b $
  לכל שורש שמצאנו נחשב את $a,b$.\
  במודלו 49 נחשב את
  $ (3+7a)^2 - 2 = 7 + 42a + 49a^2 ==> 7 + 42a eq.triple_(mod 49) 0 <==> 1 +6a eq.triple_(mod 7) 0 $
  אבל $6^(-1) eq.triple_(mod 7) 6$ ולכן $a eq.triple_(mod 7) 1$ ולכן נבחר $a=1$.\
  באופן דומה
  $ x = 3 + 7 +49b = 10 + 49b ==> (10+49b)^2 - 2 = 98+980b + 2401 b^2 $
  מחישוב
  $ 980 eq.triple_(mod 343) 294 $
  ולכן
  $
    98 + 294b eq.triple_(mod 343) 0 <==> 2 + 6b eq.triple_(mod 7) 0 <==> 6b eq.triple_(mod 7) 5 <==> b eq.triple_(mod 7) 2
  $
  ולכן $x = 3 + 7 + 2 dot.op 49$ ושלוש הספרות ה־$7$־אדיות הן $(3,1,2)$.\
  נחזור על אותם חישובים עבור השורש השני כלומר $x=4+7a+49b$ ומאותה דרך חישוב נקבל $a=5, b=4$ ולכן שלוש הספרות ה־$7$־אדיות תהיינה $(4,5,4)$.

]

#question()
יהי $p$ ראשוני ויהיו $a,b,c in p ZZ_p$ כך ש־$c in.not p^2 ZZ$. נוכיח כי לפולינום $x^3+a x^2+b x + c$ אין שורשים ב־$QQ_p$.

#proof[
  יהי $alpha in QQ_p$ שורש של הפולינום. מכיוון שהפולינום מתוקן עם מקדמים ב־$ZZ_p$, כל שורש ב־$QQ_p$ חייב להיות ב־$ZZ_p$ (נובע מהלמה של גאוס, זה אנלוגי למה שראינו במבנים אלגבריים2 כי $ZZ_p$ הוא תחום פירוק יחידה ואז במקום להגדיר את התוכן שהגדרנו בשביל להוכיח את הלמה של גאוס עם $gcd$ נגדיר אותה עם $c(f)=min_i v_p (a_i)$ ובגלל ש־$ZZ_p$ תחום פריקות יחידה ויש בו איבר ראשוני יחיד עד־כדי יחידות שהוא $p$ נשמר האנלוג בהוכחה של הלמה של גאוס).\
  לכן נניח ש־$alpha in ZZ_p$, כלומר $v_p (alpha) >= 0$  נציב את $alpha$ במשוואה ונקבל
  $ alpha^3 + a alpha^2 + b alpha + c = 0 <==> c = -alpha^3 - a alpha^2 - b alpha $
  מכיוון ש־$c in p ZZ_p without p^2ZZ_p$, אנו יודעים ש־$v_p (c) = 1$.
  נפריד למקרים עבור הערך של $v_p (alpha)$
  + אם $v_p (alpha) = 0$ אז במקרה זה $alpha eq.triple.not_(mod p) 0$ ומכך ש־$a, b in p ZZ_p$ נקבל $v_p (a), v_p (b) >= 1$.\
    מכאן נובע ש־$a alpha^2 eq.triple_(mod p) 0$ ו־$b alpha eq.triple_(mod p)$ אבל $alpha^3 eq.triple.not_(mod p) 0$ ולכן $v_p (-alpha^3 - a alpha^2 - b alpha) = 0$ וזאת כמובן סתירה.
  + אם $v_p (alpha) >= 1$ אז נקבל כי $v_p (alpha^3) >= 3$.\
    מכיוון ש־$v_p (a) >= 1$ נקבל $v_p (a alpha^2) >= 1 + 2 = 3$ וכיוון ש־$v_p (b) >= 1$ נקבל $v_p (b alpha) >= 1 + 1 = 2$ כלומר כל האיברים בפולינום הם בעלי הערכה של לפחות 2 ושוב נקבל סתירה שכן $v_p (c) = 1 gt.eq.not 2$.
  מכאן שלפולינום לא ייתכנו שורשים ב־$QQ_p$.
]

#question()
יהי $2!=p$ ראשוני ויהיו $b,c in ZZ_p$ כך ש־$b^2-4c in ZZ_p^times$.\
נתון כי קיים $w_0 in ZZ_p$ כך ש־$w_0^2+b w_0 + c eq.triple_(mod p) 0$.\
נוכיח כי קיים $w in ZZ_p$ כך ש־$w^2+b w + c =0$.

#proof[
  נגדיר $ f(x) = x^2+ b x + c \
  f^prime (x) = 2x + b $
  מהנתון $f(w_0) eq.triple_(mod p) 0$ מספיק להראות לפי למת הנזל שמתקיים $f^prime (w_0) != eq.triple_(mod p) 0$.\
  מתקיים
  $ w_0^2 + b w_0 + c eq.triple_(mod p) 0 <==> 4c eq.triple_(mod p) -4w_0^2-4b w_0 $
  כלומר
  $ b^2-4c eq.triple_(mod p) b^2 + 4w_0^2 + 4b w_0 eq.triple_(mod p) (2w_0 + b)^2 eq.triple_(mod p) (f^prime(w_0))^2 $
  אבל $b^2-4c in ZZ_p^times$ כלומר לא מתחלק ב־$p$ קרי $b^2-4c eq.triple.not_(mod p) 0$ ומכאן $f^prime (w_0) eq.triple.not_(mod p) 0$ ולכן תנאי הלמה של הנזל מתקיימים וקיים $w in ZZ_p$ כך ש־$f(w)=0$ כלומר $w^2 + b w + c = 0$.
]


#question()
יהי $p$ ראשוני ונוכיח כי קיימת תת־קבוצה $R subset.eq ZZ_p$ בת $p-1$ איברים כך שלכל $a in R$ מתקיים $a^(p-1)=1$ וגם לכל $a,b in R$ מתקיים $a b in R$.

#proof[
  לכל שארית לא־אפס $overline(a) in FF_p^times$ נבחר את הרדוקציה $r(overline(a)) in ZZ_p$ של הפולינוםח $f(x) = x^(p-1) - 1$.\
  ברור שאם $a_0^(p-1) eq.triple_(mod p) 1$ אז $f^prime (x) = (p-1)x^(p-2)$ שכן $p-1 eq.triple.not_(mod p) 0$ ו־$a_0 eq.triple 0$ ולכן נקבל $f^prime (a_0) eq.triple.not_(mod p) 0$ ולכן לפי למת הנזל יש יחידות להרמה הזאת.\
  נסמן $ R colon.eq {r(overline(a)) bar overline(a) in FF_p^times} $
  מכיוון שיש בידיוק $p-1$ שאריות לא אפסיות נקבל ש־$abs(R)=p-1$ ולכל $a in R$ מתקיים $a^(p-1) = 1$ אז אם נראה סגירות לכפל סיימנו.\
  יהיו $a,b in R$ אז
  $
    (a b)^(p-1) = a^(p-1) b^(p-1) = 1 \
    a b eq.triple_(mod p) overline(a) overline(b)
  $
  אבל ההר5מה של $overline(a) overline(b)$ היא יחידה ומקיימת את המשוואה $x^(p-1) = 1$ ולכן $a b = r(overline(a) overline(b)) in R$ וקיבלנו סגירות לכפל.
]

#question()
יהי $p$ ראשוני ונוכיח כי $ZZ_p^times tilde.equiv FF_p^times times (1+p ZZ_p)$.

#proof[
  ניקח את $R$ מהשאלה הקודמת ונדיר $phi:R times (1+p ZZ_p) arrow ZZ_p^times$ על־ידי $phi(r, u) = r u$.\
  ברור שזה הומומורפיזם של חבורות  נשאר רק להראות איזומורפיזם.\
  נניח כי $r_1 u_1 = r_2 u_2$ ולכן $r_2^(-1) r_1 = u_2 u_1^(-1)$ אבל אגף שמאל שייך ל־$R$ ואגף, ימין שייך ל־$1+p ZZ_p$ והאיבר היחידי המשותף לשתי הקבוצות הוא $1$ (כי אם נניח \
  $r in R inter (1+p ZZ_p)$ מקיים $r eq.triple_(mod p) 1$ וב־$R$ יש בידיוק נציג אחד כזה ולכן $r=1$) וזה גורר $r_1 = r_2, u_1 = u_2$ וקיבלנו חד־חד ערכיות.\
  בשביל העל, יהי $x in ZZ_p^times$ ונסמן ב־$overline(x)$ את הרדוקציה שלו ב־$FF_p^times$.\
  קיים $r in R$ יחיד המרים את $overline(x)$ ולכן אם נגדיר $u=r^(-1) x$ נקבל $u in 1 + p ZZ_p$ ולכן $x= r u$ וקיבלנו גם על.\
  אז $phi$ איזומורפיזם ומכאן $ZZ_p^times tilde.equiv R times (1+p ZZ_p)$ אבל $R tilde.equiv FF_p^times$ (כי העתקת הרדוקציה מצומצמת ל־$R$ היא איזומורפיזם) ונקבל $ZZ_p^times tilde.equiv FF_p^times times (1+p p ZZ_p)$.
]

#question()
יהי $2<p$ ראשוני ונוכיח כי $(1+p ZZ_p)^2 = (1+p ZZ_p)$.

#proof[
  נגדיר $f(x)=x^2-a$ כאשר $a in 1 + p ZZ_p$ ונרצה למצוא שורש ב־$1+p ZZ_p$.\
  מאחר ש־$a eq.triple_(mod p) 1$ נבחר $x_0 = 1$ ואז $f(1)=1-a eq.triple_(mod p) 0$ ובנוסף $f^prime (x) =2x$ ולכן $f^prime (1) = 2$ אז מאחר ש־$2 eq.triple.not_(mod p) 0$ כל תנאי הלמה של הנזל מתקיימים ולכן קיים $x in ZZ_p$ כך ש־$x^2=a$.\
  מכיוון ש־$x eq.triple_(mod p) 1$ נקבל $x in 1 + p ZZ_p$ ולכן $1 + p ZZ_p subset.eq (1+p ZZ_p)^2$ ומהיות ההכלה השנייה טריוויאלית נקבל שיוויון.
]
