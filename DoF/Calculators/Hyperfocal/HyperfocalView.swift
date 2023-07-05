//
//  ContentView.swift
//  DoF
//
//  Created by Eliseo Martelli on 05/07/23.
//

import SwiftUI

struct HyperfocalView: View {
    public var name = "Hyperfocal"
    public var description: String = "Get the hyperfocal distance for your lens."
    
    @ObservedObject var stateController: HyperfocalState = HyperfocalState()
    var body: some View {
        VStack {
                Text(String(format: "%.1f m", stateController.meters))
                    .font(.largeTitle)
                    .bold()
                    .padding()
            Form {
                Section(header: Text("Sensor Type") ) {
                    Picker("Sensor", selection: $stateController.sensorType) {
                        ForEach(SensorType.allCases, id: \.self) {option in
                            Text(String(describing: option))
                        }.pickerStyle(.segmented)
                    }
                }
                Section(header: Text("Focal Length") ) {
                    Picker("Focal Length", selection: $stateController.focalLength) {
                        ForEach(8...85, id: \.self) {value in
                            Text("\(value) mm")
                        }
                    }
                }
                Section(header: Text("Aperture") ) {
                    Picker("Aperture", selection: $stateController.fStop) {
                        ForEach(stateController.fStops, id: \.self) {value in
                            Text("f/\(String(format: "%.1f", value))")
                        }
                    }
                }
            }
        }
        .navigationTitle("Hyperfocal")
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HyperfocalView().environmentObject(HyperfocalState())
    }
}
