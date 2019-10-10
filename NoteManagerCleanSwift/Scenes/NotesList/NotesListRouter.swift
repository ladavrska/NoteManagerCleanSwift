//
//  NotesListRouter.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 10/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import UIKit

struct NotesListRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

extension NotesListRouter: NotesListRoutable {
    
    func showNote(for noteId: Int) {
        print("router showNote : id  \(noteId) ")
        
        let detailVC = NotesDetailViewController()
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
