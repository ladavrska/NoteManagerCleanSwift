//
//  NotesWorker.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation
import Alamofire

public struct NotesWorker: NotesWorkerType {
    
    private let store: NotesStore
    
    public init(store: NotesStore) {
        self.store = store
    }
}

public extension NotesWorker {
    
    func fetch(completion: @escaping (Result<[NoteType]>) -> Void) {
        store.fetch(completion: completion)
    }
    
}
