############################################################################################
# algorithmn

# dummy encoding: variables 
# pet: cat, dog
# color: blue, green
# age group: <18, >=18

["dog", "green", "<18"]

[1 1 1]


############################################################################################
# type
struct OneHotVector{T<:Int} <: AbstractVector{Bool}
    len::T
    ind::T
    function OneHotVector(len::T, ind::T) where {T}
        return ind > len ? error("out of bounds") : new{T}(len, ind)
    end
end

import Base: size, getindex, *

size(x::OneHotVector) = (x.len,)
getindex(x::OneHotVector, i::Int) = i == x.ind

OneHotVector(20, 10)

############################################################################################
# multiple dispatch

### Elementary arithmetic operations:

m1 = OneHotVector(20, 10)
m2 = OneHotVector(14, 3)

*(A::AbstractMatrix, x::OneHotVector) = A[:, x.ind]

A = rand(3, 14)

A*m2