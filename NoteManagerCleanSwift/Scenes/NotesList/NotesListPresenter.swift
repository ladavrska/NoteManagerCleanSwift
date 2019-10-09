//
//  NotesListPresenter.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 08/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation
import UIKit

struct NotesListPresenter: NotesListPresentable {
    private weak var viewController: NotesListDisplayable?
    
    init(viewController: NotesListDisplayable?) {
        self.viewController = viewController
        viewController?.displayNavigationBar(title: "My notees")
    }
}

extension NotesListPresenter {
    
    func presentFetchedNotes(for response: NotesListModels.Response) {
        let viewModel = NotesListModels.ViewModel(
            notes: response.notes.map { make(note: $0) }
        )
        
        viewController?.displayFetchedNotes(with: viewModel)
    }
    
    func presentFetchedNotes(error: DataError) {
        let viewModel = AppModels.Error(
            title: "Notes Error",
            message: "There was an error retrieving the notes: \(error)"
        )
        
        viewController?.display(error: viewModel)
    }
    
    func showActivityIndicator() {
        viewController?.showActivityIndicator()
    }
    
    func hideActivityIndicator() {
        viewController?.hideActivityIndicator()
    }
}

// MARK: - Helpers

private extension NotesListPresenter {
    
    func make(note: NoteType) -> NotesListModels.NoteViewModel {
        return NotesListModels.NoteViewModel(
            noteId: note.noteId,
            title: note.title
        )
    }
}
