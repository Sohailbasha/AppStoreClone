//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 4/18/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
}
