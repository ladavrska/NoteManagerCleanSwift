//
//  NotesWorker.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

class NotesWorker {
    var notesStore: NotesStoreProtocol
    
    init(notesStore: NotesStoreProtocol) {
        self.notesStore = notesStore
    }
    
    func fetchNotes(completion: @escaping (NotesStoreResult<[NoteType]>) -> Void) {
        notesStore.fetchNotes(completion: completion)
    }
}

protocol NotesStoreProtocol {
    var baseUrl: String? { get }
    func fetchNotes(completion: @escaping NotesStoreFetchNotesCompletionHandler)
}

extension NotesStoreProtocol {
    public var baseUrl: String? {
        return Bundle.main.infoDictionary!["BaseUrl"] as? String
    }
}

typealias NotesStoreFetchNotesCompletionHandler = (NotesStoreResult<[NoteType]>) -> Void

public enum NotesStoreResult<Value> {
    case success(Value)
    case failure(Error)
    
    /// Returns `true` if the result is a success, `false` otherwise.
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    /// Returns `true` if the result is a failure, `false` otherwise.
    public var isFailure: Bool {
        return !isSuccess
    }
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

enum NotesStoreError: Equatable, Error {
    case cannotFetch(String)
    case cannotCreate(String)
    case cannotUpdate(String)
    case cannotDelete(String)
}

func == (lhs: NotesStoreError, rhs: NotesStoreError) -> Bool {
    switch (lhs, rhs) {
    case (.cannotFetch(let left), .cannotFetch(let right)) where left == right: return true
    case (.cannotCreate(let left), .cannotCreate(let right)) where left == right: return true
    case (.cannotUpdate(let left), .cannotUpdate(let right)) where left == right: return true
    case (.cannotDelete(let left), .cannotDelete(let right)) where left == right: return true
    default: return false
    }
}
