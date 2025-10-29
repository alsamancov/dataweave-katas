%dw 2.0
output applicaton/json
fun countOccurences (arr) = 
    ((arr groupBy ((item) -> item))
        pluck ((value, key) -> {(key): sizeOf(value)}))
            reduce ((item, acc={}) -> acc ++ item)
var tests = [
    { "in": ["apple","banana","apple","orange","banana","apple"], expected: {"apple":3,"banana":2,"orange":1} },
    { "in": ["a","a","b"], expected: {"a":2,"b":1} },
    { "in": ["x"], expected: {"x":1} },
    { "in": [], expected: {} },
    { "in": ["car","car","bus","car","bus","train"], expected: {"car":3,"bus":2,"train":1} }
]
---
tests map (t) -> {
    "input": t.in,
    "output": countOccurences(t.in),
    "expected": t.expected,
    "pass": countOccurences(t.in) == t.expected
}