//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import Foundation

public extension Encodable {
    func encoded(using encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        try encoder.encode(self)
    }

    func asDictionary(using encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoded(using: encoder)
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        guard let dictionary = jsonObject as? [String: Any] else {
            throw EncodingError.invalidValue(jsonObject, EncodingError.Context(codingPath: [], debugDescription: "Object is not of type [String: Any]"))
        }

        return dictionary
    }
}
