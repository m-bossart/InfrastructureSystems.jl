using Pkg
Pkg.activate(@__DIR__)
Pkg.instantiate()

using JuliaFormatter

main_paths = ["./src", "./test"]
for main_path in main_paths
    for folder in readdir(main_path)
        @show folder_path = joinpath(main_path, folder)
        if isfile(folder_path)
            !occursin(".jl", folder_path) && continue
        end
        format(folder_path;
            whitespace_ops_in_indices = true,
            remove_extra_newlines = true,
            verbose = true,
            always_for_in = true,
            whitespace_typedefs = true,
            whitespace_in_kwargs = false,
            format_docstrings = true,

            # always_use_return = true # removed since it has false positives.
            )
    end
end
