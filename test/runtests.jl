using Test

function testapproxequal(a::Vector{Float64}, b::Vector{Float64}, tol::Float64,
  verbose::Bool)
  v::Float64 = maximum(abs.(a-b))
  verbose && (println(a) ; println(b))
  verbose && println("$v < $tol ?")
  @test v < tol
end

function testapproxequal(a::Float64, b::Float64, tol::Float64, verbose::Bool)
  v::Float64 = abs(a-b)
  verbose && println("$v < $tol ?")
  @test v < tol
end

println("Running tests: ", Threads.nthreads(), " threads")

include("finiteFK_test.jl")

@testset "LGModel tests" begin
  @time include("lgModel_test.jl")
end

include("mvlgModel_test.jl")

@testset "SMC Sampler tests" begin
  @time include("smcSampler_test.jl")
end
