let firstSet: Set<String> = ["cat", "dog"]
let secondSet: Set<String> = ["dog", "mouse"]
print(firstSet.union(secondSet).subtracting(secondSet))