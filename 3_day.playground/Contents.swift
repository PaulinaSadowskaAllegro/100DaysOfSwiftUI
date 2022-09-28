import Cocoa

var names = ["a", "b"]
let numbers = [4, 6, 13, 42]

//numbers.append(2)
names.append("c")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = [String]()
albums.append("AAA")
albums.append("BBB")

albums.contains("BBB")

print(albums.count)

albums.remove(at: 1)
print(albums)
albums.removeAll()


let cities = ["London", "Tokyo", "Rome", "Budapest"]

print(cities.sorted())
print(cities)

let employee = [
    "name": "Taylor S",
    "job": "Singer",
    "location": "NY"
]

print(employee["name"])
print(employee["name", default: "Unknown"])

var heights = [String: Int]()
heights["A"] = 222
heights["B"] = 198

let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson", "Denzel Washington"])

print(people)

var group = Set<String>()
group.insert("Tom")
group.insert("Bob")

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday

enum Weekday2 {
    case monday, tuesday, wednesday, thursday, friday
}

var day2 = Weekday2.thursday
day2 = .friday
day2 = .monday




