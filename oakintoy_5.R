



```{r}
library(lpSolveAPI)

## create IP object
cpm.ip <- make.lp(nrow = 9, ncol = 12) # nrow is the number of nodes, ncol is the numnber of arcs

# create names for nodes and arcs
arc.names <- c("x12", "x35", "x25, x58", "x24", "x57", "x47", "x46", "x89", "x79", "x69")
node.names <- c("node1", "node2", "node3", "node4", "node5", "node6", "node7", "node8", "node9")

# rename the IP object
rownames(cpm.ip) <- node.names
colnames(cpm.ip) <- arc.names

## obj function
time <- c(3, 5, 3, 2, 2, 4, 6, 4, 1, 7, 4, 5)
set.objfn(cpm.ip, -1*time)  # default is min

## set constraints LHS
set.row(cpm.ip, 1, c(1, 1), indices = c(1, 2) )     # node 1 (starting node)
set.row(cpm.ip, 2, c(1, -1), indices = c(1, 3))     # node 2 (intermediate node)
set.row(cpm.ip, 3, c(1, 1, -1, -1), indices = c(2, 3, 4, 5))  # node 3 (intermediate node)
set.row(cpm.ip, 4, c(1, -1), indices = c(5, 6))     # node 4 (intermediate node)
set.row(cpm.ip, 5, c(1, 1, -1), indices = c(4, 6, 7))         # node 5 (intermediate node)
set.row(cpm.ip, 6, 1, indices = 7)  # node 6 (finish node)

## set constraints type
set.constr.type(cpm.ip, rep("="), 12)

## set constraint RHS
rhs <- c(1, rep(0, 4), 1)
set.rhs(cpm.ip, rhs)

## set all variables type to be binary
set.type(cpm.ip, 1:7, "binary")

## solve the IP problem
solve(cpm.ip)
get.objective(cpm.ip)
get.variables(cpm.ip)

# put optimal values beside of variable names for better understanding of th results
cbind(arc.names, get.variables(cpm.ip))

###################################################
```

