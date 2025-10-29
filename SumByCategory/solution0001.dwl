%dw 2.0
output application/json
fun sumByCategory(arr) =
    (arr groupBy ((item) -> item.category))
        mapObject ((value, key) ->
        (key): sum(value.amount) )

var tests = [
    {
        in: [
            {"category": "food", "amount": 10},
            {"category": "transport", "amount": 5},
            {"category": "food", "amount": 7}
        ],
        expected: {"food": 17, "transport": 5}
    },
    {
        in: [
            {"category": "a", "amount": 1},
            {"category": "a", "amount": 2},
            {"category": "b", "amount": 10}
        ],
        expected: {"a": 3, "b": 10}
    },
    {
        in: [],
        expected: {}
    }
]
---
tests map (t) -> {
    "input": t.in,
    "output": sumByCategory(t.in),
    "expected": t.expected,
    "pass": sumByCategory(t.in) == t.expected
}