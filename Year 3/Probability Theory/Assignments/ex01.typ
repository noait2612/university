#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 01 --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#question()
יהי $(Omega, cal(F), PP)$ מרחב הסתברות.

#subquestion()
נוכיח שאם $A subset.eq Omega$ מקיימת $PP(A)=0$ אז לכל $B subset.eq Omega$ מתקיים $PP(A union B) = PP(B)$.

#proof[
  תהיי $D = B without A$ ומתקיים $(A inter B) inter D = emptyset$ ולכן מתכונת הסכימות בת־מנייה של $PP$ מתקיים
  $ (star) space PP(D union (A inter B)) = PP(D) + PP(A inter B) $
  מהגדרת החיתוך ומתכונות פונקציית הסתברות נקבל
  $ 0<=P(A inter B) <= PP(A)=0 ==> P(A inter B) = 0 $
  ומ־$(star)$ נקבל $PP(D)=PP(B)$ ובסך־הכל
  $ PP(A union B) = PP(A union (B without A)) = PP(A union.dot D) =_"סכימות בת־מנייה" PP(A)+PP(D) = 0 + PP(D)=PP(B) $
]

#subquestion()
נפריך את הטענה שאם $A subset.neq B$ אזי $PP(A) < PP(B)$.

#proof[
  נגדיר $Omega = {1,2,3}$ כך שמתקיים $p(1) = p(2)=1/2, p(3) = 0$.\
  נסתכל על הקבוצות $B = {1,3}, A = {1}$ ואכן $A subset.neq B$ אבל $PP(A) = p(1) = 1/2 = PP(B) = 1/2$, בסתירה.
]

#subquestion()
נוכיח שלכל $A, B subset.eq Omega$ מתקיים $PP(A inter B)>= PP(A) ++ PP(B)-1$.

#proof[
  מתכונות פונקציית ההסתברות ועיקרון ההכלה וההדחה מתקיים
  $
    PP(A union B) = PP(A)+PP(B)-PP(A inter B) <==> PP(A inter B) = PP(A)-PP(B)-PP(A union B) >=_(forall X in cal(F), 1>=PP(X)) PP(A) + PP(B)- 1
  $
]

#subquestion()
יהיו $A,B subset.eq Omega$ ונוכיח שמתקיים
$ PP(A Delta B) = PP(A) + PP(B) - 2PP(A inter B) $

#proof[
  ניזכר בהגדרה
  $ A Delta B = (A union B) without (A inter B) = (A union B) inter (A inter B)^c $
  מתקיים
  $
    PP(A Delta B) & = PP((A union B) inter (A inter B)^c) \
                  & =_((1)) PP(A union B) + PP((A inter B)^c) - PP((A union B) union (A inter B)^c) \
                  & =_((2)) PP(A union B) + PP(Omega without (A inter B)) - PP(A union B union A^c union B^c) \
                  & = PP(A union B) + PP(Omega without (A inter B)) - PP(Omega) \
                  & =_((3)) PP(A union B) cancel(+ PP(Omega))-PP(A inter B) cancel(- 1) \
                  & =_((1)) PP(A) + PP(B) - 2 PP(A inter B)
  $
  כאשר $(1)$ נובע מהכלה והדחה, $(2)$ נובע מכללי דה־מורגן לקבוצות ו־$(3)$ נובע מתכונת המשלים של פונקציית הסתברות.
]

#question()
במסגרת ניסוי דו־שלבי, מוגרל בשלב הראשון מספר טבעי $n in NN$ על־פי פונקציית ההתפלגות הנקודתית $p(n)=2 dot.op 3^(-n)$.\
בשלב השני מוגרל מספר באקראי באופן אחיד מתוך $[2^n]$.

#subquestion()
נראה כי $p$ מקיימת את ההגדרה של פונקציית הסתברות נקודתית על $NN$.

#proof[
  #todo
]

#subquestion()
נחשב מה ההסתברות שהגורל בסוף השלב השני המספר $1$.

#solution[

]

#question()
בכל סעיף, נבנה מרחב הסתברות אחיד המתאר נכונה את השאלה ונחשב את ההסתברות של המאורע המתואר.

#subquestion()
נתונים $5$ בני־אדם. נחשב מה ההסתברות שלפחות שניים מהם נולדו באותו החודש.

#solution[

]

#subquestion()
$4$ בנים ו־$4$ בנות עומדים בשורה באופן מקרי. נחשב מה ההסתברות שיעמדו כך ש־$4$ הבנים יעמדו ב־$4$ המקומות הימניים ו־$4$ הבנות יעמדו ב־$4$ המקומות השמאליים.

#solution[

]

#subquestion()
בוחרים באקראי ובאופן אחיד חלוקה של $12$ כדורים *זהים* בין $8$ תאים ממוספרים בהתפלגות אחידה. נחשב מה ההסתברות שאין תא ריק.

#solution[]

#subquestion()
מחלקים באקראי $12$ כדורים זהים בין $8$ תאים ממוספרים בזה אחר זה, כאשר לכל כדור נבחר תא באופן אקראי ואחיד. נחשב את ההסתברות שאין תא ריק.

#solution[]

#question()
#subquestion()

#proof[

]

#subquestion()
#proof[]

#question()
בכל סעיף נבנה מרחב הסתברות $(Omega, cal(F), PP)$ עם שלושה מאורעות $A,B,C$ שונים כך שתנאי הסעיף יתקיימו.

#subquestion()
$PP(A) = PP(B) = PP(C) = 3/4$ וגם $PP(A inter B inter C) = 1/4$.

#solution[]

#subquestion()
$PP(A)=PP(B)=PP(C)=3/4$ וגם $PP(A inter B inter C)=3/4$.
#solution[]

#subquestion()
$PP(A)=PP(B)=PP(C)=3/4$ וגם $PP(A inter B inter C) = 1/2$.
#solution[]

#question()
תהיי $Omega$ קבוצה בת־מנייה ולא סופית. במקום לקחת את $cal(F)$ להיות אוסף כל התת־קבוצות של $Omega$, נגדיר את $cal(F)$ להיות אוסף תת־הקבוצות של $Omega$ שהן או סופיות או שהקבוצה המשלימה שלהן סופית.\
נגדיר $P : cal(F) arrow.r [0,1]$ על־ידי
$ P(A) = mycases(0, abs(A)<infinity, 1, abs(Omega without A) = abs(A^c) < infinity) $

#subquestion()
נראה כי האוסף $cal(F)$ סגור ללקיחת משלים ולאיחודים סופיים.

#proof[
  יהי $A in cal(F)$.\
  מהגדרת $cal(F)$ יש שני מקרים אפשריים או ש־$abs(A)<infinity$ ולכן $abs(A^c)<infinity$ או שמתקיים $abs(A^c)<infinity$ ולכן $abs(A)<infinity$ וקיבלנו סגירות למשלים.\
  תהיינה $A, B in cal(F)$ ונחלק למקרים:
  + אם $abs(A), abs(B) < infinity$ אזי בהכרח $abs(A union B) < infinity$ ולכן $A union B in cal(F)$
  + אם $abs(A), abs(B) = infinity$ אזי $A union B = (A^c inter B^c)^c$ אבל מהגדרת $cal(F)$ נובע ש־$abs(A^c), abs(B^c) < infinity$ ולכן בהכרח $abs(A^c inter B^c)<infinity$ אז שוב קיבלנו$A union B in cal(F)$
  + אם $abs(A), abs(B^c)<infinity$ (בלי הגבלת הכלליות) אזי $(A union B)^c = A^c inter B^c$ אבל $B^c$ סופית ולכן גם $abs(A^c inter B^c)<infinity$ ושוב $A union B in cal(F)$
  כיסינו את כל המקרים האפשריים לאיחוד זוגות ולכן $cal(F)$ סגורה לאיחודי זוגות.\
  כדי להוכיח סגירות למשלים סופי, נוכל להשתמש בטענה הזאת ולהוכיח באינדוקציה: נניח $(A_i)_(i=1)^ell subset.eq cal(F)$, בסיס האינדוקציה נובע ממה שראינו לעיל מהנחת האינדוקציה והבסיס הטענה נובעת.\
  ראינו ש־$cal(F)$ סגורה להשלמה ולאיחוד סופי וזה מסיים.
]

#subquestion()
נראה כי $P$ מקיימת $P(Omega)=1, P(emptyset)=0$ וסכימות סופית (כלומר אם $A_1, dots.h, A_k in cal(F)$ זרים בזוגות אזי $P(union.big_(i=1)^k A_i) = sum_(i=1)^k P(A_i)$).

#proof[
  ראשית, $abs(emptyset) < infinity$ ולכן מהגדרה $P$ מתקיים $P(emptyset)=0$.\
  שנית, $Omega^c = Omega without Omega = emptyset$ ולכן שוב מהנתון $P(Omega)=1$.\
  נשאר להראות אדיטיביות סופית. תהיינה $(A_i)_(i=1)^ell$ מאורעות זרים בזוגות וסופית.\
  נטען שלכל היותר יש $i in [ell]$ יחיד כך ש־$abs(A_i) = infinity$: נניח שלא ככה, ולכן יש $A_i, A_j$ כך שמתקיים $abs(A_i), abs(A_j) = infinity$ עבור $i, j in [ell]$ וכמובן זרים.\
  מההנחה נובע ש־$abs(A_i^c), abs(B_j^c) < infinity$ ולכן יש $a in.not A_i^c inter A_j^c$ ולכן $a in A_i, A_j$ אבל זו סתירה לזורתם.\
  כעת, נניח כי לכל $2<=i<=ell$, $abs(A_i) < infinity$ ו־$A_1$ ונחלק למקרים:
  + אם $abs(A_1) < infinity$ אז $union.big_(i=1)^ell A_i$ הוא איחוד סופי של עוצמות סופיות ולכן סופי גם־כן ומתקיים $P(union.big_(i=1)^ell A_i) = 0 = sum_(i=1)^ell P(A_i)$.
  + אם $abs(A_1) = infinity$ אזי האיחוד שלהן של הזנב הוא סופי ומתקיים $1 = P(union.big_(i=1)^ell A_i) = P(A_1) + sum_(i=2)^ell A_i = sum_(i=1)^ell A_i$
]

#subquestion()
נראה כי יש $A in cal(F)$ המקיימת $P(A)=1$ שהיא איחוד של $A_1, A_2, dots.h in cal(F)$ זרות בזוגות אם $P(A_n)=0$ לכל $n in NN$.\
נסיק כי $P$ אינה מקיימת סכימות בת־מנייה ונבחן האם התשובה לסעיף זה הייתה משתנה אילו $Omega$ הייתה הקטע $[0,1]$ (ולכן לא בת־מנייה).

#solution[
  מהנתון,$Omega$ היא בת־מנייה, כלומר $abs(Omega)=abs(NN)$ ולכן קיימת $f:NN arrow.r Omega$ שמעידה על־כך, כלומר $f$ חד־חד ערכית ועל.\
  נגדיר $(A_n)_(n=1)^infinity subset.eq cal(F)$ על־ידי $A_n = {f(n)}$ ומתקיים $union.big_(n in NN) A_n = f(NN) = Omega$
  אזי $P(union.big_(n=1)^infinity A_n) = P(Omega)=1$ אבל מצד שני לכל $n in NN$ מתקיים $P(A_n)=0$ כי $A_n$ הוא יחידון, כלומר סופית.\
  זוהי סתירה ישירה לסיגמא־אדיטיביות כי כל יחידון $P(A_n)=0$ אבל איחודם איננו אפס.\

]
