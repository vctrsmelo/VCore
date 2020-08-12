//
//  File.swift
//  
//
//  Created by Victor Melo on 12/08/20.
//

import SwiftUI

struct Device {
    
    enum DeviceType {
        case mac, iPad, iPhone
    }
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) static private var horizontalSizeClass
    #endif
    
    static var isPad: Bool {
        return getType() == .iPad
    }
    
    static var isPhone: Bool {
        getType() == .iPhone
    }
    
    static var isMac: Bool {
        getType() == .mac
    }
    
    static func getType() -> DeviceType {
        #if os(iOS)
        return (horizontalSizeClass == .compact) ? .iPhone : .iPad
        #else
        return .mac
        #endif
    }
}
