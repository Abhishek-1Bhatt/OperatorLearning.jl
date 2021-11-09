using Test, Random, Flux

@testset "FourierLayer" begin
    # Test the proper construction
    @test size(FourierLayer(128, 64, 100, 20).Wf) == (128, 64, 51)
    @test size(FourierLayer(128, 64, 100, 20).Wl) == (64, 128, 1)
    #@test size(FourierLayer(10, 100).bias_f) == (51,)
    #@test size(FourierLayer(10, 100).bias_l) == (100,)

    # Accept only Int as architecture parameters
    @test_throws MethodError FourierLayer(128.5, 64, 100, 20)
    @test_throws MethodError FourierLayer(128.5, 64, 100, 20, tanh)
    @test_throws AssertionError FourierLayer(100, 100, 100, 60, σ)
    @test_throws AssertionError FourierLayer(100, 100, 100, 60)
end