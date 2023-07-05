//
//  StateController.swift
//  DoF
//
//  Created by Eliseo Martelli on 05/07/23.
//

import Foundation

enum SensorType: CaseIterable, Hashable {
    case APSC
    case FullFrame
}


final class StateController : ObservableObject {
    init() {
        updateMeters()
    }
    
    let fStops = initializeFstops(length: 27)
    
    @Published var fStop: Float = 1.0 {
        didSet {
            updateMeters()
        }
    }
    @Published var focalLength: Int = 24 {
        didSet {
            updateMeters()
        }
    }
    @Published var meters: Float = 0
    
    @Published var sensorType: SensorType = .FullFrame {
        didSet {
            updateMeters()
        }
    }
    
    let circleOfConfusion: [SensorType: Float] = [.FullFrame: 0.029, .APSC: 0.018]
    
    func updateMeters() {
        let currentCoc = circleOfConfusion[sensorType] ?? circleOfConfusion[.FullFrame]
        let fLengthSquared = Float(focalLength) * Float(focalLength)
        meters = ((fLengthSquared/(fStop * currentCoc!)) + Float(focalLength))/1000
    }
    
    
    private static func initializeFstops(length: Int) -> [Float] {
        var fStops = [Float]() // Create an empty array
        
        for i in 0...length {
            fStops.append(pow(2.0, Float(i)/6))
        }
        return fStops;
    }
    
}

