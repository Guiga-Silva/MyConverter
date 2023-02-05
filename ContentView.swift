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
    
    let unitTypes = ["Temperature", "Length", "Time"]
    @State private var unitTypeSelected: String = "Temperature"
    
    @State private var input: Double = 0
    @State private var inputUnit: String = ""
    @State private var outputUnit: String = ""
    
    var output: Double {
        
        if (unitTypeSelected == "Temperature") {
            if (inputUnit == "Celsius") {
                
                let celsius = Measurement(value: input, unit: UnitTemperature.celsius)
                
                if (outputUnit == "Kelvin") {
                    let kelvin = celsius.converted(to: .kelvin)
                    return kelvin.value
                }
                else {
                    let fahrenheit = celsius.converted(to: .fahrenheit)
                    return fahrenheit.value
                }
                    
            }
            else if (inputUnit == "Kelvin") {
                let kelvin = Measurement(value: input, unit: UnitTemperature.kelvin)
                
                if (outputUnit == "Celsius") {
                    let celsius = kelvin.converted(to: .celsius)
                    return celsius.value
                }
                else {
                    let fahrenheit = kelvin.converted(to: .fahrenheit)
                    return fahrenheit.value
                }
            }
            else {
                let fahrenheit = Measurement(value: input, unit: UnitTemperature.fahrenheit)
                
                if (outputUnit == "Celsius") {
                    let celsius = fahrenheit.converted(to: .celsius)
                    return celsius.value
                }
                else {
                    let kelvin = fahrenheit.converted(to: .kelvin)
                    return kelvin.value
                }
            }
        }
        else if (unitTypeSelected == "Length"){
            if (inputUnit == "meters") {
                
                let meters = Measurement(value: input, unit: UnitLength.meters)
                
                if (outputUnit == "Kilometers") {
                    let km = meters.converted(to: .kilometers)
                    return km.value
                }
                else if (outputUnit == "feet") {
                    let feet = meters.converted(to: .feet)
                    return feet.value
                }
                else if (outputUnit == "yards") {
                    let yards = meters.converted(to: .yards)
                    return yards.value
                }
                else {
                    let miles = meters.converted(to: .miles)
                    return miles.value
                }
                
            }
            else if (inputUnit == "Kilometers") {
                
                let km = Measurement(value: input, unit: UnitLength.kilometers)
                
                if (outputUnit == "meters") {
                    let meters = km.converted(to: .meters)
                    return meters.value
                }
                else if (outputUnit == "feet") {
                    let feet = km.converted(to: .feet)
                    return feet.value
                }
                else if (outputUnit == "yards") {
                    let yards = km.converted(to: .yards)
                    return yards.value
                }
                else {
                    let miles = km.converted(to: .miles)
                    return miles.value
                }
                
            }
            else if (inputUnit == "feet") {
                
                let feet = Measurement(value: input, unit: UnitLength.feet)
                
                if (outputUnit == "meters") {
                    let meters = feet.converted(to: .meters)
                    return meters.value
                }
                else if (outputUnit == "Kilometers") {
                    let km = feet.converted(to: .kilometers)
                    return km.value
                }
                else if (outputUnit == "yards") {
                    let yards = feet.converted(to: .yards)
                    return yards.value
                }
                else {
                    let miles = feet.converted(to: .miles)
                    return miles.value
                }
                
            }
            else if (inputUnit == "yards") {
                
                let yards = Measurement(value: input, unit: UnitLength.yards)
                
                if (outputUnit == "meters") {
                    let meters = yards.converted(to: .meters)
                    return meters.value
                }
                else if (outputUnit == "Kilometers") {
                    let km = yards.converted(to: .kilometers)
                    return km.value
                }
                else if (outputUnit == "feet") {
                    let feet = yards.converted(to: .feet)
                    return feet.value
                }
                else {
                    let miles = yards.converted(to: .miles)
                    return miles.value
                }
                
            }
            else {
                let miles = Measurement(value: input, unit: UnitLength.miles)
                
                if (outputUnit == "meters") {
                    let meters = miles.converted(to: .meters)
                    return meters.value
                }
                else if (outputUnit == "Kilometers") {
                    let km = miles.converted(to: .kilometers)
                    return km.value
                }
                else if (outputUnit == "feet") {
                    let feet = miles.converted(to: .feet)
                    return feet.value
                }
                else {
                    let yards = miles.converted(to: .yards)
                    return yards.value
                }
            }
        }
        else if (unitTypeSelected == "Time"){
            if (inputUnit == "seconds") {
                
                let seconds = Measurement(value: input, unit: UnitDuration.seconds)
                
                if (outputUnit == "minutes") {
                    let minutes = seconds.converted(to: .minutes)
                    return minutes.value
                }
                else if (outputUnit == "hours") {
                    let hours = seconds.converted(to: .hours)
                    return hours.value
                }
                else if (outputUnit == "days") {
                    let days = seconds.converted(to: .hours)
                    return days.value / 24
                }
            }
            else if (inputUnit == "minutes") {
                
                let minutes = Measurement(value: input, unit: UnitDuration.minutes)
                
                if (outputUnit == "seconds") {
                    let seconds = minutes.converted(to: .seconds)
                    return seconds.value
                }
                else if (outputUnit == "hours") {
                    let hours = minutes.converted(to: .hours)
                    return hours.value
                }
                else if (outputUnit == "days") {
                    let days = minutes.converted(to: .hours)
                    return days.value / 24
                }
            }
            else if (inputUnit == "hours") {
                
                let hours = Measurement(value: input, unit: UnitDuration.hours)
                
                if (outputUnit == "seconds") {
                    let seconds = hours.converted(to: .seconds)
                    return seconds.value
                }
                else if (outputUnit == "minutes") {
                    let minutes = hours.converted(to: .minutes)
                    return minutes.value
                }
                else if (outputUnit == "days") {
                    return hours.value / 24
                }
            }
            else if (inputUnit == "days") {
                
                let days = Measurement(value: input * 24, unit: UnitDuration.hours)
                
                if (outputUnit == "seconds") {
                    let seconds = days.converted(to: .seconds)
                    return seconds.value
                }
                else if (outputUnit == "minutes") {
                    let minutes = days.converted(to: .minutes)
                    return minutes.value
                }
                else if (outputUnit == "hours") {
                    let hours = days
                    return hours.value
                }
            }
        }
        return 0
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Value:", value: $input, format: .number)
                        .keyboardType(.decimalPad)
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
