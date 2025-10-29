%dw 2.0
import * from dw::core::Arrays
output application/json

fun summation(n) = sum(1 to n)

fun summation2(n) = n * (n + 1) / 2

var tests = [
  {in: 1, expected: 1},
  {in: 2, expected: 3},
  {in: 8, expected: 36},
  {in: 10, expected: 55},
  {in: 100, expected: 5050}
]
---
tests map (t) -> {
    "input": t.in,
    "output": summation(t.in),
    "expected": t.expected,
    "pass": summation(t.in) == t.expected,
    "output2": summation2(t.in),
    "pass2": summation2(t.in) == t.expected
}