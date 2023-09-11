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
    repo="https://github.com/formal-methods-mpi/Workshop.jl/blob/{commit}{path}#{line}",
    sitename="A fresh approach to scientific computing",
    format=Documenter.HTML(;
        prettyurls=on_ci(),
        canonical="https://formal-methods-mpi.github.io/Workshop.jl",
        edit_link="main",
        assets=String[],
        collapselevel = 1,
        footer = "Got a question? Something confuses you? [Don't hesitate to open an issue to ask for help!](https://github.com/formal-methods-mpi/Workshop.jl/issues/new)"
    ),
    pages=[
        "Home" => "index.md",
        "Chapter 0: Preparation" => "0_preparation/preparation.md",
        "Chapter 1: Workflow" => ["Working with Julia in VSCode" => "1_workflow/usage.md"],
        "Chapter 2: Syntax" => [
            "Chapter 2: Theory" => "2_syntax/foundations.md",
            "Chapter 2: Exercise" => "2_syntax/exercise.md"
        ],
        "Chapter 3: Types" => [
            "Chapter 3: Theory" => "3_types/types.md",
            "Chapter 3: Exercise" => "3_types/exercise.md"
        ],
        "Chapter 4: Multiple Dispatch" => [
            "Chapter 4: Theory" => "4_dispatch/dispatch.md",
            "Chapter 4: Exercise" => "4_dispatch/exercise.md"
        ],
        "Additional Materials" => [
            "Additional Materials" => "5_additional/additional-materials.md",
            "Automatic Differentiation" => "5_additional/dual.md"
        ]
    ],
    doctest = false, # use :fix to auto fix.
)

deploydocs(;
    repo="github.com/formal-methods-mpi/Workshop.jl",
    devbranch = "devel",
    push_preview = "push_preview=true" ∈ ARGS
)
