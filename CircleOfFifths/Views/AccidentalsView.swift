//
//  AccidentalsView.swift
//  CircleOfFifths
//
//  Created by Anders Lindskog on 2024-06-11.
//

import SwiftUI

struct AccidentalsView: View {
    @Binding var selectedKey: Key
    
    var body: some View {
        Grid(horizontalSpacing: 4, verticalSpacing: 2) {
            let keySignature = KeySignature.for(key: selectedKey)
            
            accidentalsRowView(accidentalSymbol: "♯", accidentals: keySignature.sharpAccidentals)
            
            accidentalsRowView(accidentalSymbol: "♭", accidentals: keySignature.flatAccidentals)
        }
    }
    
    @ViewBuilder private func accidentalTextView(_ text: String) -> some View {
        Text(text)
            .font(Font.system(size: 16))
    }
        
    @ViewBuilder private func accidentalsRowView(accidentalSymbol: String, accidentals: [String]) -> some View {
        GridRow {
            Text("\(accidentals.count)\(accidentalSymbol):")
                .bold()
            
            if !accidentals.isEmpty {
                ForEach(accidentals, id: \.self) { accidental in
                    accidentalTextView(accidental)
                }
            } else {
                accidentalTextView("♮")
            }
        }
    }
}

#Preview("C Major") {
    AccidentalsView(selectedKey: .constant(.cMajor))
}

#Preview("Db Major") {
    AccidentalsView(selectedKey: .constant(.dFlatMajor))
}
