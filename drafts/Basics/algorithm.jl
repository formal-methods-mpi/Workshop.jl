using Plots

x = 10 .+ 3*randn(20)
β = 300
α = 1000
y = α .+ β*x + 500*randn(20)

plot(x, y; seriestype=:scatter)

plot(x, y; seriestype = :scatter)

Plots.abline!(β, α)

function predict(x, α, β)
    y = α + β*x
    return y
end

using Random

Random.seed!(1232)

x = 10 .+ 3*randn(20)

ŷ