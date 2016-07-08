//: Playground - noun: a place where people can play

    // MARK: Selection Numbers
var numbers = [1,4,98,7,65,234,32,0,20,30,41,29,900,1001,21,12,21,31,13]

func selectionNumbers(Numbers numbers: [Int], analysingFunction: (number: Int) -> (Bool, Int?)) -> [Int] {
    var newNumbers: [Int] = []
    
    for number in numbers{
        switch analysingFunction(number: number) {
            case (true, let x):
                newNumbers.append(x!)
                print("Yes")
            
            default: break
        }
    }
    return newNumbers
}




selectionNumbers(Numbers: numbers, analysingFunction: {number in
    switch number {
        case var number where number % 2 == 0:
            number++
            return (true, number)
        default:
            return (false, nil)
    }
})

    //MARK: Enum & Switch
var i = 54
switch i {
    case let i:
        print(i)
}

var x: Int? = 5
x = 1
var y = x ?? 0

enum Direction: String {
    case Right = "Right"
    case Left = "Left"
}

enum Distance: Int {
    case km
    case m
}
enum Speed: Double {
    case kmH
    case mH
}

enum Action {
    case Walk(Distance)
    case Run(meters: Distance, speed: Speed)
}

var act = Action.Run(meters: .m, speed: .mH)

print(act)


print(Direction.Left.hashValue)
print(Direction.Right.rawValue)


    // MARK: Sorting String
/*
var myArray: [Int] = [5, 4, 2, 1]
    
func sorted(array: [Int], permutationFunction: (Int, Int) -> Bool) -> [Int] {
    var sortedArray: [Int] = array
    
    for var index in 0..<sortedArray.count - 1 {
        switch permutationFunction(sortedArray[index], sortedArray[index + 1]) {
            case true:
                sortedArray.insert(array[index], atIndex: index)
            index--
            default: break
        }
    }
    
    return sortedArray
}

myArray = sorted(myArray, permutationFunction: { (first, second) -> Bool in
    if second > first {
        return true
    } else {
        return false
    }
})
*/

