//
//  NotesListInterfaces.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

// View Controlelr
protocol ListProductsDisplayable: class, AppDisplayable {
    func displayFetchedNotes(with viewModel: NotesListModels.ViewModel)
}

// Interactor
protocol NotesListBusinessLogic {
    func fetchNotes(with request: NotesListModels.FetchRequest)
}

// Presenter
protocol NotesListPresentable {
    func presentFetchedNotes(for response: NotesListModels.Response)
    func presentFetchedNotes(error: DataError)
}
