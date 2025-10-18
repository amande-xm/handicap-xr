//
//  ImmersiveView.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 12/12/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct Glaucome: View {

    var body: some View {
        
        // Créer une entité qui s'ancre à "la tête"
        let headEntity: Entity = {
            let headAnchor = AnchorEntity(.head)
            headAnchor.position = [0, 0, 0]
            return headAnchor
        }()
        RealityView { content in
            do {
                
                // Créer une entité à partir de la scene glaucom
                let glaucome = try await Entity(named: "Glaucome", in: realityKitContentBundle)
                
                // Ajoute l'entité créée à l'entité ancrée à la tête
                headEntity.addChild(glaucome)
                
                // L'ajouter au contenu de la reality view
                content.add(headEntity)
                
            } catch {
                print(error)
            }
        }
    }
}


#Preview(immersionStyle: .mixed) {
    Glaucome()
}
