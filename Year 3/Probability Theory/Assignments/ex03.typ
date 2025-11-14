#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 03 --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#question()
#definition("מאורע מחזק")[
  נאמר שמאורע $A$ מחזק את מאורע $B$ אם $PP(B bar A) = PP(A inter B)/PP(A) > PP(B)$.
]
יהי $(Omega, cal(F), PP)$ מרחב הסתברות.

#subquestion()
נפריך את הטענה שאם  $A$ מחזק את $B$ ו־$B$ מחזק את $C$ אז $A$ מחזק את $C$.

#proof[
  נניח שאנחנו במרחב הסתברות הוגן של הטלה של שתי קוביות.\
  נגדיר את מאורע $A$ להיות המאורע שיצא $2$ בקובייה הראשונה, את המאורע $B$ להיות המאורע שיצא לפחות $2$ בכל קובייה ואת מאורע $C$ להיות המאורע שיצא לפחות $2$ בקובייה השנייה.\
  נחשב ונראה שאכן המאורעות האלו עומדים בתנאי השאלה
  $
    PP(B bar A) = PP(A inter B)/PP(A) = PP({(omega_1, omega_2) in [6]^2 bar omega_1 = 2, omega_2 in {2,3,4,5,6}})/PP({(omega_1, omega_2) in [6]^2 bar omega_1 = 2}) = (5/36)/(1/6)=5/6 = 30/36 > 25/36 = PP(B) \
    PP(C bar B) = PP(C inter B)/PP(B) = PP({(omega_1, omega_2) in [6]^2 bar omega_1, omega_2 in {2,3,4,5,6} and omega_2 in {2,3,4,5,6} )})/PP({(omega_1, omega_2) in [6]^2 bar omega_1, omega_2 in {2,3,4,5,6}}) = (25/36)/(25/36) = 1 > 25 /36 = PP(C)
  $
  מצד שני
  $
    PP(C bar A) = PP(A inter C)/PP(A) = PP({(omega_1, omega_2) in [6]^2 bar omega_1 = 2, omega_2 in {2,3,4,5,6}})/PP({(omega_1, omega_2) in [6]^2 bar omega_1 = 2}) = (5/36)/(1/6) = 5/6 = 30/36 gt.not 30/36 = PP(C)
  $
  אז הטענה לא נכונה.
]

#subquestion()
נוכיח שאם  $A$ מחזק את $B$ אז $B$ מחזק את $A$.

#proof[
  ישירות מהגדרה מתקיים
  $ PP(B bar A) > PP(B) <==> PP(A inter B)/PP(A) > PP(B) <==> PP(A inter B)/PP(B) > PP(A) <==> PP(A bar B) >PP(A) $
]

#subquestion()
נפריך את הטענה שאם $(Omega, cal(F), PP)$ מרחב הסתברות אחידה (בפרט $Omega$ סופית) ואם יש מאורע $B$ כך ש־$PP(B)>0$ אז $(Omega, PP_B)$ מרחב הסתברות אחידה.

#proof[
  ניקח שוב מרחב הסתברות של הטלת קובייה הוגנת בעלת $6$ פאות.\
  נגדיר את המאורע $B$ להיות שיצא ${1,2,3}$, המרחב שלנו כמובן אחיד ו־$PP(B) = 1/2$.
  אבל $ PP_B ({1}) = PP({1} bar B) = 1/3 != 0 = PP({4} bar B) = PP_B ({4}) $
]

#subquestion()
נוכיח שאם $(Omega, cal(F)=2^Omega, PP)$ איננו מרחב הסתברות אחיד כאשר $Omega$ סופית ויהי $B$ מאורע כך ש־$PP(B)>0$ אז $(Omega, cal(F), PP_B)$ איננו מרחב הסתברות אחיד.

#proof[
  $abs(Omega)!=emptyset$ (אחרת לא היה לנו מאורע $B$ עם הסתברות חיובית) ולכן יש שתי אפשרויות: או ש־$Omega=B$ ואז סיימנו מהנתון או ש־$Omega!=B$.\
  במקרה השני, נגדיר $A = Omega without B$ ומתקיים
  $ PP_B (B) = 1 != 0 = PP_B (A) $
]

#subquestion()
נוכיח שמתקיים $PP(A^c bar B) = 1-PP(A bar B)$.

#proof[
  נשים לב שניתן לכתוב
  $ B = Omega inter B = (A union A^c) inter B = (A inter B) union (A^c inter B) $
  נשים לב שמהגדרה נובע כי $A inter B$ ו־$A^c inter B$ הם מאורעות זרים (זה פשוט מהגדרת המשלים) ולכן $PP(B) = PP(A inter B) + PP(A^c inter B)$.\
  אם כך, מתקיים
  $ PP(A^c bar B) = PP(A^c inter B)/PP(B) = (PP(B)-PP(A inter B))/PP(B) = 1-PP(A inter B)/PP(B) = 1-PP(A bar B) $
]

#subquestion()
נפריך את הטענה שאם $PP(A bar B^c) = 1-PP(A bar B)$.

#proof[
  ניקח את מרחב ההסתברות שלנו להיות מרחב הסתברות אחיד של הטלת קובייה הוגנת בעלת $6$  פעם אחת.\
  נגדיר את המאורע $A$ להיות שיצא בהטלה ${1,2,3,4,5}$, את המאורע $B$ שיצאה תוצאה זוגית ו־$B^c$ זה כמובן המאורע שיצאה תוצאה אי־זוגית.\
  נחשב
  $
    PP(A bar B^c) = PP(A inter B^c)/PP(B^c) = PP({1,3,5})/PP({1,3,5}) = 1 != 1/3 = 1-4/6 = 1-(2/6)/(1/2) = 1-PP({2,4})/PP({2,4,6}) = 1-PP(A bar B)
  $
]

#question()
יהיו $A,B,C subset.eq Omega$ שלושה מאורעות במרחב הסתברות $(Omega,PP)$.\
נניח במובלע כי המאורע בו אנחנו מתנים הוא בעל הסתברות גדולה מ־$0$.

#subquestion()
נוכיח את הטענה שאם $A subset.eq B$ אז $PP(A)<=PP(A bar B)$.

#proof[
  ממונוטוניות פונקציית ההסתברות ומהנתון כי $A subset.eq B$ נובע כי $PP(A)<=PP(B)$ וכן $PP(A inter B) = PP(A)$.\
  אז מתקיים
  $ PP(A bar B) = PP(A inter B)/PP(B) = PP(A)/PP(B) $
  כלומר מתקיים  $ PP(A)<=PP(A)/PP(B) $
  אבל $0<PP(B)<=1$ ולכן $1/PP(B)>=1$ ובפרט $PP(A)/PP(B)>=PP(A)$
]

#subquestion()
נוכיח שאם $B subset.eq A$ אזי $PP(A)<=PP(A bar B)$.
#proof[
  שוב ממונוטוניות פונקציית ההסתברות, מהנתון $B subset.eq A$ נובע כי $PP(A inter B) = PP(B)$ ולכן $ PP(A bar B) = PP(A inter B)/PP(B) = PP(B)/PP(B)=1 $
  אז בהכרח שמתקיים גם $P(A)<=1$ מהגדרת פונקציית ההסתברות.
]

#subquestion()
נפריך את הטענה שאם $A inter B = emptyset$ אז $PP(A)<=PP(A bar B)$.

#proof[
  ניקח את מרחב ההסתברות האהוב עלינו של הטלת קובייה הוגנת בעלת $6$ פאות ונגדיר את $A$ להיות המאורע שתוצאת ההטלה היא זוגית ו־$B$ המאורע שתוצאת ההטלה היא אי־זוגית.\
  אז כמובן שמתקיים $A inter B = emptyset$ וניזכר שמהגדרת פונקציית ההסתברות, $PP(emptyset)=0$ וגם מתקיים
  $ PP(A) = 1/2 lt.eq.not 0 = 0/(1/2) = PP(A inter B)/PP(B) = PP(A bar B) $
]

#subquestion()
נוכיח שמתקיים $PP(A inter B bar C) = PP(A bar B inter C)PP(B bar C)$.
#proof[
  מתקיים
  $ PP(A inter B bar C) = PP(A inter B inter C)/PP(C) $
  מצד שני
  $
    PP(A bar B inter C)PP(B bar C) = PP(A inter B inter C)/PP(B inter C) PP(B inter C)/PP(C) = PP(A inter B inter C)/PP(C) = PP(A inter B bar C)
  $
]

#question()
#subquestion()
בשידה שלוש מגירות. באחת זוג גרביים שחורות, בשנייה זוג גרביים לבנות ובשלישית גרב שחורה וגרב לבנה.\
נניח שבחרתי באקראי (בהסתברות אחידה) והוצאתי ממנה גרב באקראי והוא לבן, נבחן מה ההסתברות שגם הגרב השני במגירה הוא לבן.

#solution[]

#subquestion()
נתון דלי עם $k$ כדורים לבנים ו־$k$ כדורים שחורים. \
מוציאים $n<k$ כדורים ללא החזרות ולאחר מכן מוציאים את הכדור ה־$n+1$ במספר. \
בהינתן שכל ה־$n$ כדורים הראשונים היו לבנים, נחשב את ההסתברות שהכדור ה־$n+1$ הוא שחור.

#solution[]

#question()
יהי $(Omega, PP)$ מרחב הסתברות ונשים לב שאנחנו *לא* מניחים שההסתברות של המאורעות היא חיובית (קרי, יכולה להיות $0$).\
_תזכורת_: נגיד ש־$A,B$ שני מאורעות במרחב הסתברות הם בלתי־תלויים אם ורק אם $PP(A inter B)=PP(A)PP(B)$.

#subquestion()
נפריך את הטענה ששני מאורעות $A,B$ הם בלתי־תלויים אם ורק אם הם זרים.

#proof[
  ניקח שוב את מרחב ההסתברות האהוב עלינו, מרחב הטלה אחת של קובייה הוגנת בעלת $6$ פאות.\
  נגדיר את $A$ להיות המאורע שיצא אחד מהבאים ${1,2,3}$ ואת $B$ להיות $Omega$ כלומר $B = {1,2,3,4,5,6}$.\
  אז מתקיים $A inter B = A != emptyset$ וכן
  $ PP(A inter B) = PP(A) = 1/2 = 1/2 dot.op 1 = PP(A) dot.op PP(B) $
]

#subquestion()
נפריך את הטענה שאי־תלות היא יחס טרנזטיבי: בהינתן מאורעות $A,B,C$ כך ש־$A$ בלתי־תלוי ב־$B$ ו־$B$ בלתי־תלוי ב־$C$ נראה ש־$A$ תלוי ב־$C$.
#proof[
  ניקח הפעם את מרחב ההסתברות של קובייה *לא* הוגנת כך ש־$PP({1})=PP({2})=0$ ולכל השאר יש הסתברות אחידה, כלומר $PP(omega)=1/4$ עבור $omega in {3,4,5,6}$.\
  נגדיר את המאורעות הבאים לתוצאות ההטלה $A={1,3}, B={1,2}, C={3}$, אכן מתקיים
  $
    PP(A inter B) = PP({1}) = 0 = 1/4 dot.op 0 = PP(A) dot.op PP(B) \
    PP(B inter C) = PP(emptyset) = 0 = 0 dot.op 1/4 = PP(B) dot.op PP(C)
  $
  מנגד
  $ PP(A inter C) = PP({3}) = 1/4 != 1/16 = 1/4 dot.op 1/4 = PP(A) dot.op PP(C) $
]
