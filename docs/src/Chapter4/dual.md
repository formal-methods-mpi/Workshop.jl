# Automatic Differentiation

Obtaining function derivatives is central in many areas of scientific computing.
For example, in numerical optimization, we often need derivatives to find the minimum of a function (maximum likelihood estimation, neural networks, ...).
However, deriving derivatives by hand can be quite tedious, especially if you work with frequently changing functions.
As numerical differentiation is computationally quite expensive, automatic differentiation libraries have been developed.
For example, most Deep Learning libraries employ a form of automatic differentiation called "backpropagation".
In this example, we will implement one form of automatic differentiation, called "Forward mode AD".

To do so, we heavily rely on the chain rule: 
suppose we have functions ``f: \mathbb{R} \to \mathbb{R}, \; g: \mathbb{R} \to \mathbb{R}``.
If we compose these functions, we can derive their derivative as 

```math
(f(g(x)))' = f'(g(x)) \cdot g'(x)
```

With a little bit abuse of notation, instead of defining two functions ``f`` and ``g`` we will write in the following ``x: \mathbb{R} \to \mathbb{R}`` as a function itself, so the chain rule becomes:

```math
(f(x))' = f'(x) \cdot x'
```

Using the chain rule together with all the other basic differentiation rules you hopefully remember from high school gives:

```math
\begin{aligned}
(x + y)' &= x' + y' \\
(x - y)' &= x' - y' \\
(x \cdot y)' &= x'\cdot y + x \cdot y' \\
\left(\frac{1}{x}\right)' &= \frac{-x'}{x^2} \\
\left(\frac{x}{y}\right)' &= \frac{x' \cdot y - x \cdot y'}{y^2} \\
(\log(x))' &= \frac{1}{x} \cdot x' \\
(\sin(x))' &= \cos(x) \cdot x' \\
(\cos(x))' &= -\sin(x) \cdot x' \\
\left(x^k\right)' &= k \cdot x^{k-1} \cdot x'
\end{aligned}
```

As most functions are compositions of basic functions (of course our list above is not exhaustive, but already sufficient for a lot of things), we can use the chain rule and the differentiation rules for those basic building blocks to "propagate" the derivative through more complex functions (just like we propagated the measurement error in the example in Chapter 3).

!!! compat "Exercise"
    Define a struct `Dual` that stores a function value as well as it's derivative.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    struct Dual
        x
        ∂x
    end
    ```
```@setup dual
struct Dual
    x
    ∂x
end
```
```@raw html
</details>
```
\

!!! compat "Exercise"
    Define methods for some of the basic functions described above: `+`, `-`, `*`, `/`, `inv`, `log`, `sin`, `cos`, `^`.
    Remember that you have to import them from `Base`.
    Don't do all of them (it's tedious), just a few to get the idea.

```@raw html
<details>
<summary>Hint</summary>
<br>
```
!!! compat "Hint"
    We could define the multiplication of two dual numbers as:
    ```julia
    import Base: *
    *(a::Dual, b::Dual) = Dual(a.x*b.x, a.∂x*b.x + a.x*b.∂x)
    ```
```@setup dual
import Base: *
*(a::Dual, b::Dual) = Dual(a.x*b.x, a.∂x*b.x + a.x*b.∂x)
```
```@raw html
</details>
```
\

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    import Base: +, -, *, /, inv, log, sin, cos, ^

    +(a::Dual, b::Dual) = Dual(a.x + b.x, a.∂x + b.∂x)
    -(a::Dual, b::Dual) = Dual(a.x - b.x, a.∂x - b.∂x)
    *(a::Dual, b::Dual) = Dual(a.x * b.x, a.∂x*b.x + a.x*b.∂x)
    ^(a::Dual, k::Int) = Dual(a.x^k, k*a.x^(k-1)*a.∂x)
    /(a::Dual, b::Dual) = Dual(a.x/b.x, (a.∂x*b.x - a.x*b.∂x)/b.x^2)
    inv(a::Dual) = Dual(inv(a.x), -a.∂x/(a.x^2))
    log(a::Dual) = Dual(log(a.x), -a.∂x/(a.x^2))
    sin(a::Dual) = Dual(sin(a.x), cos(a.x)*a.∂x)
    cos(a::Dual) = Dual(cos(a.x), -sin(a.x)*a.∂x)
    ```
```@setup dual
import Base: +, -, *, /, inv, log, sin, cos, ^

+(a::Dual, b::Dual) = Dual(a.x + b.x, a.∂x + b.∂x)
-(a::Dual, b::Dual) = Dual(a.x - b.x, a.∂x - b.∂x)
*(a::Dual, b::Dual) = Dual(a.x * b.x, a.∂x*b.x + a.x*b.∂x)
^(a::Dual, k::Int) = Dual(a.x^k, k*a.x^(k-1)*a.∂x)
/(a::Dual, b::Dual) = Dual(a.x/b.x, (a.∂x*b.x - a.x*b.∂x)/b.x^2)
inv(a::Dual) = Dual(inv(a.x), -a.∂x/(a.x^2))
log(a::Dual) = Dual(log(a.x), -a.∂x/(a.x^2))
sin(a::Dual) = Dual(sin(a.x), cos(a.x)*a.∂x)
cos(a::Dual) = Dual(cos(a.x), -sin(a.x)*a.∂x)
```
```@raw html
</details>
```
\
Of course we also wand to be able to have constants in our functions.
To make our life a little bit easier, we can treat constant values (aka real numbers) as dual numbers with a derivative of 0.
For this purpose, we define how to convert a real number into a dual number, and the relevant methods:

```@example dual
import Base: +, -, *, /, inv, log, sin, cos, ^

+(a::Dual, b::Dual) = Dual(a.x + b.x, a.∂x + b.∂x)
-(a::Dual, b::Dual) = Dual(a.x - b.x, a.∂x - b.∂x)
*(a::Dual, b::Dual) = Dual(a.x * b.x, a.∂x*b.x + a.x*b.∂x)
^(a::Dual, k::Int) = Dual(a.x^k, k*a.x^(k-1)*a.∂x)
/(a::Dual, b::Dual) = Dual(a.x/b.x, (a.∂x*b.x - a.x*b.∂x)/b.x^2)
inv(a::Dual) = Dual(inv(a.x), -a.∂x/(a.x^2))
log(a::Dual) = Dual(log(a.x), -a.∂x/(a.x^2))
sin(a::Dual) = Dual(sin(a.x), cos(a.x)*a.∂x)
cos(a::Dual) = Dual(cos(a.x), -sin(a.x)*a.∂x)
```