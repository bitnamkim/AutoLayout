import UIKit

class Success {
    var money:Int = 10
    
    init(bigMoney : Int){
        money = bigMoney
    }
    
    func makeMoney() -> Int {
        return money * 100
    }
}
let bigSuccess = Success(bigMoney: 30)
bigSuccess.makeMoney()


struct Tree {
    var oneTree:String
    var twoTree:String
    var threeTree:String
}

var cutTree = Tree(oneTree: "안녕", twoTree: "하세요", threeTree: "넹")


let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]


var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
    act1SceneCount += 1
}

}
print("There are \(act1SceneCount) scenes in act1.")


let mainArray = [1,2,3,4]

switch mainArray {
case [1,2,3,4]:
    print("It's real.")
case [2,3]:
    print("It's too much")
default:
    print("It's fake.")
}


