# typst-undergradmath

<p align="center">
  <a href="http://creativecommons.org/licenses/by-sa/4.0/">
    <img alt="CC BY-SA 4.0" src="https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg" />
  </a>
</p>

A Typst port of [undergradmath].

## Limitations
The following limitations are also annotated in the [document](undergradmath.pdf).

- [ ] Script letters, such as $\mathscr{P}$ form `\mathscr{P}`, are unavailable.
- [ ] Greek letter $\varsigma$ `\u{03C2}` from `\varsigma` is not defined as a symbol and should probably be defined as `sigma.alt`.
- [ ] $\emptyset$ from `\emptyset` is available in Typst as `nothing`, while $\varnothing$ from `\varnothing` is not.
      May need a `let` binding with some specific fonts. See the Version 3.93 section of README at
      https://www.ctan.org/tex-archive/fonts/newcomputermodern.
- [ ] $\imath$ `\u{1D6A4}` and $\jmath$ `\u{1D6A5}`, from `\imath` and `\jmath` respectively, are not defined as symbols.
      They are used in like vectors $\vec{\imath}$ with `\vec{\imath}`.
- [ ] $\widehat{x + y}$ from `\widehat{x + y}` is unavailable.
- [ ] No idea with $\doteq$ from `\doteq`.
      Maybe use fonts from [mathabx] or do some spacing adjustment with `dot` and `eq`.
- [ ] LaTeX arrays (i.e., matrices without fences) are unavailable, but it's easy to get them with the `grid` function.
      For math mode, it would be nice to add a new option `none` or `""` for `delim` of the `mat` function.
- [ ] No idea with spacing between values and units. It would be really great to have something like [siunitx].

[mathabx]: https://www.ctan.org/tex-archive/fonts/mathabx
[siunitx]: https://www.ctan.org/pkg/siunitx

## License
[Like undergradmath], typst-undergradmath is licensed under the
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg

[undergradmath]: https://gitlab.com/jim.hefferon/undergradmath
[Like undergradmath]: https://gitlab.com/jim.hefferon/undergradmath/-/blob/5b19eff74454f7c71664f85e8042d7b30fcf9cfb/LICENSE
