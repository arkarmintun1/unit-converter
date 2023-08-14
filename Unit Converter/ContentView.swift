//
//  ContentView.swift
//  Unit Converter
//
//  Created by Arkar Min Tun on 14/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedConversion = "Temperature"
    
    let conversions = ["Temperature", "Length", "Time", "Volume"]
    
    
    @State private var temperatureInput = 0.0
    @State private var temperatureFromUnit: UnitTemperature = .celsius
    @State private var temperatureToUnit: UnitTemperature = .celsius
    
    let temperatureConversions: [UnitTemperature] = [.celsius, .kelvin,.fahrenheit]
    
    var temperatureResult: String {
        let convertedMeasurement = Measurement(value: temperatureInput, unit: temperatureFromUnit) .converted(to: temperatureToUnit)
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        return formatter.string(from: convertedMeasurement)
    }
    
    
    @State private var lengthInput = 0.0
    @State private var lengthFromUnit: UnitLength = .meters
    @State private var lengthToUnit: UnitLength = .meters
    
    let lengthConversions: [UnitLength] = [.centimeters, .decimeters, .fathoms, .feet, .inches, .kilometers, .meters, .miles, .millimeters, .nanometers, .nauticalMiles, .yards]
    
    var lengthResult: String {
        let convertedMeasurement = Measurement(value: lengthInput, unit: lengthFromUnit) .converted(to: lengthToUnit)
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        return formatter.string(from: convertedMeasurement)
    }
    
    @State private var timeInput = 0.0
    @State private var timeFromUnit: UnitDuration = .minutes
    @State private var timeToUnit: UnitDuration = .minutes
    
    let timeConversions: [UnitDuration] = [.hours, .microseconds, .milliseconds, .minutes, .nanoseconds, .picoseconds, .seconds]
    
    var timeResult: String {
        let convertedMeasurement = Measurement(value: timeInput, unit: timeFromUnit) .converted(to: timeToUnit)
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        return formatter.string(from: convertedMeasurement)
    }
    
    @State private var volumeInput = 0.0
    @State private var volumeFromUnit: UnitVolume = .cubicMeters
    @State private var volumeToUnit: UnitVolume = .cubicMeters
    
    let volumeConversions: [UnitVolume] = [.acreFeet, .bushels, .centiliters, .cubicCentimeters, .cubicDecimeters, .cubicFeet, .cubicInches, .cubicKilometers, .cubicMeters, .cubicMiles, .cubicMillimeters, .cubicYards, .cups, .deciliters, .fluidOunces, .gallons, .kiloliters, .liters, .megaliters, .metricCups, .milliliters, .pints, .quarts, .tablespoons, .teaspoons]
    
    var volumeResult: String {
        let convertedMeasurement = Measurement(value: volumeInput, unit: volumeFromUnit) .converted(to: volumeToUnit)
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        return formatter.string(from: convertedMeasurement)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Conversion Type", selection: $selectedConversion) {
                        ForEach(conversions, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                switch selectedConversion {
                    case "Temperature":
                        Section {
                            HStack {
                                TextField(
                                    "Temperature",
                                    value: $temperatureInput,
                                    format: .number
                                )
                                Picker("", selection: $temperatureFromUnit) {
                                    ForEach(temperatureConversions, id: \.self) {
                                        Text($0.symbol)
                                    }
                                }
                            }
                        } header: {
                            Text("Temperature Conversion")
                        }
                        
                        Section {
                            Picker("Unit To", selection: $temperatureToUnit) {
                                ForEach(temperatureConversions, id: \.self) {
                                    Text($0.symbol)
                                }
                            }
                            .pickerStyle(.segmented)
                        } header: {
                            Text("Convert To")
                        }
                        
                        Section {
                            Text(temperatureResult)
                        } header: {
                            Text("Result")
                        }
                        
                    case "Length":
                        Section {
                            HStack {
                                TextField(
                                    "Length",
                                    value: $lengthInput,
                                    format: .number
                                )
                                Picker("", selection: $lengthFromUnit) {
                                    ForEach(lengthConversions, id: \.self) {
                                        Text($0.symbol)
                                    }
                                }
                            }
                        } header: {
                            Text("Length Conversion")
                        }
                        
                        Section {
                            Picker("Convert To", selection: $lengthToUnit) {
                                ForEach(lengthConversions, id: \.self) {
                                    Text($0.symbol)
                                }
                            }
                            .pickerStyle(.wheel)
                        }
                        
                        Section {
                            Text(lengthResult)
                        } header: {
                            Text("Result")
                        }
                        
                    case "Time":
                        Section {
                            HStack {
                                TextField(
                                    "Time",
                                    value: $timeInput,
                                    format: .number
                                )
                                Picker("", selection: $timeFromUnit) {
                                    ForEach(timeConversions, id: \.self) {
                                        Text($0.symbol)
                                    }
                                }
                            }
                        } header: {
                            Text("Time Conversion")
                        }
                        
                        Section {
                            Picker("Convert To", selection: $timeToUnit) {
                                ForEach(timeConversions, id: \.self) {
                                    Text($0.symbol)
                                }
                            }
                            .pickerStyle(.inline)
                        }
                        
                        Section {
                            Text(timeResult)
                        } header: {
                            Text("Result")
                        }
                        
                    case "Volume":
                        Section {
                            HStack {
                                TextField(
                                    "Volume",
                                    value: $volumeInput,
                                    format: .number
                                )
                                Picker("", selection: $volumeFromUnit) {
                                    ForEach(volumeConversions, id: \.self) {
                                        Text($0.symbol)
                                    }
                                }
                            }
                        } header: {
                            Text("Volume Conversion")
                        }
                        
                        Section {
                            Picker("Convert To", selection: $volumeToUnit) {
                                ForEach(volumeConversions, id: \.self) {
                                    Text($0.symbol)
                                }
                            }
                            .pickerStyle(.navigationLink)
                        }
                        
                        Section {
                            Text(volumeResult)
                        } header: {
                            Text("Result")
                        }
                        
                    default:
                        Section {
                            Text("HELLO")
                        } header: {
                            Text("Others")
                        }
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
