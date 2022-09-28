import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms{
    print("Swift works on \(os)")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

var catSong = ""
for _ in 1...5{
    catSong+=" Meow!"
}

let trimmed = catSong.trimmingCharacters(in: [" "])
print(trimmed)

print(platforms[1...3])
print(platforms[1...])

// create an integer to store our roll
var roll = 0

// carry on looping until we reach 20
while roll != 20 {
    // roll a new dice and print what it was
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    if filename.contains("sophie") {
        print("sophie not allowed!")
        break
    }
    print("found picture \(filename)")
}

// fizz buzz
for i in 1...100 {
    if (i % 3) == 0 && (i % 5) == 0{
        print("FizzBuzz")
    }
    else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    }
    else {
        print("\(i)")
    }
}
