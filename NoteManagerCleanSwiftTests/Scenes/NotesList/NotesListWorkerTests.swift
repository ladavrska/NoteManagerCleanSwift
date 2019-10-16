//
//  NotesListWorkerTests.swift
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

class NotesListWorkerTests: XCTestCase {
  // MARK: Subject under test
  
  var sut: NotesWorker!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupNotesListWorker()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupNotesListWorker() {
    sut = NotesWorker(notesStore: NotesStore())
  }
  
  func testSomething() {
    // Given
    
    // When
    
    // Then
  }
}