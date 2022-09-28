import Cocoa

var gameOver = true
gameOver.toggle()
print(gameOver)

print(!gameOver)
print(gameOver)

let name = "Neko"
let age = 7

let message = "Meow, my name is \(name) and I'm \(age) years old"

let tempCelsius = 12
let tempFahrenheit = (tempCelsius * 9) / 5 + 32
print("Temperature is \(tempCelsius)C (\(tempFahrenheit)F)")
