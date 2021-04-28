import UIKit



/*
 I'm not sure weather this approach was the the right one to proceed, since this type of an application does not really need to be generic. Any feedback and ways to increase algorithmic performance is appreciated.
 */


var array : [Any] = [5,3,[[3,8],[6,12,22]]]
var array2 : [Any] = [[6,3],[3,8],[[6,12,22],[1,2]]]

func arrayMelt <T,U> (array1: [T], array2: [U]) -> [Int]{
    
 func extend(array : [Any]) -> [Int] {
     var arrayx : [Int] = []
     for a in array {              //We first try to find if there are any pure Integers inside the array
        if let a = a as? Int  {
             arrayx.append(a)
         }
         if let a = a as? [Any] {   // Then, the ones that are still a sub-array are recursively fed into the function and repeated.
             let prev = extend(array: a)
             for i in prev {
                 arrayx.append(i)
             }
         }
     }
     return arrayx
 }
    
    let array1 = extend(array: array1)
    let array2 = extend(array: array2)
    
   return array1+array2
    
    
}

let x = arrayMelt(array1: array, array2: array2)

