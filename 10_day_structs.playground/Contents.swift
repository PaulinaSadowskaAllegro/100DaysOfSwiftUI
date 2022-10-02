import Cocoa

// DAY 10 - structs (part 1)

struct Album {
    let title: String
    let artist: String
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")

red.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int = 26

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}


var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
// let archer causes error (cannot call mutable func on let)

archer.takeVacation(days: 3)
print(archer.vacationRemaining)

let kane = Employee(name: "Lana Kane")

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set{
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var anna = Employee2(name: "Anna")
anna.vacationTaken += 2
print(anna.vacationRemaining)

var nekon = Employee2(name: "Neko", vacationAllocated: 14)
nekon.vacationTaken += 4
nekon.vacationRemaining = 5
print(nekon.vacationAllocated)

struct Game {
    var score = 0 {
        didSet {
            print("Old value is \(oldValue)")
            print("Score is now \(score)")
        }
        willSet{
            print("Current value is \(score)")
            print("New value: \(newValue)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct Player {
    let name: String
    let number: Int
    
    init(name: String){
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player)
