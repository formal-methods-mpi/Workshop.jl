# Extensive Foundations

Welcome back to the workshop! We hope that you had fun following along and that we sparked your interest for this fascinating programming language.
Please don't hesitate to ask us any questions or provide feedback on what you liked and didn't like or thought was too easy or too hard.
Your input is always welcome and appreciated!

Next, we will dive into the necessary foundations of the language.

## Variable assignment

In Julia, variables are used to store data and represent values in your program.
Variables have a name and are assigned a value using the assignment operator =.
Julia supports both regular (ASCII) variable names and Unicode variable names.

Regular variables are named using alphanumeric characters and underscores, starting with a letter or underscore.

```@example variables
x = 1
my_variable = "awesome"
φ = 1.618
```

Unicode variables allow you to use a wider range of characters, including mathematical symbols, Greek letters, and other special characters.
To create a Unicode variable, type a backslash followed by the Unicode character name, and then press the Tab key to convert it into the corresponding Unicode symbol.
For example, type \alpha and then press Tab to create the α variable.

```@example variables
α = 0.05
β₁ = 1.2
Δt = 0.01
```

### Exercises

1. Assign the integer value 42 to a variable named the_answer_to_life.
2. Assign the string "Julia is fun!" to a variable named yay.
3. Assign the value of 1 + √2 divided by 2 to the variable φ (phi). Remember to use the Unicode character: type \phi or \sqrt and press Tab to convert it.

```@raw html
<details>
<summary>Show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
        # 1. Assign the integer value 42 to a variable named the_answer_to_life.
        the_answer_to_life = 42

        # 2. Assign the string "Julia is fun!" to a variable named yay.
        yay = "Julia is fun!"

        # 3. Assign the value of 1 + √2 divided by 2 to the variable φ (phi).
        φ = (1 + sqrt(2)) / 2

        # Print out the variables.
        println("The answer to life: ", the_answer_to_life)
        println("Yay: ", yay)
        println("Phi: ", φ)
    ```
```@setup variables
# 1. Assign the integer value 42 to a variable named the_answer_to_life.
the_answer_to_life = 42

yay = "Julia is fun!"

φ = (1 + sqrt(2)) / 2

println("The answer to life: ", the_answer_to_life)
println("Yay: ", yay)
println("Phi: ", φ)
```
```@raw html
</details>
```

## Functions

Excellent! Now that you have a good understanding of variables and the expressive nature of Julia, let's dive into the topic of functions.

In programming, functions are reusable blocks of code that serve a specific purpose.
They play a crucial role in organizing and modularizing code, which in turn enhances its readability and maintainability.
For instance, if you've written a chunk of code that performs a specific task or multiple tasks, it would be beneficial to break down the code into individual functions and give each a descriptive name.
This approach makes your code more comprehensible and easier to work with.
Functions also enable code reuse, minimizing redundancy and simplifying updates, which can save time and effort in the long run.

The basic syntax for defining a function in Julia is as follows:

```julia
function function_name(arguments)
    # function body
    return output
end
```

The `return` keyword plays a vital role in specifying the value that a `function` should output.
When no return statement is explicitly provided, the function will return the value of the last expression evaluated in the function body.

However, it is generally good practice to include a `return` statement when defining functions using the `function` keyword, even if the function returns `nothing`.
This approach helps to eliminate ambiguity and ensures that the function's expected output is clear to anyone who reads it.

For example:

```@example variables
function add(x, y)
    return x + y
end
```

You can also write:

```julia
my_function(arguments) = "function body"
```

For example:

```@example variables
square(x) = x * x
```

### Exercises

1. Write a function called divide that takes two arguments and returns the result of dividing the first argument by the second.
2. Write a function called cube that takes one argument and returns the cube of the input number.
3. Write a function that checks if a number is even. The function should take one argument and return a `Bool`.

```@raw html
<details>
<summary>Show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    # 1. Write a function called divide that takes two arguments and returns the result of dividing the first argument by the second.
    function divide(a, b)
        return a / b
    end

    # 2. Write a function called cube that takes one argument and returns the cube of the input number.
    cube(x) = x ^ 3

    # 3. Write a function that checks if a number is even. The function should take one argument and return a `Bool`.
    function is_even(n)
        return n % 2 == 0
    end
    ```
```@setup variables
function divide(a, b)
    return a / b
end

cube(x) = x ^ 3

function is_even(n)
    return n % 2 == 0
end
```
```@raw html
</details>
```


## Vectors

In Julia, vectors are a fundamental data structure used to store and manipulate collections of values.
A vector is a one-dimensional array that can store elements of the same type (e.g., integers, floating-point numbers, or strings).
Vectors are useful for representing and processing sequences of data, such as time series, feature vectors, or lists of names.

To create a vector in Julia, you can use square brackets [] and separate the elements by commas. For example, to create a vector of integers, you would write:

```@example variables
integer_vector = [1, 2, 3, 4, 5]
```

You can access elements of a vector by specifying the index in square brackets.
Note that Julia uses 1-based indexing, which means the first element has an index of 1:

```@example variables
first_element = integer_vector[1]
```

You can also assign a new value to an element of a vector by specifying the index in square brackets and using the assignment operator:

```@example variables
integer_vector[1] = 10
```

However, you cannot assign a new value to an element of a vector if the vector is of a fixed size.
For example, if you try to assign a value to index 6 you will get an `BoundsError`.
To add a new element to a vector, you can use the `push!` function:

```@example variables
push!(integer_vector, 6)
```

Notice the exclamation mark at the end of the function name.
This is a convention in Julia that indicates that the function mutates its arguments.
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

Vectors can be concatenated with the `vcat` function or the `;` operator:

```@example variables
concatenated_vector = vcat(vector1, vector2)
concatenated_vector = [vector1; vector2]
```

However, when we want to multiply two vectors like this:

```julia
multiplied_vectors = vector1 * vector2
```

```
MethodError: no method matching *(::Vector{Int64}, ::Vector{Int64})
```

We get a `MethodError` because the `*` operator is not defined for `Vector`s.

Now, it depends on what we mean when we want to multiply two vectors.
If we want to perform an element-wise multiplication, we need to use the broadcast `.` operator:

```@example variables
vector = [1, 2, 3]
squared_vector = vector .* 2
```

However, maybe you want to perform the dot product, that is related to matrix multiplication.
It is also known as the scalar product, because it always returns a single number, i.e., a scalar.
We can do this with the `dot` function or the `⋅` operator from the LinearAlgebra package:

```@example variables
using LinearAlgebra
dot_product = dot(vector1, vector2)
dot_product = vector1 ⋅ vector2
```

Now, at last we can transpose a vector with the `transpose` function or the `'` operator:

```@example variables
transposed_vector = transpose(vector)
transposed_vector = vector'
```

Equipped with the transpose operator `'`, we can now multiply two vectors:

```@example variables
dot_product = vector1' * vector2
```

Arithmetically, this is the same as the dot product!

Another important concept before we move on is the concept of sequences in Julia.

In programming, sequences are ordered collections of elements, typically used to represent a series of values or data points. Sequences are essential in various applications, such as iterating through data, generating series of numbers, and organizing data in specific orders.

In Julia, sequences can be created using ranges and comprehensions. Ranges represent a series of evenly spaced values and can be created using the colon operator `:` or the `range` function.

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

## Arrays

Without going too much into the details, it is important to know about the concept of arrays in Julia.

Arrays are a fundamental data structure in Julia that can be used to represent and manipulate multi-dimensional collections of values.
Vectors and matrices are special cases of arrays, where vectors are one-dimensional arrays and matrices are two-dimensional arrays.
Arrays can have more than two dimensions, allowing you to work with higher-dimensional data structures in a consistent and efficient way.

The concept of arrays generalizes vectors and matrices by extending their properties and operations to multiple dimensions. This means that most of the functions and operations you have learned for vectors and matrices can be applied to arrays with higher dimensions as well.

### Exercises

1. Create a vector of strings and concatenate it with another vector of strings.
2. Create a vector and perform an element-wise square of it.
3. Calculate the scalar product of the vector in the way you like.
4. Read out an index, set an index, append an element, and pop an element from a vector.

```@raw html
<details>
<summary>Show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
        # 1. Create a vector of strings and concatenate it with another vector of strings.
        somestrings = ["this", "is", "a", "vector"]
        somemore = ["this", "is", "another", "vector"]
        vcat(somestrings, somemore)

        # 2. Create a vector and perform an element-wise square of it.
        avec = [1, 2, 3]
        avec .^2

        # 3. Calculate the scalar product of the vector in the way you like.
        42 * avec

        # 4. Read out an index, set an index, append an element, and pop an element from a vector.
        avec[1]

        avec[2] = 4
        avec

        push!(avec, 5)
        pop!(avec)
    ```
```@setup variables
somestrings = ["this", "is", "a", "vector"]
somemore = ["this", "is", "another", "vector"]
vcat(somestrings, somemore)

avec = [1, 2, 3]
avec .^2

42 * avec

avec[1]

avec[2] = 4
avec

push!(avec, 5)
pop!(avec)
```
```@raw html
</details>
```

# Matrices

In Julia, matrices are a fundamental data structure used to store and manipulate two-dimensional arrays of values.
A matrix is a rectangular grid of elements, organized into rows and columns, where each element can be accessed by its row and column indices.
Matrices are useful for representing and processing structured data, such as images, tables, or linear systems of equations.

To create a `Matrix` in Julia, you can use square brackets `[]` and separate the elements within each row by spaces or commas, and separate the rows by semicolons `;`.
For example, to create a square matrix of integers, you would write:

```@example variables
square_matrix = [1 2 3; 4 5 6; 7 8 9]
```

You can access elements of a matrix by specifying the row and column indices in square brackets, separated by a comma.
Note that Julia uses 1-based indexing, which means the first row and column have an index of 1:

```@example variables
upper_left_element = square_matrix[1, 1]
lower_right_element = square_matrix[3, 3]
```

As you can see, many things are the same as with vectors, which is not surprising, since vectors are just 1-dimensional matrices.

Lets define a 2x3 `Matrix` ...

```@example variables
non_square_matrix = [1 2 3; 4 5 6]
```

... and transpose it with the `transpose` function or the quote `'` operator:

```@example variables
transposed_matrix = transpose(non_square_matrix)
transposed_matrix = non_square_matrix'
```

Let's create two matrices and see what we can do with them:

```@example variables
matrix1 = [1 2; 3 4]
matrix2 = [5 6; 7 8]
```

We already know from the chapter about `Vector`s that we can use the vcat function or semicolon `;` for vertical concatenation:

```@example variables
vertically_concatenated_matrix = vcat(matrix1, matrix2)  # Returns [1 2; 3 4; 5 6; 7 8]
vertically_concatenated_matrix = [matrix1; matrix2]      # Also returns [1 2; 3 4; 5 6; 7 8]
```

Concatenate two matrices horizontally using the hcat function or space ` ` :

```@example variables
concatenated_matrix = hcat(matrix1, matrix2)
concatenated_matrix = [matrix1 matrix2]
```

## Exercises

1. Define two square matrices and add and subtract them with each other.
2. Perform an element-wise multiplication of two matrices and then a matrix multiplication.
3. Write a vector with spaces, e.g.,: [1 2 3]. Is that really a vector?
4. Find out what else you can do with matrices by writing `methodswith(Matrix)` in the REPL.
5. Look into the documentation of `?something` you are interested in, then try it out in the REPL.

```@raw html
<details>
<summary>Show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
        # 1. Define two square matrices and add and subtract them with each other.
        matrixA = [1 2; 3 4]
        matrixB = [5 6; 7 8]
        matrixAddition = matrixA + matrixB
        matrixSubtraction = matrixA - matrixB
        println("Matrix Addition: ")
        println(matrixAddition)
        println("Matrix Subtraction: ")
        println(matrixSubtraction)

        # 2. Perform an element-wise multiplication of two matrices and then a matrix multiplication.
        elementWiseMultiplication = matrixA .* matrixB
        matrixMultiplication = matrixA * matrixB
        println("Element-wise multiplication: ")
        println(elementWiseMultiplication)
        println("Matrix multiplication: ")
        println(matrixMultiplication)

        # 3. Write a vector with spaces, e.g.,: [1 2 3]. Is that really a vector?
        vec = [1 2 3]
        println("1D Matrix: ")
        println(vec)
        vec = [1, 2, 3]
        println("Vector: ")
        println(vec)

        # Note: For the 4th and 5th task, you'll have to use Julia's REPL (Read-Eval-Print Loop).
        # It's not possible to run these commands here.

        # 4. methodswith(Matrix) # Uncomment this line in the Julia REPL to get the methods for Matrix.

        # 5. ?rand # Uncomment this line in the Julia REPL to get the documentation for the rand function.

    ```
```@setup variables
matrixA = [1 2; 3 4]
matrixB = [5 6; 7 8]
matrixAddition = matrixA + matrixB
matrixSubtraction = matrixA - matrixB
println("Matrix Addition: ")
println(matrixAddition)
println("Matrix Subtraction: ")
println(matrixSubtraction)

elementWiseMultiplication = matrixA .* matrixB
matrixMultiplication = matrixA * matrixB
println("Element-wise multiplication: ")
println(elementWiseMultiplication)
println("Matrix multiplication: ")
println(matrixMultiplication)

vec = [1 2 3]
println("1D Matrix: ")
println(vec)
vec = [1, 2, 3]
println("Vector: ")
println(vec)
```
```@raw html
</details>
```

# Control Flow

Control flow refers to the order in which statements or instructions are executed in a program.
It is an essential concept in programming, as it allows you to create more dynamic and flexible code.
Two fundamental control flow structures are loops and conditional statements.
Loops allow you to repeat a block of code multiple times, while conditional statements enable you to execute a block of code only if certain conditions are met.

## For Loops

For loops in Julia are used to iterate over a range of values or the elements of a collection, such as an array or a tuple.
The syntax for a for loop is as follows:

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

If statements in Julia are used to execute a block of code only if a specific condition is met.
The syntax for an `if` statement is as follows:

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

Let's remember what we learned about functions!

```@example variables
function classify_sign(number)
    if number > 0
        println("The number is positive")
    elseif number < 0
        println("The number is negative")
    else
        println("The number is zero")
    end
end
```

Now we can use the function to classify any number we want:

```@example variables
classify_sign(3)
classify_sign(-3)
classify_sign(0)
```

## Exercises

1. Write a for loop that prints the first 10 even numbers.
2. Create a 2x2 Matrix and print out the value of each index. Tip: use the `length` function.
3. Write a nested loop with `i` and `j` and add each index if both are equal and prints the result.
4. Create a 3-dimension and 4-dimensional array and call `size` and `length` on them.

```@raw html
<details>
<summary>Show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
        # 1. Write a for loop that prints the first 10 even numbers.
        println("First 10 even numbers: ")
        for i in 1:10
            println(2 * i)
        end

        # 2. Create a 2x2 Matrix and print out the value of each index. Tip: use the `length` function.
        matrix = [1 2; 3 4]
        println("Values in the 2x2 matrix: ")
        for i in 1:length(matrix)
            println(matrix[i])
        end

        # 3. Write a nested loop with `i` and `j` and add each index if both are equal and prints the result.
        println("Results from nested loop: ")
        for i in 1:5
            for j in 1:5
                if i == j
                    println(i + j)
                end
            end
        end

        # 4. Create a 3-dimension and 4-dimensional array and call `size` and `length` on them.
        threeDArray = rand(3, 3, 3)
        fourDArray = rand(3, 3, 3, 3)
        println("Size and length of the 3D array: ")
        println(size(threeDArray))
        println(length(threeDArray))
        println("Size and length of the 4D array: ")
        println(size(fourDArray))
        println(length(fourDArray))
    ```
```@setup variables
println("First 10 even numbers: ")
for i in 1:10
    println(2 * i)
end

matrix = [1 2; 3 4]
println("Values in the 2x2 matrix: ")
for i in eachindex(matrix)
    println(matrix[i])
end

println("Results from nested loop: ")
for i in 1:5
    for j in 1:5
        if i == j
            println(i + j)
        end
    end
end

threeDArray = rand(3, 3, 3)
fourDArray = rand(3, 3, 3, 3)
println("Size and length of the 3D array: ")
println(size(threeDArray))
println(length(threeDArray))
println("Size and length of the 4D array: ")
println(size(fourDArray))
println(length(fourDArray))
```
```@raw html
</details>
```