#import "../../../src/article.typ": *
#show: article.with(
  title: [Cheat Sheet(Shit) - Introduction to Computer Science --- 67101],
  language: "En",
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#example("bool function")[
  #codly(languages: codly-languages)
  ```python
  def bool_examples() {
      print("--- The following will print False: ---")
      print(bool(None))
      print(bool(False))
      print(bool(0))
      print(bool(0.0))
      print(bool())
      print(bool(""))
      print(bool([]))
      print(bool(()))
      print(bool({}))
      print("--- The following will print True: ---")
      print(bool(42))
      print(bool(7.4))
      print(bool("Bla"))
      print("Hello, world!");
  }
  ```
]

#example("array shortcuts")[
  #codly(languages: codly-languages)
  ```python
  def array_shortcuts_examples() {
      text = "Python"
      text[0] == "P" # Takes the value in the index
      text[-1] == "n" # Takes the last
      text[1:4] == "yth" # Slice from 1 to 4 (meaning indices {1,2,3})
      text[:3] == "Pyt" # Take from start 3 values
      text[3:] == "hon" # Take from end 3 values
      text[::2] == "Pto" # Take every second value (meaning mod 2)
      text[::-1] == "nohtyP" # Reverse
  }
  ```
]

#example("string functions")[
  #codly(languages: codly-languages)
  ```python
  def string_functions_examples() {
      "a".upper() == "A"
      "a".lower() == "a"
      "a".lower() == "a"
      "1".lower() or "1".upper() == "1"
      " a ".strip() == "a" #Removes white space from start or end only
      "a b".split() == ["a", "b"] #Split to list by indicating sign, default space
      "-".join(["a", "b"]) == "a-b" #Just as in C#
  }
  ```
]

#example("math functions")[
  #codly(languages: codly-languages)
  ```python
  def math_functions_examples() {
      10 / 3 = 3.3333333333333335 # Divide
      10 // 3 = 3 # Divide without reminder (scale down)
      10 % 3 == 1 # Reminder from division
      2 ** 3 == 8 # 2 in the power of 3
      "a".upper() == "A"
      "a".lower() == "a"
      "a".lower() == "a"
      "1".lower() or "1".upper() == "1"
      " a ".strip() == "a" # Removes white space from start or end only
      "a b".split() == ["a", "b"] # Split to list by indicating sign, default space
      "-".join(["a", "b"]) == "a-b" # Just as in C#
  }
  ```
]

#example("C# VS Python")[

  #set table(stroke: (_, y) => if y > 0 { (top: 0.8pt) })
  #table(
    columns: 2,
    align: center,
    table.header([*C\#*], [*Python*]),
    [ #codly(languages: codly-languages)
      ```cs
      Select()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      map
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      Where()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      filter
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      Aggregate()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      reduce
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      OrderBy()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      sorted
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      OrderByDescending()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      sorted(reverse=True)
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      Sum()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      sum
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      Count()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      len
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      Any()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      any
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      All()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      all
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      First()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      next
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      FirstOrDefault()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      next(, default)
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      Skip()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      [n:]
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      Take()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      [:n]
      ``` ],

    [ #codly(languages: codly-languages)
      ```cs
      Distinct()
      ``` ],
    [ #codly(languages: codly-languages)
      ```python
      set
      ``` ],
  )
]
