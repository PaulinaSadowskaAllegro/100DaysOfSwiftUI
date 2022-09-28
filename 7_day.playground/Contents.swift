import Cocoa

func printTimes(number: Int){
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimes(number: 5)

func rollDice() -> Int {
    Int.random(in: 1...6)
}

rollDice()

func areLettersIdentical(s1: String, s2: String) -> Bool {
    if(s1.count != s1.count){
        return false
    }

    return s1.sorted() == s2.sorted()
}

areLettersIdentical(s1: "ABCD", s2: "DBCA")
areLettersIdentical(s1: "ABCDD", s2: "A")

func getUser() -> (firstName: String, lastName: String){
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName)")

// tuples
func getUser2() -> (firstName: String, lastName: String){
    ("Taylor", "Swift")
}

print("2 -> \(getUser2().lastName)")
print("2 -> \(getUser2().1)")

let (firstName, _) = getUser2()
print(firstName)

// hide param name

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

// isUppercase(string: "test")// error
isUppercase("test")

// add custom param name for the outside world

func printTimes2(for number: Int){
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimes(number: 4)
printTimes2(for: 3)
