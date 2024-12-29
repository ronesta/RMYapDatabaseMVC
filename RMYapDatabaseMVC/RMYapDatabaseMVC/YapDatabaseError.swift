//
//  YapDatabaseError.swift
//  RMYapDatabaseMVC
//
//  Created by Ибрагим Габибли on 29.12.2024.
//

import Foundation

enum YapDatabaseError: Error {
    case databaseInitializationFailed
    case encodingFailed(Error)
    case decodingFailed(Error)
}
