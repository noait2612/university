#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 03 --- מבוא לטופולוגיה, 80516 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()

#question()

#question()
#subquestion()
נראה שאם $X_1 tilde.equiv Y_1$ ו־$X_2 tilde.equiv Y_2$ אזי $X_1 times X_2 tilde.equiv Y_1 times Y_2$.

#proof[
  מכך ש־$X_1 tilde.equiv Y_1$ אז קיימת $f:X_1 arrow Y_1$ שהיא הומיאומורפיזם כלומר חד־חד ערכית, על ורציפה עם $f^(-1)$ רציפה ובאופן דומה גם קיימת \
  $g:X_2 arrow Y_2$ שהיא הומיאומורפיזם.\
  נגדיר $h: X_1 times X_2 arrow Y_1 times Y_2$ על־ידי $h(x_1,x_2) = (f(x_1), g(x_2))$ ונראה פורמלית ש־$h$ אכן הומיאומורפיזם:
  + חד־חד ערכיות:
    $
      h(x_1, x_2) = h(x^prime_1 x^prime_2) <==> (f(x_1), g(x_2)) = (f(x^prime_1), g(x^prime_2)) <==> f(x_1) = f(x^prime_1) and g(x_2) = g(x^prime_2)
    $
    אבל $f,g$ חד־חד ערכיות ולכן $x_1 = x^prime_1, x_2 = x^prime_2$.
  + על:
    יהי $(y_1, y_2) in Y_1 times Y_2$ ומכך ש־$f,g$ הן על קיימים $x_1 in X_1, x_2 in X_2$ כך ש־$y_1 = f(x_1), y_2 = g(x_2)$ ולכן $h(x_1, x_2) = (y_1,y_2)$
  + רציפות: ראינו שבמכפלה של מרחבים טופולוגיים העתקה היא רציפה אם בכל קורדינאטה שלה היא רציפה ואכן $f,g$ רציפות
  + הופכית רציפה
    $ h^(-1)(y_1, y_2) = (f^(-1)(y_1), g^(-1)(y_2)) $
    וזאת רציפה באותו אופן בכל קורדינאטה כי $f^(-1), g^(-1)$ רציפות.
  אז $h$ היא הומיאומורפיזם ו־$X_1 times X_2 tilde.equiv Y_1 times Y_2$.
]

#subquestion()
ניתן דוגמה מרחבים $X,Y$ ולפונקציה $f:X arrow Y$ רציפה, חד־חד ערכית ועל אבל כך ש־$f^(-1)$ לא רציפה.

#proof[
  ניקח $X=[0,1)$ ו־$Y=S^1 subset.eq RR^2$ ונגדיר $f:[0,1) arrow RR^2$ על־ידי $f(t)=(cos(2pi t), sin(2pi t))$ והיא רציפה בכל קורדינאטה ולכן $f$ רציפה.\
  בנוסף, מכך ש־$t in [0,1)$ נובע מהגדרת מעגל היחידה ש־$f$ היא פונקציה על והיא חד־חד ערכית מהמחזוריות של $cos(2pi t), sin(2pi t)$ בקטע זה.\
  נשים לב ש־$f^(-1)$ לא רציפה בנקודה $(1,0)$ שכן אם נתקרב אליה על המעגל מצד אחד $t arrow 0$ ומצד שני $t arrow 1$ ו־$1 in.not [0,1)$.
]

#question()

#question()

#question()
נוכיח ש־${(x,y) in RR^2 bar x^2+y^2<=1} tilde.eq {(x,y) in RR^2 bar max{abs(x), abs(y)}<=1}$
כאשר הטופולוגיה על כל אחת מהקבוצות היא הטופולוגיה המושרית מ־$RR^2$.

#proof[

]
