//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ygor Simoura on 18/10/23.
//

import Foundation

//we uses the Identifiable and UUID to ensure that each list is unic. And now we can remove the "id:" from the ForEach
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount : Double
}
