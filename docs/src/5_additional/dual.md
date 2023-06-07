# Automatic Differentiation

Obtaining function derivatives is central in many areas of scientific computing.
For example, in numerical optimization, we often need derivatives to find the minimum of a function (maximum likelihood estimation, neural networks, ...).
However, deriving derivatives by hand can be quite tedious, especially if you work with frequently changing functions.
As numerical differentiation is computationally quite expensive, automatic differentiation libraries have been developed.
For example, most Deep Learning libraries employ a form of automatic differentiation called "backpropagation".
In this example, we will implement one form of automatic differentiation, called "Forward mode AD".[^1]

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
    Define a struct `Dual` that stores a function value as well as it's derivative as a subtype of `Number`.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    struct Dual <: Number
        x
        ∂x
    end
    ```
```@setup dual
struct Dual <: Number
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
log(a::Dual) = Dual(log(a.x), a.∂x/a.x)
sin(a::Dual) = Dual(sin(a.x), cos(a.x)*a.∂x)
cos(a::Dual) = Dual(cos(a.x), -sin(a.x)*a.∂x)
```
```@raw html
</details>
```
\
Of course we also want to be able to have constants in our functions.
To make our life a little bit easier, we can treat constant values (aka real numbers) as dual numbers with a derivative of 0.
For this purpose, we define how to convert a real number into a dual number, and a "promotion rule":

```@example dual
import Base: convert, promote_rule

convert(::Type{Dual}, x::Real) = Dual(x, zero(x))
promote_rule(::Type{Dual}, ::Type{<:Real}) = Dual
nothing #hide
```

We did not cover conversion and promotion in this workshop, so you won't understand this in detail, but the short explanation is this:
We write a method for the `convert` function to tell julia how to "convert" an object of type `Real` to an object of type `Dual`, so we can now do something like this:

```@example dual
a = 3.23
convert(Dual, a)
```

that is, a Real number is converted to a dual with a derivative of zero.
The promotion rule defines a greater type of two types so that all objects of these types can be converted to it.
We now can do something like:

```@example dual
a = 3.23
b = Dual(3.2, 3.47)
promote(a, b)
```

So given a pair of a `Dual` and a `Real` number, promote both numbers to `Dual`s.
The beauty of this is that we now can add, multiply, divide, etc. reals and duals without defining any further methods:

```@example dual
a = 3.23
b = Dual(3.2, 3.47)
a*b
```

```@example dual
a+b
```
```@example dual
a/b
```
This is because julia will now "check" the defined promotion rules for us, and promote the real number to a dual number, and then use the methods we defined before.
If you are interested in details, check the documentation on this topic, but for now it suffices to see that we avoided defining a bunch of methods with this neat trick.


Now we have implemented a library for automatic differentiation! Let's come up with some random function to take the derivative of:

```@example dual
f(x) = (x^2*sin(x))/cos(x)^2
```

To compute the derivative at point `x`, simply call the function with `Dual(x, 1.0)` (as `1.0` is the derivative of the identity function `x`):
```@example dual
f(Dual(5.0, 1.0))
```

This gives the function value and the derivative of `f` at point `5`.
Another function and it's derivative:

```@example dual
g(x) = log(x)/sin(x^5)
g(Dual(π, 1.0))
```

We can check that we did not messed up by either deriving the derivative by hand or using a numerical approximation:

```@example dual
using FiniteDiff
FiniteDiff.finite_difference_derivative(g, Float64(π))
```

We can also take the partial derivative of functions ``h: \mathbb{R^n} \to \mathbb{R}``:

```@example dual
h(x) = sin(x[1]*x[2]^2-x[3])/log(x[1])
h([4.3, Dual(6.45, 1.0), 3.42])
```
gives the partial derivative w.r.t. ``x_2`` at the point ``(4.3, 6.45, 3.42)``:

```@example dual
FiniteDiff.finite_difference_gradient(h, [4.3, 6.45, 3.42])
```

To sum up, let's get back to our example from the beginning: linear regression.
Recall our setup:

```@example dual
using Random
Random.seed!(1243)

x = 10 .+ 3*randn(20)
β = 300
α = 1000
y = α .+ β*x + 500*randn(20)

function predict(x, α, β)
    y = α .+ β*x
    return y
end

function squared_error(y, ŷ)
    return sum((y - ŷ).^2)
end
nothing #hide
```

!!! compat "Exercise"
    Compute the derivative of the squared error w.r.t. `β` at the point `β = 200, α = 1000`.

```@raw html
<details>
<summary>Hint</summary>
<br>
```
!!! compat "Hint"
    Recall you can compute the squared error as
    ```julia
    squared_error(y, predict(x, α, β))
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
    squared_error(y, predict(x, 1000, Dual(200.0, 1.0)))
    ```
```@example dual
squared_error(y, predict(x, 1000, Dual(200.0, 1.0))) #hide
```
```@raw html
</details>
```

[^1]: This example is inspired by https://www.wias-berlin.de/people/fuhrmann/AdSciComp-WS2223/week3/
