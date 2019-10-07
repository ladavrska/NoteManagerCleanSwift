//
//  NotesListInteractor.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

struct NotesListInteractor {
    private let notesWorker: NotesWorkerType
    
    init(notesWorker: NotesWorkerType) {
        self.notesWorker = notesWorker
    }
}

extension NotesListInteractor: NotesListBusinessLogic {
    
    func fetchNotes(with request: NotesListModels.FetchRequest) {
        
        notesWorker.fetch {
            print("$0: \($0)")
            guard let notes = $0.value, $0.isSuccess else {
                return
            }
            print("value: \(notes)")            
        }
    }
}
