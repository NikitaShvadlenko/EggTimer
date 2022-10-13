//
//  EggTimerApp.swift
//  EggTimer
//
//  Created by Nikita Shvad on 12.10.2022.
//

import SwiftUI

@main
struct EggTimerApp: App {
    var body: some Scene {
        let eggTimer = EggTimer()
        WindowGroup {
            ContentView(
                viewModel: MainScreenViewModel(eggTimer: eggTimer)
            )
        }
    }
}
