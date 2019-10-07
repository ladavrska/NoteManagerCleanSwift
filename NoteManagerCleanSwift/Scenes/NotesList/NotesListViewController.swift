//
//  NotesListViewController.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import UIKit
import SnapKit

class NotesListViewController: UIViewController {
    
    // MARK: - VIP variables
    
    private lazy var interactor = NotesListInteractor(
        notesWorker: NotesWorker(store: NotesGetStore())
    )
    
    // MARK: - View models
    
    private var viewModel: NotesListModels.ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
}

// MARK: - Events

private extension NotesListViewController {
    
    func loadData() {
        interactor.fetchNotes(
            with: NotesListModels.FetchRequest()
        )
    }
}
