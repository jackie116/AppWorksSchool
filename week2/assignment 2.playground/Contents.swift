//Object-Oriented Swift
//1
class Animal {
    enum Gender {
        case male
        case female
        case undefined
    }

    func eat() {
        print("I eat everything!")
    }
}

//2
class Elephant: Animal{
    override func eat() {
        print("I eat banana")
    }
}

class Tiger: Animal {
    override func eat() {
        print("I eat meat.")
    }
}

class Horse: Animal {
    override func eat() {
        print("I eat grass.")
    }
}

//3
var tiger = Tiger()
var elephant = Elephant()
var horse = Horse()

class Zoo {
    var weeklyHot: Animal
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}
let zoo = Zoo(weeklyHot: Tiger())
zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

//4
/** Struct is value type and class is reference type, and class has inheritance.*/
//5
/** Instance methods are call by instance, but type methods are call by type.*/
//6
/** Initilizer can set the default value or method run before instance of a class or struct be used. */
//7
/** Self is reference to current object (instance or type). */
//8
/** Reference type will point to same memory address, but value type only store same value but point to different memory address. */

//Enumerations and Optionals in Swift
//1
enum Gasoline: String {
    case oil92 = "92"
    case oil95 = "95"
    case oil98 = "98"
    case diesel = "diesel"
    
    func getPrice() -> String{
        switch self {
        case .oil92:
            return "Price of 92"
        case .oil95:
            return "Price of 95"
        case .oil98:
            return "Price of 98"
        case .diesel:
            return "Price of diesel"
        }
    }
}

/** enum associated value can used to store additional information, like : case oil92(price: Double)*/
//2

class Pet {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class People {
    var pet: Pet?
    
    init() {
    }
}

let Jackie = People()
Jackie.pet = Pet(name: "cat")

func guardPet(people: People) {
    guard let pet = people.pet else {
        return
    }
    print("Pet's name is \(pet.name)")
}
guardPet(people: Jackie)

let Ken = People()
Ken.pet = Pet(name: "dog")

func ifPet(people: People) {
    if let pet = people.pet {
        print("Pet's name is \(pet.name)")
    }
}

ifPet(people: Ken)

//Protocol in Swift
//1
//struct Person {
//    let name: String
//}

protocol PoliceMan {
    func arrestCriminals() -> Void
}

//2
//struct Person: PoliceMan {
//    let name: String
//    func arrestCriminals() {
//        print("Police man is the person who arrest criminals.")
//    }
//}

//3
protocol ToolMan {
    func fixComputer() -> Void
}

//4
struct Person: PoliceMan{
    let name: String
    var toolman: ToolMan
    func arrestCriminals() {
        print("Police man is the person who arrest criminals.")
    }
}

//5
struct Engineer: ToolMan {
    func fixComputer() {
        print("Tool man is the engineer who fix computer.")
    }
}

//6
var Steven: PoliceMan = Person(name: "Steven", toolman: Engineer())

//Error handling in Swift
enum GuessNumberGameError: Error {
    case wrongNumber
}
class GuessNumerGame {
    var targetNumber = 10
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        print("Guess the right number: \(targetNumber)")
    }
}

var guessnumbergame = GuessNumerGame()
do {
    try guessnumbergame.guess(number: 20)
}catch{
    print("Guess the wrong number")
}

