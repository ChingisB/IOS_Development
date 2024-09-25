//
//  Task6.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
//

//Implement a func9on fibonacci(_ n: Int) -> [Int] that returns an array containing the first n numbers of the Fibonacci sequence.
//Requirements:
//• Use loops to calculate the sequence.
//• Handle cases where n is less than or equal to zero by returning an empty array.


func fibonacci(n: Int) -> Array<Int>{
    if(n <= 0){
        return []
    }
    if(n == 1){
        return [1]
    }
    // just dynamic programming for fibonacci sequence
    var numbers = [1, 1]
    var maxIndex = 1
    for _ in 3...n{
        let newElement = numbers[maxIndex] + numbers[maxIndex - 1]
        numbers.append(newElement)
        maxIndex += 1
    }
    return numbers
}

print(fibonacci(n: 10))
