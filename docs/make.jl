using Workshop
using Documenter

DocMeta.setdocmeta!(Workshop, :DocTestSetup, :(using Workshop); recursive=true)

on_ci() = get(ENV, "CI", "false") == "true"

makedocs(;
    modules=[Workshop],
    authors="Maximilian S. Ernst, Moritz Ketzer, Aaron Peikert and contributors",
    repo="https://github.com/aaronpeikert/Workshop.jl/blob/{commit}{path}#{line}",
    sitename="Workshop.jl",
    format=Documenter.HTML(;
        prettyurls=on_ci(),
        canonical="https://formal-methods-mpi.github.io/Workshop.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Setup" => "00setup.md",
        "Basics" => "01basics.md"
    ],
    doctest = false, # use :fix to auto fix.
)

deploydocs(;
    repo="github.com/formal-methods-mpi/Workshop.jl",
    devbranch = "devel",
    push_preview = "push_preview=true" ∈ ARGS
)
