//
//  NotesListPresenter.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 08/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation
import UIKit

protocol NotesListPresentationLogic {
    func presentFetchedNotes(response: NotesListModels.FetchNotes.Response)
    func presentFetchedNotes(error: NotesStoreError)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class NotesListPresenter: NotesListPresentationLogic {
  weak var viewController: NotesListDisplayLogic?

    func presentFetchedNotes(response: NotesListModels.FetchNotes.Response) {
        let viewModel = NotesListModels.FetchNotes.ViewModel(
          displayedNotes: response.notes.map { make(note: $0) }
        )
        
      viewController?.displayFetchedNotes(viewModel: viewModel)
    }
    
    func presentFetchedNotes(error: NotesStoreError) {
        let viewModel = AppModels.Error(
            title: "Notes Error",
            message: "There was an error retrieving the notes: \(error)"
        )
        
        viewController?.display(error: viewModel)
    }
    
    func showActivityIndicator() {
      guard let noteListVC = viewController, let refCtrl = noteListVC.refreshControl, !refCtrl.isRefreshing else {
            return
        }
        viewController?.showActivityIndicator()
    }
    
    func hideActivityIndicator() {
        viewController?.hideActivityIndicator()
        viewController?.hideRefresControl()
    }
}

// MARK: - Helpers

private extension NotesListPresenter {
    
    func make(note: NoteType) -> NotesListModels.FetchNotes.ViewModel.DisplayedNote {
        return NotesListModels.FetchNotes.ViewModel.DisplayedNote(
            noteId: note.noteId,
            title: note.title
        )
    }
}
