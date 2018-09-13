local DisjointSet = {}
DisjointSet.__index = DisjointSet

setmetatable(DisjointSet, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function DisjointSet.new()
  local self = setmetatable({}, DisjointSet)
  self.sets = {}
  self.set_sizes = {}
  return self
end

function DisjointSet:make_set(element)
  self.sets[element] = nil
  self.set_sizes[element] = 1
end

function DisjointSet:find(element)
  if self.sets[element] == nil then
    return element
  else
    self.sets[element] = self:find(self.sets[element])
    return self.sets[element]
  end
end

function DisjointSet:union(element1, element2)
  element1_rep = self:find(element1)
  element2_rep = self:find(element2)
  
  if element1_rep == element2_rep then
    return
  elseif self.set_sizes[element1] < self.set_sizes[element2] then
    self.set_sizes[element2_rep] = self.set_sizes[element2_rep] + self.set_sizes[element1_rep]
    self.sets[element1_rep] = element2_rep
  else
    self.set_sizes[element1_rep] = self.set_sizes[element1_rep] + self.set_sizes[element2_rep]
    self.sets[element2_rep] = element1_rep
  end
end

return DisjointSet