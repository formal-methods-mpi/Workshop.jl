# Some Ideas

## Automated Grading
https://discourse.julialang.org/t/automated-marking-feedback-for-tasks-in-a-julia-course/97117

## Structure
- 20 Minutes Input: Who are we, why Julia, focus of this workshop, how this workshop works(, install software)
- 1st lesson: Basics: Variables, Functions, Control Flow, loops, array comprehension, loading packages, namespaces
- 2nd lesson: Types: everything has a type, abstract/concrete types, type hierarchy in julia, create your own types, constructors
- 3rd lesson: multiple dispatch: what is it, "external dispatch", new types for existing operations (vs. functional) and new operations for existing types (vs. object oriented), parametric types, vs. functional continuation, vs. function overloading
- 4th lesson: advanced things for fast people (maybe put functional continuation and function overloading here)

## Examples
Maybe write first the function programming/"R" way, which is functional continuation
- Linear Algebra: eigenvals; eigenvalsh
- Measurements.jl / DifferentialEquations.jl, https://www.youtube.com/watch?v=kc9HwsxE1OY
- Distributions.jl
- Pokemon: https://gdalle.github.io/JuliaComputationSolutions/hw1a_solutions.html
- Rock, Paper, Scissors: https://giordano.github.io/blog/2017-11-03-rock-paper-scissors/
- Forward-Mode AD: https://www.youtube.com/watch?v=vAp6nUMrKYg&t=1s, https://www.wias-berlin.de/people/fuhrmann/AdSciComp-WS2223/week3/#automatic_differentiation_and_nonlinear_system_solution
- Maximum Likelihood Estimation https://github.com/johnmyleswhite/julia_tutorials/blob/master/Statistics%20in%20Julia%20-%20Maximum%20Likelihood%20Estimation.ipynb
- Noise https://github.com/aaronpeikert/TDLM.jl/blob/957a47c40cfa975c8773175c1aefe439da97cc98/src/Simulate/Noise.jl
- MonteCarloMeasurements https://github.com/baggepinnen/MonteCarloMeasurements.jl
- OneHotVector (also needs *multiple* dispatch)
- ColorTypes.jl, ColorVectorSpace.jl
- Measurements + Unitful: https://discourse.julialang.org/t/seven-lines-of-julia-examples-sought/50416/18
- Distributions with big numbers: https://discourse.julialang.org/t/seven-lines-of-julia-examples-sought/50416/146

## Key Points
- Setup (VSCode, Revise, etc.)
- Dependency Management
- Package Development
- Type System + Multiple Dispatch
- Performance
- Extensibility

Dont do:
- Macros, Metaprogramming

### Setup
- Install VSCode + julia + julia extension; use Pkg.instantiate to set up
    julia --project -e 'using Pkg; Pkg.instantiate()'
-

## Resources
- From zero to Julia: https://discourse.julialang.org/t/from-zero-to-julia-learn-how-to-code-in-julia/33595
- Julia Academy https://juliaacademy.com/
- Julia Setup for beginner: https://discourse.julialang.org/t/video-julia-setup-for-beginner/56559
- Intro to computational Thinking @ MIT: https://github.com/mitmath/6S083

## Input
- The expression problem: https://en.wikipedia.org/wiki/Expression_problem
