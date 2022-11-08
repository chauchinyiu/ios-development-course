//: ## Protocol and Extensions

import Foundation

protocol ShapeProtocol {
     var name: String { get }
     func area() -> Double
}

//: Classes, enumerations, and structures can all adopt protocols.
 

class Square : ShapeProtocol {
     var name: String = "Square"
     var sideLength: Double = 15
     func area() -> Double {
         return sideLength * sideLength
     }
}

struct Triangle: ShapeProtocol {
    var name: String = "Triangle"
    var baseLength: Double = 15
    var height: Double = 7
    
    func area() -> Double {
        return ( baseLength * height ) / 2
    }
}

let aShape: ShapeProtocol = Triangle()
print(aShape.name + " : "+String(aShape.area()))
let bShape: ShapeProtocol = Square()
print(bShape.name + " : "+String(bShape.area()))

 
//: Use `extension` to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that’s declared elsewhere, or even to a type that you imported from a library or framework.
 

class Circle {
    var radius: Double = 10
}
//: Experiment 1: try to make this line work
let cShape: ShapeProtocol = Circle()

extension Circle: ShapeProtocol {
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    var name: String {
        return "Circle"
    }
}

 
//: Experiment 2: add perimeter() -> Doubles in ShapeProtocol, make the Circle, Square , Triangle still confrm to the protocol



