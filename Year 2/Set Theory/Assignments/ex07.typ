#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 07 --- תורת הקבוצות, 80200 ],
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
ניזכר שלכל $x in omega$ הגדרנו $S(x) = x union {x}$.

#subquestion()
נוכיח שלכל $x in y in omega$ מתקיים $S(x) in y$ או $S(x) =y$.
#proof[
  נגדיר
  $ I = { y in omega bar forall x in y, space (S(x) in y or S(x) = y) } subset.eq omega $
  $I$ קיימת מאקסיומת ההפרדה, ונראה שהיא אינדוקטיבית ומהיות $omega$ הקבוצה האינדוקטיבית המינימלית נקבל ש־$omega subset.eq I$ ומאקסיומת ההיקפיות נקבל $omega = I$ וזה יסיים.\
  באופן ריק, לכל $x in emptyset$ מתקיים $S(x) in emptyset$ או $S(x) = emptyset$ ולכן $emptyset in I$.\
  יהי $y in I$ ו־$x in S(y) = y union {y}$ ומאקסיומת האיחוד נקבל ש־$x in y$ או ש־$x in {y}$.\
  אם $x in y$ אז ישר נקבל ש־$S(x) in y$ או ש־$S(x)=y$ כי $y in I$. נבחן את כל האופציות:\
  אם $S(x) in y$, אז מאקסיומת האיחוד נקבל $S(x) in y union {y} = S(y)$ ולכן $S(x) in S(y)$.\
  אם $S(x) = y$ אז מאקסיומת הזוג הלא סדור $S(x) in {y}$ ומאקסיומת האיחוד $S(x) in y union {y} = S(y)$ ושוב $S(x) in S(y)$.\
  אם $x in {y}$, מאקסיומת הזוג הלא סדור נקבל $x = y$ ולכן $S(x) = S(y)$.\
  כיסינו את כל המקרים וראינו שלכל $x in S(y)$ מתקיים $S(x) in S(y)$ או $S(x) = S(y)$ וזה אומר ש־$S(y) in I$.\
  בסך־הכל זה אומר ש־$I$ קבוצה אינדוקטיבית ו־$I = omega$ מהנימוק בהתחלה. אז לכל $y in omega$ מתקיים $y in I$ ואז לכל $x in y$ מתקיים $S(x) in y$ או $S(x) = y$, וזה בידיוק מה שהתבקשנו להראות.

]

#subquestion()
נוכיח שלכל $x,y in omega$ מתקיים $x in y$ או $y in x$ או $x=y$ ונסיק מכך שלכל $x,y in omega$ מתקיים $x subset.eq y$ או $y subset.eq x$.
#proof[
  יהי $x in omega$ ונגדיר
  $ I_x = { y in omega bar (x in y) or (y in x) or (x=y) } subset.eq omega $
  אם נראה ש־$I_x$ קבוצה אינדוקטיבית, נקבל ש־$omega subset.eq I_x$ מכך ש־$omega$ היא הקבוצה האינדוקטיבית המינימלית ואז נקבל ש־$omega = I_x$
  (מאקסיומת ההקפיות) וזה מסיים.\
  ראשית, $I_x$ קיימת מאקסיומת ההפרדה ומתקיים$emptyset in I_x$ כי לכל $y in emptyset$ מתקיים גם $x in y$ וגם $y in x$ או $x=y$ ולכן $emptyset in I_x$.\
  כעת, יהי $y in I_x$ ולכן אחד מהבאים מתקיים:
  + $x in y$ – מאקסיומת האיחוד נקבל ש־$x in y union {y}$ אבל $S(y) = y union {y}$ ולכן $x in S(y)$
  + $y in x$ – מסעיף א' נקבל ש־$S(y) in x$ או ש־$S(y) = x$
  + $x=y$ – מאקסיומת הזוג הלא סדור נקבל $x in {y}$ ומאקסיומת האיחוד $x in y union {y} = S(y)$ ולכן $x in S(y)$
  זאת אומרת שלכל $y in I_x$ מתקיים $S(y) in I_x$ וגם $emptyset in I_x$ ולכן $I_x$ קבוצה אינדוקטיבית.\
  ולכן בסך־הכל $I_x = omega$ ומתקיים לכל $x,y in omega$ או ש־$y in x$ או ש־$x in y$ או ש־$x=y$, זאת אומרת $x subset.eq y$ או ש־$y subset.eq x$.
]

#question()

#subquestion()
נניח ש־$x,y$ קבוצות ונוכיח ש־$x without y$ קיימת.
#proof[
  תהיינה $x,y$ קבוצות ונגדיר את התכונה $P(z) = (z in.not y)$, ולכן לפי אקסיומת ההפרדה הקבוצה
  $ x without y = { z in x bar z in.not y} $
  קיימת.
]

#subquestion()
נניח ש־$x,y$ קבוצות, $f : x arrow.r y$ פונקציה. נוכיח שלכל $y_0 subset.eq y$ הקבוצה $f^(-1) (y_0)$ קיימת.
#proof[
  תהיינה $x,y$ קבוצות ו־$f : x arrow.r y$ פונקציה ותהיי $y_0 subset.eq y$, נגדיר את התכונה $P(z) = (f(z) in y_0)$.\
  מאקסיומת ההפרדה, הקבוצה
  $ f^(-1)(y_0) = { z in x bar f(z) in y_0} $
  קיימת.
]

#subquestion()
נניח ש־$x,y,z$ קבוצות. נוכיח שלא מתקיים $z in x in y in z$.
#proof[
  נניח בשלילה שמתקיים $z in x in y in z$ ונבחן את הקבוצה ${x,y,z}$: קודם כל, נראה שהיא בכלל קיימת: מאקסיומת הזוג הלא סדור, הקבוצה ${x,y}$ קיימת וגם ${z}$ קיימת, ואם נפעיל שוב את אקסיומת הזוג הלא סדור על ${{x,y}, {z}}$ נקבל שהקבוצה הזאת קיימת. \
  נגדיר את התכונה
  $ P(w) = ((w in {x,y}) or w in {z}) $
  ויחד עם אקסיומת האיחוד נקבל את הקבוצה
  $ union {{x,y}, {z}} = {w bar P(w)} = {x,y,z} $
  אז הקבוצה ${x,y,z}$ קיימת.\

  אבל לפי למה שראינו בהרצאה נובע ש־$z in.not z$ וזאת סתירה.
  #todo
]

#subquestion()
נניח ש־$x$ קבוצה, $E$ יחס שקילות על $x$. נוכיח שהקבוצה $x slash E$ קיימת.
#proof[
  לכל $x' in x$ נגדיר את התכונה
  $ P_1 (accent(x, tilde)) = ((accent(x, tilde), x') in E) $
  לכל $x' in x$ מחלקת השקילות שלו לפי היחס $E$ מוגדרת על־ידי
  $ [x']_E = { accent(x, tilde) in x bar P_1 (accent(x, tilde))} $
  מאקסיומת ההפרדה נקבל ש־$[x']_E$ קיימת. \
  מההגדרה, $x slash E$ מכילה את כל האיברים שמגיעים למחלקת השקילות הנ"ל ולכן נשתמש גם באקסיומת קבוצת החזקה שאומרת שקיימת קבוצת החזקה של $x$ ונסמנה ב־$cal(P)(x)$, נגדיר את התכונה
  $ P_2 (a) = (exists x' in x (a = [x']_E )) $
  ומאקסיומת ההפרדה, נקבל שהקבוצה
  $ x slash E = { a in cal(P)(x) bar P_2 (a)} $
  קיימת.
]

#subquestion()
נניח ש־$x,y,z$ קבוצות, $T subset.eq y times z, R subset.eq x times y$ יחסים. נוכיח שההרכבה $T compose R$ קיימת.
#proof[
  בתרגול ראינו שהקבוצות $x times y, y times z$ קיימות.\
  נגדיר לכל $(x', z') in x times z$ את התכונה
  $ P((x', z')) = exists (y' in y)((x', y') in R and (y', z') in T) $
  אז לפי אקסיומת ההפרדה נקבל שהקבוצה
  $ T compose R = {(x', z') in x times z bar P((x', z'))} $
  קיימת.
]
