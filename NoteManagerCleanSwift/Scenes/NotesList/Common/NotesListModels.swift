//
//  NotesListModels.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

enum NotesListModels {
    
    struct FetchRequest {
        
    }
    
    struct SearchRequest {
        let text: String
    }
    
    struct Response {
        let notes: [NoteType]
    }
    
    struct ViewModel {
        let notes: [NoteViewModel]
    }
    
    struct NoteViewModel {
        let noteId: Int
        let title: String
    }
}
