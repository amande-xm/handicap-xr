//
//  PhysicalDisability.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 07/02/2025.
//

import SwiftUI

struct PhysicalDisability: View {
    
    @State private var menu = false
    let viewModel: ViewModel
    
    var body: some View {
        if(menu){
            DisabilitiesMenu()
        } else {
            
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
    }
}

#Preview (windowStyle: .automatic){
    // PhysicalDisability()
}
