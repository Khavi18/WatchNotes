//
//  ContentView.swift
//  NotesWatch Watch App
//
//  Created by Khavishini on 04/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Property
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    //MARK: - Function
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    
    func save() {
        //dump(notes)
        do {
            //Convert notes array to data using JSONDecoder
            let data = try JSONEncoder().encode(notes)
            //Create a new url to save the file using getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            //Write the data to the given URL
            try data.write(to: url)
        } catch {
            print("Saving data has failed")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                //Get the notes URl path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                //Create new property for the data
                let data = try Data(contentsOf: url)
                //Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                //Do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6, content: {
                    TextField("Add New Note", text: $text)
                    
                    Button {
                        //Only run the button action when textfield is not empty
                        guard !text.isEmpty else { return }
                        //create new note item and initialize it with the text value
                        let note = Note(id: UUID(), text: text)
                        //Add the new note item to the notes array (append)
                        notes.append(note)
                        //Make the text field empty
                        text = ""
                        //Save the notes (function)
                        save()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                   // .buttonStyle(BorderedButtonStyle(tint: .accentColor))
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    
                }) //: HStack
                Spacer()
                
                if notes.count > 0 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink {
                                DetailView(note: notes[i], count: notes.count, index: i)
                            } label: {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                } //:HSTack
                            }

                        }
                        .onDelete(perform: { indexSet in
                            delete(offsets: indexSet)
                        })
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            } //: VStack
            .navigationTitle("Notes")
            .onAppear(perform: {
                load()
            })
        } //:Navigation Stack
        
    }
}

#Preview {
    ContentView()
}
