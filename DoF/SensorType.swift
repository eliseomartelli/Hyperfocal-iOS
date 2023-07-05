//
//  SensorType.swift
//  DoF
//
//  Created by Eliseo Martelli on 05/07/23.
//

import Foundation

enum SensorType: CaseIterable, Hashable {
    case APSC
    case FullFrame
    case OneInch
    case FourThirds
}

extension SensorType: CustomStringConvertible {
    var description: String {
        get {
            switch self {
            case .APSC:
                return "APS-C"
            case .FullFrame:
                return "Full Frame"
            case .OneInch:
                return "1\""
            case .FourThirds:
                return "Four Thirds"
            }
        }
    }
    
    var cropFactor: Float {
        get {
            switch self {
            case .APSC:
                return 1.55
            case .FullFrame:
                return 1.0
            case .OneInch:
                return 3.0
            case .FourThirds:
                return 2.0
            }
        }
    }
    var width: Float {
        get {
            switch self {
            case .APSC:
                return 22.3
            case .FullFrame:
                return 36.0
            case .OneInch:
                return 13.2
            case .FourThirds:
                return 17.3
            }
        }
    }
    var height: Float {
        get {
            switch self {
            case .APSC:
                return 14.8
            case .FullFrame:
                return 24
            case .OneInch:
                return 8.8
            case .FourThirds:
                return 13
            }
        }
    }
    var circleOfConfusion: Float {
        get {
            let diag = sqrt((self.width * self .width) + (self.height + self.height))
            return diag/1500
        }
    }
}
