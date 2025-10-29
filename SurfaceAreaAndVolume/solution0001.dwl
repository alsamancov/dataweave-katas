%dw 2.0
output application/json

fun getBoxProperties(w, h, d) = {
    surface: 2 * (w * h + w * d + h * d),
    volume: w * h * d
}

var tests = [
  {in: {w: 1, h: 1, d: 1}, expected: {surface: 6, volume: 1}},
  {in: {w: 2, h: 3, d: 4}, expected: {surface: 52, volume: 24}},
  {in: {w: 10, h: 5, d: 2}, expected: {surface: 160, volume: 100}},
  {in: {w: 3, h: 3, d: 3}, expected: {surface: 54, volume: 27}}
]
---
tests map (t) -> { 
    "input": t.in,
    "output": getBoxProperties(t.in.w, t.in.h, t.in.d),
    "expected": t.expected,
    "pass": getBoxProperties(t.in.w, t.in.h, t.in.d) == t.expected
}