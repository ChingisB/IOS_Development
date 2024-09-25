//
//  Task3.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
//
//Write a Swi7 program that converts temperatures between Celsius, Fahrenheit, and Kelvin. Program Specifica:ons:
//• Prompt the user to input a temperature value.
//• Ask the user to specify the unit of the entered temperature (C, F, or K).
//• Convert the temperature to the other two units.
//• Display the results with appropriate labels.
//Requirements:
//• Use condi9onal statements to handle different units.
//• Use func9ons to perform the conversions.

// First of all we define 6 function that represent a possible switch to other measure Unit
func fromCelciusToKelvin(number: Int) -> String{
    return "\(number + 273) K"
}

func fromFarenheitToKelvin(number: Int) -> String{
    return "\(Int((Double(number) - 32.0) / (1.8)) + 273) K"
}

func fromKelvinToCelcius(number: Int) -> String{
    return "\(number - 273) C"
}

func fromFarenheitToCelcius(number: Int) -> String{
    return "\(Int((Double(number) - 32.0) / (1.8))) C"
}

func fromCelciusToFarenheit(number: Int) -> String{
    return "\(Int(Double(number) * 1.8 + 32.0)) F"
}

func fromKelvinToFarenheit(number: Int) -> String{
    return "\(Int(Double(number - 273) * 1.8 + 32.0)) F"
}



// Define dictionary of functions for each possible unit
let functions: Dictionary<String, [(Int) -> String]> = [
    "K": [fromKelvinToCelcius, fromKelvinToFarenheit],
    "C": [fromCelciusToFarenheit, fromCelciusToKelvin],
    "F": [fromFarenheitToKelvin, fromFarenheitToCelcius]
]


let temperatureValue: Int = Int(readLine()!)!
let unit: String = readLine()!


for function in functions[unit]!{
    print(function(temperatureValue))
}
