//
//  NotesListModels.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation

enum NotesListModels {
    
  enum FetchNotes {
  
    struct FetchRequest {
      
    }
  
    struct Response {
      let notes: [NoteType]
    }
    
    struct ViewModel {
      struct DisplayedNote {
        var noteId: Int
        var title: String
      }
      var displayedNotes: [DisplayedNote]
    }
  }
}
