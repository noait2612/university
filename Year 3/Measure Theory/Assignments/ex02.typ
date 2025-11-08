#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 02 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#question()
נוכיח את הלמה של בורל קנטלי: בהינתן מרחב מידה $(X, cal(B), mu)$, נאמר שתכונה כלשהי של נקודות ב־$X$ מתקיימת *כמעט תמיד* או *כמעט בכל מקום* אם אוסף הנקודות שלא מקיימות את התכונה הזו מוכלת בקבוצה בעלת מידה אפס.\
תהיי $(A_n)_(n=1)^infinity subset.eq cal(B)$ כך שמתקיים
$ sum_(n=1)^infinity mu(A_n) < infinity $
נוכיח כי התכונה "$x$ שייך רק למספר סופי של $A_n$־ים" מתקיימת כמעט בכל מקום.

#proof[
  ניעזר בהדרכה
  $ B = lim_(n arrow.r infinity) sup A_n = inter.big_(n=1)^infinity union.big_(k=n)^infinity A_k $
  יהי $x in B$ ונרצה להראות ש־$mu(B)=0$.\
  מהיות $(X, cal(B), mu)$ מרחב מידה זה אומר ש־$cal(B)$ היא $sigma$־אלגברה, אז עבור $k$ מקובע, נובע מתכונת הסגירות תחת איחוד בן־מנייה שמתקיים $union.big_(k>=n)^infinity A_n in cal(B)$ ומתת־אדטיביות מתקיים
  $ mu(union.big_(n>=k)^infinity A_n) <= sum_(n=k)^infinity mu(A_n) < infinity $
  כשהמעבר האחרון נובע מהיות הטור שלנו טור־זנב של הטור $sum_(n=1)^infinity mu(A_n)$ שנתון שמתכנס.\
  נגדיר $U_k = union.big_(k>=n) A_n$ ונובע מהגדרת האיחוד שזו סדרה יורדת $U_1 supset.eq U_2 supset.eq dots.h$ ובפרט מתקיים ממונוטוניות ו־$sigma$־אדיטיביות
  $ mu(U_1) <= sum_(n=1)^infinity mu(A_n) < infinity $
  נגדיר $E = inter.big_(k=1)^infinity U_k$ ואז מתכונת הרציפות לסדרות יורדות נקבל
  $ mu(B) = mu(inter.big_(k=1)^infinity U_k) = lim_(k arrow.r infinity) mu(U_k) $
  אבל $ mu(U_k) <= sum_(n=k)^infinity mu(A_n) arrow.r 0 $
  ולכן $mu(B) = 0$, כלומר המשלים של התכונה "$x$ שייך רק למספר סופי של $A_n$־ים" מוכל בקבוצה ממידה אפס ולכן לפי הגדרה התכונה מתקיימת כמעט בכל מקום.
]

#question()
תהיי $mu$ מידה המוגדרת על איזשהו מרחב מדיד $(X, cal(B))$. נגדיר
$
  cal(N) colon.eq {E subset.eq X bar E subset.eq N in cal(B), mu(N) = 0}, \
  overline(cal(B)) colon.eq {A union E bar A in cal(B), E in cal(N)}
$
ותהיי $overline(mu) : overline(cal(B)) arrow.r [0,infinity]$ כך שמתקיים $overline(mu)(A union E)= mu(A)$ לכל $A in cal(B), E in cal(N)$.

#subquestion()
נוכיח כי $cal(overline(B))$ היא $sigma$־אלגברה.

#proof[
  עלינו להראות את שלוש התכונות של $sigma$־אלגברה עבור $cal(overline(B))$.\
  $X in cal(overline(B))$ שכן $cal(B)$ היא $sigma$־אלגברה ולכן $X in cal(B)$ ו־$emptyset in cal(N)$ שכן $mu(emptyset)=0$ ולכן $X = X union emptyset$ עבור $X in cal(B)$ ו־$emptyset in cal(N)$ ולכן $X in cal(overline(B))$ וכמובן שבאותו אופן, $emptyset in cal(B)$ ולכן $emptyset union emptyset in cal(overline(B))$.\
  נראה סגירות למשלים. יהי $C in cal(overline(B)))$ ונרצה להראות ש־$C^c = X without C in cal(overline(B))$.\
  מהיות $C in cal(overline(B))$ נובע שיש $A in cal(B)$ ו־$E in cal(N)$ כך שמתקיים $C = A union E$.\
  מהיות $E in cal(N)$ נובע כי $mu(E)=0$ וכן שיש $N in cal(B)$ כך שמתקיים $E subset.eq N$.\
  נבחין $ (A union E)^c = A^c inter E^c = A^c inter (X without E) = (A^c inter (X without N)) union (A^c inter (N without E)) $
  שכן $X = (X without N) union N$ (עבור ה־$N$ שמקיים $S subset.eq N$) ובשימוש של זה לפשט את הביטוי
  $
    A^c inter (X without E) = A^c inter (X without E) inter X = A^c inter (X without E) inter ((X without N) union N) \
    = A^c inter (X without E) inter (X without N)) union (A^c inter (X without E) inter N) =_(E subset.eq N) A^c inter (X without N) union A^c inter (N without E)
  $
  עכשיו, $cal(B)$ היא $sigma$־אלגברה ולכן $A^c in cal(B)$ וכן $X without N in cal(B)$ מהסגירות גם־כן.\
  כעת, $A^c inter (N without E) subset.eq N$ מהגדרת החיתוך ולכן ממונוטוניות המידה גם מתקיים $A^c inter (N without E) in cal(N)$.\
  כלומר $C^c = (A union E)^c$ הוא איחוד של איבר מ־$cal(B)$ ואיחוד של איבר מ־$cal(N)$ ולכן $C^c in cal(overline(B))$ וקיבלנו סגירות תחת משלים.\
  נראה סגירות תחת איחוד בן־מנייה: תהיי $(C_n)_(n=1)^infinity subset.eq cal(overline(B))$ ונרצה להראות ש־$union.big_(n=1)^infinity C_n in cal(overline(B))$.\
  לכל $n in NN$ ניתן לכתוב $C_n = A_n union E_n$ עבור $A_n in cal(B)$ ו־$E_n in cal(N)$, מהיות $E_n in cal(N)$ נובע כי יש $N_n in cal(B)$ כך שמתקיים $E_n subset.eq N_n$ וכן $mu(N_n) = 0$, אז נכתוב
  $
    union.big_(n=1)^infinity C_n = union.big_(n=1)^infinity (A_n union.big E_n) = (union.big_(n=1)^infinity A_n) union.big (union.big_(n=1)^infinity E_n) = A union.big E
  $
  אבל $cal(B)$ היא $sigma$־אלגברה ומכך ש־$(A_n)_(n=1)^infinity cal(B)$ נובע מסגירות תחת איחוד בן־מנייה שמתקיים $A in cal(B)$.\
  נשים לב שמתקיים $ E = union.big_(n=1)^infinity E_n subset.eq union.big_(n=1)^infinity N_n $
  אבל כל $N_n subset.eq cal(B)$ ולכן שוב מסגירות תחת איחוד בן־מנייה מתקיים $union.big_(n=1)^infinity N_n = overline(N) in cal(B)$.\
  מתכונות המידה, מתקיים $sigma$־אדיטיביות ולכן
  $ mu(overline(N)) = mu(union.big_(n=1)^infinity N_n) <= sum_(n=1)^infinity mu(N_n) = sum_(n=1)^infinity 0 = 0 $
  אז $mu(overline(N))=0$ ו־$E subset.eq overline(N)$ ומתכונות המונוטוניות של המידה נובע כי $mu(E)<=mu(overline(N))=0$ ומאי־שליליות המידה נובע כי $mu(E)=0$, וזה גורר כי $E in cal(N)$.\
  כלומר $A in cal(B)$ וכן $E in cal(N)$ ולכן מהגדרת $cal(overline(B))$ נובע כי $A union E in cal(overline(B))$ וזה בידיוק אומר שיש סגירות תחת איחוד בן־מנייה.\
  כל שלושת התנאים ל־$sigma$־אלגברה מתקיימים ולכן $cal(overline(B))$ היא $sigma$־אלגברה.
]

#subquestion()
נוכיח כי $overline(mu)$ מוגדרת היטב.

#proof[
  עלינו להראות שאם $C in cal(overline(B))$ ניתנת לכתיבה על־ידי $C = A_1 union E_1$ וגם $C = A_2 union E_2$ עבור $A_1, A_2 in cal(B)$ ו־$E_1, E_2 in cal(N)$ אז מתקיים
  $ overline(mu) = mu(A_1) = mu(A_2) $
  נשים לב שמתקיים
  $ A_1 subset.eq A_1 union E_1 = C = A_2 union E_2 $
  מהיות $E_1 in cal(N)$, יש $N_1 in cal(B)$ כך ש־$E_1 subset.eq N_1$ ומתקיים $mu(N_1)=0$ ובאותו אופן גם $N_2 in cal(B)$ כך ש־$E_2 subset.eq N_2$ ומתקיים $mu(N_2)=0$.\
  אז $ A_1 subset.eq A_2 union E_2 ==> A_1 = (A_1 inter A_2) union (A_1 inter E_2) $
  אבל $E_2 subset.eq N_2$ ולכן $A_1 inter E_2 subset.eq N_2$ וממונוטוניות ואי־שליליות המידה מתקיים $mu(A_1 inter E_2)=0$.\
  נשים לב שמתקיים $mu((A_1 inter A_2) union (A_1 inter E_2)) = mu(A_1 inter A_2) + mu(A_1 inter E_2)$ למרות שלא בהכרח ש־$A_1 inter A_2 inter E_2 = emptyset$, כי ממונוטוניות המידה, $mu(A_1 inter A_2 inter E_2) = 0$ כי $A_1 inter A_2 inter E_2 subset.eq N$ ולכן עם עיקרון ההכלה וההפרדה נקבל $ mu(A_1) = mu((A_1 inter A_2) union (A_1 inter E_2)) = mu(A_1 inter A_2) + underbrace(mu(A_1 inter E_2), =0) - underbrace(mu(A_1 inter A_2 inter E_2), =0) = mu(A_1 inter A_2) $
  באותו אופן יכולנו רק להשתמש בטענה מהתרגול של התת־מונוטוניות.\
  כעת, מהיות $A_1 inter A_2 subset.eq A_2$ נובע ממונוטוניות המידה $mu(A_1 inter A_2)=mu(A_1) <= mu(A_2)$.\
  משיקולי סימטרייה אם נעשה עם חלופת אינדקסים $A_2 subset.eq A_1 union E_1$ נקבל את האי־שיוויון $mu(A_2)<=mu(A_1)$.\
  מטריכוטומיה נקבל $mu(A_1) = mu(A_2)$, כנדרש ולכן $overline(mu)$ מוגדרת היטב.
]

#subquestion()
נוכיח שכל מידה $hat(mu)$ על $overline(cal(B))$ המקיימת $hat(mu)(A) = mu(A)$ לכל $A in cal(B)$ למעשה מתלכדת עם $overline(mu)$. \
כלומר נוכיח ש־$overline(mu)$ היא ההרחבה היחידה של $mu$ למידה על $overline(cal(B))$.

#proof[
  תהיי $nu : cal(overline(B)) arrow.r [0, infinity]$ הרחבה של מידה $mu$ כך שמתקיים $nu(A) =mu(A)$ לכל $A in cal(B)$ ונרצה להראות ש־$nu(C) = overline(mu)(C)$ לכל $C in cal(overline(B))$.\
  אז $C = A union E$ עבור $A in cal(B)$ ו־$E in cal(N)$ ולכן יש $N in cal(B)$ כך ש־$E subset.eq N$ ומתקיים $mu(N)=0$.\
  אז בהכרח מתקיים $nu(N)=mu(N)=0$ כהרחבה של המידה $mu$ וממונוטוניות ואי־שליליות המידה מתקיים $nu(E)=0$ גם־כן.\
  נזיר את הקבוצות ונכתוב $C = A union E = A union (E without A)$ ו־$E without A subset.eq N$ ולכן מאותו נימוק ממקודם, $nu(E without A) = 0$.\
  מ־$sigma$־אדיטיביות של המידה מתקיים
  $ nu(A union E) = nu(A) + nu(E without A) = nu(A) + 0 = nu(A) $
  אז $nu$ מסכים עם $mu$ על $cal(B)$, כלומר $nu(A)=mu(A)$, אז
  $ nu(A union E) = nu(A) = mu(A) = overline(mu)(A) $
  בסעיף הקודם ראינו שגם אם ההצגה $C = A union E$ איננה יחידה, כלומר $C = A union E = A' union E'$, על $overline(mu)$ ראינו שמתקיים $overline(mu)(A union E) = overline(mu)(A' union E')$ וגם על $nu$ ראינו באמצעות ההזרה שניתן לעשות את התהליך לכל $C in cal(overline(B))$ ובגלל המידה אפס הטענה תישמר.\
  כלומר לכל $C in cal(overline(B))$ מתקיים $nu(C)=overline(mu)(C)$ ולכן $overline(mu)$ היא ההרחבה היחידה של $mu$ למידה על $cal(overline(B))$.
]
#question()
תהיי $(A_n)_(n=1)^infinity subset Sigma$ סדרת קבוצות במרחב מידה $(X, Sigma, mu)$ ונגדיר
$
  lim inf A_n = union.big_(n=1)^infinity inter.big_(k=n)^infinity A_k \
  lim sup A_n = inter.big_(n=1)^infinity union.big_(k=n)^infinity A_k
$

#subquestion()
נוכיח $lim inf A_n, lim sup A_n in Sigma$.

#proof[
  נוכיח עבור $lim inf A_n$.\
  מכך ש־$Sigma$ היא $sigma$־אלגברה נובע כי היא סגורה תחת איחוד בן־מנייה ומכללי דה־מורגן נובע שהיא סגורה תחת חיתוך בן־מנייה.\
  מכך ש־$(A_k)_(k=n)^infinity subset.eq Sigma$ הוא אוסף בן־מנייה, אם נסמן $B_n = inter.big_(k=n)^infinity A_k$ נקבל ש־$B_n in Sigma$.
  \
  נסתכל על $union.big_(n=1)^infinity B_n$ ושוב מתכונות $sigma$־אלגברה היא סגורה לאיחוד בן־מנייה ולכן $union.big_(n=1)^infinity B_n in Sigma$ אבל $union.big_(n=1)^infinity B_n = lim inf A_n$, כלומר $lim inf A_n in Sigma$.\
  עבור $lim sup A_n$ נשים לב שלפי חוקי דה־מורגן מתקיים
  $
    (lim sup A_n)^c = (inter.big_(n=1)^infinity union.big_(k=n)^infinity A_k)^c = union.big_(n=1)^infinity (union.big_(k=n)^infinity A_k)^c = union.big_(n=1)^infinity inter.big_(k=b)^infinity A_k^c = lim inf A_n^c
  $
  ראינו $lim inf A_n in Sigma$ ו־$Sigma$ היא $sigma$־אלגברה ולכן $lim inf A_n^c in Sigma$ מסגירות למשלים של $sigma$־אלגברה, ולכן $(lim sup A_n)^c in Sigma$ ושוב מהסגירות למשלים נקבל $lim sup A_c in Sigma$.
]

#subquestion()
נוכיח $mu(lim inf A_n)<=lim inf mu(A_n)$.

#proof[
  נשתמש בסימון מהסעיף הקודם $B_n = inter.big_(k=n)^infinity A_k$ ונבחין שמהגדרת החיתוך מתקיים
  $ B_1 subset.eq B_2 subset.eq B_3 subset.eq dots.h $
  מתקיים
  $
    mu(lim inf A_n) = mu(union.big_(n=1)^infinity B_n)=_("רציפות לסדרות עולות") lim_(n arrow.r infinity) mu(B_n)
  $
  ומהגדרה לכל $n in NN$ מתקיים $B_n subset.eq A_k$ לכל $k>=n$ ומהמונוטוניות ביחס להכלה מתקיים $mu(B_n) <= mu(A_k)$.\
  בפרט מתקיים $mu(B_n)<=inf_(k>=n) mu(A_k)$ ואם נחזור לביטוי לעיל שראינו שמוגדר היטב וניקח גבול
  $ lim_(n arrow.r infinity) mu(B_n)<=lim_(n arrow.r infinity)(inf_(k>=n) mu(A_k)) $
  כלומר
  $ mu(lim inf A_n) <= lim inf A_n $
]

#pagebreak()

#subquestion()
נוכיח כי אם מרחב המידה הוא סופי, כלומר $mu(X)<infinity$ אז גם $lim sup mu(A_n) <= mu(lim sup A_n)$.

#proof[
  נניח שלא כך, כלומר $mu(lim sup A_n) < lim sup mu (A_n)$.\
  בדומה לסעיפים הקודמים נגדיר $C_n = union.big_(k=n)^infinity C_k$ ואז $lim sup A_n = inter.big_(n=1)^infinity C_n$.\
  מהגדרת האיחוד מתקיים $ C_1 supset.eq C_2 supset.eq C_3 supset.eq dots.h $
  וממונוטוניות המידה מתקיים $mu(C_1) >= mu(C_2) >= dots.h$
  ובפרט מתקיים $mu(C_1) < mu(X)$ כי $C_1 subset.eq X$.\
  שוב מרציפות לסדרות יורדות מתקיים
  $ mu(lim sup A_n) = lim_(n arrow.r infinity) mu(C_n) $
  וממה שמצאנו מתקיים
  $ lim_(n arrow.r infinity) mu(C_n) < lim sup mu (A_n) $
  ושוב ממונוטוניות המידה, $ mu(C_n) = mu(union.big_(k=n)^infinity A_k) >= mu_(k>=n) (A_k) ==> mu(C_n) >= sup_(k>=n) mu(A_k) $
  ניקח גבול ונקבל
  $ lim_(n arrow.r infinity) mu(C_n) >= lim_(n arrow.r infinity) (sup_(k>=n) mu(A_k)) = lim sup mu(A_n) $
  וזאת כמובן סתירה.
]

#question()
יהי $(X, cal(B))$ מרחב מדיד.

#subquestion()
תהיי $f_n : X arrow.r [0,infinity]$ סדרה של פונקציות מדידות.\
נראה כי קבוצת הנקודות $x in X$ בהן הסדרה $f_n (x)$ מתכנסת היא מדידה וכי אם נסמן קבוצה זו ב־$E$ ונגדיר את $f:E arrow.r [-infinity,infinity]$ על־ידי \
$f colon.eq lim_(n arrow.r infinity) f_n$ זו תהיה פונקציה מדידה.

#proof[
  נסמן $ overline(f) = lim_(n arrow.r infinity) sup f_n (x), space underline(f) = lim_(n arrow.r infinity) inf f_n (x) $
  מהיות כל $f_n in cal(B)$ נובע כי $overline(f), underline(f) in cal(B)$, נראה בשביל $overline(f)$ והמקרה של $underline(f)$ זהה:\
  מהגדרה, $overline(f) (x) =inf_(k>=1) (sup_(n>=k) f_n (x))$, נסמן $g_k (x) = sup_(n>=k) f_n (x)$ ולפי טענה מההרצאה, לקיחת סופרמום משמר את הקבוצה כמדידה. באותו אופן, $overline(f) = inf_(k>=1) g_k (x)$ היא גם מדידה כלקיחת אינפימום על מדידה.\
  אז $overline(f), underline(f)$ מדידות.\
  ניזכר שמהגדרת הגבול, $(f_n (x))_(n=1)^infinity$ מתכנסת אם ורק אם $overline(f)(x)=underline(f)(x)$ ולכן נגדיר
  $ E = {x in X bar overline(f)(x)=underline(f)(x)} $
  ומההנחה בשאלה, $E$ מדידה.\
  כעת נסתכל על $f$, עלינו להראות שלכל $B subset.eq [0,infinity]$ מתקיים $f^(-1)(B)$ מדידה, כלומר $f^(-1)(B) subset.eq E$ ו־$f^(-1) in cal(B)$.\
  מההגדרה, לכל $x in X$ מתקיים $f(x)=overline(f)(x)$ ולכן לכל $a in [0,infinity)$ מתקיים
  $ f^(-1)([0,a]) = {x in E bar f(x)<=a} = {x in E bar overline(f)(x)<=a} $
  וכן
  $ f^(-1)([0,a]) = E inter {x in E bar overline(f)(x)<=a} $
  אבל $E$ היא מדידה מההנחה, ו־${x in E bar overline(f)(x) <= a}$ מדידה גם־כן כי $overline(f)$ מדידה ולפי טענה שראינו פונקציה היא מדידה אממ המקור של כל קבוצה פתוחה הוא מדיד.\
  אז $f^(-1)([0,a])$ היא חיתוך של שתי קבוצות מדידות ולכן מדיד.
]

#subquestion()
נסמן לכל $x in [0,1]$ את הפיתוח הבינארי שלו כ־$0,d_1d_2d_3 dots.h$ כאשר
$
  d_n (x) = mycases(0, exists m in NN space s.t. space x in [(2m)/2^n, (2m+1)/2^n), 1, exists m in NN space s.t. space x in [(2m-1)/2^n, (2m)/2^n))
$
ונסיק מהסעיף הקודם כי קבוצת הנקודות $x in [0,1]$ עבורן $ lim_(n arrow.r infinity) sum_(i=1)^n (d_i (x))/n = 1/2 $
היא מדידה בורל.

#proof[
  ראשית נשים לב ש־$d_i (x)$ היא פונקציה פשוטה כי תמונתה סופית ומתקיים
  $ {x in [0,1] bar d_i (x) = 1} = union.big_(m=1)^(2^(i-1)) [(2m-1)/2^i, (2m)/2^i) $
  כאשר כל קטע הוא ב־$sigma$־אלגברת בורל וזה איחוד סופי ולכן הקבוצה לעיל ב־$sigma$־אלגברת בורל, באותו אופן גם
  #colbreak()
  $ {x in [0,1] bar d_i (x) = 0} = union.big_(m=1)^(2^(i-1)) [(2m)/2^i, (2m+1)/2^i) $
  נמצאת ב־$sigma$־אלגברת בורל ובגלל שהמקור של כל קבוצה פתוחה הוא הוא מדיד נובע כי  $d_n (x)$ פונקציה מדידה.\
  נגדיר
  $ f_n (x) = 1/n sum_(i=1)^n d_i (x) $
  ונטען ש־$(f_n)_(n=1)^infinity$ היא פונקציה מדידה לכל $n in NN$ כי מהיות $d_i (x)$ מדידה לכל $i$ אז גם הסכום הסופי הוא מדיד לפי אריתמטיקה של פונקציות מדידות וגם מכפלה בסקלר משמר את היות הפונקציה מדידה.\
  נגדיר
  $
    E = {x in [0,1] bar lim_(n arrow.r infinity) f_n (x) = 1/2} subset.eq {x in [0,1] bar lim_(n arrow.r infinity) f_n (x) "קיים" }
  $
  ונגדיר $ f(x) = lim_(n arrow.r infinity) f_n (x) $
  ומסעיף א', $f$ מדידה בורל. כמו־כן, $[0,1]$ הוא מרחב האוסדרוף ולכן יחידון הוא קבוצה סגורה ולכן ${1/2}$ הוא בורל ולכן $E = f^(-1)({1/2})$ היא מדידה בורל.
]


#question()
נזכיר את ה־$sigma$־אלגברה מהתרגול הראשון על קבוצה $RR$
$ cal(A) = {E subset.eq RR bar abs(A)<=aleph_0, abs(E^c)<=aleph_0} $

#subquestion()
נגדיר $mu : cal(A) arrow.r [0, infinity]$ על־ידי
$ mu(E) = mycases(0, abs(E)<=aleph_0, 1, "אחרת") $
נראה כי $mu$ מהווה מידה על $(RR, cal(A))$.

#proof[
  עלינו להראות כי $mu$ היא $sigma$־אדיטיביות ואיננה טריוויאלית $infinity$, כלומר יש $A in cal(A)$ כך ש־$mu(A)<infinity$.\
  ראשית, $emptyset in E$ ו־$abs(emptyset)<= aleph_0$ ולכן  $mu(emptyset)=0$ ולכן $mu$ היא איננה טריוויאלית $infinity$.\
  עבור ה־$sigma$־אדיטיביות, תהיי $(A_n)_(n=1)^infinity subset.eq cal(A)$ קבוצות מדידות וזרות בזוגות.\
  יש לנו שתי אפשרויות: או שלכל $n in NN$, $abs(A_n)<=aleph_0$ ולכן $mu(A_n)=0$ ותחת הנחת אקסיומת הבחירה, $union.big_(n=1)^infinity A_n$ זה איחוד בן־מנייה של קבוצות בנות־מנייה ולכן האיחוד בן־מנייה, כלומר $mu(union.big_(n=1)^infinity)=0$ וקיבלנו שתחת מקרה זה מתקיימת $sigma$־אדיטיביות.\
  באפשרות השנייה, נטען שיש לכל היותר $k in NN$ יחד כך ש־$A_k$ איננו בן־מנייה:
  אז $A_k^c$ הוא בן־מנייה, וכדי שיהיה לנו איחוד של קבוצות זרות בזוגות, כל קבוצה אחרת שנאחד צריכה להיות זרה ל־$A$ ולכן היא ב־$A^c$ שהיא בת־מנייה, כלומר לא ייתכן שהיא תהיה לא בת־מנייה.\
  מהיות $(A_n)_(n=1)^infinity$ זרות בזוגות, נובע שלכל $n!=k$ מתקיים $A_n subset.eq A_k^c$ ולכן לכל $n$ כנ"ל מתקיים $mu(A_n)=0$.\
  ניתן לכתוב $union.dot.big_(n=1)^infinity A_n = A_k union.dot.big (union.dot.big_(n!=k) A_n)$, אבל $union.dot.big_(n!=k) A_n$ הוא קבוצה בת־מנייה (מהנחת אקסיומת הבחירה) אבל $abs(A_k)>aleph_0$ ולכן האיחוד $union.dot.big_(n=1)^infinity A_n$ איננו בן־מנייה, כלומר $ mu(union.dot.big_(n=1)^infinity A_n) = 1 $
  מצד שני מתקיים
  $ sum_(n=1)^infinity mu(A_n) = mu(A_k) + sum_(n!=k) mu(A_n) = 1 + 0 = 1 $
  כלומר קיבלנו $sigma$־אדיטיביות, כנדרש.
]

#subquestion()
נמצא את כל הפונקציות המדידות מ־$(RR, cal(A))$ ליישר הממשי ולכל אחת נחשב את האינטגרל שלה.

#proof[]
