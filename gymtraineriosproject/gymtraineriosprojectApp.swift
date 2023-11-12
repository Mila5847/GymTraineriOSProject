//
//  gymtraineriosprojectApp.swift
//  gymtraineriosproject
//
//  Created by user249179 on 10/9/23.
//

import SwiftUI
import Firebase

@main
struct gymtraineriosprojectApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
