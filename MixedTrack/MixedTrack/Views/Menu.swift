//
//  StartMenu.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 04/02/2025.
//

import SwiftUI

struct Menu: View {
    
    @State private var demo: Bool = false
    
    var body: some View {
        
        TabView {
            
            Tab("Handicaps", systemImage: "tray.and.arrow.down.fill") {
                DisabilitiesMenu()
            }
            
            Tab("Demo", systemImage: "play.circle") {
                if(demo){
                    Demo(demo : $demo)
                } else {
                    Button( action : {
                        demo = true
                    }, label : {
                        Text("Lancer la demo")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal)
                            .background(Color(uiColor: .systemOrange))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 15.0))
                    })
                    .buttonStyle(.rounded)
                    .padding()
                }
            }
            
            Tab("Credits", systemImage: "tray.and.arrow.down.fill") {
                Credits()
            }
            
            Tab("Close", systemImage: "xmark.octagon") {
                Close()
            }
            
        }
        
    }
}

#Preview (windowStyle: .automatic){
    Menu()
}
