//
//  NoteType.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

public protocol NoteType {
    var id: Int { get }
    var title: String { get }
}
