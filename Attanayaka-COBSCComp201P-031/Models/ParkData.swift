//
//  ParkData.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-24.
//

import Foundation

struct ParkData: Codable {
    var documentId: String
    var park_Name: String
    var park_type: String
    var book: Bool
    var reserve: Bool
    var book_time: Date
}
