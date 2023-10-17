//
//  ContentView.swift
//  iExpense
//
//  Created by Ygor Simoura on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentNumber = 1
    @State private var numbers = [Int]()
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(numbers, id: \.self){
                        Text("Row number: \($0)")
                    }.onDelete(perform: RemoveRows)
                }
                Button(
                    "Add Number"
                ){
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("Append +")
            .toolbar{
                EditButton()
            }
        
        }
    }
    func RemoveRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
