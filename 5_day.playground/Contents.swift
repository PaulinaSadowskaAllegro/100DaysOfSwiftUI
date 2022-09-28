import Cocoa

var greeting = "Hello, playground"

let score = 65

if(score > 80){
    print("good")
} else if score > 60 {
    print("not bad")
} else {
    print("terrible")
}

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.snow

switch(forecast){
case .sun:
    print("sunny!")
case .rain:
    print("rainy")
case .wind:
    print("windy")
case .snow:
    print("snowy")
default:
    print("something went wrong")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

let age = 16
let canVote = age > 18 ? "Y" : "N"

