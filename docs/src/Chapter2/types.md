# Types
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