import SwiftUI
import RealityKit
import RealityKitContent

struct Schizophrenie: View {

    var body: some View {
        // Créer une entité qui s'ancre à "la tête"
        let headEntity: Entity = {
            let headAnchor = AnchorEntity(.head)
            headAnchor.position = [0, 0, -1]
            return headAnchor
        }()
        
        RealityView { content in
            do {
                // Créer une entité à partir de la scene DMLA
                let schizo = try await Entity(named: "Schizophrenie", in: realityKitContentBundle)
                
                // Ajoute l'entité créée à l'entité ancrée à la tête
                headEntity.addChild(schizo)
                
                // L'ajouter au contenu de la reality view
                content.add(headEntity)
                
                Task {
                    await playRandomSounds(for: schizo)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func playRandomSounds(for schizo: Entity) async {
        while true {
            let ambientAudioEntityController = schizo.findEntity(named: "AmbientAudio")
            
            var randomIndex: Int
            var audioFileName : String
            
            var playingSound = false
            
            playingSound = !playingSound
            randomIndex = Int.random(in: 0..<8)
            
            switch(randomIndex){
            case 0:
                audioFileName = "/Root/schizSound1_m4a"
                break;
            case 1:
                audioFileName = "/Root/schizSound2_m4a"
                break;
            case 2:
                audioFileName = "/Root/schizSound3_m4a"
                break;
            case 3:
                audioFileName = "/Root/schizSound4_m4a"
                break;
            case 4:
                audioFileName = "/Root/schizSound5_m4a"
                break;
            case 5:
                audioFileName = "/Root/schizSound6_m4a"
                break;
            case 6:
                audioFileName = "/Root/schizSound7_m4a"
                break;
            case 7:
                audioFileName = "/Root/schizSound8_m4a"
                break;
            default:
                audioFileName = "/Root/schizSound9_m4a"
                break;
            }
                
            guard let resource = try? await AudioFileResource(named: audioFileName, from: "Schizophrenie.usda", in: realityKitContentBundle)
                else{
                    fatalError("Unable to load audio file")
                }
                
            let audioController = ambientAudioEntityController?.prepareAudio(resource)
            
            audioController?.play()
            
            let timer = Int.random(in: 7..<13)
            
            try? await Task.sleep(nanoseconds: UInt64(timer) * 1_000_000_000)
        }
    }
}


#Preview(immersionStyle: .mixed) {
    Schizophrenie()
}
