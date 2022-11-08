//: ## Control Flow + Optional value

import Foundation

//: ###if else statement
let individualScores = [75, 43, 99, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


//: ###guard statement

let ages = ["ben":10, "amy": 24, "david": 15, "simon": 19]

let minimumAge = 18

for name in ages.keys {
    guard ages[name]! > minimumAge else {
        continue
    }
    
    print("\(name) is old enough to drink")
}

 
//: ###switch statement
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
}


//: ### handling optional value
var optionalName: String? = "John Appleseed"
 
//: force it with (!)
var greeting = "Hello, \(optionalName!)"
 
//: check if exist
if let name = optionalName {
    greeting = "Hello, \(name)"
}

// guard if it exists
guard let name = optionalName else {
    throw NSError()
}
greeting = "Hello, \(name)"



/*:
 Experiment:

 Given array [1...100] , return a string array answer [1 - index] where:
 answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
 answer[i] == "Fizz" if i is divisible by 3.
 answer[i] == "Buzz" if i is divisible by 5.
 answer[i] == i (as a string) if none of the above conditions are true.
 */


func fizzbuzz(_ inputArray : [Int]) -> [String]? {
    
    //your implementation
    return nil
}
