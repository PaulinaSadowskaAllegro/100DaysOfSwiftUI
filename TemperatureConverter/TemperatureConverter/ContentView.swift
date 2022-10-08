//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Paulina Sadowska on 07/10/2022.
//

import SwiftUI

enum Unit {
    case Celsius
    case Fahrenheit
    case Kelvin
}
// Celsius, Fahrenheit, or Kelvin
struct ContentView: View {
    @State private var inputTemp = 0.0
    @State private var inputUnit = Unit.Celsius
    @State private var outputUnit = Unit.Celsius
    
    private let celsiusToKelvin = 273.15 // C = K + 273.15
    private let celsiusToFahrenheit = 1.8 // C = F / 1.8
    
    var outputTemp : Double {
        switch inputUnit {
        case .Celsius:
            switch outputUnit {
            case .Celsius:
                return inputTemp
            case .Fahrenheit:
                return inputTemp * celsiusToFahrenheit
            case .Kelvin:
                return inputTemp + celsiusToKelvin
            }
        case .Fahrenheit:
            switch outputUnit {
            case .Celsius:
                return inputTemp / celsiusToFahrenheit
            case .Fahrenheit:
                return inputTemp
            case .Kelvin:
                return inputTemp / celsiusToFahrenheit + celsiusToKelvin
            }
        case .Kelvin:
            switch outputUnit {
            case .Celsius:
                return inputTemp - celsiusToKelvin
            case .Fahrenheit:
                return (inputTemp - celsiusToKelvin) * celsiusToFahrenheit
            case .Kelvin:
                return inputTemp
            }
        }
    }
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
    @Binding public var selectedUnit : Unit
    var units = [Unit.Celsius, Unit.Fahrenheit, Unit.Kelvin]
    var body: some View {
        Section{
            Picker(header, selection: $selectedUnit){
                ForEach(units, id: \.self){
                    Text($0.toString())
                }
            }.pickerStyle(.segmented)
        } header: {
            Text(header)
        }
    }
}

extension Unit {
    func toString() -> String {
        switch self {
        case .Celsius:
            return "Celsius"
        case .Fahrenheit:
            return "Fahrenheit"
        case .Kelvin:
            return "Kelvin"
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
