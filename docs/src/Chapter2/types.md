```@setup types
using InteractiveUtils
```

# Types

## Introduction

In julia, every variable has a type. 
We can use the function `typeof` (just like in R) to tell us the type of a variable.
For example:

```@example types
a = 1.0
typeof(a)
```
```@example types
b = "Hello!"
typeof(b)
```
```@example types
c = rand(10)
typeof(c)
```

We see that, for example, the type of double-precision floating point numers is called `Float64` in julia.

## Abstract Types

However, in addition to the types a variable can have, there are so-called "abstract types".
Abstract types "bundle" concrete types together, and form a "type hierarchy".
Let's have a look:
```@example types
typeof(a)
```
```@example types
supertype(Float64)
```
```@example types
subtypes(AbstractFloat)
```

The function `supertype` allows us to inspect the next higher abstract type in the type hierarchy.
In this case, this type is called `AbstractFloat`
Caling `subtypes` on `AbstractFloat`, we see that `Float64` is "bundled" together with some other types,
for example single precision floating point numbers (`Float32`).
If we would explore this type hierarchy further, we could see something like:

!!! danger "Insert picture of type hierarchy"
    https://en.wikibooks.org/wiki/Introducing_Julia/Types#/media/File:Julia-number-type-hierarchy.svg

In julia, we can easily define new abstract types:

```@example types
abstract type MySpecialNumber <: Number end
```

defines a new abstract type `MySpecialNumber` that is a subtype of `Number`.

## Composite types
The most import kind of type we will encounter during this workshop is called a "composite type".
Composite types are also called "structs" and they allow us to create very useful objects. 
For example, suppose we are writing a video game for the well-known Pokemon series, 
we could define some abstract types
```@example types
abstract type Pokemon end
abstract type Normal <: Pokemon end
abstract type Flying <: Pokemon end
abstract type Electric <: Pokemon end
```
and then a composite type
```@example types
struct Pikachu <: Electric
    nickname
    attack
    defense
    speed
    hp
end
```
We now have an abstract type `Pokemon` with subtypes `Normal`, `Fire`, `Flying` and `Electric`,
and a composite type `Pikachu` which is a subtype of `Electric`.
We are now able to create our very own `Pikachu` to fight in our team:

```@example types
my_pikachu = Pikachu("Pika", 135, 80, 110, 132)
typeof(my_pikachu)
```

which creates a variable `my_pikachu` of type `Pikachu`.

!!! compat "Exercise"
    Create a new composite type for a pokemon of your choice of type `Flying`, and create an instance of that pokemon.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    struct Crobat <: Flying
        nickname
        attack
        defense
        speed
        hp
    end

    my_crobat = Crobat("Xwing", 105, 100, 210, 112)
    ```
```@setup types
struct Crobat <: Flying
    nickname
    attack
    defense
    speed
    hp
end

my_crobat = Crobat("Xwing", 105, 100, 210, 112)
```
```@raw html
</details>
```

!!! danger "Insert footnote for source of pokemon example"
    https://gdalle.github.io/JuliaComputationSolutions/hw1a_solutions.html

## Constructors

