//
//  File.swift
//  
//
//  Created by Victor Melo on 12/08/20.
//

import Foundation

public struct Options {
    public var searchPathDirectory = FileManager.SearchPathDirectory.applicationSupportDirectory
    public var folder = (Bundle.main.bundleIdentifier ?? "").appending("/Default")
    public var encoder = JSONEncoder()
    public var decoder = JSONDecoder()

    public init() {}
}
