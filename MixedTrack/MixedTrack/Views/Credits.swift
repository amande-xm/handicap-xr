//
//  Credits.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 04/02/2025.
//

import SwiftUI

struct Credits: View {
    
    var body: some View {
        
        Text("Crédits")
            .font(.system(size:36))
            .fontWeight(.bold)
        VStack(alignment: .leading){
            HStack(alignment: .firstTextBaseline){
                Text("Tuteurs :")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal)
                VStack(alignment: .leading){
                    Text(" - Mme. Prabel (infirmière de l'IUT)")
                        .padding(.horizontal)
                    Text(" - M. Farrugia")
                        .padding(.horizontal)
                }
            }
            HStack(alignment: .firstTextBaseline){
                Text("Auteurs :")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal)
                VStack(alignment: .leading){
                    Text(" - Bastien Chauvet")
                        .padding(.horizontal)
                    Text(" - Noah Mercado")
                        .padding(.horizontal)
                    Text(" - Amandine Motta")
                        .padding(.horizontal)
                    Text(" - Bastiaan Vrijhof")
                        .padding(.horizontal)
                }
            }
        }
        .padding(.vertical, 30)
        
        Image(.logoBlanc)
            .resizable()
            .frame(width: 250, height: 90)
            .padding()
        
    }
}

#Preview(windowStyle: .automatic) {
    Credits()
}
