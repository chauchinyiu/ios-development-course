//: ##Why Async - Await?
//: imagine you have network call like they do multiplication as follows:

import Foundation
 
func multiply(_ input_a: Int, _ input_b: Int, completion: @escaping(Int) -> Void){
   DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ){
       completion(input_a * input_b)
   }
}

//: you have to use this function to calculate 2 x 3 x 4 x 5, how would you do it? you have to call it few times in a nested way.
multiply(2, 3) { result in
     multiply (result, 4) { result2 in
         multiply (result2, 5) { result3 in
          print(result3) // expected result = 120
        }
    }
}
       
//: ##Async - Await way
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

 
