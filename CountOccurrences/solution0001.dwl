%dw 2.0
output application/json
var grouped = ["apple", "banana", "apple", "orange", "banana", "apple"]
---
grouped groupBy ((item) -> item ) pluck ((value, key) -> {
    (key): sizeOf(value)
}) reduce ((item, acc={}) -> acc ++ item)
