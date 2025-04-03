#import "../../../../src/article.typ": *
#show: article.with(
	title: [ פתרון מטלה 02 --- חשבון אינפיניטסימלי 3, 80415 ],
	author: [  ],
	signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]]
)

#question()
יהי $(X, norm(dot.op))$ מרחב נורמי.

#subquestion()
נוכיח כי לכל $x in X$ ו־$r>0$ מתקיים $(hat(B)_r(x))^circle.stroked.small = B_r(x)$
#proof[]

#subquestion()
נוכיח כי לכל $x in X$ ו־$r>0$ מתקיים $partial B_r(x) = S_r(x)$
#proof[]

#question()
#subquestion()
נמצא את הפנים, הסגור והשפה של הקבוצה $A = {(x,y,z) in RR^3 bar x+y+z<=1} subset.eq (RR^3, norm(dot.op)_2)$.
#proof[]

#subquestion()
נמצא את הפנים, הסגור והשפה של הקבוצה $B = {f in C([0,1]) bar f "מונוטונית יורדת ממש"} subset.eq(C[0,1], norm(dot)_infinity)$
#proof[]

#subquestion()
נמצא את הפנים, הסגור והשפה של הקבוצה $C = {x in ell^infinity bar L in (-1,1] and text("קיים הגבול") L = display(lim_(n arrow.r infinity) x_n)} subset.eq (ell^infinity, norm(dot.op)_infinity)$
#proof[]

#question()
יהי $p in NN$ מספר ראשוני.

#subquestion()
נתאר את כדור היחידה הסגור $ZZ_(p) colon.eq hat(B)_1(0) subset.eq (QQ, d_p)$.
#proof[]

#subquestion()
נוכיח כי $overline(ZZ) = ZZ_(p)$ ונקבע מהו $ZZ^circle.stroked.small$.
#proof[]

#subquestion()
נוכיח כי $ZZ_(p)$ אינה קומפקטית סדרתית.
#proof[]

#question()
יהיו $(X,d_X), (Y, d_Y)$ מרחבים מטריים ובתרגיל הקודם ראינו כי המכפלה $X times Y$ היא מרחב מטרי ביחס למטריקה TODO

#subquestion()
נוכיח כי הסדרה $((x_n, y_n)) subset.eq X times Y$ מתכנסת ל־$(x,y)$ אם ורק אם $(x_n) arrow.r_(n arrow.r infinity) x$ ו־$(y_n) arrow.r_(n arrow.r infinity) y$
#proof[]

#subquestion()
נסמן ב־$p_X : X times Y arrow.r X$ וב־$p_Y : X times Y arrow.r Y$ את ההטלות. נוכיח כי $p_X$ ו־$p_Y$ רציפות.
#proof[]

#subquestion()
נוכיח כי לכל מרחב מטרי $(Z,x_Z)$ ופונקציה $f : Z arrow.r X times Y$ מתקיים ש־$f$ רציפה אם ורק אם $p_X compose f$ ו־$p_Y compose f$ רציפות.
#proof[]

#subquestion()
נניח כי $X,Y$ קומפקטיים סדרתית. נוכיח כי גם המכפלה $X times Y$ קומפקטית סדרתית. נסיק כי מכפלה סופית של מרחבים קומפקטיים סדרתית היא קומפקטית סדרתית.
#proof[
מספיק שנראה עבור שתי מכפלות והמכפלה של יותר תנבע באינדוקציה.
]

#question()
יהי $(X,d)$ מרחב מטרי ו־$K subset.eq X$ קומפקטית סדרתית ו־$B subset.eq X$ כלשהי.

#subquestion()
נוכיח כי כל פונקציה רציפה $f: K arrow.r RR$ מקבלת מינימום ומקסימום.
#proof[]

#subquestion()
נוכיח כי $d(x,B)=0$ אם ורק אם $x in overline(B)$.
#proof[]

#subquestion()
נוכיח כי קיים $x in K$ כך ש־$d(K,B)=d(x,B)$ ונסיק כי $d(K,B) < 0$ אם ורק אם $K inter overline(B) = emptyset$.
#proof[]

#question()
נוכיח כי $hat(B)_1(0) subset.eq (C([0,1]), norm(dot.op)_infinity)$ היא קבוצה סגורה וחסומה שאינה קומפקטית סדרתית.