# Working with Julia in VSCode

We will now learn how to use Julia in Visual Studio Code (VSCode) through some examples, so let's tackle everything together.
If you feel slightly overwhelmed at first, don't worry — that's perfectly natural.
It takes time to become familiar with a tool like VSCode.

## Create a folder for the workshop

First, we'll want to create a dedicated folder for our workshop.
VSCode isn't particularly friendly when it comes to navigating files/folders.
So don't try to use VSCode for that.
Instead, we will use our operating system for that, i.e., just use your Explorer/Finder and create a folder in a location that makes sense to you.
Once you've done that, you can open the folder in VSCode by navigating to the Menu Bar and selecting File > Open Folder and then selecting the folder you just created.

Next, let's create a new file within our workshop folder.
To do this, right-click within the folder's file explorer in VSCode, and select "New File."
Name this file `introduction.jl` and then open it by double-clicking on the file name.
In this file, write the following code:

```julia
println("Hello, Julia!")
```

Now, we'll execute this code using the Command Palette.
To open the Command Palette, press Ctrl+Shift+P (Windows/Linux) or Cmd+Shift+P (Mac).
In the Command Palette search bar, type "execute," and then look for the option "Julia: Execute Code in REPL and Move"
Take note what the displayed shortcut for executing code in the REPL is - you can use this shortcut in the the future to execute a line of code from your script.
Leave the command palette by clicking on the background, click on the line of code you just worte, and hit the shortcut to execute it. The code you've written should be executed, displaying "Hello, Julia!" in the REPL window that opens up at the bottom of VSCode.

Great! You've just executed your first line of Julia in VSCode!

## The Julia REPL

The Julia REPL (Read-Eval-Print Loop) is an interactive and modern command-line interface for the Julia programming language. It allows you to enter Julia expressions, execute them, and see the results immediately.
This makes the REPL a great place to experiment with Julia, test ideas, get help, and much more.

The REPL has several differend modes:
- The normal Julia mode
- Help mode
- Package mode
- Shell mode

We will cover each of these modes, except the shell mode, in the following sections.

### Julia mode

This is the default mode when you start the REPL.
Here, you can enter and execute Julia expressions.
To return to Julia mode from any other mode, press Backspace.

!!! compat "Exercise"
    Add two numbers in the REPL.

```@raw html
<details>
<summary>show solution</summary>
<br>
```
!!! tip "Solution"
    ```julia
    julia> 3+4
    7
    ```
```@setup xxx
```
```@raw html
</details>
```

### Help mode

To access Help mode, press ?. In this mode, you can search for documentation and information about various Julia functions, types, and keywords.

!!! compat "Exercise"
    1. To find information on the println function, enter Help mode by pressing ?. Once in Help mode, simply type println and press Enter to retrieve the relevant documentation.
    2. Look for an alternative print function by entering "print" (with quotation marks) in the search field. Julia will subsequently provide a list of definitions where the string "print" appears in the associated documentation.

### Package mode

Access Package mode by pressing `]`.
This mode is dedicated to managing Julia packages using the built-in package manager, Pkg.
In Package mode, you can add, update, remove, and list installed packages, among other tasks.

!!! compat "Exercise"
    Enter Package mode by pressing `]`.
    1. Add the Example package: `add Example`.
    2. List the installed packages: `status`.
    3. Remove the Example package: `rm Example`.
    4. Discover what else you can type in Package mode by entering `help` or `?`.

## Restarting the REPL

Now that we have learned about the REPL and the various modes, let's restart the REPL.

The necessity to restart the REPL comes from how Julia handles certain changes in your code. When you define functions, variables or types, they are stored in the current Julia session. However, if you make changes to a type definition, the REPL won't recognize these changes until you restart the session. Although VSCode includes a package called Revise.jl, which alleviates this problem somewhat, it wont help us for all cases we will encounter in this course.

To restart the Julia REPL in VSCode, you can use the keyboard shortcut Alt + J Alt + R. (Note that, if you wait too long between key presses, VSCode might not recognize it as a single command.)
This starts a fresh Julia session, without all variables you previously defined or packages you loaded.

Tip: If you want to look up the shortcut for restarting the REPL, or any other shortcut, you can do so by opening the Command Palette and searching for "restart".

Because we will need to restart Julia during the workshop, and this will delete all variables, functions, etc. you defined, it is important that you keep your code in a script file. You should keep this file clean, so it runs from top to bottom without errors. This way, you can easily execute it again after restarting Julia. The goal is to have a single file which solves the entire workshop in a single run at the end.

## The Tab key

The Tab key is a useful tool in the REPL, which you can use for autocompletion and to see what is available in the current scope. For example, if you type `pr` and then press Tab, the REPL will show you all the available commands, beginning with `pr`. You can also see the namespace of a package by typing e.g., Base.<tab><tab>. If there is only a single possibility, the REPL will automatically complete the command for you. Try it out!

## Summary

In this chapter, we created a folder for the workshop, executed our first Julia code, and explored the various modes of the Julia REPL, including Julia mode, Help mode, and Package mode.
We also learned how to restart the REPL and why this is necessary.
Lastly, we learned about the Tab key and how it can be used for autocompletion and to see what is available in the current scope.