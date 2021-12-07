//
//  ParkData.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-24.
//

import Foundation

struct ParkData: Identifiable, Codable { 
        var id: String
        var number: Int
        var isVIP: Bool
        var isAvailable: Bool
        var bookedTime: String
        var bookedUser: String
        var bookedVehicle: String
}
