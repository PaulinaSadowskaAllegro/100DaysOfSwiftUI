//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Paulina Sadowska on 07/10/2022.
//

import SwiftUI

// Celsius, Fahrenheit, or Kelvin
struct ContentView: View {
    @State private var inputTemp = 0.0
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Celsius"
    
    private let celsiusToKelvin = 273.15 // C = K + 273.15
    private let celsiusToFahrenheit = 1.8 // C = F / 1.8
    
    var outputTemp : Double {
        if inputUnit==outputUnit {
            return inputTemp
        } else if(inputUnit=="Celsius"){
            if outputUnit == "Fahrenheit" {
                return inputTemp * celsiusToFahrenheit
            } else {
                return inputTemp - celsiusToKelvin
            }
        } else if(inputUnit=="Fahrenheit"){
            if outputUnit == "Celsius" {
                return inputTemp / celsiusToFahrenheit
            } else {
                return inputTemp / celsiusToFahrenheit - celsiusToKelvin
            }
        } else {
            if outputUnit == "Celsius" {
                return inputTemp + celsiusToKelvin
            } else {
                return inputTemp * celsiusToFahrenheit + celsiusToKelvin
            }
        }
    }
    var units = ["Celsius", "Fahrenheit", "Kelvin"]
    var body: some View {
        NavigationView {
            Form {
                UnitPicker(header: "Input unit", selectedUnit: $inputUnit)
                Section {
                    TextField(
                        "Temperature",
                        value: $inputTemp,
                        format: .number
                    ).keyboardType(.decimalPad)
                } header: {
                    Text("Input temperature")
                }
                UnitPicker(header: "Output unit", selectedUnit: $outputUnit)
                Section {
                    Text(outputTemp, format: .number)
                } header: {
                    Text("Output temperature")
                }
                
            }
        }
    }
}

struct UnitPicker: View {
    let header: String
    @Binding public var selectedUnit : String
    var units = ["Celsius", "Fahrenheit", "Kelvin"]
    var body: some View {
        Section{
            Picker(header, selection: $selectedUnit){
                ForEach(units, id: \.self){
                    Text($0)
                }
            }.pickerStyle(.segmented)
        } header: {
            Text(header)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
