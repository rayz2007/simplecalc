//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if (args.contains("count")) {
            return (args.count - 1)
        } else if (args.contains("avg")) {
            if (args.count == 1) {
                return 0
            }
            var sum = 0;
            for i in 0...(args.count - 2) {
                let int1:Int! = Int(args[i])
                sum += int1
            }
            return (sum / (args.count - 1))
        } else if (args.contains("fact")) {
            if (args.count == 1) {
                return 0
            }
            var total = 1;
            let num:Int! = Int(args[0])
            for i in 1...num! {
                total *= i
            }
            return total
        } else {
            let firstNum:Int! = Int(args[0])
            let nextNum:Int! = Int(args[2])
            let operate = args[1]
            if (operate == "+") {
                return (firstNum + nextNum)
            } else if (operate == "-") {
                return (firstNum - nextNum)
            } else if (operate == "*") {
                return (firstNum * nextNum)
            } else if (operate == "/") {
                return (firstNum / nextNum)
            } else {
                return (firstNum % nextNum)
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

