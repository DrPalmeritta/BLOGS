# Highlight examples

## Highlighted code

```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

## Colored text inside code block

```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
## Colored text

<h3 style="color:#ff0000">Danger</h3>

## Colored with LaTeX

${{\color{orange}\Huge{\textsf{ Test purpose }}}}\$

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
