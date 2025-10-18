//
//  VisualDisability.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 07/02/2025.
//

import SwiftUI

struct VisualDisability: View {
    
    @State private var menu = false
    let viewModel: ViewModel
    
    @State private var simulation: Bool = false
    @State private var DMLA: Bool = false
    @State private var Glaucome: Bool = false
    
    @State private var Schizophrenie: Bool = false
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    
    var body: some View {
        if(menu){
            DisabilitiesMenu()
        } else {
            
            if(simulation){ // Si une simulation est en cours
                Dismiss(sim : $simulation, DMLA : $DMLA, Glaucome : $Glaucome, Schizophrenie: $Schizophrenie) // Appel la view Dismiss
            } else {
                
                Button( action : {
                    Task {
                        await openImmersiveSpace(id:"DMLA")
                        simulation = true
                        DMLA = true
                    }
                }, label : {
                    Text("Simuler le DMLA")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background(Color(uiColor: .systemOrange))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15.0)
                        )
                })
                .buttonStyle(.rounded)
                
                Button( action : {
                    Task {
                        await openImmersiveSpace(id:"Glaucome")
                        simulation = true
                        Glaucome = true
                    }
                }, label : {
                    Text("Simuler le Glaucome")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background(Color(uiColor: .systemOrange))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15.0)
                        )
                })
                .buttonStyle(.rounded)
                .padding()
                
                Button( action : {
                    menu = true
                }, label : {
                    Text("Retour au menu des handicaps")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background(Color(uiColor: .systemOrange))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15.0))
                })
                .buttonStyle(.rounded)
                .padding()
                
                List {
                    ForEach(viewModel.disabilities, id: \.self){
                        disability in
                        HStack {
                            Image("")
                                .frame(width: 130, height:70)
                                .background(Color.gray)
                            Text(disability.title)
                                .bold()
                        }
                    }
                }
                .navigationTitle("Mental disabilities")
                .onAppear {
                    viewModel.fetch()
                }
                
            }
            
            List {
                ForEach(viewModel.disabilities, id: \.self){
                    disability in
                    HStack {
                        Image("")
                            .frame(width: 130, height:70)
                            .background(Color.gray)
                        Text(disability.title)
                            .bold()
                    }
                }
            }
            .navigationTitle("Mental disabilities")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

#Preview (windowStyle: .automatic){
    // VisualDisability()
}
