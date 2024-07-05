//
//  Note.swift
//  NotesWatch Watch App
//
//  Created by Khavishini on 04/07/2024.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
