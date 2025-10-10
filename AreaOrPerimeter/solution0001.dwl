%dw 2.0
output application/json
fun areaOrPerimeter(length, width) = 
    if(length == width)
        length * width
    else
        2 * (length + width)

var tests = [
     { "in": {length: 3, width: 3}, expected: 9 },   // square → area
    { "in": {length: 6, width: 10}, expected: 32 }, // rectangle → perimeter
    { "in": {length: 4, width: 4}, expected: 16 },
    { "in": {length: 7, width: 3}, expected: 20 },
    { "in": {length: 10, width: 10}, expected: 100 }
]

---
tests map (t) -> {
    "input": t.in,
    "output": areaOrPerimeter(t.in.length, t.in.width),
    "expected": t.expected,
    "pass": areaOrPerimeter(t.in.length, t.in.width) == t.expected
}