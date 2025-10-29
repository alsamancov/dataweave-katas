%dw 2.0
output application/json
fun noSpace(str) = str replace  " " with ""
var tests =  [
  {in: "8 j 8   mBliB8g  imjB8B8  jl  B", expected: "8j8mBliB8gimjB8B8jlB"},
  {in: "8 8 Bi fk8h B 8 BB8B B B  B888 c hl8 BhB fd", expected: "88Bifk8hB8BB8BBBB888chl8BhBfd"},
  {in: "8aaaaa dddd r     ", expected: "8aaaaaddddr"},
  {in: " no spaces ", expected: "nospaces"},
  {in: "", expected: ""}
]
---
tests map (t) -> {
    "input": t.in,
    "output": noSpace(t.in),
    "expected": t.expected,
    "pass": noSpace(t.in) == t.expected
}