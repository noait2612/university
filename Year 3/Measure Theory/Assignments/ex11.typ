#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 11 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נשלים את הוכחת הלמה מהכיתה – יהיו $lambda, mu$ שתי מידות רדון על $RR^d$ ויהיו $0<t<infinity$.\
אם $A subset RR^d$ היא קבוצת בורל המקיימת לכל $x in A$
$ overline(D)(mu, lambda, x)>=t $
אז
$ mu(A)>=t dot.op lambda(A) $

#proof[]

#question()

#question()
*משפט שטיינהאוס*: תהיי $A subset.eq RR^d$ ונגדיר את ההפרש של $A$ להיות
$ cal(D) colon.eq {x-y bar x,y in A} $
נסמן ב־$lambda$ את מידת לבג על $RR^d$.

#subquestion()
נוכיח כי אם $lambda(A)>0$ אז קיימת $delta>0$ כך ש־$B_delta (0) subset cal(D)(A)$.

#proof[
  ראשית נבחין כי ניתן להניח ש־$lambda(A)<infinity$: כי אם $lambda(A)=infinity$ אז נבחר $K subset A$ חסומה כך שמתקיים $0<lambda(K)<infinity$ ואם נוכיח עבור $K$ אז נקבל $B_delta (0) subset cal(D)(K) subset cal(D)(A)$.\
  אז נניח $0<lambda(A)<infinity$.\
  נעזר ברמז ונגדיר $g:RR^d arrow.r RR$ על־ידי
  $ g(x) = lambda(A inter (A + x))=integral_(RR^d) bb(1)_(A)(y) bb(1)_(A)(y-x) dif y $
  נבחין כי מתקיים
  $ g(0) = lambda(A inter (A+0))=lambda(A inter A)=lambda(A)>0 $
  וכן ש־$g(x)$ רציפה: בתרגיל 5 ראינו ש־$lambda$ היא אינווריאנטית להזזות ובאופן דומה גם ב־$RR^d$ נקבל שהיא אינווריאנטית להזזות.\
  #todo תסיימי את הרציפות
  מהיות $lambda(A)>0$ נובע שיש $delta>0$ כך שמתקיים לכל $abs(r)<delta$
  $ lambda(A inter (A+r))>0 $
  כלומר $A inter (A+r)!=emptyset$ לכל $r in B_delta (0)$ וזה בידיוק אומר $B_delta (0) subset cal(D)(A)$:\
  כי אם $g(x)>0$ אז $A inter (A+r)!=emptyset$ כלומר קיים $a in A inter (A+r)$ כך ש־$a in A+r$ כלומר יש $a' in A$ כך שמתקיים $ a=a'+r<==> r=a-a' in cal(D)(A) $
]

#subquestion()
נשתמש בסעיף הקודם כדי להראות שאם $A subset RR^d$ היא קבוצה מדידה שמהווה תת־חבורה לא טריוויאלית (ביחס לפעולת החיבור) אז $lambda(A)=0$.

#proof[
  תהיי $A$ קבוצה מדידה שמהווה תת־חבורה לא טריוויאלית ביחס לפעולת החיבור ונניח בשלילה $lambda(A)>0$.\
  מהסעיף הקודם נובע שקיימת $delta>0$ כך ש־$B_delta (0) subset cal(D)(A)$.\
  היות ו־$A$ היא תת־חבורה נובע כי $x-y in A$ לכל $x,y in A$ ולכן $cal(D)(A)=A$, כלומר $B_delta (0) subset A$.\
  נטען כי $A=RR^d$: ואכן, לכל $x in RR^d$ ניקח $n in NN$ גדול דיו כך ש־$x/n in B_delta (0) subset A$ ומהיות $A$ תת־חבורה
  $ x = n dot.op x/n in A $
  ולכן $A = RR^d$ אבל זה אומר ש־$A$ היא תת־חבורה טריוויאלית, בסתירה.
]

#question()
תהיי $mu$ מידת רדון על $RR^d$ ונסמן ב־$P subset.eq RR$ את
$ P colon.eq {r bar mu(partial B_r (0))>0} $
כלומר את קבוצת הרדיוסים $r$ עבורם הספירה מרדיוס $r$ שמרכזה בראשית הצירים מקבלת מידה חיובית.

#subquestion()
נניח ש־$P$ לא בת־מנייה. לכל $n in NN$ נגדיר $P_n subset P$ להיות קבוצת הרדיוסים $r$ עבורם $ mu(partial B_r (0))>1/n $
ונראה כי יש $R>0, n$ כך שהקבוצה $P_n inter (0,R)$ אינסופית.
