%dw 2.0
output application/json

fun extractDomain(email) = (email splitBy  "@")[1]

var tests = [
  {in: "alex@mulesoft.com", expected: "mulesoft.com"},
  {in: "john.doe@gmail.com", expected: "gmail.com"},
  {in: "info@softserveinc.com", expected: "softserveinc.com"},
  {in: "support@openai.com", expected: "openai.com"}
]
---
tests map (t) ->{
    "input": t.in,
    "output": extractDomain(t.in),
    "expected": t.expected,
    "pass": extractDomain(t.in) == t.expected
}