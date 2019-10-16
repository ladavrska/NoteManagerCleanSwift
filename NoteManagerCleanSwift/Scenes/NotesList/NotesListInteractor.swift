//
//  NotesListInteractor.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

protocol NotesListBusinessLogic {
    func fetchNotes(request: NotesListModels.FetchNotes.FetchRequest)
}

protocol NotesListDataStore {
    var notes: [Note]? { get }
}

class NotesListInteractor: NotesListBusinessLogic, NotesListDataStore {
        
    var presenter: NotesListPresentationLogic?
    var notesWorker = NotesWorker(notesStore: NotesStore())
    var notes: [Note]?
    
    func fetchNotes(request: NotesListModels.FetchNotes.FetchRequest) {
        self.presenter?.showActivityIndicator()
        notesWorker.fetchNotes {
            print("$0: \($0)")
            guard let notes = $0.value, $0.isSuccess else {
                self.presenter?.presentFetchedNotes(error: $0.error as? NotesStoreError ?? .cannotFetch("Cannot fetch notes"))
                return
            }
            print("notes: \(notes)")
            self.presenter?.hideActivityIndicator()
            self.presenter?.presentFetchedNotes(response: NotesListModels.FetchNotes.Response(notes: notes))
        }
    }
}
