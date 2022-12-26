//
//  Model.swift
//  Notes WatchKit Extension
//
//  Created by Alex Barreto on 26/12/22.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
