//
//  File.swift
//  
//
//  Created by Victor Melo on 12/08/20.
//

import Foundation

infix operator ?= : AssignmentPrecedence
func ?=<T>(lhs: inout T?, rhs: T) {
    if lhs == nil {
        lhs = rhs
    }
}
