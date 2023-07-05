//
//  ContentView.swift
//  DoF
//
//  Created by Eliseo Martelli on 05/07/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var stateController: StateController
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Sensor Type") ) {
                    Picker("Sensor", selection: $stateController.sensorType) {
                        ForEach(SensorType.allCases, id: \.self) {option in
                            Text(String(describing: option))
                        }
                    }
                }
                Section(header: Text("Hyperfocal Distance") ) {
                    Text("\(stateController.meters, specifier: "%.1f") m")
                }
                Section(header: Text("Focal Length") ) {
                    Slider(value: .convert(from: $stateController.focalLength), in: 8...85, step: 1)
                    Text("\(stateController.focalLength, specifier: "%d") mm")
                }
                Section(header: Text("Aperture") ) {
                    Picker("Aperture", selection: $stateController.fStop) {
                        ForEach(stateController.fStops, id: \.self) {value in
                            Text("f/\(String(format: "%.1f", value))")
                        }
                    }.pickerStyle(.wheel)
                }
            }.navigationTitle("Hyperfocal")
                .listStyle(.insetGrouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(StateController())
    }
}
