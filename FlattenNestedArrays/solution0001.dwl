%dw 2.0
output application/json
fun flattenDeep(arr) = 
    arr flatMap ((item) -> 
        if (item is Array) flattenDeep(item)
        else [item]
    )

var tests = [
  {in: [1,[2,[3,4],5]], expected: [1,2,3,4,5]},
  {in: [[1,2],[3,[4,[5]]]], expected: [1,2,3,4,5]},
  {in: [1,2,3], expected: [1,2,3]},
  {in: [], expected: []}
]
---
tests map (t) -> {
    "input": t.in,
    "output": flattenDeep(t.in),
    "expected": t.expected,
    "pass": flattenDeep(t.in) == t.expected
}
