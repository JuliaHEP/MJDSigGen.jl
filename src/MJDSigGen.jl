# This file is a part of MJDSigGen, licensed under the MIT License (MIT).

__precompile__(true)

module MJDSigGen

const deps_jl = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if isfile(deps_jl)
    include(deps_jl)
else
    error("MJDSigGen is not properly installed. Run Pkg.build(\"MJDSigGen\").")
end


macro sgsym(func)
    :(($(esc(func)), libmjd_siggen))
end


using Compat.DelimitedFiles


include("types.jl")
include("util.jl")
include("wrappers.jl")

end # module
