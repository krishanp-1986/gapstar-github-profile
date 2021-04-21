//
//  JsonUtils.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import Foundation

struct JsonUtils {
    public static func convertJsonIntoDecodable<T>(_ type: T.Type,
                                                   fileName: String,
                                                   bundle: Bundle = Bundle.main,
                                                   inDirectory: String? = nil) -> T? where T: Decodable {
        guard let filePath = bundle.path(forResource: fileName, ofType: "json", inDirectory: inDirectory) else {
            return nil
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
            return nil
        }
        
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
