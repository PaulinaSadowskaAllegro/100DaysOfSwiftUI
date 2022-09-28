import Cocoa
import Darwin

var greeting = "Hello, playground"
greeting = "Hello there!"
let aStr = "test"

print(greeting)
// aStr = "test2" // error

let longText = """
Very
long
text!
"""

print(greeting.uppercased())
print(greeting.hasPrefix("Hell"))
print(greeting.hasSuffix("!"))
print(longText.count)

print(120.isMultiple(of: 3))

print(0.1 + 0.2)

let a = 1
let b = 2.0
// print(a + b) // error

print(a + Int(b))

print(Double(a) + b)

