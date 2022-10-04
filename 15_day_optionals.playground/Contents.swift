import Cocoa
import IOKit

// DAY 14 - optionals

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

// if let syntax
if let opposite : String = opposites["Mario"] {
    print(opposite)
} else {
    print("not found")
}

var username: String? = nil
if let unwrapped = username {
    print("we got \(unwrapped)")
} else {
    print("it's empty")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let number = number { // shadowing - temp create constant of the same name
    print(square(number: number))
} else {
    print("cannot square null")
}

// guard

func printSquare(of number: Int?){
    guard let number = number else {
        print("missing number")
        return
    }
    // thanks to guard here i know that number is not nullable
    // if let made non nullable only in scope
    
    print("\(number) x \(number) is \(number * number)")
}

printSquare(of: 4)
printSquare(of: nil)

// nill coalescing

let opposite2 : String = opposites["S"] ?? "N/A"
let opposite3 = opposites["S", default: "N/A"]
print(opposite2)
print(opposite3)

// optional chaining

let names = ["Arya", "Bran", "Robb", "Sansa"]
let emptyNames = [String]()

let chosen = names.randomElement()?.uppercased() ?? "No one"
print(chosen)
print(emptyNames.randomElement()?.uppercased() ?? "nope")

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 4) {
    print("user: \(user)")
}

let user2 = (try? getUser(id: 4)) ?? "No one"
print(user2)

// checkpoint

func randomInt(values: [Int]?) -> Int {
    values?.randomElement() ?? Int.random(in: 1...100)
}

print(randomInt(values: [111, 322, 433]))
print(randomInt(values: []))
print(randomInt(values: nil))
