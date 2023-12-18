//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI

@main
struct StoreApp: App {
    @StateObject var viewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
