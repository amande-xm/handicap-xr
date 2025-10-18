//
//  Demo.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 14/01/2025.
//

import SwiftUI

struct Demo: View {

    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    @Binding var demo: Bool

    @State private var phrase: String = ""
    @State private var finPresentationApplication: Bool = false
    @State private var finPresentationDMLA: Bool = false
    @State private var finPresentationGlaucome: Bool = false
    @State private var finPresentationSchizophrenie: Bool = false
    @State private var simulation: Bool = false
    @State private var simulationDMLA: Bool = false
    @State private var simulationGlaucome: Bool = false
    @State private var simulationSchizophrenie: Bool = false
    @State private var current: Int = 0

    var body: some View {
        if !simulation {
            if current == 0 && !finPresentationApplication {
                Text(phrase)
                    .font(.largeTitle)
                    .frame(maxWidth: 650, alignment: .center)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        displaySequentialTexts(texts: "Cette application a pour but de simuler certains handicaps de la vie réelle/Pour ce faire nous avons utilisé XCode et SwiftUI/Vous allez expérimenter 3 handicaps visuels :/Le DMLA/Le glaucome/La schizophrénie", delay: 6) {
                            finPresentationApplication = true
                            current = 1
                        }
                    }
            }

            if current == 1 && !finPresentationDMLA {
                Text(phrase)
                    .font(.largeTitle)
                    .frame(maxWidth: 650, alignment: .center)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        displaySequentialTexts(texts: "Le premier handicap qui sera présenté est le DMLA/Il correspond à une dégradation d’une partie de la rétine et peut mener à la perte de la vision centrale/Avant de vous le montrer, voici quelques chiffres :/Il s'agit du 1er handicap visuel chez les plus de 50 ans/Cette maladie concerne environ 8% de la population française/Et 25 à 30% des plus de 75 ans sont concernés", delay: 4) {
                            finPresentationDMLA = true
                        }
                    }
            }
            if finPresentationDMLA && !simulationDMLA {
                Text("Regardez le bouton et pincez vos doigts")
                    .font(.largeTitle)
                    .frame(maxWidth: 650, alignment: .center)
                Button(action: {
                    Task {
                        await openImmersiveSpace(id: "DMLA")
                        simulation = true
                        simulationDMLA = true
                        current = 2
                    }
                }, label: {
                    Text("Lancer la simulation")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background(Color(uiColor: .systemOrange))
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                })
                .buttonStyle(.rounded)
                .padding()
            }

            if current == 2 && !finPresentationGlaucome {
                Text(phrase)
                    .font(.largeTitle)
                    .frame(maxWidth: 650, alignment: .center)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        displaySequentialTexts(texts: "Le second handicap qui sera présenté est le glaucome/C'est une maladie de l’œil qui provoque une diminution irréversible du champ de vision/Voici quelques chiffres qui pourraient vous éclaircir :/Le glaucome est la 2e cause de cécité dans le monde dans les pays les moins développés/En France, plus d’un million de personnes seraient concernées/Le glaucome évolue de manière silencieuse, progressive et sans douleur. Il est donc difficile de s'en rendre compte", delay: 4) {
                            finPresentationGlaucome = true
                        }
                    }
            }
            if finPresentationGlaucome && !simulationGlaucome {
                Text("Regardez le bouton et pincez vos doigts")
                    .font(.largeTitle)
                    .frame(maxWidth: 650, alignment: .center)
                Button(action: {
                    Task {
                        await openImmersiveSpace(id: "Glaucome")
                        simulation = true
                        simulationGlaucome = true
                        current = 3
                    }
                }, label: {
                    Text("Lancer la simulation")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background(Color(uiColor: .systemOrange))
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                })
                .buttonStyle(.rounded)
                .padding()
            }

            if current == 3 && !finPresentationSchizophrenie {
                Text(phrase)
                    .font(.largeTitle)
                    .frame(maxWidth: 650, alignment: .center)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        displaySequentialTexts(texts: "Le dernier handicap présenté sera la schizophrénie/C'est une maladie mentale sévère et chronique qui diffère selon les personnes/La schizophrénie est une maladie qui se caractérise par des hallucinations visuelles et auditives, des délires et/ou des troubles cognitifs/Elle se déclare le plus souvent entre 15 et 25 ans/La schizophrénie concerne 600 000 personnes en France/Elle est classée par l’OMS comme l’une des dix maladies les plus invalidantes", delay: 4) {
                            finPresentationSchizophrenie = true
                        }
                    }
            }
            if finPresentationSchizophrenie && !simulationSchizophrenie {
                Text("Regardez le bouton et pincez vos doigts")
                    .font(.largeTitle)
                    .frame(maxWidth: 650, alignment: .center)
                Button(action: {
                    Task {
                        await openImmersiveSpace(id: "Schizophrenie")
                        simulation = true
                        simulationSchizophrenie = true
                    }
                }, label: {
                    Text("Lancer la simulation")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal)
                        .background(Color(uiColor: .systemOrange))
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                })
                .buttonStyle(.rounded)
                .padding()
            }

        } else {
            Text("")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                        simulation = false
                        Task {
                            await dismissImmersiveSpace()
                        }
                        if current == 3 && simulationSchizophrenie {
                            current = 4
                        }
                    }
                }
        }
        if current == 4 {
            Text("")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        demo = false
                    }
                }
        }
        Button(action: {
            demo = false
        }, label: {
            Text("Quitter la demo")
                .fontWeight(.bold)
                .padding(.vertical)
                .padding(.horizontal)
                .background(Color(uiColor: .systemOrange))
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
        })
        .buttonStyle(.rounded)
        .padding()
    }

    func displaySequentialTexts(texts: String, delay: Double, completion: @escaping () -> Void) {
        let phrases = texts.split(separator: "/")
        var index = 0

        func showNextPhrase() {
            if index < phrases.count {
                self.phrase = String(phrases[index])
                index += 1
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    showNextPhrase()
                }
            } else {
                completion()
            }
        }

        showNextPhrase()
    }
}




/*

struct Demo: View {
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    @Binding var demo : Bool
    
    @State private var phrase: String = ""
    @State private var finPresentationApplication: Bool = false
    @State private var finPresentationDMLA: Bool = false
    @State private var finPresentationGlaucome: Bool = false
    @State private var finPresentationSchizophrenie: Bool = false
    @State private var simulation: Bool = false
    @State private var simulationDMLA: Bool = false
    @State private var simulationGlaucome: Bool = false
    @State private var simulationSchizophrenie: Bool = false
    @State private var current: Int = 0
    
    var body: some View {
        
        if(!simulation){
            if(current == 0 && !finPresentationApplication){
                Text(phrase)
                    .font(.largeTitle)
                    .frame(maxWidth: 650 ,alignment: .center)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.phrase = "Cette application a pour but de simuler certains handicaps de la vie réelle"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                            self.phrase = "Pour ce faire nous avons utilisé XCode et SwiftUI"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 11) {
                            self.phrase = "Vous allez expérimenter 3 handicaps visuels :"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 14) {
                            self.phrase = "Vous allez expérimenter 3 handicaps visuels : \n Le DMLA"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 16) {
                            self.phrase = "Vous allez expérimenter 3 handicaps visuels : \n Le glaucome"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 18) {
                            self.phrase = "Vous allez expérimenter 3 handicaps visuels : \n La schizophrénie"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                            finPresentationApplication = true
                            current = 1
                        }
                    }
            }
            
            if(current == 1 && !finPresentationDMLA){
                Text(phrase)
                    .font(.largeTitle)
                    .frame(maxWidth: 650 ,alignment: .center)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()){
                            self.phrase = "Le premier handicap qui sera présenté est le DMLA"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            self.phrase = "Il correspond à une dégradation d’une partie de la rétine et peut mener à la perte de la vision centrale"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 10){
                            self.phrase = "Avant de vous le montrer, voici quelques chiffres :"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 13){
                            self.phrase = "Il s'agit du 1er handicap visuel chez les plus de 50 ans"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 17){
                            self.phrase = "Cette maladie concerne environ 8% de la population française"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 21){
                            self.phrase = "Et 25 à 30% des plus de 75 ans sont concernés"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 25){
                            finPresentationDMLA = true
                        }
                    }
            }
            if(finPresentationDMLA && !simulationDMLA){
                Text("Regardez le bouton et pincez vos doigts")
                    .font(.largeTitle)
                    .frame(maxWidth: 650 ,alignment: .center)
                Button( action : {
                    Task {
                        await openImmersiveSpace(id: "DMLA")
                        simulation = true
                        simulationDMLA = true
                        current = 2
                    }
                }, label : {
                    Text("Lancer la simulation")
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
            }
            
            if(current == 2 && !finPresentationGlaucome){
                Text(phrase)
                    .font(.largeTitle)
                    .frame(maxWidth: 650 ,alignment: .center)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()){
                            self.phrase = "Le second handicap qui sera présenté est le glaucome"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                            self.phrase = "C'est une maladie de l’œil qui provoque une diminution irréversible du champ de vision"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 9){
                            self.phrase = "Voici quelques chiffres qui pourraient vous éclaircir :"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 13){
                            self.phrase = "Le glaucome est la 2e cause de cécité dans le monde dans les pays les moins développés"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 18){
                            self.phrase = "En France, plus d’un million de personnes seraient concernées"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 22){
                            self.phrase = "Le glaucome évolue de manière silencieuse, progressive et sans douleur. Il est donc difficile de s'en rendre compte"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 28){
                            finPresentationGlaucome = true
                        }
                    }
            }
            if(finPresentationGlaucome && !simulationGlaucome){
                Text("Regardez le bouton et pincez vos doigts")
                    .font(.largeTitle)
                    .frame(maxWidth: 650 ,alignment: .center)
                Button( action : {
                    Task {
                        await openImmersiveSpace(id: "Glaucome")
                        simulation = true
                        simulationGlaucome = true
                        current = 3
                    }
                }, label : {
                    Text("Lancer la simulation")
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
            }
            
            if(current == 3 && !finPresentationSchizophrenie){
                Text(phrase)
                    .font(.largeTitle)
                    .frame(maxWidth: 650 ,alignment: .center)
                    .multilineTextAlignment(.center)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()){
                            self.phrase = "Le dernier handicap présenté sera la schizophrénie"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                            self.phrase = "C'est une maladie mentale sévère et chronique qui diffère selon les personnes"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 9){
                            self.phrase = "La schizophrénie est une maladie qui se caractérise par des hallucinations visuelles et auditives, des délires et/ou des troubles cognitifs"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 15){
                            self.phrase = "Elle se déclare le plus souvent entre 15 et 25 ans"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 19){
                            self.phrase = "La schizophrénie concerne 600 000 personnes en France"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 23){
                            self.phrase = "Elle est classée par l’OMS comme l’une des dix maladies les plus invalidantes"
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 28){
                            finPresentationSchizophrenie = true
                        }
                    }
            }
            if(finPresentationSchizophrenie && !simulationSchizophrenie){
                Text("Regardez le bouton et pincez vos doigts")
                    .font(.largeTitle)
                    .frame(maxWidth: 650 ,alignment: .center)
                Button( action : {
                    Task {
                        await openImmersiveSpace(id: "Schizophrenie")
                        simulation = true
                        simulationSchizophrenie = true
                    }
                }, label : {
                    Text("Lancer la simulation")
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
            }
            
        } else {
            Text("")
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now()+30){
                        simulation = false
                        Task{
                            await dismissImmersiveSpace()
                        }
                        if(current==3 && simulationSchizophrenie){
                            current = 4
                        }
                    }
                }
        }
        if(current == 4){
            Text("")
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now()+5){
                        demo = false
                    }
                }
        }
        Button( action : {
            demo = false
        }, label : {
            Text("Quitter la demo")
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
} */


//#Preview(windowStyle: .automatic) {
//    
//    @Previewable Bool var value = true
//    Demo(demo: value)
//}

#Preview {
    struct Preview: View {
        @State var number = true
        var body: some View {
            Demo(demo: $number)
        }
    }
    return Preview()
}
