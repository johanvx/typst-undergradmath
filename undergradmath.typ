// Meta data
#set document(title: "Typst Math for Undergrads", author: "johanvx")

// headcolor
#let headcolor = rgb("004225")

// Margin and footer
#set page(
  margin: 0.5in,
  footer: context {
    if counter(page).display() == "2" {
      set text(headcolor)
      grid(
        columns: (1fr, 1fr),
        [],
        block(
          inset: 4pt,
          stroke: (top: headcolor),
          [johanvx #h(1fr) #datetime.today().display()],
        ),
      )
    } else {
      []
    }
  },
)

// Font size
#let scriptsize = 7pt
#let normalsize = 10pt
#let large = 12pt
#set text(size: normalsize, lang: "en")

// Some horizontal spacing
#let kern(length) = h(length, weak: true)
#let enspace = kern(0.5em)

// For table/grid, something like "lhs \enspace rhs"
#let cell(lhs, rhs) = box(lhs + enspace + rhs)
// Grid for code blocks
#set grid(columns: (2em, auto))
// Table for math-code listing
#set table(stroke: none, align: horizon + left, inset: 0pt, row-gutter: 0.45em)

// LaTeX and TeX logos
#let TeX = context {
  let e = measure(text(normalsize, "E"))
  let T = "T"
  let E = text(normalsize, baseline: e.height / 2, "E")
  let X = "X"
  box(T + kern(-0.1667em) + E + kern(-0.125em) + X)
}
#let LaTeX = context {
  let l = measure(text(10pt, "L"))
  let a = measure(text(7pt, "A"))
  let L = "L"
  let A = text(7pt, baseline: a.height - l.height, "A")
  box(L + kern(-0.36em) + A + kern(-0.15em) + TeX)
}

// Unavailable (last check version)
#show "??": box(text(red, [v#sys.version #emoji.crossmark]))
// Tricky
#show "!!": box(text(blue, emoji.drops))
// No idea
#show "?!": box(text(orange, [No idea #emoji.face.unhappy]))
// Tricky figure numbering
#set figure(
  numbering: n => {
    ([??], [!!], [?!]).at(n)
  },
)
// No prefix
#set ref(supplement: "")

// Justified paragraphs
#set par(justify: true)

// Run-in sections, like LaTeX \paragraph
#show heading.where(level: 1): it => text(
  size: normalsize,
  weight: "bold",
  fill: headcolor,
  it.body + h(0.67em),
)

// Black raw code
#show raw.where(block: false): it => { it.text }

// Two-column layout
#show: rest => columns(2, rest)

// Shortcuts for math equation
#let eqn = math.equation

// Title
#show title: set align(center)
#show title: set text(large, headcolor)
#show title: it => link("https://github.com/johanvx/typst-undergradmath")[#it]
#title()

// Put this here to avoid affecting the title
#show link: underline

This is a Typst port with typst #sys.version of _#LaTeX Math for Undergrads_ by Jim Hefferon.
The original version is available at #link("https://gitlab.com/jim.hefferon/undergradmath").

= Meaning of annotations
// #figure(
//  alt: "unavailable annotation",
//  table(
//    columns: (1fr, 2fr),
//    [??], [Unavailable until typst #sys.version.],
//  )
// ) <unavailable>
#figure(
  alt: "tricky annotation",
  table(
    columns: (1fr, 2fr),
    [!!], [Tricky. A simpler method is needed.],
  ),
) <tricky>
// #figure(
//   alt: "no idea annotation",
//   table(
//     columns: (1fr, 2fr),
//     [?!], [Don't know how to get this.],
//   )
// ) <noidea>

= Rule One
Any mathematics at all, even a single character, gets a mathematical setting.
Thus, for "the value of #eqn(alt: "x", $x$) is #eqn(alt: "7", $7$)" enter `the value of $x$ is $7$`.

= Template
Your document should contain at least this.

#grid(
  "",
  ```
  -- document body here --
  ```,
)

= Common constructs
#align(
  center,
  table(
    columns: 4,
    align: (right, left, right, left),
    column-gutter: (1em, 1.5em, 1em),
    eqn(alt: "x squared", $x^2$),
    [`x^2`],
    [#eqn(alt: "square root of 2", $sqrt(2)$), #eqn(alt: "cube root of n", $root(n, 3)$)],
    [`sqrt(2)`, `root(n, 3)`],

    eqn(alt: "x subscript i, j", $x_(i, j)$),
    [`x_(i, j)`],
    [#eqn(alt: "2 divided by 3", $2 / 3$), #eqn(alt: "2 divided by 3", $2 \/ 3$)],
    [`2 / 3`, `2 \/ 3` or `2 slash 3`],
    // Maybe use `slash`?
  ),
)

= Calligraphic letters
Use as in `$cal(A)$`.

#eqn(
  alt: "calligraphic uppercase letters A through Z",
  block: true,
  $ cal(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) $,
)

// #show math.equation: set text(stylistic-set: 1)
// Get script letters, such as $cal(P)$ from `$cal(P)$`, by changing the `stylistic-set` parameter of `text()` to the corresponding set.
Get script letters by using `scr`, such as #eqn(alt: "script capital P", $scr(P)$) from `$scr(P)$`.
See #link("https://typst.app/docs/reference/math/variants/#functions-scr")[`scr`] for more information.

= Greek
#align(
  center,
  table(
    columns: 4,
    align: (right, left, right, left),
    column-gutter: (1em, 1.5em, 1em),
    eqn(alt: "Greek letter alpha", $alpha$),
    [`alpha`],
    [#eqn(alt: "Greek letter xi", $xi$), #eqn(alt: "uppercase Greek letter Xi", $Xi$)],
    [`xi`, `Xi`],

    eqn(alt: "Greek letter beta", $beta$),
    [`beta`],
    eqn(alt: "Greek letter omicron", $omicron$),
    [`omicron`],

    [#eqn(alt: "Greek letter gamma", $gamma$), #eqn(alt: "uppercase Greek letter Gamma", $Gamma$)],
    [`gamma`, `Gamma`],
    [#eqn(alt: "Greek letter pi", $pi$), #eqn(alt: "uppercase Greek letter Pi", $Pi$)],
    [`pi`, `Pi`],

    [#eqn(alt: "Greek letter delta", $delta$), #eqn(alt: "uppercase Greek letter Delta", $Delta$)],
    [`delta`, `Delta`],
    eqn(alt: "variant Greek letter pi", $pi.alt$),
    [`pi.alt`],

    eqn(alt: "Greek letter epsilon", $epsilon.alt$),
    [`epsilon.alt`],
    eqn(alt: "Greek letter rho", $rho$),
    [`rho`],

    eqn(alt: "Greek letter epsilon", $epsilon$),
    [`epsilon`],
    eqn(alt: "Greek letter rho", $rho.alt$),
    [`rho.alt`],

    eqn(alt: "Greek letter zeta", $zeta$),
    [`zeta`],
    [#eqn(alt: "Greek letter sigma", $sigma$), #eqn(alt: "uppercase Greek letter Sigma", $Sigma$)],
    [`sigma`, `Sigma`],

    eqn(alt: "Greek letter eta", $eta$),
    [`eta`],
    eqn(alt: "variant Greek letter sigma", $sigma.alt$),
    [`sigma.alt`],

    [#eqn(alt: "Greek letter theta", $theta$), #eqn(alt: "uppercase Greek letter Theta", $Theta$)],
    [`theta`, `Theta`],
    eqn(alt: "Greek letter tau", $tau$),
    [`tau`],

    eqn(alt: "variant Greek letter theta", $theta.alt$),
    [`theta.alt`],
    [#eqn(alt: "Greek letter upsilon", $upsilon$), #eqn(alt: "uppercase Greek letter Upsilon", $Upsilon$)],
    [`upsilon`, `Upsilon`],

    eqn(alt: "Greek letter iota", $iota$),
    [`iota`],
    [#eqn(alt: "variant Greek letter phi", $phi.alt$), #eqn(alt: "uppercase Greek letter Phi", $Phi$)],
    [`phi.alt`, `Phi`],

    eqn(alt: "Greek letter kappa", $kappa$),
    [`kappa`],
    eqn(alt: "Greek letter phi", $phi$),
    [`phi`],

    [#eqn(alt: "Greek letter lambda", $lambda$), #eqn(alt: "uppercase Greek letter Lambda", $Lambda$)],
    [`lambda`, `Lambda`],
    eqn(alt: "Greek letter chi", $chi$),
    [`chi`],

    eqn(alt: "Greek letter mu", $mu$),
    [`mu`],
    [#eqn(alt: "Greek letter psi", $psi$), #eqn(alt: "uppercase Greek letter Psi", $Psi$)],
    [`psi`, `Psi`],

    eqn(alt: "Greek letter nu", $nu$),
    [`nu`],
    [#eqn(alt: "Greek letter omega", $omega$), #eqn(alt: "uppercase Greek letter Omega", $Omega$)],
    [`omega`, `Omega`],
  ),
)

= Sets and logic
#align(
  center,
  table(
    columns: 6,
    align: (right, left, right, left, right, left),
    column-gutter: (1em, 1.5em, 1em, 1.5em, 1em),
    eqn(alt: "union", $union$),
    [`union`],
    eqn(alt: "blackboard bold R", $RR$),
    [`RR`, `bb(R)`],
    eqn(alt: "for all", $forall$),
    [`forall`],

    eqn(alt: "intersection", $inter$),
    [`inter`],
    eqn(alt: "blackboard bold Z", $ZZ$),
    [`ZZ`, `bb(Z)`],
    eqn(alt: "there exists", $exists$),
    [`exists`],

    eqn(alt: "subset of", $subset$),
    [`subset`],
    eqn(alt: "blackboard bold QQ", $QQ$),
    [`QQ`, `bb(Q)`],
    eqn(alt: "logical not", $not$),
    [`not`],

    eqn(alt: "subset of or equal to", $subset.eq$),
    [`subset.eq`],
    eqn(alt: "blackboard bold N", $NN$),
    [`NN`, `bb(N)`],
    eqn(alt: "logical or", $or$),
    [`or`],

    eqn(alt: "superset of", $supset$),
    [`supset`],
    eqn(alt: "blackboard bold C", $CC$),
    [`CC`, `bb(C)`],
    eqn(alt: "logical and", $and$),
    [`and`],

    eqn(alt: "superset of or equal to", $supset.eq$),
    [`supset.eq`],
    eqn(alt: "empty set", $diameter$),
    [`diameter`],
    eqn(alt: "proves", $tack.r$),
    [`tack.r`],

    eqn(alt: "element of", $in$),
    [`in`],
    eqn(alt: "empty set", $nothing$),
    [`nothing`],
    eqn(alt: "models", $models$),
    [`models`],

    eqn(alt: "not an element of", $in.not$),
    [`in.not`],
    eqn(alt: "aleph", $aleph$),
    [`aleph`],
    eqn(alt: "set minus", $without$),
    [`without`],
  ),
)

Negate an operator, as in #eqn(alt: "not a subset of", $subset.not$), with `subset.not`.
Get the set complement #eqn(alt: "complement of A", $A^(sans(c))$) with `A^(sans(c))` (or #eqn(alt: "complement of A", $A^(complement)$) with `A^(complement)`, or #eqn(alt: "complement of A", $overline(A)$) with `overline(A)`).

// https://www.ctan.org/tex-archive/fonts/newcomputermodern
//
// README
//
//     Version 3.93
//
//       Provides access to Russian and Greek guillemotleft and guillemotright
//     using the character variant tables cv3 and cv4 respectively.
//
//       The Math fonts provide the character \varnothing, an alternative to \emptyset,
//     through Character Variant cv01. The fontsetup package provides the option
//     'varnothing' to easily switch to the alternative character.

// http://mirrors.ctan.org/fonts/newcomputermodern/doc/newcm-doc.pdf
//
// Version 5.1
//
// The NewComputerModern FontFamily §14.5
// The Math fonts provide the character \varnothing (⌀, U+2300), as an alternative to \emptyset (a slashed zero), through Character Variant cv01.
// The fontsetup package provides the option ‘varnothing’ to easily switch to the alternative character.

/ Remark: Using `diameter` for `\varnothing` may cause some confusion.
  However, in #LaTeX, the `\varnothing` provided through Character Variant `cv01` is also `diameter`
  (see #link("http://mirrors.ctan.org/fonts/newcomputermodern/doc/newcm-doc.pdf")[newcm #{ sym.section }14.5]).
  So a simple solution with the default math font _New Computer Modern Math_ is to define a new symbol `varnothing` with `#let varnothing = math.diameter`.
  Other solutions can be found in #link("https://sitandr.github.io/typst-examples-book/book/basics/math/symbols.html#empty-set")[Typst Examples Book].

= Decorations
#align(
  center,
  table(
    columns: 6,
    align: (right, left, right, left, right, left),
    column-gutter: (1em, 1.5em, 1em, 1.5em, 1em),
    eqn(alt: "first derivative of f", $f'$),
    [`f'`, `f prime`],
    eqn(alt: "time derivative of a", $dot(a)$),
    [`dot(a)`],
    eqn(alt: "a tilde", $tilde(a)$),
    [`tilde(a)`],

    eqn(alt: "second derivative of f", $f prime.double$),
    [`f prime.double`],
    eqn(alt: "second time derivative of a", $diaer(a)$),
    [`diaer(a)`],
    eqn(alt: "a bar", $macron(a)$),
    [`macron(a)`],

    eqn(alt: "Sigma star", $Sigma^*$),
    [`Sigma^*`],
    eqn(alt: "unit vector a", $hat(a)$),
    [`hat(a)`],
    eqn(alt: "vector a", $arrow(a)$),
    [`arrow(a)`],
  ),
)
If the decorated letter is #eqn(alt: "i", $i$) or #eqn(alt: "j", $j$) then some decorations need `dotless.i` and `dotless.j`, as in #eqn(alt: "vector i", $arrow(dotless.i)$) with `arrow(dotless.i)`.
Some authors use boldface for vectors: `bold(x)`.

Entering `overline(x + y)` produces #eqn(alt: "complex conjugate of x plus y", $overline(x + y)$), and `hat(x + y)` gives #eqn(alt: "estimator of x plus y", $hat(x + y)$).
Comment on an expression as here (there is also `overbrace(..)`).

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "x plus y, with an underbrace labelled cardinality of A",
      block: true,
      $ underbrace(x + y, |A|) $,
    ),
    [
      ```
      underbrace(x + y, |A|)
      ```
    ],
  ),
)

= Dots
Use low dots in a list #eqn(alt: "the set of 0, 1, 2, and so on", ${0, 1, 2, ...}$), entered as `{0, 1, 2, ...}`.
Use centered dots in a sum or product #eqn(alt: "the sum from 1 to 100", $1 + dots.h.c + 100$), entered as `1 + dots.h.c + 100`.
You can also get vertical dots `dots.v`, diagonal dots `dots.down` and anti-diagonal dots `dots.up`.

= Roman names
Just type them!

#align(
  center,
  table(
    columns: 6,
    align: (right, left, right, left, right, left),
    column-gutter: (1em, 1.5em, 1em, 1.5em, 1em),
    eqn(alt: "sine", $sin$),
    [`sin`],
    eqn(alt: "hyperbolic sine", $sinh$),
    [`sinh`],
    eqn(alt: "arcsine", $arcsin$),
    [`arcsin`],

    eqn(alt: "cosine", $cos$),
    [`cos`],
    eqn(alt: "hyperbolic cosine", $cosh$),
    [`cosh`],
    eqn(alt: "arccosine", $arccos$),
    [`arccos`],

    eqn(alt: "tangent", $tan$),
    [`tan`],
    eqn(alt: "hyperbolic tangent", $tanh$),
    [`tanh`],
    eqn(alt: "arctagent", $arctan$),
    [`arctan`],

    eqn(alt: "secant", $sec$),
    [`sec`],
    eqn(alt: "hyperbolic cotangent", $coth$),
    [`coth`],
    eqn(alt: "minimum", $min$),
    [`min`],

    eqn(alt: "cosecant", $csc$),
    [`csc`],
    eqn(alt: "determinant", $det$),
    [`det`],
    eqn(alt: "maximum", $max$),
    [`max`],

    eqn(alt: "cotangent", $cot$),
    [`cot`],
    eqn(alt: "dimension", $dim$),
    [`dim`],
    eqn(alt: "infimum", $inf$),
    [`inf`],

    eqn(alt: "exponential", $exp$),
    [`exp`],
    eqn(alt: "kernel", $ker$),
    [`ker`],
    eqn(alt: "supremum", $sup$),
    [`sup`],

    eqn(alt: "logarithm", $log$),
    [`log`],
    eqn(alt: "degree", $deg$),
    [`deg`],
    eqn(alt: "limit inferior", $liminf$),
    [`liminf`],

    eqn(alt: "natural logarithm", $ln$),
    [`ln`],
    eqn(alt: "argument", $arg$),
    [`arg`],
    eqn(alt: "limit superior", $limsup$),
    [`limsup`],

    // ISO notation for base 2 is lb and for base 10 is lg
    eqn(alt: "base 10 logarithm", $lg$),
    [`lg`],
    eqn(alt: "greatest common divisor", $gcd$),
    [`gcd`],
    eqn(alt: "limit", $lim$),
    [`lim`],
  ),
)

#let cosec = math.op("cosec")

If an operator you wish to use does not exist, you can create one using `math.op`. For example, to create the #eqn(alt: "cosecant", $cosec$) operator:

```
#let cosec = math.op("cosec")
$ cosec x = 1/(sin x) $
```

#eqn(
  alt: "cosecant of x equals 1 divided by sine of x",
  block: true,
  $ cosec x = 1 / (sin x) $,
)

= Other symbols
#align(
  center,
  table(
    columns: 6,
    align: (right, left, right, left, right, left),
    column-gutter: (0.5em, 1em, 0.5em, 1em, 0.5em),

    eqn(alt: "less than", $<$),
    [`<`, `lt`],
    eqn(alt: "angle", $angle$),
    [`angle`],
    eqn(alt: "dot", $dot$),
    [`dot`],

    eqn(alt: "less than or equal to", $<=$),
    [`<=`, `lt.eq`],
    eqn(alt: "measured angle", $angle.arc$),
    [`angle.arc`],
    eqn(alt: "plus or minus", $plus.minus$),
    [`plus.minus`],

    eqn(alt: "greater than", $>$),
    [`>`, `gt`],
    [#eqn(alt: "script l", $ell$)],
    [`ell`],
    eqn(alt: "minus or plus", $minus.plus$),
    [`minus.plus`],

    eqn(alt: "greater than or equal to", $>=$),
    [`>=`, `gt.eq`],
    eqn(alt: "parallel", $parallel$),
    [`parallel`],
    eqn(alt: "multiplication sign", $times$),
    [`times`],

    eqn(alt: "not equal to", $!=$),
    [`!=`, `eq.not`],
    eqn(alt: "45 degree", $45 degree$),
    [`45 degree`],
    eqn(alt: "division sign", $div$),
    [`div`],

    eqn(alt: "much less than", $<<$),
    [`<<`, `lt.double`],
    eqn(alt: "congruent to", $tilde.equiv$),
    [`tilde.equiv`],
    eqn(alt: "asterisk", $*$),
    [`*`, `ast`],

    eqn(alt: "much greater than", $>>$),
    [`>>`, `gt.double`],
    eqn(alt: "not congruent to", $tilde.nequiv$),
    [`tilde.nequiv`],
    eqn(alt: "divides", $divides$),
    [`divides`],

    eqn(alt: "approximately equal to", $approx$),
    [`approx`],
    eqn(alt: "similar", $tilde$),
    [`tilde`],
    eqn(alt: "does not divide", $divides.not$),
    [`divides.not`],

    eqn(alt: "asymptotically equal to", $asymp$),
    [`asymp`],
    eqn(alt: "similar and equal to", $tilde.eq$),
    [`tilde.eq`],
    eqn(alt: "n factorial", $n!$),
    [`n!`],

    eqn(alt: "identically equal to", $equiv$),
    [`equiv`],
    eqn(alt: "not similar to", $tilde.not$),
    [`tilde.not`],
    eqn(alt: "partial derivative", $partial$),
    [`partial`],

    eqn(alt: "precedes", $prec$),
    [`prec`],
    eqn(alt: "circled plus", $plus.o$),
    [`plus.o`],
    eqn(alt: "nabla", $nabla$),
    [`nabla`],

    eqn(alt: "precedes or equal to", $prec.eq$),
    [`prec.eq`],
    eqn(alt: "circled minus", $minus.o$),
    [`minus.o`],
    eqn(alt: "reduced Planck constant", $planck$),
    [`planck`],

    eqn(alt: "succeeds", $succ$),
    [`succ`],
    eqn(alt: "circled dot", $dot.o$),
    [`dot.o`],
    eqn(alt: "compose", $compose$),
    [`compose`],

    eqn(alt: "succeeds or equal to", $succ.eq$),
    [`succ.eq`],
    eqn(alt: "circled times", $times.o$),
    [`times.o`],
    eqn(alt: "star", $star$),
    [`star`],

    eqn(alt: "proportional to", $prop$),
    [`prop`],
    eqn(alt: "circled slash", $slash.o$),
    [`slash.o`],
    eqn(alt: "square root", $sqrt("")$),
    [`sqrt("")`],

    eqn(alt: "approaches the limit", $\u{2250}$),
    [`\u{2250}` @tricky],
    eqn(alt: "upwards harpoon with barb rightwards", $harpoon.tr$),
    [`harpoon.tr`],
    eqn(alt: "check mark", $checkmark$),
    [`checkmark`],
  ),
)

Use `a divides b` for the divides relation, #eqn(alt: "a divides b", $a divides b$), and `a divides.not b` for the negation, #eqn(alt: "a does not divide b", $a divides.not b$).
Use `|` to get set builder notation #eqn(alt: "the set of all a in S such that a is odd", ${a in S | a "is odd"}$) with `{a in S | a "is odd"}`.

= Arrows
#align(
  center,
  table(
    columns: 4,
    align: (right, left, right, left),
    column-gutter: (1em, 1.5em, 1em),
    eqn(alt: "right arrow", $->$),
    [`->`, `arrow.r`],
    eqn(alt: "maps to", $|->$),
    [`|->`, `arrow.r.bar`],

    eqn(alt: "not right arrow", $arrow.r.not$),
    [`arrow.r.not`],
    eqn(alt: "long maps to", $arrow.r.long.bar$),
    [`arrow.r.long.bar`],

    eqn(alt: "long right arrow", $-->$),
    [`-->`, `arrow.r.long`],
    eqn(alt: "left arrow", $<-$),
    [`<-`, `arrow.l`],

    eqn(alt: "implies", $=>$),
    [`=>`, `arrow.r.double`],
    eqn(alt: "left right arrow", $<->$),
    [`<->`, `arrow.l.r`],

    eqn(alt: "does not imply", $arrow.r.double.not$),
    [`arrow.r.double.not`],
    eqn(alt: "down arrow", $arrow.b$),
    [`arrow.b`],

    eqn(alt: "long right double arrow", $==>$),
    [`==>`, `arrow.r.double.long`],
    eqn(alt: "up arrow", $arrow.t$),
    [`arrow.t`],

    eqn(alt: "leads to", $arrow.squiggly$),
    [`arrow.squiggly`],
    eqn(alt: "up down arrow", $arrow.t.b$),
    [`arrow.t.b`],
  ),
)

The right arrows in the first column have matching left arrows, such as `arrow.l.not`, and there are some other matches for down arrows, etc.

= Variable-sized operators
The summation #eqn(alt: "sum from j equals 0 to 3 of j squared", $sum_(j = 0)^3 j^2$) `sum_(j = 0)^3 j^2` and the integral #eqn(alt: "integral from x equals 0 to 3 of x squared d x", $integral_(x = 0)^3 x^2 dif x$) `integral_(x = 0)^3 x^2 dif x` expand when displayed.

#eqn(
  alt: "sum from j equals 0 to 3 of j squared, integral from x equals 0 to 3 of x squared d x",
  block: true,
  $ sum_(j = 0)^3 j^2 wide integral_(x = 0)^3 x^2 dif x $,
)

These do the same.

#align(
  center,
  table(
    columns: 4,
    align: (right, left, right, left),
    column-gutter: (1em, 1.5em, 1em),
    row-gutter: 0.5em,
    eqn(alt: "integral", $integral$),
    [`integral`],
    eqn(alt: "double integral", $integral.double$),
    [`integral.double`],

    eqn(alt: "triple integral", $integral.triple$),
    [`integral.triple`],
    eqn(alt: "contour integral", $integral.cont$),
    [`integral.cont`],

    eqn(alt: "union", $union.big$),
    [`union.big`],
    eqn(alt: "intersection", $inter.big$),
    [`inter.big`],
  ),
)

= Fences
#align(
  center,
  table(
    columns: 6,
    align: (right, left, right, left, right, left),
    column-gutter: (1em, 1.5em, 1em, 1.5em, 1em),
    row-gutter: 0.5em,
    eqn(alt: "parentheses", $()$),
    [`()`],
    eqn(alt: "angle brackets", $chevron.l chevron.r$),
    [`chevron.l chevron.r`],
    eqn(alt: "absolute value bars", $abs("")$),
    [`abs("")`],

    eqn(alt: "brackets", $[]$),
    [`[]`],
    eqn(alt: "floor brackets", $floor("")$),
    [`floor("")`],
    eqn(alt: "double bars", $norm("")$),
    [`norm("")`],

    eqn(alt: "braces", ${}$),
    [`{}`],
    eqn(alt: "ceiling brackets", $ceil("")$),
    [`ceil("")`],
  ),
)

Fix the size with the `lr` function.

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "sum from k equals 0 to n of e to the k squared",
      block: true,
      $ lr([sum_(k = 0)^n e^(k^2)], size: #50%) $,
    ),
    [
      ```
      lr([sum_(k = 0)^n e^(k^2)], size: #50%)
      ```
    ],
  ),
)

To have them grow with the enclosed formula, also use the `lr` function.

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "the ordered pair i and two to the power of two to the i",
      block: true,
      $ lr(chevron.l i, 2^(2^i) chevron.r) $,
    ),
    [
      ```
      lr(chevron.l i, 2^(2^i) chevron.r)
      ```
    ],
  ),
)

Fences scale by default if entered directly as codepoints, and don't scale automatically if entered as symbol notation.

#align(
  center,
  table(
    columns: 2,
    align: (right + horizon, left + horizon),
    column-gutter: 1em,
    eqn(alt: "1 divided by n to the alpha", block: true, $ (1 / n^(alpha)) $),
    [
      ```
      (1 / n^(alpha))
      ```
    ],

    eqn(
      alt: "1 divided by n to the alpha",
      block: true,
      $ paren.l 1 / n^(alpha) paren.r $,
    ),
    [
      ```
      paren.l 1 / n^(alpha) paren.r
      ```
    ],
  ),
)

The `lr` function also allows to scale unmatched delimiters and one-side fences.

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "df by dx, evaluated at x zero",
      block: true,
      $ lr(frac(dif f, dif x) |)_(x_0) $,
    ),
    [
      ```
      lr(frac(dif f, dif x) |)_(x_0)
      ```
    ],
  ),
)

= Arrays, Matrices
Get a matrix with the `mat` function. You can pass an array to it.

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "two by two matrix: first row a, b; second row c, d",
      block: true,
      $ mat(a, b; c, d) $,
    ),
    [
      ```
      $ mat(a, b; c, d) $
      ```
    ],
  ),
)

In Typst, #link("https://typst.app/docs/reference/foundations/array")[array] is a sequence of values,
while in #LaTeX, array is a matrix without fences, which is `$mat(delim: #none, ..)$` in Typst.

For the determinant use `|A|`, text operator #eqn(alt: "determinant", $det$) `det` or `mat(delim: "|", ..)`.

Definition by cases can be easily obtained with the `cases` function.

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "f sub n equals a if n equals zero; otherwise r times f sub n minus one",
      block: true,
      $
        f_n = cases(
          a & "if" n = 0,
          r dot f_(n - 1) & "else"
        )
      $,
    ),
    [
      ```
      $ f_n = cases(
        a &"if" n = 0,
        r dot f_(n - 1) &"else"
      ) $
      ```
    ],
  ),
)

= Spacing in mathematics
Improve #eqn(alt: "square root of two times x", $sqrt(2) x$) to #eqn(alt: "square root of two, thin space, x", $sqrt(2) thin x$) with a thin space, as in `sqrt(2) thin x`.
Slightly wider are `med` and `thick` (the three are in ratio #eqn(alt: "3 to 4 to 5", $3 : 4 : 5$)).
Bigger space are: `quad` for #eqn(alt: "A right arrow, followed by a quad space, then a left arrow. The quad space is about the width of the capital letter 'M'.", $-> quad <-$) and `wide` for #eqn(alt: "A right arrow, followed by a wide space, then a left arrow. The wide space is about twice the width of the capital letter 'M'.", $-> wide <-$), which are useful between parts of a display.
Get arbitrary space with the `h` function.
For example, use `#h(-0.1667em)` for `\!` in #LaTeX.

= Displayed equations
Display equations in a block level using `$ ... $` with at least one space separating the math content and the `$`.

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "S equals k times the base-10 logarithm of W",
      block: true,
      $ S = k dot lg W $,
    ),
    [
      ```
      $ S = k dot lg W $
      ```
    ],
  ),
)

You can break into multiple lines.

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "Sine of x equals x minus x cubed over three factorial, plus x to the fifth over five factorial, minus continuing in this alternating pattern.",
      block: true,
      $
        sin(x) = x - x^3 / 3! \
        + x^5 / 5! - dots.h.c
      $,
    ),
    [
      ```
      $ sin(x) = x - x^3 / 3! \
          + x^5 / 5! - dots.h.c $
      ```
    ],
  ),
)

Align equations using `&`

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "The divergence of the vector D equals rho. New line: The divergence of the vector B equals zero.",
      block: true,
      $
        nabla dot bold(D) & = rho \
        nabla dot bold(B) & = 0
      $,
    ),
    ```
    $ nabla dot bold(D) &= rho \
      nabla dot bold(B) &= 0 $
    ```,
  ),
)

(the left or right side of an alignment can be empty).
Get a numbered version by `#set math.equation(numbering: ..)`.

= Calculus examples
The last three here are display style.

#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "function f maps from the set of real numbers R to R",
      block: true,
      $ f: RR -> RR $,
    ),
    [
      ```
      f: RR -> RR
      ```
    ],

    eqn(
      alt: "9.8 meters per second squared",
      block: true,
      $ 9.8 thin "m" slash "s"^2 $,
    ),
    [`9.8 thin "m" slash "s"^2` @tricky],

    eqn(
      alt: "the limit as h approaches zero of f of x plus h minus f of x, divided by h",
      block: true,
      $ lim_(h->0) (f(x+h)-f(x)) / h $,
    ),
    [
      ```
      lim_(h -> 0) (f(x + h) - f(x)) / h
      ```
    ],

    eqn(
      alt: "the integral of x squared with respect to x equals x cubed divided by three, plus C",
      block: true,
      $ integral x^2 dif x = x^3 \/ 3 + C $,
    ),
    [
      ```
      integral x^2 dif x = x^3 \/ 3 + C
      ```
    ],

    eqn(
      alt: "Nabla equals vector i times d by d x, plus vector j times d by d y, plus vector k times d by d z.",
      block: true,
      $
        nabla = bold(i) dif / (dif x) + bold(j) dif / (dif y) + bold(k) dif / (dif z)
      $,
    ),
    [
      ```
      nabla = bold(i) dif / (dif x) + bold(j) dif / (dif y) + bold(k) dif / (dif z)
      ```
    ],
  ),
)

= Discrete mathematics examples
For modulo, there is a symbol #eqn(alt: "congruent to", $equiv$) from `equiv` and a text operator #eqn(alt: "modulo", $mod$) from `mod`.

For combinations the binomial symbol #eqn(alt: "n choose k", $binom(n, k)$) is from `binom(n, k)`.
This resizes to be bigger in a display.

For permutations use #eqn(alt: "n falling factorial r", $n^(underline(r))$) from `n^(underline(r))` (some authors use #eqn(alt: "n permute r", $P(n, r)$), or #eqn(alt: "r-permutation of n", $""_n P_r$) from `""_n P_r`).

= Statistics examples
#align(
  center,
  table(
    columns: 2,
    column-gutter: 1em,
    eqn(
      alt: "sigma squared equals the square root of the sum of x sub i minus mu squared, divided by N",
      block: true,
      $ sigma^2 = sqrt(sum(x_i - mu)^2 \/ N) $,
    ),
    [
      ```
      sigma^2 = sqrt(sum(x_i - mu)^2 \/ N)
      ```
    ],

    eqn(
      alt: "Expected value of X equals mu sub X equals the sum of x sub i minus P of x sub i",
      block: true,
      $ E(X) = mu_X = sum(x_i - P(x_i)) $,
    ),
    [
      ```
      E(X) = mu_X = sum(x_i - P(x_i))
      ```
    ],

    eqn(
      alt: "one divided by the square root of two sigma squared pi, times e to the power of negative open parenthesis x minus mu squared divided by two sigma squared close parenthesis",
      block: true,
      $ 1 / sqrt(2 sigma^2 pi) e^(- (x - mu)^2 / (2 sigma^2)) $,
    ),
    [
      ```
      1 / sqrt(2 sigma^2 pi) e^(- (x - mu)^2 / (2 sigma^2))
      ```
    ],
  ),
)

= For more
See also the Typst Documentation at #link("https://typst.app/docs").
