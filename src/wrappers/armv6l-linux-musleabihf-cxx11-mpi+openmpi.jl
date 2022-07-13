# Autogenerated wrapper script for COSMA_jll for armv6l-linux-musleabihf-cxx11-mpi+openmpi
export cosma

using OpenBLAS_jll
using CompilerSupportLibraries_jll
using OpenMPI_jll
using MPIPreferences
JLLWrappers.@generate_wrapper_header("COSMA")
JLLWrappers.@declare_library_product(cosma, "libcosma.so")
function __init__()
    JLLWrappers.@generate_init_header(OpenBLAS_jll, CompilerSupportLibraries_jll, OpenMPI_jll, MPIPreferences)
    JLLWrappers.@init_library_product(
        cosma,
        "lib/libcosma.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
