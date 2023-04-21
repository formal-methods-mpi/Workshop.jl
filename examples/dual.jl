############################################################################################
# algorithmn
# Vielleicht einfache lineare Regression? Also

x = randn(10)
y = 0.5*x + randn(10)/3

function squared_loss(x, y, β)
    ŷ = β*x
    sum((y - ŷ).^2)
end

function ∂squared_loss(x, y, β)
    ∂loss = 0.0
    for i in eachindex(x)
        ∂loss += 2*x[i]*(x[i]*β - y[i])
    end
    return [∂loss]
end

using Optim

β₀ = 1.0

solution = optimize(
    β -> squared_loss(x, y, β[1]),
    β -> ∂squared_loss(x, y, β[1]),
    [β₀], 
    BFGS();
    inplace = false)

solution.minimizer

############################################################################################
# type

struct Dual
    v
    ϵ
end

############################################################################################
# multiple dispatch

a = Dual(3.0, 1.0)
b = Dual(4.0, 0.0)

import Base: +, -, *, ^, convert, promote_rule

+(a::Dual, b::Dual) = Dual(a.v + b.v, a.ϵ + b.ϵ)
-(a::Dual, b::Dual) = Dual(a.v - b.v, a.ϵ - b.ϵ)
*(a::Dual, b::Dual) = Dual(a.v * b.v, a.v*b.ϵ + b.v*a.ϵ)
^(a::Dual, k::Int) = Dual(a.v^k, k*a.v^(k-1)*a.ϵ)

+(a::Dual, b::Real) = a + convert(Dual, b)
+(a::Real, b::Dual) = b + a

-(a::Dual, b::Real) = a - convert(Dual, b)
-(a::Real, b::Dual) = convert(Dual, a) - b

*(a::Dual, b::Real) = a * convert(Dual, b)
*(a::Real, b::Dual) = b*a

*(a::Dual, b::Vector) = [a * b[i] for i in eachindex(b)]
*(a::Vector, b::Dual) = b*a

Base.convert(::Type{Dual}, x::Real) = Dual(x, zero(x))
Base.promote_rule(::Type{Dual}, ::Type{<:Real}) = Dual


squared_loss(x, y, Dual(β₀, 1.0))

using FiniteDiff

FiniteDiff.finite_difference_derivative(β -> squared_loss(x, y, β), β₀)