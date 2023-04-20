############################################################################################
# algorithmn

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