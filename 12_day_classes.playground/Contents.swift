import Cocoa

// DAY 12 - classes

class Game {
    var score = 0 {
        didSet {
            print("Score now: \(score)")
        }
    }
}

var game = Game()
game.score += 10

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    final func finalMethod(){
        print("I cannot be overriden")
    }
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer : Employee {
    func work(){
        print("I'm writing code for \(hours)")
    }
    
    override func printSummary() {
        print("test")
    }
}

class Manager: Employee {
    let tired: Bool
    
    init(hours: Int, tired: Bool) {
        self.tired = tired
        super.init(hours: hours)
    }
    
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10, tired: false)
robert.work()
joseph.work()
robert.printSummary()

class User {
    var username = "Anonymous"
    
    func copy() -> User { // deep copy
        let user = User()
        user.username = username
        return user
    }
    
    deinit{
        print("All users \"\(username)\" are dead X.X")
    }
}

var user1 = User()
var userCopy = user1

userCopy.username = "changed by userCopy"
print(user1.username)

var userDeepCopy = user1.copy()

userDeepCopy.username = "changed by userDeepCopy"
print(user1.username)

user1 = User()
userCopy = User()

for i in 1...3 {
    let user = User()
    user.username = "test \(i)"
    print("User \(user.username): I'm in control!")
}

class Animal{
    let legs: Int
    
    init(legs: Int){
        self.legs = legs
    }
}

class Dog : Animal {
    
    init(){
        super.init(legs: 4)
    }
    
    func speak() {
        print("Wof! wof!")
    }
}

class Cat : Animal {
    let isTame: Bool
    
    func speak() {
        print("Meow")
    }
    
    init(isTame: Bool){
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Corgi: Dog {
    
}

class Persian: Cat {
    
}

print(Corgi().speak())

print(Persian(isTame: true).speak())

