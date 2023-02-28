//
//  ContentView.swift
//  MyConverter
//
//  Created by Guilherme Silva on 04/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input = 100.0
    @State private var inputUnit: Dimension = UnitLength.meters
    @State private var outputUnit: Dimension = UnitLength.centimeters
    @State var unitTypeSelected: Int = 0

    let conversions = ["Length", "Mass", "Temperature", "Time"]

    let units = [
        [UnitLength.millimeters, UnitLength.centimeters, UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.inches, UnitLength.miles, UnitLength.yards],
        [UnitMass.milligrams, UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.milliseconds, UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours]
    ]

    @FocusState private var inputIsFocused: Bool
    
    let formatter: MeasurementFormatter
    
    init() {
            formatter = MeasurementFormatter()
            formatter.unitOptions = .providedUnit
            formatter.unitStyle = .long
    }

    var output: String {

        let inputMeasurement = Measurement(value: input, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        
        return formatter.string(from: outputMeasurement)
    }


    var body: some View {

        NavigationView {
            Form {
                Section {
                    TextField("Value:", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)

                    Picker("Choose the type", selection: $unitTypeSelected) {
                        ForEach(0..<conversions.count, id: \.self) {
                            Text(conversions[$0])
                        }
                    }

                    Picker("Choose the unit", selection: $inputUnit) {
                        ForEach(units[unitTypeSelected], id: \.self) {
                            Text(formatter.string(from: $0))
                        }
                    }
                } header: {
                    Text("type the input to be converted")
                }

                Section {
                    Picker("Choose the output unit", selection: $outputUnit) {
                        ForEach(units[unitTypeSelected], id: \.self) {
                            Text(formatter.string(from: $0))
                        }
                    }

                    Section {
                        Text(output)
                    }
                } header: {
                    Text("output")
                }
            }
            .navigationTitle("MyConverter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
            .onChange(of: unitTypeSelected) {
                let unitTypes = units[$0]

                inputUnit = unitTypes[$0]
                outputUnit = unitTypes[$0]
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
