//
//  main.swift
//  SimpleCalc
//
//  Created by iGuest on 10/10/17.
//  Copyright © 2017 yongjp94. All rights reserved.
//

import Foundation

func help() {
    
    print("")
    print("=============================================")
    print("List of Commands:")
    print("quit - Quit and shut down the calculator")
    print("help - View the list of commands.")
    print("")
    print("=============================================")
    print("List of Accepted Operators:")
    print("+ - * / %")
    print("")
    print("=============================================")
    print("Special Functions:")
    print("avg - Average of all inputs that are received.")
    print("count - Counts the number of inputs received.")
    print("fact - Calculates the factorial of one input.")
    print("")
    print("=============================================")
    print("")
    
}

print("Welcome to the SimpleCalc!")
print("")
print("You can use the simple command line interface to calculate basic expressions.")
print("enter \"help\" if you would like the list of commands")

var start = true;
while (start) {
    // Initialize Variables
    var store = [UInt]()
    var opr = ""
    var complete = false
    var oprSet = false

    print("Calculate: ")
    while (!complete) {
        // Read user's input
        let response = readLine()
        let operand = UInt.init(response!)
        
        if (response == "+" || response == "-" || response == "*" || response == "/" || response == "%") {
            opr = response!
            oprSet = true
            // find Average with "avg"
        } else if (response == "avg") {
            var total = 0.0
            for num in store {
                total += Double(num)
            }
            let count = Double(store.count)
            let result = total / count
            print(result)
            complete = true
            print("")
            // find Count with "count"
        } else if (response == "count") {
            print(store.count)
            complete = true
            print("")
            // find Factorials of an input with "fact"
        } else if (response == "fact") {
            var result:UInt = 0
            for i in 0..<(store.last!) {
                result += i
            }
            print(result)
            complete = true
            print("")
        } else if (response == "help") {
            help()
        } else if (response == "quit") {
            start = false
            print("")
            break
        } else if (operand != nil) {
            store.append(operand!)
            if (oprSet) {
                var result: UInt = 0
                if (opr == "+") {
                    result = store.first! + store.last!
                } else if (opr == "-") {
                    result = store.first! - store.last!
                } else if (opr == "*") {
                    result = store.first! * store.last!
                } else if (opr == "/") {
                    result = store.first! / store.last!
                } else {
                    result = store.first! % store.last!
                }
                print(result)
                complete = true
                print("")
            }
        } else {
            print("Don't be a fool! Use a real operator or function!!")
        }
    }
}
