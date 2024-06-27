//
//  ContentView.swift
//  UnitConvert
//
//  Created by Yashwanth Raj Varadharajan on 6/26/24.
// In this application we are going to perform conversion between three units of measurements - Meters, Kilometers and miles

import SwiftUI

struct ContentView: View {
    @State private var inputLength = 0.0
    
    let availableUnits = ["Miles", "Kilometers", "Meters"]
    @State private var selectedInputUnit = "Miles"
    @State private var selectedOutputUnit = "Kilometers"
    
    private var outputLength: Double {
        if selectedInputUnit == "Meters" && selectedOutputUnit == "Kilometers" {
            return (inputLength * 0.001)
        } else if selectedInputUnit == "Meters" && selectedOutputUnit == "Miles" {
            return (inputLength * 0.00062)
        } else if selectedInputUnit == "Miles" && selectedOutputUnit == "Meters" {
            return (inputLength * 1609.34)
        } else if selectedInputUnit == "Miles" && selectedOutputUnit == "Kilometers" {
            return (inputLength * 1.6)
        } else if selectedInputUnit == "Kilometers" && selectedOutputUnit == "Miles" {
            return (inputLength * 0.62)
        } else if selectedInputUnit == "Kilometers" && selectedOutputUnit == "Meters" {
            return (inputLength * 1000)
        } else if selectedInputUnit == selectedOutputUnit {
            return inputLength
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            Form{
                
                Section("INPUT") {
                    
                    Picker("Input Unit", selection: $selectedInputUnit) {
                        ForEach(availableUnits, id: \.self){ units in
                            Text(units)
                        }
                    }.pickerStyle(.segmented)
                    
                    TextField("Length", value: $inputLength, format: .number)
                }
                
                Section("OUTPUT") {
                    
                    Picker("Output Unit", selection: $selectedOutputUnit) {
                        ForEach(availableUnits, id: \.self){ units in
                            Text(units)
                        }
                    }.pickerStyle(.segmented)
                    
                    Text(outputLength, format: .number)
                }
            }.navigationTitle("Unit Convertor App")
        }
    }
}

#Preview {
    ContentView()
}
