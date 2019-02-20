import UIKit

// 가장 기본적인 형태의 함수. 기본형태에 파라미터 기본값을 설정해줬음
func bitnam1(num1: Int, num2: Int = 100) -> Int {
    let sum = num1 + num2
    return sum
}
bitnam1(num1: 20, num2: 30)
bitnam1(num1: 50)

func funcname(parameter1: Int, parameter2: Int = 30) -> Int {
    let calculation = parameter1 + parameter2
    return calculation
}
funcname(parameter1: 30, parameter2: 30)
funcname(parameter1: 10)

// 파라미터(입력값)는 있고 리턴값이 없는 함수
func bitnam2(name:String){
}


// 파라미터, 리턴값 둘 다 없는 함수
func bitnam3(){
}


// 파라미터를 여러개 받는 함수
func bitnam4(numbers:Int...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}
bitnam4(numbers: 1, 2, 3, 4, 5)


// ArgumentLabel은 파라미터(입력값)에 대한 설명임. 파라미터의 기능, 역할을 알 수 있음.
func calculate1(multiflyFirstNumber num1:Int, bySecondNumber num2:Int) -> Int {
    return num1 * num2
}
func calculate2(_ num1:Int, _ num2:Int) -> Int {
    // underscore 사용해서 ArgumentLabel 생략할 수 있음.
    return num1 * num2
}
calculate1(multiflyFirstNumber:1, bySecondNumber:1)
calculate2(10, 10)
// (10, 10) -> 이렇게 안에 들어있는 숫자들은 🐷'인자(Argument)'🐷라고 해줌.


class Circle {
    var radius:Double = 10.0
    // 변수의 값을 할당하지 않으면 '타입'을 넣어줘야함(Double의 경우만 이런듯. Int는 그냥 됨). 그리고 클래스에서는 프로퍼티의 초기값을 꼭 설정해줘야함. 프로퍼티 초기값 넣어주는 방법은 2가지가 있음. 위 코드처럼 변수에 바로 넣거나 기본 생성자에 넣어주면 됨.
    // 생성자에 넣어주는 방법은 밑에 주석처리한 코드임.
    let pi = 3.14
    
//    init() {
//        radius = 10.0
//    }
    init(radius:Double) {
        self.radius = radius
    }
    // 생성자는 기본 생성자 이외에 추가로 생성자를 만들 수 있음. 새로운 생성자를 만들어서 인자값을 바꿔준거임.
    // self.radius 클래스 내부에 있는 속성 var radius:Double = 10을 가르키는거임. 하얀색 radius는 새로 생성한 파라미터 네임을 가리키는거임. 변수 이름이랑 파라미터 네임이 다를때에는 self. 이거 안해줘도 됨.
    
    func area() -> Double {
        return radius * radius * pi
    }
}

let circle = Circle(radius: 10)
circle.area()

var emptyArray = [String]() // 걍 초기화 한번 해본거임

// stcut는 value type(값 타입), class는 reference type(참조타입)
// struct는 값을 할당하고 전달할 때 '복사'를 해줌. class는 값을 '참조'해서 콜해줌.
// struct는 상속 할 수 없음. class는 상속 가능함.



// 열거형 예제. 값이 한정적이고 고정적일 때, 열거형으로 정의해놓고 함수로 한정된 값을 콜해주는거임.
enum AppleOS {
    case iOS
    case macOS
    case tvOS
    case watchOS
}

var osType = AppleOS.macOS
// .ios는 AppleOS를 걍 생략해준거임.
// 타입은 AppleOS 타입으로 설정했음.

func AppleDevice(ostype:AppleOS) {
    switch ostype {
    case .iOS:
        print("iPhone")
    case .macOS:
        print("iMac")
    case .tvOS:
        print("Apple TV")
    case .watchOS:
        print("Apple Watch")
    }
}
AppleDevice(ostype: .iOS)



// 열거형은 switch문이랑 같이 사용하는 경우가 많음.
// 열거형 switch문은 defalut절을 사용하지 않아도 오류 안남.

// literal 형식(방식)으로 값을 준다 -> 값을 직접 선언해서 배열, 딕셔너리를 만들어 주는 것을 뜻함. ex) var abc = [1,2,3,4] / var 123 = ["country":"호주", "name":"김띵띵"]



var abc:String? = "404"
abc = nil
print(abc)


func manypara(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
manypara(numbers: 1,2,3,4,5)

func tripleA(Hello kim1:Int, Hi kim2:Int) -> Int {
    return kim1 * kim2
}
func tripleB(_ kim3:String, _ kim4:String) -> String {
    return kim3 + kim4
}
tripleA(Hello: 3, Hi: 3)
tripleB("안녕", "하세요")




class GoodWill{
    var howMuch = 3
    
    let howHow = 3
    
    init(howMany : Int) {
        self.howMuch = howMany
    }
    func letItGo() -> Int {
        return howMuch * howHow
    }
}

let tooMany = GoodWill(howMany: 10)
tooMany.letItGo()
print(tooMany.letItGo())
