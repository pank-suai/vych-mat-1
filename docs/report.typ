#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2cm),
)

#set text(
  font: "Times New Roman",
  size: 14pt,
  lang: "ru"
)

#set par(
  justify: true,
  leading: 1.5em,
  first-line-indent: (amount: 1.25cm, all: true),
)

#set heading(
  numbering: "1.",
)

// Убираем увеличение размера для заголовков
#show heading.where(level: 1): it => block(above: 1.5em, below: 1em)[
  #set text(size: 14pt, weight: "bold")
  #it
]

#show heading.where(level: 2): it => block(above: 1.2em, below: 0.8em)[
  #set text(size: 14pt, weight: "bold")
  #it
]

РАБОТУ ВЫПОЛНИЛ: Панков Василий Дмитриевич (М412)


= Постановка задачи


На интервале $[0; 1]$ вычислить корень уравнения


$ x^3 - cos(x) = 0 $

Наличие корня на этом интервале подтвердить графиком.


Использовать следующие методы:



1. Метод половинного деления:
   $ x_(n+1) = (a_n + b_n) / 2, quad f(a_n) dot f(b_n) < 0 $

2. Метод хорд:
   $ x_(n+1) = (b_n dot f(a_n) - a_n dot f(b_n)) / (f(a_n) - f(b_n)), quad f(a_n) dot f(b_n) < 0 $

3. Метод Ньютона (в начальной точке $f(x_0) dot f''(x_0) > 0$):
   $ x_(n+1) = x_n - f(x_n) / f'(x_n) $

4. Модифицированный метод Ньютона:
   $ x_(n+1) = x_n - (f(x_n) dot (x_n - x_(n-1))) / (f(x_n) - f(x_(n-1))) $

5. Метод простых итераций ($lambda > 0$):
   $ x_(n+1) = x_n - lambda dot f(x_n) $


Использовалась точность: $epsilon = 10^(-6)$


= График функции

График функции $f(x) = x^3 - cos(x)$ на интервале $[0; 1]$ подтверждает наличие корня:


#align(center)[
  #image("../images/graph.png", width: 70%)
]

Из графика видно, что функция пересекает ось абсцисс в окрестности точки $x approx 0.865$.


= Решение

== Метод половинного деления

Начальные данные: $a_0 = 0$, $b_0 = 1$


#align(center)[
  #table(
    columns: 5,
    align: center,
    [*n*], [*$x_n$*], [*$f(x_n)$*], [*$a_n$*], [*$b_n$*],
    ..csv("../data/1.csv", delimiter: ",").flatten()
  )
]

*Результат:* $x approx 0.865474$


*Количество итераций:* 20


== Метод хорд

Начальные данные: $a_0 = 0$, $b_0 = 1$


#align(center)[
  #table(
    columns: 5,
    align: center,
    [*n*], [*$x_n$*], [*$f(x_n)$*], [*$a_n$*], [*$b_n$*],
    ..csv("../data/2.csv", delimiter: ",").flatten()
  )
]

*Результат:* $x approx 0.865474$


*Количество итераций:* 8


== Метод Ньютона

#par(first-line-indent: 1.25cm)[
Начальные данные: $x_0 = 1$
]

#par(first-line-indent: 1.25cm)[
Производная: $f'(x) = 3x^2 + sin(x)$
]

#align(center)[
  #table(
    columns: 3,
    align: center,
    [*n*], [*$x_n$*], [*$f(x_n)$*],
    ..csv("../data/3.csv", delimiter: ",").flatten()
  )
]

#par(first-line-indent: 1.25cm)[
*Результат:* $x approx 0.865474$
]

#par(first-line-indent: 1.25cm)[
*Количество итераций:* 3
]

== Модифицированный метод Ньютона

#par(first-line-indent: 1.25cm)[
Начальные данные: $x_0 = 1$, $x_1 = 0.866021$ (из метода Ньютона)
]

#align(center)[
  #table(
    columns: 3,
    align: center,
    [*n*], [*$x_n$*], [*$f(x_n)$*],
    ..csv("../data/4.csv", delimiter: ",").flatten()
  )
]

#par(first-line-indent: 1.25cm)[
*Результат:* $x approx 0.865475$
]

#par(first-line-indent: 1.25cm)[
*Количество итераций:* 2
]

== Метод простых итераций

#par(first-line-indent: 1.25cm)[
Начальные данные: $x_0 = 1$, $lambda = 0.3$
]

#align(center)[
  #table(
    columns: 3,
    align: center,
    [*n*], [*$x_n$*], [*$f(x_n)$*],
    ..csv("../data/5.csv", delimiter: ",").flatten()
  )
]

#par(first-line-indent: 1.25cm)[
*Результат:* $x approx 0.865474$
]

#par(first-line-indent: 1.25cm)[
*Количество итераций:* 5
]

#par(first-line-indent: 1.25cm)[
Значение $lambda = 0.33$ было подобрано экспериментально для обеспечения сходимости.
]

= Выводы

Сравнение скорости сходимости методов:


#align(center)[
  #table(
    columns: 3,
    align: center,
    [*Метод*], [*Количество итераций*], [*Корень*],
    [Половинного деления], [20], [0.865474],
    [Хорд], [8], [0.865],
    [Ньютона], [3], [0.865474],
    [Ньютона (модиф.)], [2], [0.865475],
    [Простых итераций], [5], [0.865],
  )
]

#par(first-line-indent: 1.25cm)[
*Заключение:* Наиболее быстро сходится модифицированный метод Ньютона (2 итерации) и метод Ньютона (3 итерации). Метод половинного деления требует наибольшего числа итераций (20), но гарантирует сходимость. Метод простых итераций показывает хорошую скорость (5 итераций) при правильном выборе параметра $lambda$. Метод хорд занимает промежуточное положение по скорости сходимости (8 итераций).
]
