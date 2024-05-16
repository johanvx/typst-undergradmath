# typst-undergradmath

[![CC BY-SA 4.0](https://badgers.space/github/license/johanvx/typst-undergradmath)][cc-by-sa]
[![Latest release](https://badgers.space/github/release/johanvx/typst-undergradmath)][latest-release]
![Checks status](https://badgers.space/github/checks/johanvx/typst-undergradmath)

A [Typst] port of [undergradmath].

## Limitations

The following limitations are also annotated in the [document][latest-release].

- [x] ~Script letters, such as $\mathscr{P}$ form `\mathscr{P}`, are unavailable.~
      It's possible to get script letters like $\mathscr{P}$ from `cal(P)` by changing the [`stylistic-set` of the `text()` function].
      The stylistic set to apply is font-specific, so it's necessary to consult the font to know which set is desired.
- [x] ~Greek letter $\varsigma$ `\u{03C2}` from `\varsigma` is not defined as a symbol and should probably be defined as `sigma.alt`.~
      `sigma.alt` is available as from `typst v0.5.0`.
- [x] $\emptyset$ from `\emptyset` is available in Typst as `nothing`, while $\varnothing$ from `\varnothing` is not.
      May need a `let` binding with some specific fonts.
      See the Version 3.93 section of README at https://www.ctan.org/tex-archive/fonts/newcomputermodern.
      See also [#10] and [#16] for details.
- [x] ~$\imath$ `\u{1D6A4}` and $\jmath$ `\u{1D6A5}`, from `\imath` and `\jmath` respectively, are not defined as symbols.
      They are used in like vectors $\vec{\imath}$ with `\vec{\imath}`.~
      $\imath$ and $\jmath$ are `dotless.i` and `dotless.j` respectively as from `typst v0.4.0`.
- [x] ~$\widehat{x + y}$ from `\widehat{x + y}` is unavailable.~ It's automatic if you write `$hat(x+y)$`, as mentioned in [#2].
- [x] ~No idea with $\doteq$ from `\doteq`.
      Maybe use fonts from [mathabx] or do some spacing adjustment with `dot` and `eq`.~
      It can be obtained with `\u{2250}`, which is a bit tricky.
- [x] ~LaTeX arrays (i.e., matrices without fences) are unavailable, but it's easy to get them with the `grid` function.
      For math mode, it would be nice to add a new option `""` for `delim` of the `mat` function.~
      It's actually available with `$mat(delim: #none, ..)$`.
- [x] ~No idea with spacing between values and units. It would be really great to have something like [siunitx].~
      The space between values and units can be `thin` (`\u{2009}`), as mentioned in [#17].
      There are also some amazing Typst ports of siunitx, such as [metro] and [unify].

## License

[Like undergradmath], typst-undergradmath is licensed under the [Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

## Contributing to typst-undergradmath

If you're interested in contributing to this project, feel free to comment on
existing issues, open new issues and create pull requests.

If you create a pull request, make sure to observe the following rules:

1. adopt [Conventional Commits], and
2. keep the document two-page.

<!-- Links -->

[#2]: https://github.com/johanvx/typst-undergradmath/issues/2
[#10]: https://github.com/johanvx/typst-undergradmath/issues/10
[#16]: https://github.com/johanvx/typst-undergradmath/pull/16
[#17]: https://github.com/johanvx/typst-undergradmath/issues/17
[`stylistic-set` of the `text()` function]: https://typst.app/docs/reference/text/text/#parameters-stylistic-set
[Conventional Commits]: https://www.conventionalcommits.org/en/v1.0.0/
[Like undergradmath]: https://gitlab.com/jim.hefferon/undergradmath/-/blob/5b19eff74454f7c71664f85e8042d7b30fcf9cfb/LICENSE
[Typst]: https://github.com/typst/typst
[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[latest-release]: https://github.com/johanvx/typst-undergradmath/releases/latest
[mathabx]: https://www.ctan.org/tex-archive/fonts/mathabx
[metro]: https://github.com/fenjalien/metro
[siunitx]: https://www.ctan.org/pkg/siunitx
[undergradmath]: https://gitlab.com/jim.hefferon/undergradmath
[unify]: https://github.com/ChHecker/unify
