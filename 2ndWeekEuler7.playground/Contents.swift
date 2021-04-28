import UIKit


extension Int {

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


var i : Int = 1
var count : Int = 1

while (count != 10000){
    i += 2
    if i.fasterIsPrime() == true && count != 10000{
       
        count += 1
    } else if count == 10000 {
        break
    } else {
        continue
    }
    
}

print(i)
