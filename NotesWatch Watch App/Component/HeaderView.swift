//
//  HeaderView.swift
//  NotesWatch Watch App
//
//  Created by Khavishini on 04/07/2024.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String = ""
    
    var body: some View {
        VStack {
            
            //Title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            //Separator
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }//:HStack
            .foregroundColor(.accentColor)
        }//: VStack
    }
}

#Preview {
    Group {
        HeaderView(title: "Credits")
    }
}
