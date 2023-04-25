Title: Getting Started with Julia: Workflow and Tools

# Introduction

Welcome to our Julia workshop! In this session, we will explore the powerful and versatile world of Julia, a high-performance programming language for technical computing.
Julia is known for its ease of use, speed, and flexibility, making it a popular choice among developers, data scientists, and researchers.

As this is an asynchronous workshop, you might be reading this before, during, or after the workshop. Regardless of when you're engaging with the material, we hope you'll find this workshop useful and informative.

To ensure a smooth learning experience, we have divided the workshop into three main stages: pre-workshop preparation, hands-on activities during the workshop, and post-workshop exploration.

## Pre-workshop preparation:
Before diving into the intricacies of Julia, we will first discuss the workflow and tools you'll need to get started with the language.
This will help you familiarize yourself with the environment, become proficient in using Julia, and empower you to troubleshoot any issues you may encounter.
## During the workshop:
We will focus on setting up your Julia environment, working with Julia in Visual Studio Code (VSCode) and the terminal.
Through hands-on activities, you'll gain practical experience to reinforce your understanding of the concepts.
## Post-workshop exploration:
After the workshop, we encourage you to continue experimenting with Julia, apply the skills you've learned to real-world projects, and leverage the resources and community support available to further your knowledge.
By thoughtfully engaging with the workshop content and activities, you'll be well-prepared to harness the full potential of Julia and excel in your projects.

TODO: Objective of the Workshop. What are the goals of the workshop? What are the expected outcomes?

# Setting up the Julia environment
## Installing Julia

Before we begin working with Julia, it's essential to have the language properly installed on your computer.
Follow the steps below to install Julia:

  <details>
  <summary>Advanced option: Use Juliaup for Julia Version Management</summary>
If you're comfortable using the shell and already have some experience with the terminal, you may want to install Juliaup, a powerful cross-platform Julia installer.
It helps you to manage multiple versions of the Julia programming language and you'll be notified when a new version becomes available.
To install Juliaup, check out the <a href="https://github.com/JuliaLang/juliaup">Juliaup GitHub page</a>.
After the installation just execute `juliaup add release` in your terminal and you're ready to go.
</details>

1. Go to the official Julia website at https://julialang.org/downloads/ and navigate to the "Downloads" section.
2. Choose the current stable release for your operating system (Windows, macOS, or Linux).
3. To verify the installation, open the terminal and type julia. This should launch the Julia REPL, indicating that Julia is successfully installed on your system.

Now that you have Julia installed, we can proceed to set up your development environment.

## Installing Visual Studio Code (VSCode)
Visual Studio Code (VSCode) is a popular and versatile integrated development environment (IDE) that offers excellent support for Julia, making it our recommended choice for this workshop.

1. Download the installer at https://code.visualstudio.com/.

2. Once the download is complete, locate the installer file and run it. Follow the prompts and instructions to install VSCode.

3. After the installation is complete, open VSCode from your applications menu or search for it using your operating system's search functionality.

## Installing Julia extension for VSCode:
Now that you have VSCode installed, you'll need to add the Julia extension to enable language support and additional features. Follow these steps to install the Julia extension:

1. Open the Extensions view: Launch VSCode, and click on the square icon on the left-hand sidebar (or press Ctrl+Shift+X / Cmd+Shift+X) to open the Extensions view.

2. Search for the Julia extension: In the Extensions view, use the search bar at the top to search for "Julia" and select the extension titled "Julia" from julialang.

3. Click on the "Install" button on the top of the page.

You have now successfully set up VSCode with Julia support, and you are ready to start working with Julia code in a powerful and feature-rich IDE.

# Working with Julia in VSCode

In this workshop we will learn Visual Studio Code (VSCode) through hands-on learning, so let's tackle everything together. If you feel slightly overwhelmed at first, don't worry – that's perfectly natural.
It takes time to become familiar with a powerful tool like VSCode.

## Create a folder for the workshop
First, we'll want to create a dedicated folder for our workshop. It's important to note that VSCode isn't particularly friendly when it comes to navigating your file system. So don't try to use VSCode for that.
Instead, we will use our operating system for that, i.e., just use your Explorer/Finder and create a folder in a location that makes sense to you.
Once you've done that, you can open the folder in VSCode by navigating to the Menu Bar and selecting File > Open Folder and then selecting the folder you just created.

Next, let's create a new file within our workshop folder. To do this, right-click within the folder's file explorer in VSCode, and select "New File." Name this file "Introduction.jl" and then open it by double-clicking on the file name.
In this file, write the following code:

```julia
println("Hello, Julia!")
```

Now, we'll execute this code using the Command Palette. To open the Command Palette, press Ctrl+Shift+P (Windows/Linux) or Cmd+Shift+P (Mac). In the Command Palette search bar, type "execute," and then look for the option "Julia: Execute Code in REPL." Click on it, and the code you've written should be executed, displaying "Hello Julia" in the REPL (Read-Eval-Print Loop) window that opens up at the bottom of the VSCode window.

Great! You've just executed your first Julia code in VSCode!

## The Julia REPL

The Julia REPL (Read-Eval-Print Loop) is an interactive and modern command-line interface for the Julia programming language. It allows you to enter Julia expressions, execute them, and see the results immediately.
This makes the REPL a great place to experiment with Julia, test ideas, get help, and much more.

Because this is still the pre-workshop stage, we will not go into too much detail about the REPL. We will provide you with insights into the capabilities and functionality of the Julia REPL, and then encourage you to explore it on your own.

### Julia mode
This is the default mode when you start the REPL. Here, you can enter and execute Julia expressions. To return to Julia mode from any other mode, press Backspace.
### Help mode
To access Help mode, press ?. In this mode, you can search for documentation and information about various Julia functions, types, and keywords.
### Shell mode
To enter Shell mode, press ;. In this mode, you can execute shell commands (e.g., ls, cd, mkdir) as you would in your operating system's command prompt or terminal. This allows you to perform file and directory operations, or to start a command-line interface without leaving the Julia REPL.
### Package mode
Access Package mode by pressing ]. This mode is dedicated to managing Julia packages using the built-in package manager, Pkg. In Package mode, you can add, update, remove, and list installed packages, among other tasks.
### Search mode
Press Ctrl+R (Windows/Linux) or Cmd+R (Mac) to enter Search mode. This mode allows you to search for previously executed commands in the REPL history. You can navigate through matching commands using the up and down arrow keys. Press Enter to execute the selected command or Ctrl+C (Windows/Linux/Mac) to cancel the search and return to the previous mode.

## Exercises
### Julia mode exercises:
1. Enter and execute a simple arithmetic expression: 3 + 4.
2. Define a variable x and assign it the value of 7: x = 7.
3. Create a simple function that adds two numbers: function add(a, b) return a + b end.
### Help mode ? exercises:
1. To find information on the println function, enter Help mode by pressing ?. Once in Help mode, simply type println and press Enter to retrieve the relevant documentation.
2. Look for an alternative print function by entering "print" (with quotation marks) in the search field. Julia will subsequently provide a list of definitions where the string "print" appears in the associated documentation.
3. Find out what the difference is between println and print. There was also something that was called @show. What is that?
### Shell mode ; exercises:
1. List the files in the current directory: ls.
2. Create another Julia file in the current directory: `touch chapter1.jl`.
3. Create a new directory called "resources": `mkdir resources`.
4. Go into the directoty with the cd command: `cd resources`.
5. Go back to the parent directory: `cd ..`.
6. Display the contents of the folder with the ls command: `ls`.
7. Display the contents of the (saved) file "Introduction.jl": `cat Introduction.jl`.
### Package mode ] exercises:
1. Add the Example package: `add Example`.
2. List the installed packages: `status`.
3. Remove the Example package: `remove Example` or `rm Example`.
4. Discover what else you can type in Package mode by entering `help` or `?`.

### Search mode exercises:
a. See what you typed before by pressing up arrow repeatedly.
b. Find the last command related to variable assignment: Press Ctrl+R, type "=" and then up arrow to select the last command that contains an equal sign.

# Summary
You've made great progress learning about Julia and VSCode. In this chapter, we covered setting up the Julia environment, which involved installing Julia, Visual Studio Code, and the Julia extension for VSCode.
We created a folder for the workshop, executed our first Julia code, and explored the various modes of the Julia REPL, including Julia mode, Help mode, Shell mode, Package mode, and Search mode.
