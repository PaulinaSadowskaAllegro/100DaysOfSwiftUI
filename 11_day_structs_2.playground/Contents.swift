import Cocoa

// DAY 11 - structs 2

struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 1000)
account.withdraw(amount: 100)
print(account)

let success = account.withdraw(amount: 2000)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// private, fileprivate, public
// private(set)

print(account.funds)
// account.funds+=100 // error

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}
School.add(student: "Taylor")
print(School.studentCount)

let newSchool = School()
//newSchool.add(student: "Mike")
// self - current value
// Self (Uppercased) - current type

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

print(Employee.example)

// CHECKPOINT 6

struct Car {
    let model: String
    let numOfSeats: Int
    private(set) var gear: Int = 1
    
    init(model: String, numOfSeats: Int){
        self.model = model
        self.numOfSeats = numOfSeats
    }
    
    mutating func changeGear(gear: Int){
        self.gear = gear
    }
}

var car = Car(model: "test", numOfSeats: 4)
car.changeGear(gear: 3)
print(car.gear)

