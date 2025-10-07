%dw 2.0
output application/json

fun extractDate(inputText) = (inputText splitBy ",")[0] 

var tests = [
    { "in": "Friday May 2, 7pm", expected: "Friday May 2" },
    { "in": "Tuesday January 29, 10pm", expected: "Tuesday January 29" },
    { "in": "Monday December 25, 10pm", expected: "Monday December 25" },
    { "in": "Saturday April 1", expected: "Saturday April 1" }, // no comma
    { "in": "Wednesday July 4,  9am", expected: "Wednesday July 4" } // extra space
]

---
tests map (t) -> {
    "input": t."in",
    "output": extractDate(t."in"),
    "expected": t.expected,
    "pass": extractDate(t."in") == t.expected
}
