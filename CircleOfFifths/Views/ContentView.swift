//
//  ContentView.swift
//  CircleOfFifths
//
//  Created by Anders Lindskog on 2024-06-09.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedKey: Key = .cMajor

    var body: some View {
        VStack {
            Text("Circle of Fifths")
                .font(Font.system(size: 30))
                .bold()
                .accessibilityAddTraits(.isHeader)

            CircleView(selectedKey: $selectedKey)

            AccidentalsView(selectedKey: $selectedKey)

            ChordsView(selectedKey: $selectedKey)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
