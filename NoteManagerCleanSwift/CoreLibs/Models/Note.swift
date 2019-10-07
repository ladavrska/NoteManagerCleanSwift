//
//  Note.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

public struct Note: NoteType, Codable {
    public var id: Int
    public var title: String
    
    init(id: Int = 0, title: String = "") {
        self.id = id
        self.title = title
    }
}
