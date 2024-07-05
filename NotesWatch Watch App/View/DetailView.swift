//
//  DetailView.swift
//  NotesWatch Watch App
//
//  Created by Khavishini on 04/07/2024.
//

import SwiftUI

struct DetailView: View {
    //MARK: - Property
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            //Header
            HeaderView()
            
            //Content
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            //Footer
            HStack(alignment: .center, content: {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented, content: {
                        SettingsView()
                    })
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
            })
            .foregroundColor(.secondary)
            
        })//:Hstack
        .padding(3)
    }
}

#Preview {
    
    DetailView(note: Note(id: UUID(), text: "Hello"), count: 5, index: 1)
}
