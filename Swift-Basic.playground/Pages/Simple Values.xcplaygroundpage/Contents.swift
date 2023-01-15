import Foundation

var greeting = "Hello, it-e!!"

print(greeting)
//: ### variable and constants
var myVariable = 42
let myConstant = 42

 
//: Experiment 1: try to change the value of myVariable and myConstant, see what problem you get?
//try it here:


//: ### Explicitly and Implictly defined variable or constant
let implicitDouble = 70.0
let explicitDouble: Double = 70
//: Experiment 2: create a number = 10 and get sum of implicitDouble + number , see what problem you get? and how you fix it?
//try it here:
let number = 10
let answer = implicitDouble + Double(number)


//: ### String operation
let label = "The width is "
let width = 94
let height = 23
let widthLabel  = label + String(width)
let heightLabel = "The height is \(height)"


//: Experiment 3: Use three double quotation marks (""") for strings that take up multiple lines and print the area of the rectangle
let areaSentence = """
\(widthLabel)
\(heightLabel)

"""
print(areaSentence)


//: ### Array
var emptyArray: [String] = []
 
var nums = [1,2,3,4,6]
nums[0]=9

print(nums)

var fruits = ["strawberries", "limes", "orange"]
fruits[1] = "grapes"
fruits.append("apple")
fruits.remove(at: 0)
print(fruits)


//: ### Dictionary
var emptyDictionary: [String: String] = [:]

var members = [
    "April": "admin",
    "Ben": "editor",
    "Carol": "accountant"
]
print(members["Ben"]!)


//: Experiment 3: please add "David" in members , and he is a "developer". and please update "April" to "marketing"

print(members)
