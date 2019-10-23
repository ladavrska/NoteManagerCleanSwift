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
  func displayFetchedNotes(viewModel: NotesListModels.FetchNotes.ViewModel)
}

class NotesListViewController: UIViewController, NotesListDisplayLogic {
    
  var interactor: NotesListBusinessLogic?
  var router: NotesListRoutingLogic?
  var tableView = UITableView()
  private let cellReuseIdentifier = "PersonalNoteTableViewCell"
  public var topOffset: CGFloat = 90
  var activityIndicator = UIActivityIndicatorView()
  let refreshControl = UIRefreshControl()
  
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
    let presenter = NotesListPresenter()
    let router = NotesListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }

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
  
  // MARK: - VIP cycle
  
  var displayedNotes: [NotesListModels.FetchNotes.ViewModel.DisplayedNote] = []
  
  func displayFetchedNotes(viewModel: NotesListModels.FetchNotes.ViewModel) {
    print("viewModel: \(viewModel)")
    displayedNotes = viewModel.displayedNotes
    loadUI()
  }
}

// MARK: UITableViewDelegate

extension NotesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      router?.routeToNoteDetail()
    }
}

// MARK: UITableViewDataSource

extension NotesListViewController: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayedNotes.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var cell = UITableViewCell()
    if let noteCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? PersonalNoteTableViewCell {
      let model = displayedNotes[indexPath.row]
      noteCell.bind(model)
      cell = noteCell
    }
    return cell
  }
}

// MARK: - Events

private extension NotesListViewController {
    
  func loadData() {
     let request = NotesListModels.FetchNotes.FetchRequest()
    interactor?.fetchNotes(request: request)
  }
  
  func loadUI() {
    tableView.reloadData()
  }
  
  @objc private func refreshData(_ sender: Any) {
    loadData()
  }
}
