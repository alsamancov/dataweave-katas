%dw 2.0 
output application/json 
fun extractDate(inputText) = (inputText splitBy ",")[0] 
--- 
{ field1: extractDate(payload.field1), field2: extractDate(payload.field2) }