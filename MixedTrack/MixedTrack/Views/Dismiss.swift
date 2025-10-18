//
//  Dismiss.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 16/12/2024.
//

import SwiftUI

struct Dismiss: View {
    
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    
    @State private var toggle: Bool = true
    @State private var textToggle : String = "Désactiver la simulation"
    
    @Binding var sim : Bool
    @Binding var DMLA: Bool
    @Binding var Glaucome: Bool
    @Binding var Schizophrenie: Bool
    
    var body: some View {
        HStack{
            Button( action : {
                Task{
                    await dismissImmersiveSpace()
                    sim = false
                    DMLA = false
                    Glaucome = false
                    Schizophrenie = false
                }
            }, label : {
                Text("Fermer la simulation")
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .background(Color(uiColor: .systemOrange))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15.0))
            })
            .buttonStyle(.rounded)
            .padding()
            
            Button( action : {
                if(toggle){
                    Task{
                        textToggle = "Activer la simulation"
                        await dismissImmersiveSpace()
                        toggle = false
                    }
                } else {
                    if(DMLA){
                        Task{
                            await openImmersiveSpace(id:"DMLA")
                        }
                    }
                    else if(Glaucome){
                        Task{
                            await openImmersiveSpace(id:"Glaucome")
                        }
                    }
                    else if(Schizophrenie){
                        Task{
                            await openImmersiveSpace(id:"Schizophrenie")
                        }
                    }
                    textToggle = "Désactiver la simulation"
                    toggle = true
                }
                
            }, label : {
                Text(textToggle)
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
        .position(x: 300, y:650)
    }
}

#Preview {
    struct Preview: View {
        @State var number = true
        var body: some View {
            Dismiss(sim: $number, DMLA: $number, Glaucome: $number, Schizophrenie: $number)
        }
    }
    return Preview()
}
