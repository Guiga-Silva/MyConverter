//
//  ContentView.swift
//  MyConverter
//
//  Created by Guilherme Silva on 04/02/23.
//

import SwiftUI

struct ContentView: View {
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengthUnits = ["meters", "Kilometers", "feet", "yard", "mile"]
    let timeUnits = ["seconds", "minutes", "hours", "days"]
    let volumeUnits = ["milliliters", "Liters", "cups", "pints", "gallons"]
    
    let unitTypes = ["Temperature", "Length", "Time", "Volume"]
    @State private var unitTypeSelected: String = "Temperature"
    
    @State private var input: Double?
    @State private var inputUnit: String = ""
    @State private var outputUnit: String = ""
    @State private var output: Double = 0.0
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Value:", value: $input, format: .number)
                    Picker("Choose the type", selection: $unitTypeSelected) {
                        ForEach(unitTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Choose the unit", selection: $inputUnit) {
                        if (unitTypeSelected == "Temperature") {
                            ForEach(temperatureUnits.filter { $0 != outputUnit }, id: \.self) {
                                Text($0)
                            }
                        }
                        else if (unitTypeSelected == "Length") {
                            ForEach(lengthUnits.filter { $0 != outputUnit }, id: \.self) {
                                Text($0)
                            }
                        }
                        else if (unitTypeSelected == "Time") {
                            ForEach(timeUnits.filter { $0 != outputUnit }, id: \.self) {
                                Text($0)
                            }
                        }
                        else {
                            ForEach(volumeUnits.filter { $0 != outputUnit }, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                } header: {
                    Text("type the input to be converted")
                }
                
                Section {
                    Picker("Choose the output unit", selection: $outputUnit) {
                        if (unitTypeSelected == "Temperature") {
                            ForEach(temperatureUnits.reversed().filter { $0 != inputUnit }, id: \.self) {
                                Text($0)
                            }
                        }
                        else if (unitTypeSelected == "Length") {
                            ForEach(lengthUnits.reversed().filter { $0 != inputUnit }, id: \.self) {
                                Text($0)
                            }
                        }
                        else if (unitTypeSelected == "Time") {
                            ForEach(timeUnits.reversed().filter { $0 != inputUnit }, id: \.self) {
                                Text($0)
                            }
                        }
                        else {
                            ForEach(volumeUnits.reversed().filter { $0 != inputUnit }, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    Section {
                        Text(output.formatted())
                            .padding()
                            
                            
                            
                    }
                } header: {
                    Text("output")
                }
                
                
                
            }
            .navigationTitle("MyConverter")
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
