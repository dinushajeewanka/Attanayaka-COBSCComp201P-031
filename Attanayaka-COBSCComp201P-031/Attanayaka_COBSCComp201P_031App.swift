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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
