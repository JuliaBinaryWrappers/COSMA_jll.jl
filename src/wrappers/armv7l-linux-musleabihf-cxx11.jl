# Autogenerated wrapper script for COSMA_jll for armv7l-linux-musleabihf-cxx11
export cosma, grid2grid

using OpenBLAS_jll
using MPICH_jll
using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `cosma`
const cosma_splitpath = ["lib", "libcosma.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
cosma_path = ""

# cosma-specific global declaration
# This will be filled out by __init__()
cosma_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const cosma = "libcosma.so"


# Relative path to `grid2grid`
const grid2grid_splitpath = ["lib", "libgrid2grid.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
grid2grid_path = ""

# grid2grid-specific global declaration
# This will be filled out by __init__()
grid2grid_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const grid2grid = "libgrid2grid.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"COSMA")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (OpenBLAS_jll.PATH_list, MPICH_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (OpenBLAS_jll.LIBPATH_list, MPICH_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list,))

    global cosma_path = normpath(joinpath(artifact_dir, cosma_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global cosma_handle = dlopen(cosma_path)
    push!(LIBPATH_list, dirname(cosma_path))

    global grid2grid_path = normpath(joinpath(artifact_dir, grid2grid_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global grid2grid_handle = dlopen(grid2grid_path)
    push!(LIBPATH_list, dirname(grid2grid_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

