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
    
    private var tableView = UITableView()
    private let cellReuseIdentifier = "PersonalNoteTableViewCell"
    public var topOffset: CGFloat = 90
    var activityIndicator = UIActivityIndicatorView()
    
    // MARK: - VIP variables
    
    private lazy var interactor = NotesListInteractor(
        presenter: NotesListPresenter(viewController: self),
        notesWorker: NotesWorker(store: NotesListStore())
    )
    
    // MARK: - View models
    
    private var viewModel: NotesListModels.ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        loadData()
    }
    
    @objc public func didTapCreateNote() {
        print("didTapCreateNote")
    }
}

extension NotesListViewController: UITableViewDelegate {
    
    func prepareTableView() {
        tableView.rowHeight = 60.0
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(topOffset)
            maker.bottom.leading.trailing.equalToSuperview()
        }
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.swipeActionsEnabled = true
        //tableView.refreshControl = refreshControl
        registerCell()
    }
    
    func registerCell() {
        let cellClass = PersonalNoteTableViewCell.self
        let classIdentifier = String(describing: PersonalNoteTableViewCell.self)
        tableView.register(cellClass, forCellReuseIdentifier: classIdentifier)
    }
    
}

// MARK: - Events

private extension NotesListViewController {
    
    func loadData() {
        interactor.fetchNotes(
            with: NotesListModels.FetchRequest()
        )
    }
    
    func loadUI() {
        tableView.reloadData()
        print("reload table")
    }
}

extension NotesListViewController: UITableViewDataSource {
    
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

// MARK: - VIP cycle

extension NotesListViewController: NotesListDisplayable {
    
    func displayFetchedNotes(with viewModel: NotesListModels.ViewModel) {
        print("viewModel: \(viewModel)")
        self.viewModel = viewModel
        loadUI()
    }
}
