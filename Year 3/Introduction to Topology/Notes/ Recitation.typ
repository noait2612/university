#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *

#show: thmbox-init()

#show: article_he.with(
  title: [ מבוא לטופולוגיה – תרגולים ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 2)

= תרגול 4 – 06/05
#definition[מרחב טופולוגי $Y$ נקרא האוסדרוף $(T_2)$ אם לכל $x!=y in Y$ קיימות $U,V subset.eq Y$ זרות כך ש־$x in U, y in V$.\
  נראינו שזה שקול ל־$Delta subset.eq Y times Y$ הוא סגור (האלכסון).]

#exercise[
  בהינתן $X,Y$ מרחבים טופולוגיים, $A subset.eq X$ ו־$f:A arrow Y$ רציפה.
  האם קיימת ויחידה $F:X arrow Y$ רציפה כך ש־$F|_A = f$?
]
#proof[
  נתחיל מלהסתכל על $X=Y=RR$ ו־$A=QQ$ ויש לנו הרחבה יחידה.\
  אם $A=(0,1)$ נניח אין לנו הרחבה יחידה כי הפונקציה יכולה להיות קבועה ב־$(0,1)$ אבל אחרי זה להיות לא קבועה או קבועה.\
  אם $Y$ עם הטופולוגיה הטריוויאלית עם $abs(Y)>=2$ ו־$A!=X$ אז כל פונקציה $g:X arrow Y$ היא רציפה ואז כל הרחבה שלה היא גם רציפה ויש לפחות שתי הרחבות כאלו.\
  בעצם, נרצה $closure(A)=X$.
]

#proposition[
  יהיו $X,Y$ מרחבים טופולוגיים ו־$A subset.eq X$ צפופה ($closure(A)=X$) ויהיו $f,g:X arrow Y$ רציפות עם $f|_A = g|_A$.\
  אם $Y$ הוא האוסדרוף אז $f=g$.
]

#proof[
  נגדיר $E colon.eq { x in X bar f(x)=g(x) }$ ומהנתון נובע ש־$A subset.eq E$.\
  נרצה להראות ש־$E=X$ ולכן מספיק שנראה ש־$E$ סגורה.\
  נגדיר $h:X arrow Y times Y$ על־ידי $h(x)=(f(x), g(x))$ והיא כמובן רציפה שכן ההטלות $pi_i compose h$ הן הטלות רציפות.\
  $ h^(-1)(Delta) = {x in X bar h(x) = (f(x), g(x)) in Delta} = E $
  מכך ש־$Y$ הוא האוסדרוף מתקיים ש־$Delta$ סגור ומרציפות נסיק ש־$E subset.eq X$ סגורה.\
  ניקח סגור $A subset.eq E$ ונקבל $X=closure(A) subset.eq closure(E)=E$ (מצפיפות וסגירות) ולכן $X=E$ וזה מסיים.
]

#exercise[
  ראינו ש־$RR times RR = RR^2$ כאשר בכל אחד מהם אנחנו עם הטופולוגיה הסטנדרטית.\
  האם $RR_italic("zar") times RR_italic("zar") = RR^2_italic("zar")$?
]
#solution[
  התשובה היא לא כי $RR_italic("zar") = RR_italic("cofin")$ והטופולוגיה הקו־סופית על $RR$ היא אינה האוסדרוף (כי כל שתי פתוחות נחתכות כי איבר שלא במשלים של שניהם הוא בהכרח בחיתוך שלהם).
]

#corollary[
  $Delta subset.eq RR_italic("zar") times RR_italic("zar")$ והוא לא סגור אבל הוא כן סגור ב־$RR^2_italic("zar")$.\
  כי אם אנחנו בפולינומים מהצורה $x,y$ אזי $Delta=Z(x-y)$ (כל האפסים).\
  לכן הטופולוגיות האלו שונות ובאופן דומה $RR^n_italic("zar") times RR^n_italic("zar") != RR^(2n)_italic("zar")$.
]

#remark[
  ברור שיכול להיות שהם הומיאומורפיים גם אם הטופולגיות שונות.
]

#exercise[
  יהיו $X,Y$ מרחבים טופולוגיים ונניח שיש $p:X arrow Y$ רציפה, על וסגורה (כלומר אם $A subset.eq X$ סגורה אז $f(A) subset.eq Y$ היא סגורה).\
  נניח ש־$X$ נורמלי אז גם $Y$ נורמלי.
]

#proof[
  יהיו $A,B subset.eq Y$ סגורות וזרות.\
  מרציפות $p^(-1)(A), p^(-1)(B)$ סגורות (וזרות).\
  מנורמליות $X$ קיימות $U_0,V_0 subset.eq X$ פתוחות זרות כך ש־$p^(-1)(A) subset.eq U_0, p^(-1)(B) subset.eq V_0$.\
  מסגירות $p$ הקבוצות $p(X without U_0). p(X without V_0)$ סגורות.\
  נגדיר $U = Y without p(X without U_0), V = Y without p(X without V_0)$ ונטען ש־$A subset.eq U$.\
  נבחין כי $ X without U_0 subset.eq X without p^(-1)(A) = p^(-1)(Y) without p^(-1)(A) = p^(-1)(Y without A) $
  נפעיל את $p$ ונקבל מכך ש־$p$ על
  $ p(X without U_0) subset.eq p(p^(-1)(Y without A)) = Y without A $
  ניקח משלים ונקבל $A subset.eq U$ ומטיעון דומה נקבל $B subset.eq V$.\
  נשאר להראות ש־$U inter V = emptyset$.\
  אז מכללי דה־מורגן
  $ Y without U inter V = Y without U union Y without V = p(X without U_0) union p(X without V_0) $
  צריך להראות שזה בעצם $Y$.
  \
  יהי $y in Y$, $p$ על ולכן קיים $x in X$ כך ש־$y=p(x)$.\
  נראה ש־$x in X without U_0 union X without V_0$: מדה־מורגן
  $ X without U_0 union X without V_0 = X without U_0 inter V_0 = X $
  כי $U_0, V_0$ זרות וזה מסיים.
]
