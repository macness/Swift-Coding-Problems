
/*
 
 Solution by Edwin Soto
 
 Project Euler.net
 https://projecteuler.net/problem=4
 
 Largest palindrome product
 
 Problem 4
 A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
 
 Find the largest palindrome made from the product of two 3-digit numbers.
 
 */

func isPalindrome(number: Int) -> Bool{
    
    // turn the number into a string
    let numberAsString = "\(number)"
    
    // create an array of the number's characters
    let characters = Array(numberAsString.unicodeScalars)
    
    // compare the first and last character
    var tempCharacters = characters
    
    if tempCharacters.count > 1 && tempCharacters.first == tempCharacters.last {
        repeat {
            tempCharacters.removeFirst()
            tempCharacters.removeLast()
            
        } while tempCharacters.first == tempCharacters.last && tempCharacters.count > 1
    }

    
    // see if the temporary array has more than 1 character which indicates that it's not a palindrome
    if tempCharacters.count < 1 {
//        print("Is a palindrome \(tempCharacters)")
        return true
    } else {
//        print("Is not a palindrome \(tempCharacters)")
        return false
    }

}

func exponent(number:Int, power: Int) -> Int {
    
    // exponent fucntion instead of pow()
    var result = number
    for _ in 0..<power-1 {
        result = result * number
    }

    return result
}

func findLargestPlalindromeProductFor(numberOfDigits: Int) -> Int  {

    // Concept behind this fucntion is to be able to reuse it, not just find the answer to the problem
    var startingNumber = 9
    
    // get the right starting number based on the number of digits passed
    for x in 1 ..< numberOfDigits {
        
        startingNumber += 9 * (exponent(number: 10, power: x))
        
    }
    // start decreasing
    
    var firstNumber = startingNumber
    var secondNumber = startingNumber
    var product = Int()
    
    var resultsArray = [Int]()
    
    repeat {
        product = firstNumber * secondNumber

        if isPalindrome(number: product) {
            print("First Number:\(firstNumber)\nSecond Number:\(secondNumber)\nProduct:\(product)")
            resultsArray.append(product)
            
        }
        secondNumber = secondNumber - 1
        if secondNumber == 0 {
            firstNumber = firstNumber - 1
            secondNumber = firstNumber
        }
    } while firstNumber > exponent(number: 1, power: numberOfDigits)

    print("First Number:\(firstNumber), Second Number:\(secondNumber), Product:\(product)")
    resultsArray = resultsArray.sorted { $0 < $1 }
    print(resultsArray)
    return resultsArray.last!
    
}

findLargestPlalindromeProductFor(numberOfDigits: 3)


