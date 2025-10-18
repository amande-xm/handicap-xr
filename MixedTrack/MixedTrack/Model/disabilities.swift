//
//  disabilities.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 26/03/2025.
//

import SwiftUI

struct Disability: Hashable, Codable {
    let title: String
}

class ViewModel: ObservableObject {
    @Published var disabilities: [Disability] = []
    @Published var url: String = ""
    
    func initURL(newUrl: String){
        self.url = newUrl
    }
    
    func fetch() {
        guard let url = URL(string: "http://localhost:8765/scenarios/view-all/1.json") else {
            return
        }
        
        _ = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let disabilities = try JSONDecoder().decode([Disability].self, from: data)
                DispatchQueue.main.async {
                    self?.disabilities = disabilities
                }
            } catch {
                print(error)
            }
        }
    }
}
