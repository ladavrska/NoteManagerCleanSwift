//
//  JSONDecoderExtension.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 07/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import Foundation
import Alamofire

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> NotesStoreResult<T> {
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            return .failure(NotesStoreError.cannotFetch("Cannot fetch notes"))
        }
        
        do {
            let decodedData = try decode(T.self, from: responseData)
            return .success(decodedData)
        } catch {
            print(error)
            return .failure(NotesStoreError.cannotFetch("cannot fetch notes"))
        }
    }
}
