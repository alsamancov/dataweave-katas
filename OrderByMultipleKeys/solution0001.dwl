%dw 2.0
output application/json
fun sortByAgeThenName(arr) = 
    (arr orderBy ((item) -> item.name))
    orderBy ((item) -> item.age)
var tests = [
    {
        "in": [
            { "name": "Alice", "age": 30 },
            { "name": "Charlie", "age": 25 },
            { "name": "Bob", "age": 25 }
        ],
        "expected": [
            { "name": "Bob", "age": 25 },
            { "name": "Charlie", "age": 25 },
            { "name": "Alice", "age": 30 }
        ]
    },
    {
        "in": [
            { "name": "Zoe", "age": 40 },
            { "name": "Adam", "age": 40 },
            { "name": "Bob", "age": 20 }
        ],
        "expected": [
            { "name": "Bob", "age": 20 },
            { "name": "Adam", "age": 40 },
            { "name": "Zoe", "age": 40 }
        ]
    }
]
---
tests map (t) -> {
    "input": t.in,
    "output": sortByAgeThenName(t.in),
    "expected": t.expected,
    "pass": sortByAgeThenName(t.in) == t.expected
}