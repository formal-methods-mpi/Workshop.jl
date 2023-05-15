# Syntax cheat sheet

Welcome to the next chapter! We hope that you made it through the setup part without too many headaches.
Please don't hesitate to ask us any questions or provide feedback on what you liked and didn't like or thought was too easy or too hard.
Your input is always welcome and appreciated!

In the following, you will find a quick sheet cheat covering the basic julia syntax.
Since we assume you are elrady familiar with R, python or MATLAB, you will see that the julia syntax is quite similar.
We therefore recommend you quickly skim this cheat sheet and do the exercises at the and of this chapter. 
Then you may want to open this page in a new tab, so you can refer to it during the next chapters.

## Variable assignment

```@example variables
x = 1
my_variable = "awesome"
nothing #hide
```

Julia also supports Unicode variable names (like `α`).
They allow you to use a wider range of characters, including mathematical symbols, Greek letters, and other special characters.
To create a Unicode variable, type a backslash followed by the Unicode character name, and then press the Tab key to convert it into the corresponding Unicode symbol.
For example, type `\alpha` and then press `<tab>` to create the `α` variable.

```@example variables
α = 0.05
β₁ = 1.2
Δt = 0.01
nothing #hide
```

To find out how a certain unicode character can be created, you can use the help mode of the REPL:
```
help?> β₁
```

```
"β₁" can be typed by \beta<tab>\_1<tab>
```

## Functions

```julia
function function_name(argument1, argument2)
    # function body
    return output
end
```

You can also define functions as:

```julia
function_name(argument1, argument2) = #function body
```

For example:

```@example variables
square(x) = x * x
nothing #hide
```

## Vectors

```@example variables
first_vector = [1, 2, 3]
nothing #hide
```

You can access elements of a vector by specifying the index in square brackets. Note that Julia uses 1-based indexing, which means the first element has an index of 1:

```@example variables
first_element = first_vector[1]
nothing #hide
```

You can also assign a new value to an element of a vector by specifying the index in square brackets and using the assignment operator:

```@example variables
first_vector[1] = 10
nothing #hide
```

## Operations on Vectors

```@example variables
second_vector = [4, 5, 6]
nothing #hide
```

When you use standard arithmetic operators (`+`, `-`) on vectors, Julia performs element-wise operations.

```@example variables
subtracted_vectors = first_vector - second_vector
```

Scalar multiplication and division using the standard arithmetic operators (`*`, `/`):

```@example variables
multiplied_vector = 2 * first_vector
```

Vectors can be concetenated with the `vcat` function or the `;` operator:

```@example variables
concatenated_vector = vcat(first_vector, second_vector)
concatenated_vector = [first_vector; second_vector]
```

## Broadcasting

All functions can be applied element-wise to a collection (vector/matrix) by using the broadcast `.` operator.
For example, we can take the elemt-wise square root of a vector:

```@example variables
sqrt.(first_vector)
```

Or we mutliply two vectors element-wise:
```@example variables
first_vector .* second_vector
```

## Sequences

Another important concept before we move on is the concept of sequences in Julia.

In programming, sequences are ordered collections of elements, typically used to represent a series of values or data points. Sequences are essential in various applications, such as iterating through data, generating series of numbers, and organizing data in specific orders.

In Julia, sequences can be created using ranges. They represent a series of evenly spaced values and can be created using the colon operator `:` or the `range` function.

For example, you can create a range of integers from 1 to 10:

```@example variables
integer_sequence = 1:10
```

To create a range with a specific step size, you can use the following syntax:

```@example variables
even_sequence = 2:2:10
```

To convert a sequence to a vector, you can use the collect function:

```@example variables
integer_vector = collect(integer_sequence)
```

!!! compat "Exercises"
    1. Create a vector of numbers and perform an element-wise square.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    a = [1 2 3]
    a .^ 2
    ```
```@setup variables
a = [1 2 3]
a .^ 2
```
```@raw html
</details>
```
\

# Matrices

Matrices are a data structure used to store and manipulate two-dimensional arrays of values. A matrix is a rectangular grid of elements, organized into rows and columns, where each element can be accessed by its row and column indices.

To create a `Matrix` in Julia, you can use square brackets `[]` and separate the elements within each row by spaces or commas, and separate the rows by semicolons `;`.
For example, to create a square matrix of integers, you would write:

```@example variables
square_matrix = [1 2 3; 4 5 6; 7 8 9]
```

You can access elements of a matrix by specifying the row and column indices in square brackets, separated by a comma. Note that Julia uses 1-based indexing, which means the first row and column have an index of 1:

```@example variables
upper_left_element = square_matrix[1, 1]
lower_right_element = square_matrix[3, 3]
```

As you can see, things are very similar to vectors.

!!! compat "Exercises"
    1. Define two square matrices and add and subtract them to/from each other.
    2. Perform an element-wise multiplication of two matrices and then a matrix multiplication.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    a = [1 2; 3 4]
    b = [π sin(1); -5 3]
    a + b
    a - b
    a .* b
    a * b
    ```
```@setup variables
a = [1 2; 3 4]
b = [π sin(1); -5 3]
a + b
a - b
a .* b
a * b
```
```@raw html
</details>
```

# Control Flow

## For Loops

For loops in Julia are used to iterate over a range of values or the elements of a collection, such as an array or a tuple. The syntax for a for loop is as follows:

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

## Conditional evaluation

If-else statements are used to execute a block of code only if a specific condition is met. The syntax for an `if` statement is as follows:

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

!!! compat "Exercise"
    1. Write a for loop that prints the first 10 even numbers.
    2. Create a 2x2 Matrix and print out the value of each index. Tip: use the `eachindex` function.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    for i in 2:2:20
        println(i)
    end

    a = [1 2; 3 4]

    for i in eachindex(a)
        println(a[i])
    end
    ```
```@setup variables
```
```@raw html
</details>
```


# Exercises

!!! compat "Exercise"
    3. Assign the value of 1 + √2 divided by 2 to the variable φ (phi). Remember to use the Unicode character: type \phi or \sqrt and press Tab to convert it.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    the_answer_to_life = 42
    yay = "Julia is fun!"
    ϕ = (1 + √2)/2
    ```
```@setup variables
the_answer_to_life = 42
yay = "Julia is fun!"
ϕ = (1 + sqrt(2))/2
```
```@raw html
</details>
```

!!! compat "Exercise"
    1. Write a function called divide that takes two arguments and returns the result of dividing the first argument by the second.

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