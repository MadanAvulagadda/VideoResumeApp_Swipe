//
//  Untitled.swift
//  VideoResumeApp
//
//  Created by Madan Mohan Avulagadda on 14/04/25.
//

import SwiftUI
import AVKit

struct Video: Identifiable {
    let id = UUID()
    let name: String
    let url: URL
    let userImage: String
    let title: String
    let skillTags: [String]
    let experience: Int
    let location: String
    let package: Int
    let phoneNumber: String
    let email: String
}
