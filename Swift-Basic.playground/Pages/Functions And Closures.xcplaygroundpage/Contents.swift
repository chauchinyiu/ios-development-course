//: ### Functions and Closures

import Foundation


//: ### function definition

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

print(greet(person: "Bob", day: "Tuesday"))


func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday") // more readable and simple

//: ### use of tuple
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)
print(statistics.max)
print(statistics.max + statistics.max)


func bigFunction(_ input: Int) -> Int {
    var result = input
    
    func innerFunction() {
        result += 5
    }
    
    innerFunction()
    
    return result
}
let result = bigFunction(9)

//: A function can take another function as one of its arguments.
//:
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

func minus(number: Int) -> Bool {
    return number < 0
}


var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)
hasAnyMatches(list: numbers, condition: minus)

//: Closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it’s executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces (`{}`). Use `in` to separate the arguments and return type from the body.
 
 
let sayHello = { (name: String) -> String in
    
    print( "Hey \(name)!")
    return "Hey \(name)!"
}
print("abc")
sayHello("tom")
 


//: we want to pass a function in a function
//var numbers = [20, 19, 7, 12]
func multiply3(number: Int) -> Int {
    return number * 3
}

let a = numbers.map({ (number: Int) -> Int in
    return 3 * number
})

let b = numbers.map(multiply3)

print(a==b)


//: Experiment 1:
//: Rewrite the closure to return zero for all odd numbers.
//:
numbers = [20, 19, 7, 12]
let mappedNumbers = numbers.map({ number in
    if number % 2 == 1 {
        return 0
    }
    return number * 3
    }
)

print(mappedNumbers)




let team = ["Yvonne", "Ben", "Susan", "April", "Tiffany"]
let sortedTeam = team.sorted()
print(sortedTeam)

//: now Susan is captain, and she needs to the first one in the list
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Susan" {
        return true
    } else if name2 == "Susan" {
        return false
    }

    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)


//: Experiment 2:
/*: Directly pass a closure into the sorted function i.e. sorted({ name1, name2 in //this is your implementation })
    to sort in alphabetical descending order. However, Captain name still in the first place i.e. Susan still in first of place.
 */
func captainFirstSortedDescending(name1: String, name2: String) -> Bool {
    if name1 == "Susan" {
        return true
    } else if name2 == "Susan" {
        return false
    }

    return name1 > name2
}

print(team.sorted(by: captainFirstSortedDescending))


















































