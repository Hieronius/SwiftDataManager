//
//  SwiftDataManagerApp.swift
//  SwiftDataManager
//
//  Created by Арсентий Халимовский on 04.07.2025.
//

import SwiftUI

@main
@MainActor
struct SwiftDataManagerApp: App {
	
	var compositionRoot = CompositionRoot()

    var body: some Scene {
        WindowGroup {
			compositionRoot.buildMainView()
        }
    }
}
