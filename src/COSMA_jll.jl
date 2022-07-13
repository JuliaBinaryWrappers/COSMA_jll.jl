# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule COSMA_jll
using Base
using Base: UUID
Base.include(@__MODULE__, joinpath("..", ".pkg", "platform_augmentation.jl"))
import JLLWrappers

JLLWrappers.@generate_main_file_header("COSMA")
JLLWrappers.@generate_main_file("COSMA", UUID("0efae8bf-39e6-5d65-b05d-c8947f4cee2a"))
end  # module COSMA_jll
