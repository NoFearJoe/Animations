//
//  Size.swift
//  Animations iOS
//
//  Created by Илья Харабет on 13.02.2018.
//  Copyright © 2018 Илья Харабет. All rights reserved.
//

import struct CoreGraphics.CGSize

struct Size {
    let width: Unit
    let height: Unit
}

extension Size {
    var ratio: Unit {
        return width / height
    }
}

extension Size {
    var cgSize: CGSize {
        return CGSize(width: width, height: height)
    }
}
