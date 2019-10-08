//
//  NotesListStore.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 08/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation
import Alamofire

public struct NotesListStore: NotesStore {
    
    public init() {
        
    }
}

public extension NotesListStore {
    
    func fetch(completion: @escaping (Result<[NoteType]>) -> Void) {
        let url = "http://private-9aad-note10.apiary-mock.com/notes"
        Alamofire.request(url).responseData { response in
            let decoder = JSONDecoder()
            let result: Result<[Note]> = decoder.decodeResponse(from: response)
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
