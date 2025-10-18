//
//  DisabilitiesMenu.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 07/02/2025.
//

import SwiftUI

struct DisabilitiesMenu: View {
    
    @State private var mentalView: Bool = false
    @State private var physicalView: Bool = false
    @State private var visualView: Bool = false
    
    @State private var getUrl: String = ""
    
    @StateObject private var viewModel = ViewModel()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        if(mentalView){
            MentalDisability(viewModel: viewModel)
        }
        else if(physicalView){
            PhysicalDisability(viewModel: viewModel)
        }
        else if(visualView){
            VisualDisability(viewModel: viewModel)
        } else {
            
            Text("Menu Disabilities")
                .font(.system(size: 50, weight: .bold, design: .default))
            
            HStack{
                Text("URL Base")
                    .font(.system(size: 24))
                TextField(
                    "Exemple : https://jsonplaceholder.typicode.com",
                    text: $getUrl
                )
                .focused($isFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                .frame(width: 600)
                .font(.system(size: 24))
                
                Button( action : {
                    viewModel.initURL(newUrl : getUrl)
                }, label : {
                    Text("Submit")
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
            Text(viewModel.url)
                .font(.system(size: 24))
            
            HStack{
                Button( action : {
                    Task{
                        mentalView = true
                    }
                }, label : {
                    ZStack{
                        Text("Mental disabilities")
                            .frame(height: 400)
                    }
                })
                
                Button( action : {
                    Task{
                        physicalView = true
                    }
                }, label : {
                    ZStack{
                        Text("Physical disabilities")
                            .frame(height: 400)
                    }
                })
                
                Button( action : {
                    Task{
                        visualView = true
                    }
                }, label : {
                    ZStack{
                        Text("Visual disabilities")
                            .frame(height: 400)
                    }
                })
            }
        }
    }
}

#Preview (windowStyle: .automatic){
    DisabilitiesMenu()
}
