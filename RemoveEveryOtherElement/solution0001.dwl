%dw 2.0
output application/json
fun removeEveryOther(arr) = arr filter ((item, index) -> (index mod 2) == 0)

var tests = [
    { "in": ["Keep", "Remove", "Keep", "Remove", "Keep"], expected: ["Keep", "Keep", "Keep"] },
    { "in": ["A", "B", "C", "D", "E"], expected: ["A", "C", "E"] },
    { "in": [1, 2, 3, 4, 5, 6], expected: [1, 3, 5] },
    { "in": ["one"], expected: ["one"] },   // single element
    { "in": [], expected: [] }              // empty array
]

---
tests map (t) -> {
    "input": t.in,
    "output": removeEveryOther(t.in),
    "expected": t.expected,
    "pass": removeEveryOther(t.in) == t.expected
}