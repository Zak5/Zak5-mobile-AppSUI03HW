//
//  Configurator.swift
//
//
//  Created by Konstantin Zaharev on 28.12.2021.
//

import Foundation
import ServiceLocator
import Networking

class Configurator {
    static let shared = Configurator()
    
    func register() {
        ServiceLocator.shared.addServices(service: InshortsNewsAPI())
    }
}
