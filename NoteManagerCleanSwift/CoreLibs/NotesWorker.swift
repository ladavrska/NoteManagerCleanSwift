//
//  NotesWorker.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation
import Alamofire

class NotesWorker {
    var notesStore: NotesStoreProtocol
    
    init(notesStore: NotesStoreProtocol) {
        self.notesStore = notesStore
    }
    
    func fetchNotes(completion: @escaping (Result<[NoteType]>) -> Void) {
        notesStore.fetchNotes(completion: completion)
    }
}

protocol NotesStoreProtocol {
    var baseUrl: String? { get }
    
    func fetchNotes(completion: @escaping (Result<[NoteType]>) -> Void)
}

extension NotesStoreProtocol {
    public var baseUrl: String? {
        return Bundle.main.infoDictionary!["BaseUrl"] as? String
    }
}
