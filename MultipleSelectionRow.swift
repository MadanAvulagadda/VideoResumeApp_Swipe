//
//  MultipleSelectionRow.swift
//  VideoResumeApp
//
//  Created by Madan Mohan Avulagadda on 14/04/25.
//
import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
