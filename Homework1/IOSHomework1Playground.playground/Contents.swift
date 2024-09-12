import UIKit

let firstName = "Chingis"
let lastName = "Bogdatov"
var age = 20
let birthYear = 2004
var isStudent = true
var height = 1.80

let currentYear = 2024
age = currentYear - birthYear


let hobby = "Intellectual games"
let numberOfHobbies = 4
let favouriteNumber = 7
let isHobbyCreative = false


let hobbyDescription = if(isHobbyCreative){
    "not creative"
} else{
    "creative"
}


let currentPosition = "Android Developer"
let dreamCompany = "Reddit"
let interestingTechnologies = "IOS, Backend"

let lifeStory = """
    My name is \(firstName) \(lastName). I am \(currentYear - birthYear) years old, born in \(birthYear)
    I am currently a student. I enjoy \(hobby), which is a \(hobbyDescription).
    I have \(numberOfHobbies) in total, and my favourite number is \(favouriteNumber).
"""


let lifeGoal = "I'm an \(currentPosition). I'm interested in \(interestingTechnologies). I want to work at \(dreamCompany)"

print(lifeStory + "\n" + lifeGoal)
