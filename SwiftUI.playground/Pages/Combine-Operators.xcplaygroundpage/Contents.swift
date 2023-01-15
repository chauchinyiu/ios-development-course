//: [Previous](@previous)

import Foundation
import Combine

//: ##Operator

//:There are three groups of operators on Combine — Transforming, Filtering, and Combining Operators.
print("----------------- Transforming ----------------------")
/*:
 
 ![Transforming](transforming.png)
 
*/
_ = Publishers.Sequence(sequence: [1,2,4])
    .map { $0 * 10 }
    .flatMap { Just($0) } //Flat Map to transform elements of a publisher to a sequence for a new or existing publisher.
    .sink(receiveValue: {
        print($0)
    })


print("----------------- Filter ----------------------")
/*:
 
 ![Filter](filter.png)
 
*/
_ = Publishers.Sequence(sequence: [1,2,2,3,3,4,5,7])
    .map { $0 * 2 }
    .flatMap {  Just($0) }
    .filter { $0.isMultiple(of: 2) }
    .dropFirst(3) //omit 1,2,2
    .removeDuplicates()
    .sink(receiveValue: { value in
        print(value)
    })

print("----------------- Merge ----------------------")
/*:
 
 ![Merge](merge.png)
 
*/

let germanCities = PassthroughSubject<String, Never>()
let italianCities = PassthroughSubject<String, Never>()
let europianCities = Publishers.Merge(germanCities, italianCities) //merge two publishers together

_ = europianCities.sink(receiveValue: { city in
    print("\(city) is a city in europe")
})

germanCities.send("Munich")
germanCities.send("Berlin")
italianCities.send("Milano")
italianCities.send("Rome")

print("----------------- CombineLatest ----------------------")
/*:
 
 ![CombineLatest](combineLatest.png)
 
*/


let selectedFilter = PassthroughSubject<String, Never>()
let searchText = PassthroughSubject<String, Never>()

let combinePublisher = selectedFilter.combineLatest(searchText) {
    selectedFilter, searchText in
        "\(selectedFilter) \(searchText)"
}
_ = combinePublisher.sink { value in
    print(value)
}

selectedFilter.send("hello")
searchText.send("world")
selectedFilter.send("magic")
searchText.send("combine")
searchText.send("operator")

print("----------------- Scan ----------------------")
/*:
 
 ![Scan](scan.png)
 
*/

//:A publisher that transforms elements by applying a closure that receives its previous return value and the next element from the upstream publisher.


let range = (0...5)
_ = range.publisher
    .scan(0) { return $0 + $1 }
    .sink { print ("\($0)", terminator: " ") }

let words = ["you","try","so","hard","to","be","funny","right?"]
_ = words.publisher
    .scan("Hey,") { return $0 + " " + $1 }
    .sink { print (" \($0) \n", terminator: " ") }
