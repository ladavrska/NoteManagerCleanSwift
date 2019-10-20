//
//  NotesListRouter.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 10/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import UIKit

protocol NotesListRoutingLogic {
  func routeToNoteDetail()
}

protocol NotesListDataPassing {
  var dataStore: NotesListDataStore? { get }
}
  
class NotesListRouter: /*NSObject,*/NotesListRoutingLogic, NotesListDataPassing {
  weak var viewController: NotesListViewController?
  var dataStore: NotesListDataStore?

  // MARK: Routing
    
  func routeToNoteDetail() {
    let destinationVC = NotesDetailViewController()
    var destinationDS = destinationVC.router!.dataStore!
    passDataToNotesDetail(source: dataStore!, destination: &destinationDS)
    
    navigateToNotesDetail(source: viewController!, destination: destinationVC)
  }
  
  // MARK: Passing data
  
  func passDataToNotesDetail(source: NotesListDataStore, destination: inout NotesDetailDataStore) {
    let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row
    destination.note = source.notes?[selectedRow!]
  }
  
  // MARK: Navigation
  
  func navigateToNotesDetail(source: NotesListViewController, destination: NotesDetailViewController) {
    source.show(destination, sender: nil)
  }
}
