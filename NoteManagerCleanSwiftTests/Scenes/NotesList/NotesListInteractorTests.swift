//
//  NotesListInteractorTests.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 15/10/2019.
//  Copyright (c) 2019 Lada Vrska. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Note_Manager
import XCTest

class NotesListPresentationLogicSpy: NotesListPresentationLogic {
    var presentFetchedNotesCalled = false
    func presentFetchedNotes(response: NotesListModels.FetchNotes.Response) {
        presentFetchedNotesCalled = true
    }
    // not implemented:
    func presentFetchedNotes(error: NotesStoreError) {
        print("Error")
    }
    func showActivityIndicator() {
        print("showActivityIndicator")
    }
    func hideActivityIndicator() {
        print("hideActivityIndicator")
    }
}

class NotesListInteractorTests: XCTestCase {
  // MARK: Subject under test
  
  var sut: NotesListInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupNotesListInteractor()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupNotesListInteractor() {
    sut = NotesListInteractor()
  }

  func testFetchNotes() {
        
    // Given
    let notesListPresentationLogicSpy = NotesListPresentationLogicSpy()
    sut.presenter = notesListPresentationLogicSpy
    sut.notesWorker = NotesWorker(notesStore: NotesMemStore())
    let request = NotesListModels.FetchNotes.FetchRequest()
    
    // When
    sut.fetchNotes(request: request)
    
    // Then
    XCTAssert(notesListPresentationLogicSpy.presentFetchedNotesCalled, "fetchNotes() should ask the presenter to format result")
    }
}