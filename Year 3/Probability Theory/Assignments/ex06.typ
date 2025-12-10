#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 06 --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
#subquestion()
נפריך את הטענה שאם $X$ משתנה מקרי המוגדר על מרחב הסתברות $(Omega, PP)$ כך ש־$X~U({1,2,3})$ אז $(Omega, PP)$ הוא מרחב הסתברות אחידה.

#proof[
  נגדיר
  $ Omega = {omega_1, omega_2, omega_3, omega_4} $
  ונגדיר
  $ PP({omega_1}) = 1/12, space PP({omega_2})=PP({omega_3})=PP({omega_4})=3/12 $
  זהו אינו מרחב הסתברות אחיד, ואם נגדיר $X:Omega arrow.r {1,2,3}$ על־ידי
  $ X(omega_1) = X(omega_2) = 1, space X(omega_3) = 2, space X(omega_4)=3 $
  אז מתקיים
  $
    PP(X=1) = PP({omega_1, omega_2}) = PP({omega_1})+PP({omega_2}) = 1/6+1/6 = 1/3 \
    PP(X=2) = PP({omega_3})=1/3 \
    PP(X=3) = PP({omega_4}) = 1/3
  $
  ואכן $X~U({1,2,3})$.
]

#subquestion()
נפריך את הטענה שאם $X,Y$ משתנים מקריים בלתי־תלויים ובעלי תומך סופי ומתקיים $EE(abs(X-Y))=0$ אזי $PP(X=Y)=1$.

#proof[
  ניקח את $Omega = {1, -1}$ ונניח שגם $X,Y$ משתנים מקריים בלתי־תלויים כך שמתקיים $X(omega)=omega, Y(omega)=-omega$ ואכן התומך של $X,Y$ סופי גם הוא.
  מצד אחד, מנוסחת התוחלת נקבל
  $EE(abs(X-Y))=0$ אבל $PP(X=Y)=0$.]

#subquestion()
נפריך את הטענה שאם $X$ משתנה מקרי בעל תוחלת אז גם $X^2$ משתנה מקרי בעל תוחלת.

#proof[
  נניח כי $X$ משתנה מקרי הנתמך על הטבעים ונגדיר $PP(X=n)=c/n^3$ עבור $c$ קבוע.\
  מצד אחד, הטור $EE(X)=sum_(n=1)^infinity n dot.op c/n^3$ מתכנס בהחלט ומנגד $EE(X^2)=sum_(n=1)^infinity n^2 dot.op c/n^3 = sum_(n=1)^infinity c/n$ מתבדר.
]

#subquestion()
נוכיח שאם $X$ משתנה מקרי כך ש־$X^2$ בעל תוחלת אז $X$ בעל תוחלת.

#proof[
  $
    EE(X^2) = sum_(s in RR_(>=0)) s PP(X^2=s) = sum_(s in RR_(>=0)) sqrt(s) dot.op sqrt(s) dot.op PP(X in {sqrt(s), -sqrt(s)}) = sum_(s' in RR_(>=0)) s' dot.op s' dot.op PP(X in {s', -s'}) \
    = sum_(s' in RR_(>=0)) s' dot.op s' (PP(X=s')+PP(X=-s')) = sum_(s' in RR_(>=0)) s' dot.op s' PP(X=s')+sum_(s' in RR_(<0)) s' dot.op s' PP(X=s') \
    = sum_(s' in RR_(>=0)) abs(s') abs(s'PP(X=s'))=sum_(s' in RR_(<0)) abs(s') abs(s'PP(X=s')) = sum_(s' in RR) abs(s') dot.op abs(s' PP(X=s')) = sum_(s in supp(X)) abs(s) dot.op abs(s PP(X=s))
  $
  זהו טור מתכנס בהחלט ולכן ממבחן ההתכנסות גם $ sum_(s in S) abs(s PP(X=s)) $
  הוא טור מתכנס.
]

#subquestion()
נפריך את הטענה שאם  $X,Y$ משתנים מקריים כך ש־$EE(X)=EE(Y)$ וכן $EE(X^2)=EE(Y^2)$  אז $PP(X=Y)=1$.

#proof[
  נסתכל על $Omega=[4]^2$ מרחב ההטלה של שתי קוביות הוגנות בעלות $4$ פאות.\
  נגדיר $X((omega_1, omega_2)) = omega_1$ וכן $Y((omega_1, omega_2))=omega_2$ ואכן, $X,Y ~ U([4])$ ולכן $EE(X)=EE(Y)$ וגם $EE(X^2)=EE(Y^2)$ אבל $PP(X=Y)=1/4 != 1$.
]
