//
//  Task4.swift
//  IOS_Homework3
//
//  Created by Чингис Богдатов on 22.09.2024.
//

/// Develop a simple shopping list applica9on.
///Program Features:
//• Allow the user to add items to the shopping list.
//• Allow the user to remove items from the shopping list.
//• Display the current shopping list.
//• Provide an op9on to exit the applica9on.
//Requirements:
//• Use an array to store the shopping list items.
//• Use loops and condi9onal statements to manage user input.
//• Display a user-friendly menu for interac9on.


// I decided to use map, since it's more suitable for deletion and etc
// Also it's a global variable, please don't beat me up
var shoppingList: [String] = []


func addItem(item: String){
    shoppingList += [item]
}

func removeItem(item: String){
    var index = shoppingList.firstIndex(of: item)
    if(index == nil){
        return
    }
    shoppingList.remove(at: index!)
}

func displayList(){
   print(shoppingList)
}


while(true){
    let input = readLine()!
    
    print("Welcome to shopping list!")
    print("Please insert number of a command")
    print("1. Display current list")
    print("2. Add item to list")
    print("3. Delete item from list")
    print("4. Exit")
    
    if(input == "1"){
        displayList()
    }
    
    if(input == "2"){
        print("Please insert name of the product")
        let item = readLine()
        addItem(item: item!)
    }
    
    if(input == "3"){
        print("Please insert name of the product")
        let item = readLine()
        removeItem(item: item!)
    }
    
    if(input == "4"){
        break
    }
}
