import Foundation

var greeting = "Hello, playground"

func multiply(_ input_a: Int, _ input_b: Int, completion: @escaping(Int) -> Void){
   DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ){
       completion(input_a * input_b)
   }
}


multiply(2, 3) { result in
     multiply (result, 4) { result2 in
         multiply (result2, 5) { result3 in
          print(result3) // expected result = 120
        }
    }
}
       
 
