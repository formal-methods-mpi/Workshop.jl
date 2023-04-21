using JuliaWorkshop
using Documenter

DocMeta.setdocmeta!(JuliaWorkshop, :DocTestSetup, :(using JuliaWorkshop); recursive=true)

on_ci() = get(ENV, "CI", "false") == "true"

makedocs(;
    modules=[JuliaWorkshop],
    authors="Maximilian S. Ernst, Moritz Ketzer, Aaron Peikert and contributors",
    repo="https://github.com/aaronpeikert/JuliaWorkshop.jl/blob/{commit}{path}#{line}",
    sitename="JuliaWorkshop.jl",
    format=Documenter.HTML(;
        prettyurls=on_ci(),
        canonical="https://formal-methods-mpi.github.io/JuliaWorkshop.jl",
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
    repo="github.com/formal-methods-mpi/JuliaWorkshop.jl",
    devbranch = "devel",
    push_preview = "push_preview=true" ∈ ARGS
)
