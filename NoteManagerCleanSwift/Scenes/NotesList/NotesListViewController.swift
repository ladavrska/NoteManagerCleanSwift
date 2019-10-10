//
//  NotesListViewController.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import UIKit
import SnapKit

class NotesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    private let cellReuseIdentifier = "PersonalNoteTableViewCell"
    public var topOffset: CGFloat = 90
    var activityIndicator = UIActivityIndicatorView()
    let refreshControl = UIRefreshControl()
    
    // MARK: - VIP variables
    
    private lazy var interactor = NotesListInteractor(
        presenter: NotesListPresenter(viewController: self),
        notesWorker: NotesWorker(store: NotesListStore())
    )
    
    // MARK: - View models
    
    private var viewModel: NotesListModels.FetchNotes.ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayNavigationBar(title: "My notees")
        displayTableView()
        loadData()
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    @objc public func didTapCreateNote() {
        print("didTapCreateNote")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.notes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        if let noteCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? PersonalNoteTableViewCell {
            guard let model = viewModel?.notes[indexPath.row] else { return cell }
            noteCell.bind(model)
            cell = noteCell
        }
        return cell
    }
}

// MARK: - Events

private extension NotesListViewController {
    
    func loadData() {
        interactor.fetchNotes(
            with: NotesListModels.FetchNotes.FetchRequest()
        )
    }
    
    func loadUI() {
        tableView.reloadData()
    }
    
    @objc private func refreshData(_ sender: Any) {
        loadData()
    }
}

// MARK: - VIP cycle

extension NotesListViewController: NotesListDisplayable {
    
    func displayFetchedNotes(with viewModel: NotesListModels.FetchNotes.ViewModel) {
        print("viewModel: \(viewModel)")
        self.viewModel = viewModel
        loadUI()
    }
}
