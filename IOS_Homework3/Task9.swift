//
//  Task9.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
//


// Problem 9: Simple Calculator
// Create a program that func9ons as a simple calculator. Program Features:
// • Prompt the user to enter two numbers.
// • Ask the user to choose an opera9on: addi9on (+), subtrac9on (-), mul9plica9on (*), or
// division (/).
// • Perform the calcula9on and display the result.
// • Allow the user to perform mul9ple calcula9ons un9l they choose to exit.
// Requirements:
// • Use func9ons to perform each opera9on.
// • Handle division by zero with an appropriate error message.
// • Use a loop to con9nue the program based on user input.

// Decided to move calculation to a different function
// I'd rather parse entry of ENUM, but I don't know if it's a viable option
func calculate(a: Int, b: Int, operation: String) -> Int?{
    switch(operation){
    case("+"): return a + b;
    case("-"): return a - b;
    case("*"): return a * b;
    case("/"):
        if(b != 0){
            return a / b
        }
    default:
        return nil
    }
    return nil
}

// straightforward
func promptCaluclator(){
    print("Please insert first number")
    let a = Int(readLine() ?? "0")!
    print("Please insert second number")
    let b = Int(readLine() ?? "0")!
    print("Please insert opeation from the following: +-*/")
    let operation = readLine()!
    let result = calculate(a: a, b: b, operation: operation)
    print(result!)
}


while true{
    print("Select one of the following options")
    print("1. Calculate operation")
    print("2. Exit")
    
    let command = readLine()!
    if(command == "1"){
        promptCaluclator()
        continue
    }
    if(command == "2"){
        break
    }

    print("Error, please continue later")
}