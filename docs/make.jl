using Workshop
using Documenter

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
        "Chapter 0: Workflow" => "Chapter0/workflow.md",
        "Chapter 1: Syntax" => [
            "Syntax" => "Chapter1/syntax.md", 
            "Exercise" => "Chapter1/exercise.md"],
        "Chapter 2: Types" => [
            "Types" => "Chapter2/types.md",
            "Exercise" => "Chapter2/exercise.md"],
        "Chapter 3: Multiple Dispatch" => [
            "Methods" => "Chapter3/dispatch.md",
            "Exercise" => "Chapter3/exercise.md"],
        "Chapter 4: Exercises" => [
            "Introduction" => "Chapter4/intro.md"
            "Automatic Differentiation" => "Chapter4/dual.md"
        ]
    ],
    doctest = false, # use :fix to auto fix.
)

deploydocs(;
    repo="github.com/formal-methods-mpi/Workshop.jl",
    devbranch = "devel",
    push_preview = "push_preview=true" ∈ ARGS
)