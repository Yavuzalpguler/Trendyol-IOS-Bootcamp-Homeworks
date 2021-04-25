import UIKit

import QuartzCore

func executionTimeInterval(block: () -> ()) -> CFTimeInterval {
    let start = CACurrentMediaTime()
    block();
    let end = CACurrentMediaTime()
    return end - start
}

// I have found the execution time calculation method online
// Source  : https://gist.github.com/kristopherjohnson/4201fbe86473f6edb207
extension Int {
    func conventionalIsPrime() -> Bool{
        if self == 2
        {
            return true
        }
        else if self % 2 == 0
        {
            return false
        }
        
        else if self == 1
        {
            return false
        }
        else {
            for i in 2...self - 1{
                if self % i == 0 {return false}
            }
        }
  return true }
    
    func fasterIsPrime() -> Bool{
        let x : Int = (Int(sqrt(Double(self))))
        if self == 2
        {
            return true
        }
        else if self % 2 == 0
        {
            return false
        }
        
        else if self == 1
        {
            return false
        }
        else {
            for i in 1...x{
                if self % (i+2) == 0 {return false}
                
            }
        }
  return true
    }
}

var a = 99999999999// For 67280421310721, which was the largest prime accourding to my knowledge, the conventional way took about half an hour to compute and did not end up with a result, since it was in need of making ≈ 16million times steps.
let conventionalExecutionTime = executionTimeInterval {
    let x : Bool = a.conventionalIsPrime()
    print(x)
}
let fasterExecutionTime = executionTimeInterval {
    let x : Bool = a.fasterIsPrime()
    print(x)
}
var t = (conventionalExecutionTime / fasterExecutionTime).rounded()

print("Faster algorithm executes nearly \(t) times faster then the conventional one.")
