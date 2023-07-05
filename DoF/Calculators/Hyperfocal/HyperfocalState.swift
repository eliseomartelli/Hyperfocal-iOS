//
//  StateController.swift
//  DoF
//
//  Created by Eliseo Martelli on 05/07/23.
//

import Foundation



final class HyperfocalState : ObservableObject {
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
    
    func updateMeters() {
        let fLengthSquared = Float(focalLength) * Float(focalLength)
        meters = ((fLengthSquared/(fStop * sensorType.circleOfConfusion)) + Float(focalLength))/1000
    }
    
    
    private static func initializeFstops(length: Int) -> [Float] {
        var fStops = [Float]() // Create an empty array
        
        for i in 0...length {
            fStops.append(pow(2.0, Float(i)/6))
        }
        return fStops;
    }
    
}

