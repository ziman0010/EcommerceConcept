//
//  EMError.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 09.12.2022.
//

import Foundation

enum EMError: Error, LocalizedError {
    
    case unableToMapJSON
    case unableToGetUrl
    case unknown
    case responseError(Int)
    case urlError(URLError)
    case decodingError(DecodingError)
    
    var localizedDescription: String {
        switch self {
        case .unableToMapJSON:
            return "wrong json"
        case .unableToGetUrl:
            return "bad url"
        case .unknown:
            return "unknown error"
        case .responseError(let statusCode):
            return "response error, status code = \(statusCode)"
            
        case .urlError(let error):
            return error.localizedDescription
            
        case .decodingError(let error):
            var errorToReport = error.localizedDescription
            switch error {
            case .dataCorrupted(let context):
                let details = context.underlyingError?.localizedDescription
                ?? context.codingPath.map { $0.stringValue }.joined(separator: ".")
                errorToReport = "\(context.debugDescription) - (\(details))"
            case .keyNotFound(let key, let context):
                let details = context.underlyingError?.localizedDescription
                ?? context.codingPath.map { $0.stringValue }.joined(separator: ".")
                errorToReport = "\(context.debugDescription) (key: \(key), \(details))"
            case .typeMismatch(let type, let context), .valueNotFound(let type, let context):
                let details = context.underlyingError?.localizedDescription
                ?? context.codingPath.map { $0.stringValue }.joined(separator: ".")
                errorToReport = "\(context.debugDescription) (type: \(type), \(details))"
            @unknown default:
                break
            }
            return  errorToReport
        }
    }
}
