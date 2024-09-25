//
//  Task2.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
//
//Create a func9on isPrime(_ number: Int) -> Bool that determines whether a given number is prime. Then, use this func9on to print all prime numbers between 1 and 100. Requirements:
//• Use loops and condi9onal statements within your func9on.
// • Call the func9on in your main program to display the prime numbers

func isPrime(number: Int) -> Bool{
    if(number < 2){
        return false
    }
    for i in 2..<number{
        if(number % i == 0){
            return false
        }
    }
    return true
}


for i in 1...100{
    if(isPrime(number: i)){
        print(i)
    }
}
