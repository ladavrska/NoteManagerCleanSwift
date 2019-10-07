//
//  DataError.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

public enum DataError: Error {
    case urlError(reason: String)
    case serializationFailure(reason: String)
    case parseFailure(reason: String)
    case networkFailure(reason: String)
}
