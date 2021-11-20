//
//  Attanayaka_COBSCComp201P_031App.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-18.
//

import SwiftUI
import Firebase

@main
struct Attanayaka_COBSCComp201P_031App: App {
    
    //init firebase
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
