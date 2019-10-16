//
//  NotesListViewController.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import UIKit
import SnapKit

protocol NotesListDisplayLogic: class, AppDisplayable {
    func displayFetchedNotes(with viewModel: NotesListModels.FetchNotes.ViewModel)
    func displayNavigationBar(title: String)
}

class NotesListViewController: UIViewController {
    
    var interactor: NotesListBusinessLogic?
    //var router: (NSObjectProtocol & ListOrdersRoutingLogic & ListOrdersDataPassing)?
    
    var tableView = UITableView()
    private let cellReuseIdentifier = "PersonalNoteTableViewCell"
    public var topOffset: CGFloat = 90
    var activityIndicator = UIActivityIndicatorView()
    let refreshControl = UIRefreshControl()
    
    private lazy var router: NotesListRoutingLogic = NotesListRouter(viewController: self)
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = NotesListInteractor()
        let presenter = NotesListPresenter(viewController: self)   
        let router = NotesListRouter(viewController: self) 
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        //presenter.viewController = viewController
        //router.viewController = viewController
        //router.dataStore = interactor
    }
    
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
}

extension NotesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel?.notes[indexPath.row] else { return }
        router.showNote(for: model.noteId)
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

// MARK: - Events

private extension NotesListViewController {
    
    func loadData() {
        interactor?.fetchNotes(request: NotesListModels.FetchNotes.FetchRequest())
    }
    
    func loadUI() {
        tableView.reloadData()
    }
    
    @objc private func refreshData(_ sender: Any) {
        loadData()
    }
}

// MARK: - VIP cycle

extension NotesListViewController: NotesListDisplayLogic {
    
    func displayFetchedNotes(with viewModel: NotesListModels.FetchNotes.ViewModel) {
        print("viewModel: \(viewModel)")
        self.viewModel = viewModel
        loadUI()
    }
}
