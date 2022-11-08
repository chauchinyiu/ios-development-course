//: ## Classes , Structures and Enumerations

class SquareClass {
    var sideLength: Double

    init(sideLength: Double) {
       self.sideLength = sideLength
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }

    func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let testClass = SquareClass(sideLength: 5.0)
testClass.area()
testClass.simpleDescription()



//: Use `struct` to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they’re passed around in your code, but classes are passed by reference.

struct SquareStruct {
    var sideLength: Double

    init(sideLength: Double) {
       self.sideLength = sideLength
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }

    func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

var testStruct = SquareStruct(sideLength: 5.0)
testStruct.area()
testStruct.simpleDescription()



//: Experiment 1:  how to make the follow codes work?
testClass.sideLength = 4
testClass.area()
testStruct.sideLength = 4
testStruct.area()


enum Shape {
    case square, rectangle, circle, triangle
    func name() -> String {
        switch self {
            case .square:
                return "Square"
            case .rectangle:
                return "Rectangle"
            case .circle:
                return "Circle"
            case .triangle:
                return "Triangle"
        }
    }
}

let rectangle = Shape.rectangle
let rectangleName = rectangle.name()


//: Experiment 2: add a funciton numberOfLines() in the Shape, so that rectangle.numberOfLines() == 4


//: enum case can contain values
enum AdvanceShape{
    case rectangle(Double, Double)
    case square(Double)
    case circle(Double)
    case triangle(Double, Double)
    
    func area() -> Double {
        switch self {
            case let .square(sidelength):
                return sidelength * sidelength
            case let .rectangle(width, height):
                return width * height
            case let .circle(radius):
                return  Double.pi * radius * radius
            case let .triangle(base, height):
                return  (base * height) / 2
        }
    }
}

let triangle = AdvanceShape.triangle(5, 7.5)
print(triangle.area())


//: Experiment 3: add a funciton perimeter() in the Shape. just assume triangle is equilateral triangle,i.e. all sides are equal
