//
//  ErrorCases.swift
//  GlamGrooveSwiftUI
//
//  Created by User Account  on 2024-03-22.
//

import Foundation

enum ErrorCases: LocalizedError {
    
    case custom(error: Error)
    case failedToDecode
    
    var errorDescription: String? {
        
        switch self {
        case .failedToDecode:
            return "Failed to fetch data."
            
        case .custom(let error):
            return error.localizedDescription
        }
    }
}
