//
//  StateController.swift
//  DoF
//
//  Created by Eliseo Martelli on 05/07/23.
//

import Foundation



final class StarruleState: ObservableObject {
    init() {
        updateSeconds()
    }
    
    let fStops = initializeFstops(length: 27)
    
    @Published var fStop: Float = 1.0 {
        didSet {
            updateSeconds()
        }
    }
    @Published var focalLength: Int = 24 {
        didSet {
            updateSeconds()
        }
    }
    @Published var seconds: Float = 0
    
    @Published var sensorType: SensorType = .FullFrame {
        didSet {
            updateSeconds()
        }
    }
    
    func updateSeconds() {
        seconds = 500.0/(sensorType.cropFactor * Float(focalLength))
    }
    
    
    private static func initializeFstops(length: Int) -> [Float] {
        var fStops = [Float]() // Create an empty array
        
        for i in 0...length {
            fStops.append(pow(2.0, Float(i)/6))
        }
        return fStops;
    }
    
}

