import Cocoa

var greeting : String = "Hello, playground"

let score : Double = 2

var teams = [String]()
var teams2 : [String] = []

teams.append("aaa")
teams2.append("bbb")

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.dark

let username: String
// print(username) // error
username = "nekon"
print(username)

let albums = ["Red", "Fearless", "Red", "Blue"]
print("There are \(albums.count) albums and \(Set(albums).count) unique albums")

