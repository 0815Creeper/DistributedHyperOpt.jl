#
# Copyright (c) 2023 Tobias Thummerer, Lars Mikelsons
# Licensed under the MIT license. See LICENSE file in the project root for details.
#

sampler = DistributedHyperOpt.RandomSampler()
optimization = DistributedHyperOpt.Optimization(f, 
                                             DistributedHyperOpt.Parameter("a", :Linear, (1.0,3.0)), 
                                             DistributedHyperOpt.Parameter("b", :Discrete, [4.0, 5.0, 6.0]), 
                                             DistributedHyperOpt.Parameter("c", :Log, (1.0, 2.0)))
DistributedHyperOpt.optimize(optimization; sampler=sampler, max_iters=10)
DistributedHyperOpt.optimize(optimization; sampler=sampler, max_iters=10, plot=true)
@info "Found minimum $(optimization.minimum) for minimizer $(optimization.minimizer)."
@test optimization.minimum < 0.0