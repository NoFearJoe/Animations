//
//  Converters.swift
//  Animations iOS
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

extension Unit {
    
    var asDegrees: Unit {
        return self * 180 / .pi
    }
    
    var asRadians: Unit {
        return self * .pi / 180
    }
    
}

extension Int {
    
    var asDegrees: Unit {
        return Unit(self) * 180 / .pi
    }
    
    var asRadians: Unit {
        return Unit(self) * .pi / 180
    }
    
}
