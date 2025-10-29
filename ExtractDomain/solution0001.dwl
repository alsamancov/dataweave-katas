%dw 2.0
output application/json

fun extractDomain(url) =
    (url scan(/^(?:https?:\/\/)?(?:www\.)?([^\/:?#]+)/))[0][1]

var tests = [
  { in: "https://www.google.com/department/sell", expected: "google.com" },
  { in: "http://google.com", expected: "google.com" },
  { in: "https://google.com/path/to/page", expected: "google.com" },
  { in: "http://www.google.com:8080/api", expected: "google.com" },
  { in: "https://subdomain.google.com/index.html", expected: "subdomain.google.com" },
  { in: "http://subdomain.google.com:3000/dashboard", expected: "subdomain.google.com" },
  { in: "https://www.google.co.uk/search?q=test", expected: "google.co.uk" },
  { in: "http://google.org", expected: "google.org" },
  { in: "https://maps.google.com", expected: "maps.google.com" },
  { in: "http://test.subdomain.google.com/path", expected: "test.subdomain.google.com" },
  { in: "https://google.com?param=value", expected: "google.com" },
  { in: "http://www.google.com/#section", expected: "google.com" },
  { in: "https://google.com:443/home", expected: "google.com" },
  { in: "ftp://google.com/resource", expected: "google.com" },
  { in: null, expected: null }
]

---
tests map (t) -> {
  "input": t.in,
  "output": extractDomain(t.in),
  expected: t.expected,
  pass: extractDomain(t.in) == t.expected
}
