//
//  NotesStoreInterfaces.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation
import Alamofire

public protocol NotesStore {
    func fetch(completion: @escaping (Result<[NoteType]>) -> Void)
}

public protocol NotesWorkerType: NotesStore {
    
}
