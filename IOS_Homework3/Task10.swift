//
//  Task10.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
//

// Problem 10: Unique Characters
// Write a func9on hasUniqueCharacters(_ text: String) -> Bool that determines if a string has all unique characters.
// Requirements:
// • Consider le[ers case-sensi9vely (e.g., 'A' and 'a' are different).
// • Return true if all characters are unique, false otherwise.


func hasUniqueCharacters(_ text: String) -> Bool{

    // Keep track of characters, set is faster for this
    var appeared: Set<Character> = []
    for letter in text{
        // if we see a letter that already appeared, then we return false
        if appeared.contains(letter){
            return false
        }
        appeared.insert(letter)
    }
    // If there was no case desribed inside the loop, then all characters are unique
    return true
}
