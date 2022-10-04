import Cocoa
import Darwin

// DAY 13 - protocols

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance/50
    }
    
    func travel(distance: Int) {
        print("travel for \(distance)")
    }
    
    var name: String = "Car"
    
    var currentPassengers: Int = 4
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int){
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

// opaque return types (equivalent of Kotlin generics)

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

let result = getRandomBool() == getRandomBool()

let result2 = getRandomNumber() == getRandomNumber()

// extensions

let quote = "   The truth is rarely pure and never simple   "

let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
}

let trimmed2 = quote.trimmed()

// let trimmed3 = quote.trim() // error
var mutableQuote = "   The truth \n"
mutableQuote.trim()
print(mutableQuote)

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

let book = Book(title: "test", pageCount: 2, readingHours: 20)

extension Book{
    init(title: String, pageCount: Int) {
            self.title = title
            self.pageCount = pageCount
            self.readingHours = pageCount / 50
        }
}

let otherBook = Book(title: "test", pageCount: 2)

// protocol extensions

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("there are some guests")
}

// protocol-oriented programming (like interfaces with default implementations)

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, my name is \(name)")
    }
}

struct Employee: Person {
    let name: String
}

extension Numeric {
    func squared() -> Self { // Self - whatever confirming type this method was called on
        self * self // self - current value
    }
}

let whole = 5
print(whole.squared())

struct User: Comparable {
    let name: String
}

func <(lhs: User, rhs: User) -> Bool{
    lhs.name < rhs.name
}

let user1 = User(name: "Taylor")
let user2 = User(name: "Adele")

print(user1 > user2)
print(user1 == user2)

protocol Building {
    var numOfRooms: Int { get }
    var cost: Int { get }
    var  name: String{ get }
    var agent: String { get }
    
    func printSummary()
}

struct House: Building {
    let numOfRooms: Int
    let cost: Int
    let name: String
    let agent: String
    
    func printSummary() {
        print("summary")
    }
}

var house = House(numOfRooms: 5, cost:500_000, name: "test", agent: "test agent")
