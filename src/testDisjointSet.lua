local DisjointSet = require "DisjointSet"

local myDisjointSet = DisjointSet:new()

myDisjointSet.make_set(5)
myDisjointSet.make_set(2)
myDisjointSet.make_set(7)
myDisjointSet.make_set(9)
myDisjointSet.make_set(8)
myDisjointSet.make_set(3)

myDisjointSet.union(8, 2)
myDisjointSet.union(7, 8)
myDisjointSet.union(2, 5)

print(myDisjointSet.find(2))