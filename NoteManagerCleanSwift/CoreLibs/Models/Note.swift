//
//  Note.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

public struct Note: NoteType, Codable {
    public var noteId: Int
    public var title: String
    
    enum CodingKeys: String, CodingKey {
        case noteId = "id"
        case title
    }
}
