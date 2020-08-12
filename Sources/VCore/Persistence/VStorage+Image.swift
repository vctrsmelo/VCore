#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

public extension VStorage {
    func save(object: Image, forKey key: String) throws {
        try commonSave(object: object as AnyObject, forKey: key, toData: {
            return try unwrapOrThrow(Utils.data(image: object), VStorageError.encodeData)
        })
    }

    func load(forKey key: String, withExpiry expiry: Expiry = .never) throws -> Image {
        return try commonLoad(forKey: key, withExpiry: expiry, fromData: { data in
            return try unwrapOrThrow(Utils.image(data: data), VStorageError.decodeData)
        })
    }
}
