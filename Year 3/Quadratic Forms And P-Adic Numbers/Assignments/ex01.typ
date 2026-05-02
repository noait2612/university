#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 01 --- תבניות ריבועיות ומספרים $P$־אדיים, 80507 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נתונים שדה $FF$ ומטריצות $A,B in M_n (FF)$ חופפות זו לזו.

#subquestion()
נוכיח שאם $A$ סימטרית אז $B$ סימטרית.

#proof[
  מכך ש־$A,B$ חופפות נובע שיש $P in M_n (FF)$ הפיכה כך שמתקיים $B=P^t A P$ ואם $A$ סימטרית אז $A=A^t$ ולכן נקבל
  $ B=P^t A P <==> B^t = (P^t A P)^t <==> B^t =_((X Y Z)^t = Z^t Y^t X^t) P^t A^p (P^t)^t =_(A^t = A) P^t A P $
  כלומר $B^t = B$ ולכן $B$ מטריצה סימטרית.
]

#subquestion()
נוכיח שאם $A$ הפיכה אז $B$ הפיכה.

#proof[
  $A$ הפיכה ולכן קיימת $A^(-1)$ וקיימת $P in M_n (FF)$ הפיכה מהחפיפת מטריצות ולכן מתקיים
  $
    B = P^t A P <==> B^(-1) = (P^t A P)^(-1) =_((X Y)^(-1) = Y^(-1) X^(-1)) P^(-1) A^(-1) (P^t)^(-1) =_((P^t)^(-1) = (P^(-1))^t) P^(-1) A^(-1) (P^(-1))^t
  $
  והכל כמובן מוגדר היטב.
]

#subquestion()
נוכיח שקיים $0 != c in FF$ כך ש־$det B = c^2 det A$.

#proof[
  נזכר בכמה תכונות של הדטרמיננטה עבור סקלר $k in FF$ ו־$X,Y in M_n (FF)$
  $ det(k M) = k^n det M wide det(X Y)=det(X)det(Y) wide det(P^t)=det(P) $
  ולכן אם ניקח שוב את $P in M_n (FF)$ ההפיכה מהחפיפת מטריצות נקבל $B=P^t A P$ ולכן
  $ det(B)=det(P^t A P)=det(P^t) det(A) det(P) = det(P) det(A) det(P) = det^2 (P) det(A) $
  אז אם נגדיר $c = det^2 (P)$ ו־$c!=0$ כי $P$ הפיכה נקבל $det(B)=c^2 det(A)$, כנדרש.
]
