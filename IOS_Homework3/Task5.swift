//
//  Task5.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
//

//Problem 5: Word Frequency Counter
//Write a Swi7 program that counts the frequency of each word in a given sentence. Program Specifica:ons:
//• Prompt the user to enter a sentence.
//• Count how many 9mes each word appears.
//• Display the words and their corresponding frequencies.
//Requirements:
//• Use a dic9onary to store word-frequency pairs.
//• Ignore punctua9on and make the word count case-insensi9ve.
//• Use loops to iterate through the words.

func substringToString(item: Substring) -> String{
    return item.lowercased()
}


let sentence: [String] = readLine()!.split(separator: " ").map(substringToString)

var wordCounter: [String: Int] = [:]

for word in sentence{
    let currentCount = wordCounter[word] != nil ? wordCounter[word]! : 0
    wordCounter.updateValue(currentCount + 1, forKey: word)
}


for (word, count) in wordCounter{
    print("\(word) appears \(count) times")
}

