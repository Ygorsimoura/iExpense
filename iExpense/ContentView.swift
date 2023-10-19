//
//  ContentView.swift
//  iExpense
//
//  Created by Ygor Simoura on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingSheets = false
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                    
                }
                .onDelete(perform: removeIntens)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                   showingSheets = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingSheets){
                AddView(expenses: expenses)
            }
        }
    }
    func removeIntens(at Offsets: IndexSet){
        expenses.items.remove(atOffsets: Offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
