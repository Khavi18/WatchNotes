//
//  CreditsView.swift
//  NotesWatch Watch App
//
//  Created by Khavishini on 04/07/2024.
//

import SwiftUI

struct CreditsView: View {
    
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    var body: some View {
        VStack(spacing: 3, content: {
            //Profile Image
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            //Header
            HeaderView(title: "Credits")
            
            //Content
            Text("Khavishini")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
        })//:VStack
    }
}

#Preview {
    CreditsView()
}
