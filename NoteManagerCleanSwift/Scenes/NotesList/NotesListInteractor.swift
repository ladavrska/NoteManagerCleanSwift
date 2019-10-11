//
//  NotesListInteractor.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

protocol NotesListBusinessLogic {
    func fetchNotes(with request: NotesListModels.FetchNotes.FetchRequest)
}

struct NotesListInteractor {
    private let presenter: NotesListPresentationLogic
    private let notesWorker: NotesWorkerType
    
    init(presenter: NotesListPresentationLogic, notesWorker: NotesWorkerType) {
        self.presenter = presenter
        self.notesWorker = notesWorker
    }
}

extension NotesListInteractor: NotesListBusinessLogic {
    
    func fetchNotes(with request: NotesListModels.FetchNotes.FetchRequest) {
        self.presenter.showActivityIndicator()
        notesWorker.fetch {
            print("$0: \($0)")
            guard let notes = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedNotes(error: $0.error as? DataError ?? .unknownReason(nil))
            }
            print("notes: \(notes)")
            self.presenter.hideActivityIndicator()
            self.presenter.presentFetchedNotes(for: NotesListModels.FetchNotes.Response(notes: notes))
        }
    }
}
