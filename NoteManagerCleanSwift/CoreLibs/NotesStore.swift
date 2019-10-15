//
//  NotesStore.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 11/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation
import Alamofire

class NotesStore: NotesStoreProtocol {
    
    public init() {
        
    }
}

extension NotesStore {
    
    func fetchNotes(completion: @escaping (NotesStoreResult<[NoteType]>) -> Void) {
        guard let url = self.baseUrl else {
            return
        }
        Alamofire.request("\(url)/notes").responseData { response in
            let decoder = JSONDecoder()
            let result: NotesStoreResult<[Note]> = decoder.decodeResponse(from: response)
            switch result {
            case .success(let value):
                print("result.value: \(value)")
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
