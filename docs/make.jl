using Workshop
using Documenter
import Downloads

mkpath("./docs/src/assets/")
Downloads.download("https://raw.githubusercontent.com/JuliaLang/julia-logo-graphics/master/images/julia-logo-color.svg", "./docs/src/assets/logo.svg")
Downloads.download("https://raw.githubusercontent.com/JuliaLang/julia-logo-graphics/master/images/julia-logo-dark.svg", "./docs/src/assets/logo-dark.svg")


DocMeta.setdocmeta!(Workshop, :DocTestSetup, :(using Workshop); recursive=true)

on_ci() = get(ENV, "CI", "false") == "true"

makedocs(;
    modules=[Workshop],
    authors="Maximilian S. Ernst, Moritz Ketzer, Aaron Peikert and contributors",
    repo="https://github.com/aaronpeikert/Workshop.jl/blob/{commit}{path}#{line}",
    sitename="A fresh approach to scientific computing",
    format=Documenter.HTML(;
        prettyurls=on_ci(),
        canonical="https://formal-methods-mpi.github.io/Workshop.jl",
        edit_link="main",
        assets=String[],
        collapselevel = 1
    ),
    pages=[
        "Home" => "index.md",
        "Chapter 0: Preparation" => [
            "Introduction" => "0_preparation/introduction.md",
            "Setup" => "0_preparation/preparation.md"],
        "Chapter 1: Workflow" => ["Working with Julia in VSCode" => "1_workflow/usage.md"],
        "Chapter 2: Syntax" => [
            "Theory" => "2_syntax/syntax.md", 
            "Exercise" => "2_syntax/exercise.md"],
        "Chapter 3: Types" => [
            "Theory" => "3_types/types.md",
            "Exercise" => "3_types/exercise.md"],
        "Chapter 4: Multiple Dispatch" => [
            "Theory" => "4_dispatch/dispatch.md",
            "Exercise" => "4_dispatch/exercise.md"],
        "Advanced Materials" => [
            "Introduction" => "5_advanced/intro.md",
            "Automatic Differentiation" => "5_advanced/dual.md",
            "Workflow" => "5_advanced/workflow.md"
        ]
    ],
    doctest = false, # use :fix to auto fix.
)

deploydocs(;
    repo="github.com/formal-methods-mpi/Workshop.jl",
    devbranch = "devel",
    push_preview = "push_preview=true" ∈ ARGS
)
