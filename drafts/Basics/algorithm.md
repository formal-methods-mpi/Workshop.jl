We will finish this chapter with an exercise that makes use of some of the basic syntax elements described before.
Our goal is to implement linear regression. 
During the course of the workshop, we will come back to this example several times.
Let's first have a look at what linear regression is:
Suppose you observe the two variables education (in years) and income (per month in dollar), and you want to predict a persons income based on their education. One way to do this is linear regression. Suppose we conducted a study and observed the following data points:

```@eval linreg_data
using Plots

x = 10 .+ 3*randn(20)
β = 300
γ = 1000
y = γ .+ β*x + 500*randn(20)

plot(x, y; seriestype=:scatter)
```

On the x-axis, you see the years of education, and on the y-axis you see the monthly income. The task of linear regression is to find a straight line that best describes this relationship:

```@eval linreg_data
Plots.abline!(β, α)
```

As you may recal from university, school, or learn just now, a straight line is mathematically described by ``y = \alpha + \beta x``, where in our case, ``y`` corresponds to income and ``x`` to years of education.

Task: write a function `predict` that takes `x, α` and `β` as inputs and returns the predicted value for `y`.

Solution:
```julia
function predict(x, α, β)
    y = α + β*x
    return y
end
```

Let's simulate some data for the task at hand. First, we load the `Random` package (a julia package for random number generation) and set a seed (to make our experiments reproducible):

```@eval
using Random
Random.seed!(1232)
```

Next, we generate some random values for years of education:

```@eval
x = 10 .+ 3*randn(20)
```

This produces a vector of 20 values with 10 years of education as the average, and some normally distributed random variation.

Task: Use your previously defined function `predict` to generate some values for income (`y`) with `\alpha = 1000, \beta = 300`

Solution:
```julia
y = predict(x, 1000, 300)
```

Since in reality, income dose not perfectly depend on education, but there is some random variation, we add this random variation to `y`:

```julia
y += 500*randn(20)
```

And viola! We have some data to work with.

In reality of course, we don't know the values for ``\alpha`` and ``\beta``, but we have to estimate them from the data. To do so, we first need some indication of how good a certain combination of values works for our data. Usually, we use the sum of squared errors for this task:

```math
\sum_{i=1}^n \left(\hat\y_i - y_i \right)^2
```

So we go through all of our `n` data points (`i = 1, ..., n`) and for each of those data points we compute the squared distance between the prediction and the value we observed in reality.

Task: Define a function `squared_error` that takes a vector of predicted values and observed values as input and computes the squared loss between them.

Solution:
```julia
function squared_error(y, ŷ)
    error = 0.0
    for i in eachindex(y)
        error += (y[i] - ŷ[i])^2
    end
    return error
end
```
or, a bit shorter using broadcasting:
```julia
function squared_error(y, ŷ)
    return sum((y - ŷ).^2)
end
```

Task: Using your previously defined `predict` and `squared_error` functions to define a function `squared_error_regression` that takes as input values for `α`, `β`, `x` and `y` and returns as output the squared error between predictions and observed values. Then, use this function to compute the squared error for the parameters

Solution:
```julia
function squared_error_regression(α, β, y, x)
    return squared_error(y, predict(x, α, β))
end
```
