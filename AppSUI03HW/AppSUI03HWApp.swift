//
//  AppSUI02HWApp.swift
//  
//
//  Created by Konstantin Zaharev on 19.12.2021.
//

import SwiftUI
import Navigation

@main
struct AppSUI03HWApp: App {
    init() {
        Configurator.shared.register()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationContainerView(transition: Transition.custom(.slide), content: {
                NewsView()
            })
        }
    }
}
