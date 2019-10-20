//
//  NotesDetailInteractor.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 19/10/2019.
//  Copyright (c) 2019 Lada Vrska. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NotesDetailBusinessLogic {
  func doSomething(request: NotesDetail.Something.Request)
}

protocol NotesDetailDataStore {
  var note: Note? { get set }
}

class NotesDetailInteractor: NotesDetailBusinessLogic, NotesDetailDataStore {
  var presenter: NotesDetailPresentationLogic?
  var worker: NotesDetailWorker?
  var note: Note?
  
  // MARK: Do something
  
  func doSomething(request: NotesDetail.Something.Request) {
    worker = NotesDetailWorker()
    worker?.doSomeWork()
    
    let response = NotesDetail.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
