```@setup dispatch
using InteractiveUtils

abstract type Pokemon end
abstract type Normal <: Pokemon end
abstract type Flying <: Pokemon end
abstract type Electric <: Pokemon end

struct Pikachu <: Electric
    nickname
    attack
    defense
    speed
    hp
end

struct Crobat <: Flying
    nickname
    attack
    defense
    speed
    hp
end

my_pikachu = Pikachu("Pika", 135, 80, 110, 132)
my_crobat = Crobat("Xwing", 105, 100, 210, 112)
```

# Multiple Dispatch

We will now approach the central topic of this workshop: multiple dispatch.
In Julia, functions can behave quite differently, depending on the type of their arguments.
For example, let's take a look at the multiplication function `*`:

```@example dispatch
a = 1.0
b = 1.0
a * b
```
```@example dispatch
a = "Hello "
b = "World"
a * b
```
```@example dispatch
a = rand(5, 5)
b = rand(5, 5)
a * b
```
If we multiply two numbers together, we will get their product, if we multiply two strings together, they are concatenated, and if we multiply two arrays, we get a matrix product.
So functions are able to specialise on the type of the input arguments.
Every such specialisation is called a method of that function.
We can for example take a look at all the methods for `*`:

```@example dispatch
methods(*)
nothing # hide
```
```
# 372 methods for generic function "*":
[1] *(x::T, y::T) where T<:Union{Int128, UInt128} in Base at int.jl:976
[2] *(x::T, y::T) where T<:Union{Int128, Int16, Int32, Int64, Int8, UInt128, UInt16, UInt32, UInt64, UInt8} in Base at int.jl:88
[3] *(x::T, y::T) where T<:Union{Float16, Float32, Float64} in Base at float.jl:385
[4] *(s1::Union{AbstractChar, AbstractString}, ss::Union{AbstractChar, AbstractString}...) in Base at strings/basic.jl:260
[5] *(d::Union{AbstractChar, AbstractString}, x::Missing) in Base at missing.jl:183
[6] *(c::Union{UInt16, UInt32, UInt64, UInt8}, x::BigInt) in Base.GMP at gmp.jl:542
[7] *(c::Union{Int16, Int32, Int64, Int8}, x::BigInt) in Base.GMP at gmp.jl:544
[8] *(c::Union{UInt16, UInt32, UInt64, UInt8}, x::BigFloat) in Base.MPFR at mpfr.jl:398
[9] *(c::Union{Int16, Int32, Int64, Int8}, x::BigFloat) in Base.MPFR at mpfr.jl:406
[10] *(c::Union{Float16, Float32, Float64}, x::BigFloat) in Base.MPFR at mpfr.jl:414
[11] *(A::StridedMatrix{T}, x::StridedVector{S}) where {T<:Union{Float32, Float64, ComplexF32, ComplexF64}, S<:Real} in LinearAlgebra at /usr/share/julia/stdlib/v1.8/LinearAlgebra/src/matmul.jl:49
```

We see there are quite a number of methods/specialisations available for the `*` function.
To see the particular method that is used for a given combination of arguments, we call
```@example dispatch
@which a*b
nothing #hide
```
```
*(A::Union{LinearAlgebra.Adjoint{var"#s886", <:StridedMatrix{T} where T}, LinearAlgebra.Transpose{var"#s886", <:StridedMatrix{T} where T}, StridedMatrix{var"#s886"}} where var"#s886"<:Union{Float32, Float64}, B::Union{LinearAlgebra.Adjoint{var"#s885", <:StridedMatrix{T} where T}, LinearAlgebra.Transpose{var"#s885", <:StridedMatrix{T} where T}, StridedMatrix{var"#s885"}} where var"#s885"<:Union{Float32, Float64}) in LinearAlgebra at /usr/share/julia/stdlib/v1.8/LinearAlgebra/src/matmul.jl:146
```
and for some methods, we are even able to Strg/Cmd + Left-Click on the link to directly take us to the method definition.
So every time a function is called, Julia is able to automatically "look up" and use the correct method for the given types of arguments.
This is called *multiple dispatch*.

The crucial part is that methods don't have to be defined together with the function, but instead we can add methods to existing functions.
To add a method to a function from another module, we first import the function:
```@example dispatch
import Base: *
```
and add a new method just like we would define a function
```julia
function *(a::SomeType, b::AnotherType)
    ...
end

*(a::SomeType, b::AnotherType) = ...
```
but we specify on which input-type combination the method should be called (in the above pseudo-code, the method would be called every time we multiply two variables `a` and `b`, where `a` is of type `SomeType` and `b` of type `AnotherType`).

Let's practise this a bit. We return to our Pokemon example: suppose we would like to let Pokemon fight against each other.
As you maybe know, depending on the type of Pokemon (e.g., `Normal`, `Fire`, `Flight`, etc.), the attacks vary in their effectiveness.
So let's define a function `effectiveness` that computes this for us. We will first define the generic fallback definition that is used every time there is no special interaction between the types of Pokemon fighting:

```@example dispatch
effectiveness(attacker::Pokemon, defender::Pokemon) = 1.0
```

Calling this function on our previously defined Pokemon, we get
```@example dispatch
effectiveness(my_pikachu, my_crobat)
```

However, the rules of Pokemon tell us that we should have the following interactions between the types we defined:

| ↓att/def→| Electric | Flying | Normal |
|----------|-----------|-------|--------|
| Electric |    0.5    |    2  |     1  |
| Flying   |    0.5    |    1  |    1   |
| Normal   |     1     |   1   |    1   |

!!! compat "Exercise"
    Define the missing methods for the `effectiveness` function according to the table.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    effectiveness(attacker::Electric, defender::Electric) = 0.5
    effectiveness(attacker::Electric, defender::Flying) = 2.0
    effectiveness(attacker::Flying, defender::Electric) = 0.5

    effectiveness(my_pikachu, my_crobat)
    ```
```@example dispatch
    effectiveness(attacker::Electric, defender::Electric) = 0.5 #hide
    effectiveness(attacker::Electric, defender::Flying) = 2.0 #hide
    effectiveness(attacker::Flying, defender::Electric) = 0.5 #hide

    effectiveness(my_pikachu, my_crobat) #hide
```
```@raw html
</details>
```
\
We only have to define 3 methods, because for all other cases, our generic fallback works correctly.
We also see that our function now correctly works for our Pikachu and Crobat, so we successfully altered the functions behaviour to work on our types correctly.
