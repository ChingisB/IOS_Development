//
//  Task7.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
//

// Problem 7: Grade Calculator
// Create a program that processes student test scores. Program Features:
// • Accept a list of student names and their corresponding test scores.
// • Calculate the average score.
// • Determine the highest and lowest scores.
// • Display each student’s name with their score and indicate if they are above or below the
// average. Requirements:
// • Use arrays or dic9onaries to store student data.
// • Use loops to process the data.
// • Use condi9onal statements to compare scores.
var grades: [String: Int] = [:]
var lowestScore = 0
var maxScore = 0

while true{

    print("Please insert name to add grade or 0 to stop and calculate")
    let command = readLine()!

    if(command == "0"){
        break
    }

    let score = Int(readLine()!)!
    lowestScore = score
    maxScore = score

    grades[command] = score
}

var totalScore = 0

for (_, score) in grades{
    totalScore += score
    if(score > maxScore){
        maxScore = score
    }
    if(score < lowestScore){
        lowestScore = score
    }
}

let average = totalScore / grades.count

print("Average score is \(average)")
print("Highest score is \(maxScore)")
print("Lowest score is \(lowestScore)")

for (name, score) in grades{
    if score >= average{
        print("\(name) has scored \(score) which is more than average")
    } else{
        print("\(name) has scored \(score) which is less than average")
    }
}
