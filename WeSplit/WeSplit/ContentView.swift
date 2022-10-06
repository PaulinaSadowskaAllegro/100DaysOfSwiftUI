//
//  ContentView.swift
//  WeSplit
//
//  Created by Paulina Sadowska on 05/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    let currencyCode = Locale.current.currencyCode ?? "USD"
    
    var totalPerPerson: Double {
        return (checkAmount * (1 + Double(tipPercentage)/100)) / Double(numberOfPeople+2)
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(code: currencyCode)
                    ).keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                Section {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section{
                    Text(totalPerPerson, format: .currency(code: currencyCode))
                }
            }.navigationTitle("WeSplit")
             .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("DONE"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
