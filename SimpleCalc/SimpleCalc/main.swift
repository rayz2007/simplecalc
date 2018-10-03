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
        let operate = getOperator(args) // Get Operator
        switch operate {
        case "count":
            return (args.count - 1)
        
        case "avg":
            if (args.count < 2) {
                return 0
            }
            var sum = 0;
            for i in 0...(args.count - 2) {
                let int1:Int! = Int(args[i])
                sum += int1
            }
            return (sum / (args.count - 1))
        
        case "fact":
            if (args.count < 2) {
                return 0
            }
            var total = 1;
            let num:Int! = Int(args[0])
            for i in 1...num! {
                total *= i
            }
            return total
        
        case "+":
            let firstNum:Int! = Int(args[0])
            let nextNum:Int! = Int(args[2])
            return firstNum + nextNum
        
        case "-":
            let firstNum:Int! = Int(args[0])
            let nextNum:Int! = Int(args[2])
            return firstNum - nextNum
        
        case "*":
            let firstNum:Int! = Int(args[0])
            let nextNum:Int! = Int(args[2])
            return firstNum * nextNum
        
        case "/":
            let firstNum:Int! = Int(args[0])
            let nextNum:Int! = Int(args[2])
            return firstNum / nextNum
        
        case "%":
            let firstNum:Int! = Int(args[0])
            let nextNum:Int! = Int(args[2])
            return firstNum % nextNum

        default:
            return 0
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    // Get operator
    private func getOperator(_ args: [String]) -> String {
        if (args[args.count - 1].count > 1) {
            return args[args.count - 1]
        } else {
            return args[args.count - 2]
        }
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

