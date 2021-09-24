//
//  LoadingCircleApp.swift
//  LoadingCircle
//
//  Created by Quentin Cornu on 24/09/2021.
//

import SwiftUI

@main
struct LoadingCircleApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingCircle()
				.loadingColor(.purple)
				.secondaryColor(.purple.opacity(0.2))
        }
    }
}
