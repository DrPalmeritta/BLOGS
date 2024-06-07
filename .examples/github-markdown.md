# Highlight examples

## Highlighted code

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

## Leveling headings

Main heading way is using `#` like:

```md
# Example #1
```

Another one way for leveling headings is `===` or `---` usage like this:

```md
Example #2
==========

Example #3
----------
```
## Empty spaces

The non-breaking space ASCII character:

```
&nbsp;
```

HTML <(br)/> tag (able not to be closed for actual HTML5 version):

```
<br />
```

HTML Entity &NewLine:

```
&NewLine;
```

Backticks with a space inside followed by two spaces:

```
`(space)`(space)(space)
```

## Colored text inside code block

```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```

## Colored with LaTeX

${{\color{orange}\Huge{\textsf{ Test purpose }}}}\$

## LaTeX color shames

To use colors you can use `\color` or `\textcolor`.  


|                        command                        |                           result                      |
|                          ---                          |                            ---                        |
`$\color{red}{\textsf{lorem ipsum}}$`                   | $\color{red}{\textsf{lorem ipsum}}$
`$\color{#f00}{\textsf{lorem ipsum}}$`                  | $\color{#f00}{\textsf{lorem ipsum}}$ 
`$\color{rgb(255,0,0)}{\textsf{lorem ipsum}}$`          | $\color{rgb(255,0,0)}{\textsf{lorem ipsum}}$
`$\color{rgba(255,0,0, 0.4)}{\textsf{lorem ipsum}}$`    | $\color{rgba(255,0,0, 0.4)}{\textsf{lorem ipsum}}$
`$\color{hsl(0,100%,50%)}{\textsf{lorem ipsum}}$`       | $\color{hsl(0,100%,50%)}{\textsf{lorem ipsum}}$
`$\color{hsla(0,100%,50%, 0.4)}{\textsf{lorem ipsum}}$` | $\color{hsla(0,100%,50%, 0.4)}{\textsf{lorem ipsum}}$
`$\textcolor{red}{\textsf{lorem ipsum}}$`               | $\textcolor{red}{\textsf{lorem ipsum}}$


## Table with some color examples

| $\color{black}{\textsf{Black}}$ |  $\color{MidnightBlue}{\textsf{MidnightBlue}}$ | $\color{brown}{\textsf{Brown}}$ | $\color{darkgray}{\textsf{Dark Gray}}$  | $\color{gray}{\textsf{Gray}}$ | 
| ------------- | ------------- | ------------- | ------------- | ------------- | 
| $\color{lightgray}{\textsf{Light Gray}}$ |  $\color{green}{\textsf{Green}}$ | $\color{lightblue}{\textsf{Light Blue}}$ | $\color{lime}{\textsf{Lime}}$  | $\color{magenta}{\textsf{Magenta}}$ |
| $\color{olive}{\textsf{Olive}}$ |  $\color{orange}{\textsf{Orange}}$ | $\color{pink}{\textsf{Pink}}$ | $\color{purple}{\textsf{Purple}}$  | $\color{red}{\textsf{Red}}$ | 
| $\color{teal}{\textsf{Teal}}$ |  $\color{violet}{\textsf{Violet}}$ | $\color{white}{\textsf{White}}$ | $\color{yellow}{\textsf{Yellow}}$  | $\color{BurntOrange}{\textsf{Burnt Orange}}$ |


$\textsf{{\color[rgb]{0.0, 0.0, 1.0}Yo}{\color[rgb]{0.1, 0.0, 0.9}u~ }{\color[rgb]{0.2, 0.0, 0.8}c}{\color[rgb]{0.3, 0.0, 0.7}a}{\color[rgb]{0.4, 0.0, 0.6}n~ }{\color[rgb]{0.5, 0.0, 0.5}do~ }{\color[rgb]{0.6, 0.0, 0.4}th}{\color[rgb]{0.7, 0.0, 0.3}is~ }{\color[rgb]{0.8, 0.0, 0.2}t}{\color[rgb]{0.9, 0.0, 0.1}o}{\color[rgb]{1.0, 0.0, 0.0}o}}$

Here is full man for [LaTex & Color scheme](https://en.wikibooks.org/wiki/LaTeX/Colors)

## LaTex Font Sizes

|                command              |                result              |
|                  ---                |                 ---                |
`$\Huge{\textsf{lorem ipsum}}$`       | $\Huge{\textsf{lorem ipsum}}$
`$\huge{\textsf{lorem ipsum}}$`       | $\huge{\textsf{lorem ipsum}}$
`$\LARGE{\textsf{lorem ipsum}}$`      | $\LARGE{\textsf{lorem ipsum}}$
`$\Large{\textsf{lorem ipsum}}$`      | $\Large{\textsf{lorem ipsum}}$
`$\large{\textsf{lorem ipsum}}$`      | $\large{\textsf{lorem ipsum}}$
`$\normalsize{\textsf{lorem ipsum}}$` | $\normalsize{\textsf{lorem ipsum}}$
`$\small{\textsf{lorem ipsum}}$`      | $\small{\textsf{lorem ipsum}}$
`$\scriptsize{\textsf{lorem ipsum}}$` | $\scriptsize{\textsf{lorem ipsum}}$
`$\tiny{\textsf{lorem ipsum}}$`       | $\tiny{\textsf{lorem ipsum}}$

## For important information

> [!NOTE]
> Highlights information that users should take into account, even when skimming.

> [!TIP]
> Optional information to help a user be more successful.

> [!IMPORTANT]
> Crucial information necessary for users to succeed.

> [!WARNING]
> Critical content demanding immediate user attention due to potential risks.

> [!CAUTION]
> Negative potential consequences of an action.

## Cells

{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 10,
   "metadata": {},
   "outputs": [],
   "source": [
Hello, World!]
  }
  ]
}

## Badges

[![](https://img.shields.io/badge/github-blue?style=for-the-badge)](https://github.com/hamzamohdzubair/redant)
[![](https://img.shields.io/badge/book-blueviolet?style=for-the-badge)](https://hamzamohdzubair.github.io/redant/)
[![](https://img.shields.io/badge/API-yellow?style=for-the-badge)](https://docs.rs/crate/redant/latest)
[![](https://img.shields.io/badge/Crates.io-orange?style=for-the-badge)](https://crates.io/crates/redant)
[![](https://img.shields.io/badge/Lib.rs-lightgrey?style=for-the-badge)](https://lib.rs/crates/redant)

## Toggle lists

<details>
	<summary>
	Toggle summary
	</summary>
	<br />
	Test text to display
</details>
