//
//  NotesListPresenter.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 08/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

struct NotesListPresenter: NotesListPresentable {
    private weak var viewController: ListProductsDisplayable?
    private let currencyFormatter: NumberFormatter
    
    init(viewController: ListProductsDisplayable?) {
        self.viewController = viewController
        
        self.currencyFormatter = NumberFormatter()
        self.currencyFormatter.numberStyle = .currency
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
        // Handle and parse error
        let viewModel = AppModels.Error(
            title: "Notes Error",
            message: "There was an error retrieving the notes: \(error)"
        )
        
        viewController?.display(error: viewModel)
    }
}

// MARK: - Helpers

private extension NotesListPresenter {
    
    func make(note: NoteType) -> NotesListModels.NoteViewModel {
        return NotesListModels.NoteViewModel(
            id: note.id,
            title: note.title
        )
    }
}
