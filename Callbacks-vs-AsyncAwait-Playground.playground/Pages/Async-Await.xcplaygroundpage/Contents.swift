//: [Previous](@previous)

import Foundation
import Combine
import UIKit

func multiply(_ input_a: Int, _ input_b: Int, _ delayInSec: Double = 2) async throws -> Int{
    try await Task.sleep(nanoseconds: UInt64(delayInSec * Double(NSEC_PER_SEC)))  //some async delay
    return input_a * input_b
}

Task {
    let result = try await multiply(2,3)
    let result2 = try await multiply(4, result)
    let finalresult = try await multiply(result2, 5)
    print(finalresult)
}


////parallel
//func doSome() async throws -> [Int] {
//    do {
//        let result1 =  multiply(2,3)
//         let result2 = try multiply(4,5)
//         let result3 = try multiply(6,7)
//        let response = try await [result1, result2, result3]
//        print(response)
//        return response
//    }catch  {
//        return []
//    }
//}

 
Task {
    async let result1 = multiply(6,7,10)
    async let result2 = multiply(6,7,5)
    async let result3 = multiply(4,5,1)
    let response = try await [result1, result2, result3]
    print(response)

}
