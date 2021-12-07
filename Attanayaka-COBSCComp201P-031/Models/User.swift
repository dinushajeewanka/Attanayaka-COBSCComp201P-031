//
//  User.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-24.
//

import Foundation

struct User: Codable {
    var documentId: String
    var name: String
    var email: String
    var vehicleNumber: String
    var nic: String
    var parkId: String
    var bookedStatus: Bool
}
