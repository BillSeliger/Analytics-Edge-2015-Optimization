setwd("C:/Users/rr046302/Documents/Bill's Stuff/edX/The Analytics Edge 2015/Week 8/Analytics-Edge-2015-Optimization")

require(lpSolveAPI)

## Documentation for lpSolveAPI can be fond here - http://cran.r-project.org/web/packages/lpSolveAPI/lpSolveAPI.pdf

## make the lprec object - constraints 1st arg, decision variables 2nd arg

lprec <- make.lp(5, 2)
# change to maximization, default is minimization
lp.control(lprec, sense = "max")
# smaller models can be printed on the console
# you may want to print after each function to observe how the model is composed
print(lprec)
# larger models will need to be written to a file and viewed
write.lp(lprec, "lprec_file.lp")


## set objective coefficients 
set.objfn(lprec, c(617, 238))

## set RHS copies constraints
set.constr.value(lprec, rhs = c(166,100,150,0,0), constraints=seq(1:5))

## set RHS constraint types
set.constr.type(lprec, c(rep("<=", 3), rep(">=", 2)))

## set the LHS constraints
set.row(lprec, 1, c(1, 1), indices = c(1, 2))
set.row(lprec, 2, 1, indices = 1)
set.row(lprec, 3, 1, indices = 2)
set.row(lprec, 4, 1, indices = 1)
set.row(lprec, 5, 1, indices = 2)

# set names of constraints & decision variables
dimnames(lprec) <- list(c("capacity","reg_demand", "discount_demand", "reg_positive", "disc_positive"), c("reg","disc"))

# check type and bounds for the decision variables
get.type(lprec)
get.bounds(lprec)

# write the model to a file for review
write.lp(lprec, "lprec_file.lp")

# write the file to an mps model in case you want to submit it to Gurobi, CPlex or other solver
write.lp(lprec,'model.mps',type='mps')

# solve the model, if this returns 0 an optimal solution is found
solve(lprec)

## the below functions return the optimal opjective, variables and constraints
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)

