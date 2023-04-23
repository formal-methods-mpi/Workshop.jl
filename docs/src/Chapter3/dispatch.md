# Multiple Dispatch

We will now approach the central topic of this workshop: multiple dispatch.
In julia, functions can behave quite differently, depending on the typoe of their arguments.
For example, let`s take a look at the multiplication function `*`:

```@example dispatch
a = 1.0
b = 1.0
a * b
```
```@example dispatch
a = "Hello "
b = "World
a * b
```