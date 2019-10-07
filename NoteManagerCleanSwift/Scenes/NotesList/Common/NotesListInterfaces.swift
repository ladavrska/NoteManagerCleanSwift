//
//  NotesListInterfaces.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

// View Controlelr
protocol ListProductsDisplayable: class {
    func displayFetchedProducts(with viewModel: NotesListModels.ViewModel)
}

// Interactor
protocol NotesListBusinessLogic {
    func fetchNotes(with request: NotesListModels.FetchRequest)
}
