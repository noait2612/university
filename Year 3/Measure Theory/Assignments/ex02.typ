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
  עלינו להראות את שלוש התכונות של $sigma$־אלגברה עבור $cal(overline(B))$
]

#subquestion()
נוכיח כי $overline(mu)$ מוגדרת היטב.

#proof[

]

#subquestion()
נוכיח שכל מידה $hat(mu)$ על $overline(cal(B))$ המקיימת $hat(mu)(A) = mu(A)$ לכל $A in cal(B)$ למעשה מתלכדת עם $overline(mu)$. \
כלומר נוכיח ש־$overline(mu)$ היא ההרחבה היחידה של $mu$ למידה על $overline(cal(B))$.

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
נראה כי קבוצת הנקודות $x in X$ בהן הסדרה $f_n (x)$ מתכנסת היא מדידה וכי אם נסמן קבוצה זו ב־$E$ ונגדיר את $f:E arrow.r [-infinity,infinity]$ על־ידי $f colon.eq lim_(n arrow.r infinity) f_n$ זו תהיה פונקציה מדידה.

#proof[

]

#subquestion()
נסמן לכל $x in [0,1]$ את הפיתוח הבינארי שלו כ־$0,d_1d_2d_3 dots.h$ כאשר
$
  d_n (x) = mycases(0, exists m in NN space s.t. space x in [(2m)/2^n, (2m+1)/2^n], 1, exists m in NN space s.t. space x in [(2m-1)/2^n, (2m)/2^n])
$
ונסיק מהסעיף הקודם כי קבוצת הנקודות $x in [0,1]$ עבורן $ lim_(n arrow.r infinity) sum_(i=1)^n (d_i (x))/n = 1/2 $
היא מדידה בורל.

#question()
נזכיר את ה־$sigma$־אלגברה מהתרגול הראשון על קבוצה $RR$
$ cal(A) = {E subset.eq RR bar abs(A)<=aleph_0, abs(E^c)<=aleph_0} $

#subquestion()
נגדיר $mu : cal(A) arrow.r [0, infinity]$ על־ידי
$ mu(E) = mycases(0, abs(E)<=aleph_0, 1, "אחרת") $
נראה כי $mu$ מהווה מידה על $(RR, cal(A))$.

#proof[

]

#subquestion()
נמצא את כל הפונקציות המדידות מ־$(RR, cal(A))$ ליישר הממשי ולכל אחת נחשב את האינטגרל שלה.

#proof[]
