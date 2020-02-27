import Foundation

//定义优先级组
precedencegroup ForwardApplication {
    //运算符的左边优先级高
    associativity: left
}

//自定义操作符
infix operator |>: ForwardApplication

//｜>运算符的定义
public func |> <A,B>(x: A, f:(A) -> B) -> B {
    return f(x)
}
