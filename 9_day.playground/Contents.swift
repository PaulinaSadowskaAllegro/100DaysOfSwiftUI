import Cocoa

// DAY 9 - CLOSURES

func greetUser() {
    print("Hi there!")
}

greetUser()

var greet: () -> Void = greetUser

greet()


let greet2 = {
    print("Hi there!")
}

greet2()

let getHello = { (name: String) -> String in
    "Hello \(name)"
}

print(getHello("test"))

let sayHello = { (name: String) in
    print("Hello \(name)")
}

sayHello("test2")

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if(name1 == "Suzanne"){
        return true
    } else if (name2 == "Suzanne"){
        return false
    }
    
    return name1 < name2
}

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted(by: captainFirstSorted)
print(sortedTeam)

let sortedTeam2 = team.sorted { name1, name2 in
    if(name1 == "Suzanne"){
        return true
    } else if (name2 == "Suzanne"){
        return false
    }
    
    return name1 < name2
}
print(sortedTeam2)

var cleanRoom = { (name: String) in
    print("I'm cleaning the \(name).")
}
cleanRoom("kitchen")

let sortedTeam3 = team.sorted {
    if($0 == "Suzanne"){
        return true
    } else if ($1 == "Suzanne"){
        return false
    }
    
    return $0 < $1
}
print(sortedTeam3)

let revertedSort = team.sorted{ $0 > $1 }
print(revertedSort)

let filteredTeam = team.filter{ $0.starts(with: "T") }
print(filteredTeam)

print(team.map{$0.uppercased()})

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0...size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let result = makeArray(size: 4) {
    Int.random(in: 1...20)
}

print(result)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    first()
    print("first")
    second()
    print("second")
    third()
    print("third")
}

doImportantWork {
    print("1")
} second: {
    print("2")
} third: {
    print("3")
}

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers
    .filter { !$0.isMultiple(of: 2)}
    .sorted{ $0 < $1 }
    .map { "\($0) is a lucky number!"}
    .forEach{
        print($0)
    }


