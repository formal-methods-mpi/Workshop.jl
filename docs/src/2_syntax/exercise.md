# Exercise: Linear Regression

We will finish this chapter with an exercise that makes use of some of the basic syntax elements described before.
Our goal is to implement linear regression.
During the course of the workshop, we will come back to this example several times.
Let's first have a look at what linear regression is:
Suppose you observe the two variables education (in years) and income (per month in dollar), and you want to predict a persons income based on their education. One way to do this is linear regression. Suppose we conducted a study and observed the following data points:

```@setup linreg
using Random
Random.seed!(1243)

using Plots
default(legend = false)

x = 10 .+ 3*randn(20)
β = 300
α = 1000
y = α .+ β*x + 500*randn(20)

plot(x, y; seriestype=:scatter, xlabel = "Education", ylabel = "Income")
savefig("data.png")
```

![data](data.png)

On the x-axis, you see the years of education, and on the y-axis you see the monthly income. The task of linear regression is to find a straight line that best describes this relationship:

```@setup linreg
Plots.abline!(β, α)
savefig("lr.png")
```

![lr](lr.png)

As you may recall from university, school, or learn just now, a straight line is mathematically described by ``y = \alpha + \beta x``, where in our case, ``y`` corresponds to income and ``x`` to years of education.

!!! compat "Exercise"
    Write a function `predict` that takes `x, α` and `β` as inputs and returns the predicted value for `y`.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    function predict(x, α, β)
        y = α .+ β*x
        return y
    end
    ```
```@raw html
</details>
```
\

```@setup linreg
function predict(x, α, β)
    y = α .+ β*x
    return y
end
```

Let's simulate some data for the task at hand. First, we load the `Random` package (a Julia package for random number generation) and set a seed (to make our experiments reproducible):

```@example linreg
using Random
Random.seed!(1234)
```

Next, we generate some random values for years of education:

```@example linreg
x = 10 .+ 3*randn(20)
```

This produces a vector of 20 values with 10 years of education as the average, and some normally distributed random variation (with mean 0 and standard deviation 3).

!!! compat "Exercise"
    Use your previously defined function `predict` to generate some values for income (`y`) with `α = 1000, β = 300`

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    y = predict(x, 1000, 300)
    ```
```@example linreg
y = predict(x, 1000, 300) #hide
```
```@raw html
</details>
```
\

Since in reality, income does not perfectly depend on education, but there is some random variation, we add this random variation to `y`:

```@example linreg
y += 500*randn(20)
```

And voilà! We have some data to work with.

In reality of course, we don't know the values for ``\alpha`` and ``\beta``, but we have to estimate them from the data. To do so, we first need some indication of how good a certain combination of values works for our data. Usually, we use the sum of squared errors for this task:

```math
\sum_{i=1}^n (\hat{y}_i - y_i)^2
```

So we go through all of our `n` data points (`i = 1, ..., n`) and for each of those data points we compute the squared distance between the prediction, ``\hat{y}_i``, and the value we observed in reality, ``y_i``.

!!! compat "Exercise"
    Define a function `squared_error` that takes a vector of predicted values and a vector of observed values as input and computes the sum of squared errors between them.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    function squared_error(y, ŷ)
        return sum((y - ŷ).^2)
    end
    ```
    (In case you are wondering, `ŷ` can by typed as `y\hat<tab>`)
```@setup linreg
function squared_error(y, ŷ)
    return sum((y - ŷ).^2)
end
```
```@raw html
</details>
```
\

!!! compat "Exercise"
    Using your previously defined `predict` and `squared_error` functions to define a function `squared_error_regression` that takes as input values for `α`, `β`, `x` and `y` and returns as output the squared error between predictions and observed values. Then, use this function to compute the squared error for the parameter values 1. `β = 100, α = 200` and 2. `β = 300, α = 1000`

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    function squared_error_regression(α, β, y, x)
        return squared_error(y, predict(x, α, β))
    end

    squared_error_regression(200, 100, y, x)
    squared_error_regression(1000, 300, y, x)
    ```
```@example linreg
function squared_error_regression(α, β, y, x) #hide
    return squared_error(y, predict(x, α, β)) #hide
end #hide
 #hide
squared_error_regression(200, 100, y, x) #hide
```
```@example linreg
squared_error_regression(1000, 300, y, x) #hide
```
```@raw html
</details>
```
\

You should see that the error corresponding to the true parameters we used to simulate the data is much lower.
