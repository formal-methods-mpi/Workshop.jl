############################################################################################
# algorithmn

function predict(x, β)
    return β*x
end

function loss(x, y, β)
    return sum((predict(x, β) - y)).^2
end

function thickness(density, mass, width, length)
    thickness = mass/(density*width*length)
    return thickness
end

density = 2.7
mass = 250
width = 30.5
length = 1400.24

thickness(density, mass, width, length)
# something more complex would be nice, maybe with sin/cos
# so we can later inspect (@which) how this works

############################################################################################
# type

struct Measurement{T<:AbstractFloat} <: AbstractFloat
    val::T
    err::T
    Measurement(val::T, err::T) where {T} = new{T}(val, abs(err))
end

function Measurement(val::V, err::E) where {V,E}
    T = promote_type(V, E)
    return Measurement(T(val), T(err))
end

Measurement(1.0, 2)

±(val, err) = Measurement(val, err)

############################################################################################
# multiple dispatch

### Elementary arithmetic operations:

m1 = 2.98 ± 0.43
m2 = 0.34 ± 1.34

# Addition: +
Base.:+(a::Measurement, b::Measurement) = Measurement(a.val + b.val, a.err + b.err)
Base.:+(a::Real, b::Measurement) = Measurement(a + b.val, b.err)
Base.:+(a::Measurement, b::Real) = b + a

m1 + m2
m1 + 1.23
1.23 + m1

# Subtraction: -
## leave undefined for now

# Multiplication: *
function Base.:*(a::Measurement, b::Measurement)
    val = a.val*b.val
    lower = (a.val - a.err)*(b.val - b.err)
    upper = (a.val + a.err)*(b.val + b.err)
    err = maximum([abs(val-lower), abs(val-upper)])
    return(Measurement(val, err))
end

m1 * m2

Base.zero(x::Measurement) = Measurement(zero(x.val), zero(x.err))
Base.zero(::Type{Measurement}) = Measurement(0.0, 0.0)

# Division: /
## leave undefined for now
A = [m1 m1
    m2 m2
    m1 m2]

b = [m1; m2]

A*b

→

############################################################################################

struct Measurement <: AbstractFloat
    value
    error
    Measurement(val, err) = new(val, abs(err))
end

±(val, err) = Measurement(val, err)

m1 = 2.98 ± 0.43
m2 = 0.34 ± 1.34

import Base: +, -, *
+(x::Measurement, y::Measurement) = Measurement(x.value + y.value, x.error + y.error)
-(x::Measurement, y::Measurement) = Measurement(x.value - y.value, x.error + y.error)
+(a::Real, b::Measurement) = Measurement(a + b.value, b.error)
+(a::Measurement, b::Real) = b + a
-(x::Measurement, y::Real) = Measurement(x.value - y, x.error)
-(x::Real, y::Measurement) = Measurement(x - y.value, y.error)
*(x::Measurement, y::Real) = Measurement(x.value*y, abs(x.error*y))
*(x::Real, y::Measurement) = y*x

import Base: show

function show(io::IO, m::Measurement)
    value_as_string = string(round(m.value, digits = 2))
    error_as_string = string(round(m.error, digits = 2))
    print(io, value_as_string*" ± "*error_as_string)
end

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

m1 .+ [m1; m2]

x = 10 .+ 3*randn(20)
β = 300
α = 1000
y = α .+ β*x + 500*randn(20)
x = Measurement.(x, 2*randn(20))


function squared_error(y, ŷ)
    return sum((y - ŷ).^2)
end

function Base.:*(a::Measurement, b::Measurement)
    val = a.val*b.val
    lower = (a.val - a.err)*(b.val - b.err)
    upper = (a.val + a.err)*(b.val + b.err)
    err = maximum([abs(val-lower), abs(val-upper)])
    return(Measurement(val, err))
end


function Base.:^(a::Measurement, k::Int)
    if k != 2
        error("not implemented")
    else
        value = a.value^2
        lower = (a.value - a.error)*(a.value - a.error)
        upper = (a.value + a.error)*(a.value + a.error)
        error = maximum([abs(value-lower), abs(value-upper)])
        return(Measurement(value, error))
    end
end


m1^2

squared_error(y, predict(x, 1000, 300))
