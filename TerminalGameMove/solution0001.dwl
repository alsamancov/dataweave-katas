%dw 2.0
output application/json
fun move(position, roll) = position + (roll * 2)

var tests = [
  {position: 3, roll: 6, expected: 15},
  {position: 10, roll: 2, expected: 14},
  {position: 0, roll: 4, expected: 8}
]
---
tests map (t) -> {
    "input": {position: t.position, roll: t.roll},
    "output": move(t.position, t.roll),
    "expected": t.expected,
    "pass": move(t.position, t.roll) == t.expected
}