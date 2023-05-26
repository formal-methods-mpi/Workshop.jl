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
    1. Install the Example package: `add Example`.
    2. List the installed packages: `status`.
    3. Remove the Example package: `rm Example`.
    4. Discover what else you can type in Package mode by entering `help` or `?`.

## Restarting the REPL

We've already talked about the REPL and its various modes. Now, let's learn how to restart it.

Restarting the REPL in Julia is a step you'll need to take occasionally, especially when you've made certain changes to your code (you will learn when this is required later).
When you create or alter code elements, they're stored in the current Julia session.
But sometimes, you'll need to restart the session so that the REPL can properly understand these changes.

Don't worry about the specifics yet. For now, just remember that restarting the REPL is part of the process and is something we'll be doing throughout this course.

Restarting the REPL in VSCode is easy.
Just press Alt + J and then Alt + R. If you wait too long between pressing these keys, VSCode may not recognize it as a single command, so try to do it quickly.

Restarting the REPL gives you a clean slate. It removes all variables you previously defined or packages you loaded.

If you forget how to restart the REPL, or want to find other shortcuts, you can always open the Command Palette and search for "restart".

Remember, each time you restart the REPL, any variables or functions you've defined will be erased.
So it's important to keep your code in a script file.
This way, after a restart, you can just run your script again to get back where you were.
It's good practice to keep this file tidy so it runs smoothly from start to finish.
By the end of the workshop, we aim to have one script file that can be run in a single go.

## Making Use of the Tab Key for Autocompletion in REPL

In the REPL (Read-Eval-Print-Loop) environment, the Tab key has a helpful role beyond its usual function.
This key assists in your programming tasks by providing autocompletion, suggesting commands based on what you've started to type and what's applicable in your current scope.

Let's say you've started typing 'pr' – hitting the Tab key after this triggers REPL to present all commands that start with 'pr'.
Want to peek into the contents of a package?
Simply type its name followed by two presses of the Tab key – for instance, 'Base.<tab><tab>'.

If there's only one command that matches your partial input, REPL will conveniently complete it for you.
Get hands-on with this feature and see the leap in your coding efficiency!


## Summary

In this session, we have explored how to effectively utilize Julia in Visual Studio Code (VSCode). Here's what we've accomplished:

- We began by setting up our working environment in VSCode. We created a new folder for the workshop and a new file within that folder named `introduction.jl`. We then wrote and executed our first line of Julia code in this file, outputting "Hello, Julia!".
- We dove deep into the Julia REPL (Read-Eval-Print Loop), an interactive command-line interface for the Julia programming language. We learned about the different modes in the REPL: Julia mode (the default), Help mode (for accessing documentation), and Package mode (for managing Julia packages). We practiced executing simple Julia expressions in the REPL, using Help mode to retrieve documentation, and using Package mode to add, update, and remove packages.
- We covered how to restart the REPL, which is crucial when making changes to our code. We learned the key commands to perform a restart and understood that it effectively wipes the slate clean, removing any previously defined variables or loaded packages.
- Finally, we discovered the utility of the Tab key in the REPL for autocompletion and to see what's available in the current scope.

Through these steps, we have set up our workspace, started working with Julia code, navigated different modes in the REPL, managed packages, and learned key functions of the VSCode environment. The practices we've established will lay a strong foundation for our upcoming work with Julia in VSCode.
