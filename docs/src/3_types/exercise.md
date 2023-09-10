# Exercise: Measurements
In this exercise, you will define a type which is (hopefully) more closely related to your research than Pokemon.
We will continue our example from the first chapter, linear regression.
Suppose you collected your data on education, but with some measurement error (people lie about their education, or they are not sure what exactly counts into the number of years, ...).
Of course this is not limited to the example of education, but observing data with measurement error is a central concept in most empirical sciences.

!!! compat "Exercise"
    Define the composite type `Measurement`, that is able to store a measurement (in a field called `value`) and the magnitude of error of that measurement (in a field called `error`).
    It should be a subtype of `AbstractFloat` and have an inner constructor that converts the magnitude of error to a positive number.
    Hint: you can use the function `abs(...)` to take the absolute value of a number.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    struct Measurement <: AbstractFloat
        value
        error
        Measurement(value, error) = new(value, abs(error))
    end
    ```
```@setup measurement
struct Measurement <: AbstractFloat
    value
    error
    Measurement(val, err) = new(val, abs(err))
end
```
```@raw html
</details>
```
\
For conveniece, we may want to have a more compact and readable way of defining new Measurements.
For this purpose, we use a so-called "infix operator", which is just a function that can also be written between its arguments.
You may have never thought about it, but you have been using infix operators all the time (in R or Python): 
For example, `+` is a function that can be called like any other function, `+(5,6)`, but also in infix notation as `5 + 6`.
Julia has a whole list of infix operators available, for example `&`, `+`, `-`, `⊗`, `≤`, `∈`, `±`:

```@example measurement
5 ≤ 5
```

We can define infix operators just as functions:
```@example measurement
⊗(a, b) = string(a, b)

"Hello" ⊗ " World"
```

!!! compat "Exercise"
    Define the function `±(value, error)` to create a new instance of the `Measurement` type, and create some measurements.
    The `±` symbol can we written as `\pm<tab>`.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    ±(value, error) = Measurement(value, error)

    # Using infix notation, we may now write:
    m1 = 2.98 ± 0.43
    m2 = 0.34 ± 1.34
    ```
```@setup measurement
±(value, error) = Measurement(value, error)

# Using infix notation, we may now write:
m1 = 2.98 ± 0.43
m2 = 0.34 ± 1.34
```
```@raw html
</details>
```

