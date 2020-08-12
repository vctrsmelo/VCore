//
//  File.swift
//  
//
//  Created by Victor Melo on 12/08/20.
//

import Foundation

public extension VStorage {
    func save(object: Data, forKey key: String) throws {
        try commonSave(object: object as AnyObject, forKey: key, toData: { object })
    }

    func load(forKey key: String, withExpiry expiry: Expiry = .never) throws -> Data {
        return try commonLoad(forKey: key, withExpiry: expiry, fromData: { $0 })
    }
}
