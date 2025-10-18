//
//  MixedTrackApp.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 12/12/2024.
//

import SwiftUI

@main
struct MixedTrackApp: App {

    var body: some Scene {
        WindowGroup {
            Menu() // Fait appel à la view ContentView
        }
        .windowStyle(.plain) // Enlève la window pour ne faire apparaître que le contenu

        // Déclaration de l'immersive space DMLA
        ImmersiveSpace(id: "DMLA") {
            DMLA()
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        
        // Déclaration de l'immersive space Glaucome
        ImmersiveSpace(id: "Glaucome"){
            Glaucome()
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        
        // Déclaration de l'immersive space Schizophrenie
        ImmersiveSpace(id: "Schizophrenie"){
            Schizophrenie()
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        
        
     }
}
