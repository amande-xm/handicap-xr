//
//  Button.swift
//  MixedTrack
//
//  Created by IUT Bourg Info on 17/12/2024.
//

import SwiftUI

struct RoundedButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        Button(action: configuration.trigger, label: {
            configuration.label
                .hoverEffect()
                .clipShape(
                    RoundedRectangle(cornerRadius: 15.0)
                )
        })
        .buttonStyle(.plain)
    }
}

extension PrimitiveButtonStyle where Self == RoundedButtonStyle{
    static var rounded: Self{
        .init()
    }
}
