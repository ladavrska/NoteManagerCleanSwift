//
//  NotesListInteractor.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

struct NotesListInteractor {
    private let presenter: NotesListPresentable
    private let notesWorker: NotesWorkerType
    
    init(presenter: NotesListPresentable, notesWorker: NotesWorkerType) {
        self.presenter = presenter
        self.notesWorker = notesWorker
    }
}

extension NotesListInteractor: NotesListBusinessLogic {
    
    func fetchNotes(with request: NotesListModels.FetchRequest) {
        self.presenter.showActivityIndicator()
        notesWorker.fetch {
            print("$0: \($0)")
            guard let notes = $0.value, $0.isSuccess else {
                return self.presenter.presentFetchedNotes(error: $0.error as? DataError ?? .unknownReason(nil))
            }
            print("notes: \(notes)")
            self.presenter.hideActivityIndicator()
            self.presenter.presentFetchedNotes(for: NotesListModels.Response(notes: notes))
        }
    }
}
