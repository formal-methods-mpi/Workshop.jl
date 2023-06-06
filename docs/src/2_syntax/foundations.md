# Syntax cheat sheet

Welcome to the next chapter! We hope that you made it through the setup part without too many headaches.
Please don't hesitate to ask us any questions or provide feedback on what you liked and didn't like or thought was too easy or too hard.
Your input is always welcome and appreciated!

In the following, you will find a quick cheat sheet covering the basic Julia syntax.
You will see that Julia's syntax is similar to `Matlab`, `Python`, and `R` (in this order).
We recommend that you quickly **skim** this cheat sheet and do the exercises at the and of this chapter.
You might want to keep this page open in another tab to have it as a reference at your disposal.
There is a collection of side-by-side comparisons of Julia and R, Python or Matlab in the Additional Resources section of the Additional Materials chapter.
Because these are more comprehensive, you should not need them during the workshop.

## Variable assignment

In Julia, variables are used to store data and represent values in your program.
Variables have a name and are assigned a value using the assignment operator `=`.
Julia supports both regular (ASCII) variable names (like `alpha`) and Unicode variable names (like `α`).

```@example variables
my_variable = "awesome"
α = 1
nothing #hide
```

To create a Unicode variable, type a backslash followed by the Unicode character name, and then press the Tab key to convert it into the corresponding Unicode symbol.
For example, type `\alpha` and then press `<tab>` to create the `α` variable.
If you are interested you can find a [table of all available unicode characters](https://docs.julialang.org/en/v1/manual/unicode-input/) and how to type them out in the Julia documentation.

## Functions

Excellent! Now that you have an understanding of variables and the use of unicode symbols, let's dive into the topic of functions.

The basic syntax for defining a function in Julia is as follows:

```julia
function function_name(argument1, argument2)
    # function body
    return output
end
```


For example:

```@example variables
function add(x, y)
    return x + y
end
```

You can also define functions as:

```julia
function_name(argument1, argument2) = #function body
```

For example:

```@example variables
function square(x)
    return x*x
end
# or
square(x) = x * x
nothing #hide
```

## Vectors

```@example variables
first_vector = [1, 2, 3]
nothing #hide
```

Julia uses 1-based indexing, which means the first element has an index of 1:

```@example variables
first_element = first_vector[1]
nothing #hide
```

You can also assign a new value to an element of a vector via indexing:

```@example variables
first_vector[1] = 10
nothing #hide
```

## Operations on Vectors

```@example variables
second_vector = [4, 5, 6]
nothing #hide
```


```@example variables
subtracted_vectors = first_vector - second_vector
```


Vectors can be concetenated with the `vcat` function or the `;` operator:

```@example variables
concatenated_vector = vcat(first_vector, second_vector)
concatenated_vector = [first_vector; second_vector]
```

## Broadcasting

All functions can be applied element-wise to a collection (vector/matrix) by using the broadcast `.` operator.
For example, we can take the element-wise square root of a vector:

```@example variables
sqrt.(first_vector)
```

Or we mutliply two vectors element-wise:

```@example variables
first_vector .* second_vector
```
Note that infix operators (i.e., `+`, `*`, `=`, and many more) place the dote *before the operator (i.e., `.+`, `.*`, `.=`)

## Sequences

Create a range of integers from 1 to 10:

```@example variables
integer_sequence = 1:10
```

Create a range with a specific step size:

```@example variables
even_sequence = 2:2:10
```


## Matrices

Create a square matrix of integers:

```@example variables
my_matrix = [1 2 3; 4 5 6]
# or alternatively:
my_matrix = 
    [1 2 3
    4 5 6]
```

As you can see, you can put rows in the matrix on different rows of your script, or separate them by semicolons `;`.

You can access elements of a matrix by specifying the row and column indices in square brackets, separated by a comma.

```@example variables
upper_left_element = my_matrix[1, 1]
lower_right_element = my_matrix[2, 3]
nothing #hide
```

## Control Flow

### For Loops

```julia
for variable in collection
    # Code to be executed for each value in the collection
end
```

For example:

```@example variables
for i in 1:5
    println(i^2)
end
```

### Conditional evaluation

```julia
if condition
    # Code to be executed if the condition is true
end
```

You can also use `elseif` and `else` to test multiple conditions:

```julia
if condition1
    # Code to be executed if condition1 is true
elseif condition2
    # Code to be executed if condition1 is false and condition2 is true
else
    # Code to be executed if both condition1 and condition2 are false
end
```

For example, to check if a number is positive, negative, or zero:

```@example variables
number = -3

if number > 0
    println("The number is positive")
elseif number < 0
    println("The number is negative")
else
    println("The number is zero")
end
```

## Packages
The section [Package mode](@ref) explained how to install packages.
To use an installed package called `Example` in the current session:

```@example variables
using Example
```
This makes all functions from the `Example` package available, for example the function `hello`:

```@example variables
hello("world")
```

(As you can see, this is very similar to `library(Example)` in R or `import Example` in Python)

# Tasks

!!! compat "Exercise"
    Write a function that takes two arguments and divides them.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    function divide(a, b)
        return a/b
    end
    # or
    divide(a, b) = a/b
    ```
```@setup variables
function divide(a, b)
    return a/b
end
# or
divide(a, b) = a/b
```
```@raw html
</details>
```
\

!!! compat "Exercises"
    Create a vector of numbers and perform an element-wise square.
    *Hint*: In julia, a variable `x` can be squared with `x^2`.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    a = [1 2 3]
    a .^ 2
    # or
    a .* a
    ```
```@setup variables
a = [1 2 3]
a .^ 2
a .* a
```
```@raw html
</details>
```
