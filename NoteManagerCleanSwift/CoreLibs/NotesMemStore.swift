//
//  NotesMemStore.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 15/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

class NotesMemStore: NotesStoreProtocol {
    
    public init() {
        
    }
}

extension NotesMemStore {
    
    func fetchNotes(completion: @escaping (NotesStoreResult<[NoteType]>) -> Void) {
        let result: NotesStoreResult<[NoteType]> =  .success([
            Note(noteId: 1, title: "Buy groceries"),
            Note(noteId: 2, title: "Go to the cinema"),
            Note(noteId: 2, title: "Go to swimming pool")
            ])
        completion(result)
    }
}
