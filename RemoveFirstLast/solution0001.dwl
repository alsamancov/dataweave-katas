%dw 2.0
import * from dw::core::Strings
output applicatoin/json
fun removeFirstLast(str) = substring(str as String, 1, sizeOf(str) - 1)

var tests = [
    { in: "Hello", expected: "ell" },
    { in: "DataWeave", expected: "ataWeav" },
    { in: "AB", expected: "" },
    { in: "A", expected: "" },
    { in: "", expected: "" }
]

---
tests map (t) -> {
    "input": t.in,
    "output": removeFirstLast(t.in),
    expected: t.expected,
    pass: removeFirstLast(t.in) == t.expected
}