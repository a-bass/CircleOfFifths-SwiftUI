//
//  ChordsView.swift
//  CircleOfFifths
//
//  Created by Anders Lindskog on 2024-06-11.
//

import SwiftUI

struct ChordsView: View {
    @Binding var selectedKey: Key
    
    var body: some View {
        Grid(horizontalSpacing: 4, verticalSpacing: 2) {
            let keySignature = KeySignature.for(key: selectedKey)
            
            chordRowView(keyName: keySignature.major, intervals: Interval.majorScaleIntervals, chords: keySignature.majorChords)
            
            chordRowView(keyName: keySignature.minor, intervals: Interval.minorScaleIntervals, chords: keySignature.minorChords)
        }
    }
    
    @ViewBuilder private func chordTextView(_ text: String) -> some View {
        Text(text)
            .frame(width: 45, height: 15)
            .font(Font.system(size: 14))
    }
        
    @ViewBuilder private func chordRowView(keyName: String, intervals: [Interval], chords: [[String]]) -> some View {
        
        GridRow {
            Text(keyName)
                .frame(height: 25)
                .gridCellColumns(7)
                .font(Font.system(size: 22))
                .bold()
        }
        
        GridRow {
            ForEach(intervals, id: \.self) { interval in
                Text(interval.degree)
                    .frame(width: 45, height: 20)
                    .font(Font.custom("Times", fixedSize: 14))
                    .bold()
                    .foregroundStyle(Color("ForegroundColor"))
                    .border(Color("ForegroundColor"), width: 1)
                    .background(Color(interval.quality.color))
            }
        }
        
        ForEach(chords, id: \.self) { chords in
            GridRow {
                if chords.count != 0 {
                    ForEach(chords, id: \.self) { chord in
                        chordTextView(chord)
                    }
                } else {
                    chordTextView("")
                        .gridCellColumns(7)
                }
            }
        }
    }
}

#Preview("C Major") {
    ChordsView(selectedKey: .constant(.cMajor))
}
#Preview("Db Major") {
    ChordsView(selectedKey: .constant(.dFlatMajor))
}
