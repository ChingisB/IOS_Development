//
//Problem 9: Simple Calculator
//Create a program that func9ons as a simple calculator. Program Features:
//• Prompt the user to enter two numbers.
//• Ask the user to choose an opera9on: addi9on (+), subtrac9on (-), mul9plica9on (*), or
//division (/).
//• Perform the calcula9on and display the result.
//• Allow the user to perform mul9ple calcula9ons un9l they choose to exit.
//Requirements:
//• Use func9ons to perform each opera9on.
//• Handle division by zero with an appropriate error message.
//• Use a loop to con9nue the program based on user input.


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

for (name, score) in grades{
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
        print("\(name) has scored more than average")
    } else{
        print("\(name) has scored less than average")
    }
}
