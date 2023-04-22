# Exercise
In this exercise, you will define a type which is (hopefully) more closely related to your research than Pokemon.
We will continue our example from the first chapter, linear regression.
Suppose you collcted your data on education, but with some measurement error (people lie about their education, or they are not shure what exactly counts into the number of years, ...).
Of cours this is not limited to the example of education, but observing data with measurement error is a central concept in most empirical sciences.

!!! compat "Exercise"
    Define the composite type `Measurement`, that is able to store a measurement and the magnitude of error of that measurement.
    It should be a subtype of `AbstractFloat` and have an inner constructor that converts the magnitude of measurement to a positive number.
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
        Measurement(val, err) = new(val, abs(err))
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

!!! compat "Exercise"
    Define the function `±(value, error)` to create a new instance of the `Measurement` type, and create some measurements.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    ±(val, err) = Measurement(val, err)

    m1 = 2.98 ± 0.43
    m2 = 0.34 ± 1.34
    ```
```@setup measurement
±(value, error) = Measurement(value, error)

m1 = 2.98 ± 0.43
m2 = 0.34 ± 1.34
```
```@raw html
</details>
```

