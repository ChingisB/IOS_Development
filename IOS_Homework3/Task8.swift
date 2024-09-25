//
//  Task8.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
//

func isPalindrome(_ text: String) -> Bool{
    // сlean text
    let correctedText = text.lowercased().filter({ char in return char.isLetter })


    // I guess reversed return something iterable instead of a plain string    
    return correctedText == String(correctedText.reversed())
}

print(isPalindrome("Аргентина манит негра"))