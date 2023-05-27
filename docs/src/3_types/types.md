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

![Type hiearchy](https://upload.wikimedia.org/wikipedia/commons/d/d9/Julia-number-type-hierarchy.svg)
*By Cormullion - Own work, CC BY-SA 4.0, [https://commons.wikimedia.org/w/index.php?curid=83858572](https://commons.wikimedia.org/w/index.php?curid=83858572)*

In julia, we can easily define new abstract types:

```@example types
abstract type MySpecialNumber <: Number end
```

defines a new abstract type `MySpecialNumber` that is a subtype of `Number`.

## Composite types
The most import kind of type we will encounter during this workshop is called a "composite type".
Composite types are also called "structs" and they allow us to create very useful objects. 
For example, suppose we are writing a video game for the well-known Pokemon series [^1], 
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
We now have an abstract type `Pokemon` with subtypes `Normal`, `Flying` and `Electric`,
and a composite type `Pikachu` which is a subtype of `Electric`.
The composite type `Pikachu` has the "fields" `nickname`, `attack`, `defense`, `speed` and `hp`, where we can store the respective values.
    
We are now able to create our very own `Pikachu` to fight in our team:

```@example types
my_pikachu = Pikachu("Pika", 135, 80, 110, 132)
```

which creates a variable `my_pikachu` of type `Pikachu`.

We can retrieve the values stored in the fields as
```@example types
my_pikachu.defense
```

One thing to notice is that types cannot be re-defined in a running julia session.
For example, trying to re-define the `Pikachu` type will result in an error:

```julia
struct Pikachu <: Electric
    nickname
    attack
end
```

```
ERROR: invalid redefinition of constant Pikachu
```

In Julia, once a type is defined, it is locked in place due to the language's "just-in-time" compilation process. This feature enhances performance during normal use, but it can be a little cumbersome during a workshop where you are programming interactively.
For example, you might want to try things out, or you made an error while defining a type.
Unfortunately, correcting your error makes it necessary to restart Julia.
Luckily, you did learn how to do that at the beginning of the workshop – remember that you can use the VSCode command palette.

!!! compat "Exercise"
    Create a new composite type for a pokemon of your choice of type `Flying`, create an instance of that pokemon, and retrieve it's nickname.

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
    my_crobat.nickname
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
my_crobat.nickname
```
```@raw html
</details>
``` 

## Constructors

Let's talk about how we create new objects. In the example above, we called the type (`Pikachu`, `Crobat`) with the values we want to store in the respective fields (`Pikachu("Pika", 135, 80, 110, 132)`) to create a new instance of that pokemon.
However, we may like to have more convenience or safety.
For this purpose, we have Constructors: functions that create new objects.

### Outer Constructors
Outer constructors are mainly for conveniece reasons, and we define them just like functions.
For example, we may want to have the option of not giving a new Pokemon a nickname:

```@example types
import Random: randstring
Pikachu(attack, defense, speed, hp) = Pikachu(randstring(10), attack, defense, speed, hp)
```

So if I want to be lazy and not come up with a nickname, i just sample a random one:

```@example types
my_lazy_pikachu = Pikachu(132, 34, 23, 343)
```

### Inner Constructors
Inner constructors can be used for enforcing that newly created objects obey certain rules.
For example, the way we defined our `Pikachu` type, there was nothing to tell julia which kind of objects we actually can store in the fields.
This allows us to do something like this:

```@example types
weird_pikachu = Pikachu(132, 34, 23, -12)
```

Of course, this is not a valid Pokemon, as the maximum health points can't be negative.
To fix this, we use an inner constructor. This is just another function, but defined inside the type definition.
Suppose we define another type of Pokemon like this:

```@example types
struct Pichu <: Electric
    nickname
    attack
    defense
    speed
    hp
    function Pichu(nickname, attack, defense, speed, hp)
        if (attack < 0) | (defense < 0) | (speed < 0) | (hp < 0)
            error("Your Pokemon's stats are outside the valide range")
        else
            return new(nickname, attack, defense, speed, hp)
        end
    end
end
```

So we add a function to the type definition that has the same name as the type.
This function checks whether the inputs are valid and throws an error if not.
If they are valid, it uses the special `new` function (which is only available inside type definitions) to create a new (hopefully valid) object.

Let's check if it works:

```@example types
try  #hide
weird_pichu = Pichu("Pika_2.0", 132, 34, 23, -12)
catch err; showerror(stderr, err); end  #hide
```

[^1]: Inspired by https://gdalle.github.io/JuliaComputationSolutions/hw1a_solutions.html