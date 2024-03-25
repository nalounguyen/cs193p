//
//  CardView.swift
//  AssignmentOne
//
//  Created by Nalou Nguyen on 25/3/24.
//

import SwiftUI

struct CardView: View {
    @State var isFaceUp: Bool = false
    let content: String
    
    var body: some View {
        ZStack {
            let temp = RoundedRectangle(cornerRadius: 12)
            Group {
                temp.fill(.white)
                temp.stroke(lineWidth: 3 )
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            temp.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    CardView(content: "👹")
}
