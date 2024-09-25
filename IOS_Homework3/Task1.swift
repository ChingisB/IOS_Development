//
//  Task1.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
// Write a Swi7 program that prints the numbers from 1 to 100. For mul9ples of three, print “Fizz” instead of the number. For mul9ples of five, print “Buzz”. For numbers that are mul9ples of both three and five, print “FizzBuzz”.
//Requirements:
//• Use a loop to iterate through the numbers.
//• Use condi9onal statements (if, else if, else) to determine what to print.
//


// Just different cases, first one could be replaced with and statement, but same thing
for i in 1...100{
    if(i % 15 == 0){
        print("FizzBuzz")
    } else if(i % 5 == 0){
        print("Buzz")
    } else if(i % 3 == 0){
        print("Fizz")
    } else{
        print(i)
    }
}
