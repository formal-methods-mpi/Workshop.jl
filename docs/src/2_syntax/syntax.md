# First step

Ah, excellent! You're all set up and ready to explore. Let's get started!

We will be working through a few examples to get you started. Because the Julia documentation already is very detailed about the language, we'll be focusing on the most important parts of the language. If you want to get a more complete overview of the language language or you have specific questions, we recommend you to read the [Julia documentation](https://docs.julialang.org/en/v1/).
While doing the workshop you should ask us of course!

First we need to get acuainted with julias number types, variables, logical operators and functions. Because we thing it is boring if we just list all the operators and functions, we will use them in some examples. So let's get started

# Assignment + function definition + vectors + matrices + indices + control flow (for / if) + broadcasting

# broadcast square over array

```julia
x = 1
```

```julia
#unicode
```

#hello world

```julia
3 == 3.0     # true (integer and float comparison)
3 != 3.0     # false (integer and float comparison)
"hello" == "hello"   # true (string comparison)
"hello" != "world"   # true (string comparison)

4//5 < 0.75  # false (rational and float comparison)
4//5 > 0.75  # true  (rational and float comparison)
"apple" < "banana"   # true (string comparison based on lexicographic order)
"apple" > "banana"   # false (string comparison based on lexicographic order)

1//2 <= 0.5  # true (rational and float comparison)
1//2 >= 0.5  # true (rational and float comparison)
"hello" <= "world"   # true (string comparison based on lexicographic order)
"hello" >= "world"   # false (string comparison based on lexicographic order)

!true  # false (not operator)

(3 == 3.0) && ("apple" < "banana")  # true (and operator)
(3 != 3.0) || (4//5 < 0.75)         # false (or operator)

(1//2 <= 0.5) && ("hello" >= "world")   # false (and operator with mixed types)
(1//2 >= 0.5) || ("hello" <= "world")   # true (or operator with mixed types)

!("hello" == "world")               # true (not operator with string comparison)
```

- `==`: Equality operator, checks whether two values are equal.
- `!=` or `≠`: Inequality operator, checks whether two values are not equal.
- `<`: Less than operator, checks whether the left value is less than the right value.
- `>`: Greater than operator, checks whether the left value is greater than the right value.
- `<=` or `≤`: Less than or equal to operator, checks whether the left value is less than or equal to the right value.
- `>=` or `≥`: Greater than or equal to operator, checks whether the left value is greater than or equal to the right value.
- `!`: NOT operator, inverts the value of a boolean.
- `&&`: AND operator, returns true if both values are true.
- `||`: OR operator, returns true if at least one of the values is true.

You might be thinking, but how do I write that ≠ sign in Julia. \ne<tab> will give you the ≠ sign. You can also use \le<tab> for ≤ and \ge<tab> for ≥.

You can use these also for variables by writing \delta<tab> for δ and \alpha<tab> for α.

```julia
δ = 2 - 1.3
α = 3 * 4
```

You can already see that Julia easily handles different types of numbers. You can check their type with the `typeof` function.

```julia
typeof(δ)  # Float64
typeof(α)  # Int64
```

Creating functions in Julia is a straightforward process.
To define a function, you can use the function keyword, followed by the function name, and enclose the function body in a block using the end keyword. By default, functions in Julia return the value of the last expression, which eliminates the need for an explicit return statement. However, it is a recommended practice to include a return statement to make it easier to understand what the function is returning. To evaluate an expression and include its result in a string, you can use the $ symbol within the string for interpolation.

```julia
function greet(name)
    greeting = "Hello, $(name)!"
    return greeting
end
```

```julia
greet("Julia Explorer")  # Output: Hello, Julia Explorer!
```

If we have a short function like this, we can also define it in a single line:

```julia
greet(name) = "Hello, $(name)!"
```

To better understand interpolation, let's consider another example. If we're interpolating a single variable, we don't need to use braces. But why did we do that in the previous example? Including braces helps Julia identify and resolve the variable more easily. Without braces, Julia would've produced an error stating that it can't find the variable `name!` and we would have had to add an additional whitespace. Additionally, braces are necessary when interpolating more complicated expressions, as in the next example:

```julia
x = 1`
y = 2//3
string_output = "The sum of $x and $y is $(x + y)."
```

Awesome! Now lets look at control flow statements, such as if, for, while, and break and combine them with what we've learned so far:

```julia
function check_x(x)
    if x < 5
        println("x is less than 5")
    elseif x > 5
        println("x is greater than 5")
    else
        println("x is equal to 5")
    end
end
```

```julia
check_x(10) # Output: x is greater than 5
check_x(4//7)
```

naming, snakecase vs camelcase

You can see that Julia easily works with different types of numbers, even though you dont have to worry about them.

However, Julia will throw an error if we pass a complex number:

```julia
check_x(4+3im)
```

# explain sequences

```julia
function print_numbers(start, stop)
    for i in start:stop
        println(i)
    end
end
```

```julia
function print_numbers(x)
    while x < 10
        println(x)
        x += 1
    end
end
```

```julia
function print_numbers()
    for i in 1:10
        if i == 5
            break
        end
        println(i)
    end
end
```

# Resources

[Julia Docs - Integers and Floating-Point Numbers](https://docs.julialang.org/en/v1/manual/complex-and-rational-numbers/)
[Julia Docs - Rational and Complex Numbers](https://docs.julialang.org/en/v1/manual/complex-and-rational-numbers/)
[Julia Docs - Mathematical Operations](https://docs.julialang.org/en/v1/manual/mathematical-operations/)
[Julia Docs - Strings](https://docs.julialang.org/en/v1/manual/strings/)