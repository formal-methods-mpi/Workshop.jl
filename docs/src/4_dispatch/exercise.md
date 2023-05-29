```@setup exercise_dispatch
using InteractiveUtils

struct Measurement <: AbstractFloat
    value
    error
    Measurement(val, err) = new(val, abs(err))
end

±(val, err) = Measurement(val, err)
```

# Exercise: Combining Linear Regression and Measurements

Let's return to our example from the previous chapter, where we defined a new type called `Measurement` to store a measurement and it's measurement error.
We will now define appropriate methods for this type.

Let's first take a look at addition: if we add two measurements, ``a \pm b`` and ``c \pm d``, we will get a new measurement
```math
(a \pm b) + (c \pm d) = (a + c) \pm (b + d)
```
That is, we add the measured values and the error terms separately.

!!! compat "Exercise"
    Define a method for the addition of two measurements.
    Hint: recall that functions from other modules (like `+` from `Base`) have to be imported before you can define a new method for them.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    import Base: +
    +(x::Measurement, y::Measurement) = Measurement(x.value + y.value, x.error + y.error)
    ```
```@example exercise_dispatch
import Base: + #hide
+(x::Measurement, y::Measurement) = Measurement(x.value + y.value, x.error + y.error) #hide
```
```@raw html
</details>
```
\
We can now add measurements together:

```@example exercise_dispatch
m1 = 2.98 ± 0.43
m2 = 0.34 ± 1.34

m1 + m2
```

Work's like a charm!
Subtraction works similarly, so I will define this method for you:
```@example exercise_dispatch
import Base: -
-(x::Measurement, y::Measurement) = Measurement(x.value - y.value, x.error + y.error)
```

To make working with our `Measurement` type a bit more aesthetic, we can even define a new method for `Base.show` that defines how our type is printed to the REPL:

```@example exercise_dispatch
import Base: show

function show(io::IO, m::Measurement)
    value_as_string = string(round(m.value, digits = 2))
    error_as_string = string(round(m.error, digits = 2))
    print(io, value_as_string*" ± "*error_as_string)
end

m1
```
But let's get back to more serious business: The next thing we need is to be able to add measurements and real numbers together.
We can think of real numbers as measurements without error, so adding a measurement ``(a \pm b)`` and a real number ``c`` should yield

```math
(a \pm b) + c = (a + c) \pm b 
```

!!! compat "Exercise"
    Add methods for the addition of measurements and real numbers.
    Hint: real numbers are denoted by the type `Real`.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    +(a::Real, b::Measurement) = Measurement(a + b.value, b.error)
    +(a::Measurement, b::Real) = b + a
    m1 + 3.53
    ```
```@example exercise_dispatch
+(a::Real, b::Measurement) = Measurement(a + b.value, b.error) #hide
+(a::Measurement, b::Real) = b + a #hide
m1 + 3.53 #hide
```
```@raw html
</details>
```
\
Okay, to spare you some time, I will define some last methods we need: subtraction and multiplication of real numbers and measurements. 
Subtraction works just like addition, and for multiplication we see that

```math
c \cdot (a \pm b) = ca \pm cb
```

```@example exercise_dispatch
-(x::Measurement, y::Real) = Measurement(x.value - y, x.error)
-(x::Real, y::Measurement) = Measurement(x - y.value, y.error)

import Base: *
*(x::Measurement, y::Real) = Measurement(x.value*y, abs(x.error*y))
*(x::Real, y::Measurement) = y*x
```

Let's see if it all works as planned:
```@example exercise_dispatch
m1 + m2
9.34 + m1
m2 + 4.52
3.5 * m2
m2 * 3.5
```

Now for the fun part: 
In the exercise to the first chapter, we tried to predict income from years of education with the help of linear regression.
Let's simulate some data again:

```@example exercise_dispatch
using Random
Random.seed!(1243)

x = 10 .+ 3*randn(20)
β = 300
α = 1000
y = α .+ β*x + 500*randn(20)
nothing #hide
```
This time, let's asume we observed education with some measurement error:

```@example exercise_dispatch
x = Measurement.(x, 2*randn(20))
```

But what happens when we us the education data with measurement error to predict income?
Let's find out! We defined our prediction function as

```@example exercise_dispatch
function predict(x, α, β)
    y = α .+ β*x
    return y
end
nothing #hide
```

and if we plug in the values for education with measurement error, we achieve
```@example exercise_dispatch
predict(x, 1000, 300)
```
a prediction of income with the respective measurement error.


Hopefully, this serves a a nice illustration of what multiple dispatch together with julias type system is able to achieve.
When you wrote the `predict` function at the beginning of this workshop, you probably had no idea what multiple dispatch even is.
But because we are able to define methods for important operations (like `*`, `+`), we can use any function or algorithmn that is composed of these operations.
This is a very powerful idea that allows for great extensibility and interoperability of different packages.
If you don't believe me, imagine somebody has written an `R` package for linear regression.
Now you are in the situation that you have to deal with measurement error.
I believe it would be impossible to get the published `R` package to work with measurement error without rewriting the whole package.


Similarly, if you think about our pokemon example from the beginning:
If we would like to add more types of pokemon, we just have to define the types (`Water`, `Fire`, etc.) and the relevant methods for our functions (`effectiveness`). Of course, the code we wrote in the pokemon example is rather limited, but this translates seamlessly to complicated packages with more functionality.