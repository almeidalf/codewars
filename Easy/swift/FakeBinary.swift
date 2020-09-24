//Given a string of digits, you should replace any digit below 5 with '0' and any digit 5 and above with '1'. 
//Return the resulting string.
import UIKit

func fakeBin(digits: String) -> String {
  var binaryResult: String = ""
  digits.forEach({ char in
    binaryResult += "\(char >= "5" ? "1" : "0")"
  })
  return binaryResult

//BEST PRACTICES
func fakeBin(digits: String) -> String {
  
  return String(digits.map { Int(String($0))! >= 5 ?  "1" : "0" })
}