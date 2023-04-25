# Foundations

Welcome to the next chapter! We hope that you made it through the setup part without too many headaches.
Please don't hesitate to ask us any questions or provide feedback on what you liked and didn't like or thought was too easy or too hard.
Your input is always welcome and appreciated!

We are now ready to dive into the foundations of the Julia language.

## Variable assignment

In Julia, variables are used to store data and represent values in your program.
Variables have a name and are assigned a value using the assignment operator `=`.
Julia supports both regular (ASCII) variable names (like `alpha`) and Unicode variable names (like `α`).

Regular variables are named using alphanumeric characters and underscores, starting with a letter or underscore.

```@example variables
x = 1
my_variable = "awesome"
```

Unicode variables allow you to use a wider range of characters, including mathematical symbols, Greek letters, and other special characters.
To create a Unicode variable, type a backslash followed by the Unicode character name, and then press the Tab key to convert it into the corresponding Unicode symbol.
For example, type \alpha and then press Tab to create the α variable.

```@example variables
α = 0.05
β₁ = 1.2
Δt = 0.01
```

!!! compat "Exercise"
    1. Assign the integer value 42 to a variable named the_answer_to_life.
    2. Assign the string "Julia is fun!" to a variable named yay.
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

## Functions

Excellent! Now that you have an understanding of variables and the use of unicode symbols, let's dive into the topic of functions.

In programming, functions are reusable blocks of code that serve a specific purpose. They play a crucial role in organizing and modularizing code, which in turn enhances its readability and maintainability. For instance, if you've written a chunk of code that performs a specific task or multiple tasks, it would be beneficial to break down the code into individual functions and give each a descriptive name. This approach makes your code more comprehensible and easier to work with. Functions also enable code reuse, minimizing redundancy and simplifying updates, which can save time and effort in the long run.

The basic syntax for defining a function in Julia is as follows:

```julia
function function_name(argument1, argument2)
    # function body
    return output
end
```

The `return` keyword plays a vital role in specifying the value that a `function` should output. When no return statement is explicitly provided, the function will return the value of the last expression evaluated in the function body.

However, it is generally good practice to include a `return` statement when defining functions using the `function` keyword, even if the function returns `nothing`.
This approach helps to eliminate ambiguity and ensures that the function's expected output is clear to anyone who reads it.

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
square(x) = x * x
```

### Exercises



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

## Vectors

In Julia, vectors are a fundamental data structure used to store and manipulate collections of values. A vector is a one-dimensional array that can store elements. Vectors are useful for representing and processing sequences of data, such as time series, feature vectors, or lists of names.

To create a vector in Julia, you can use square brackets `[]` and separate the elements by commas. For example, to create a vector of integers, you can write:

```@example variables
integer_vector = [1, 2, 3, 4, 5]
```

You can access elements of a vector by specifying the index in square brackets. Note that Julia uses 1-based indexing, which means the first element has an index of 1:

```@example variables
first_element = integer_vector[1]
```

You can also assign a new value to an element of a vector by specifying the index in square brackets and using the assignment operator:

```@example variables
integer_vector[1] = 10
integer_vector
```

To add a new element to the end of a vector, you can use the `push!` function:

```@example variables
push!(integer_vector, 6)
```

Notice the exclamation mark at the end of the function name. This is a convention in Julia that indicates that the function mutates its arguments.
This means that the function modifies the original data passed as an argument instead of creating a new copy of the data.

This will already help you to predict the behavior of the `pop!` function:

```@example variables
last_element = pop!(integer_vector)
```

Lets create two vectors and see what we can do with them:

```@example variables
vector1 = [1, 2, 3]
vector2 = [4, 5, 6]
```

When you use standard arithmetic operators (+, -) on vectors, Julia performs element-wise operations.

```@example variables
added_vectors = vector1 + vector2
subtracted_vectors = vector1 - vector2
```

Scalar multiplication and division using the standard arithmetic operators (*, /):

```@example variables
multiplied_vector = 2 * vector1
divided_vector = vector1 / 2
```

Vectors can be concetenated with the `vcat` function or the `;` operator:

```@example variables
concatenated_vector = vcat(vector1, vector2)
concatenated_vector = [vector1; vector2]
```

However, when we want to multiply two vectors like this:

```@example variables
try  #hide
multiplied_vectors = vector1 * vector2
catch err; showerror(stderr, err); end  #hide
```

We get a `MethodError` because the `*` operator is not defined for `Vector`s.

Now, it depends on what we mean when we want to multiply two vectors.
If we want to perform an element-wise multiplication, we need to use the broadcast `.` operator:

```@example variables
vector1 .* vector2
```

However, maybe you want to perform the dot product, that is related to matrix multiplication.
It is also known as the scalar product, because it always returns a single number, i.e., a scalar.
We can do this with the `dot` function or the `⋅` operator from the `LinearAlgebra` package:

```@example variables
using LinearAlgebra
dot_product = dot(vector1, vector2)
dot_product = vector1 ⋅ vector2
```
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

## Exercises

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
\