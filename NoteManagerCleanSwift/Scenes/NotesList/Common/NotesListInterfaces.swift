//
//  NotesListInterfaces.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

// View Controlelr
protocol NotesListDisplayable: class, AppDisplayable {
    func displayFetchedNotes(with viewModel: NotesListModels.FetchNotes.ViewModel)
    func displayNavigationBar(title: String)
}

// Interactor
protocol NotesListBusinessLogic {
    func fetchNotes(with request: NotesListModels.FetchNotes.FetchRequest)
}

// Presenter
protocol NotesListPresentable {
    func presentFetchedNotes(for response: NotesListModels.FetchNotes.Response)
    func presentFetchedNotes(error: DataError)
    func showActivityIndicator()
    func hideActivityIndicator()
}

// Router
protocol NotesListRoutable { 
    func showNote(for noteId: Int)
}
