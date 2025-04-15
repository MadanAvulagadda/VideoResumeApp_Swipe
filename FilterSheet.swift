//
//  FilterSheet.swift
//  VideoResumeApp
//
//  Created by Madan Mohan Avulagadda on 14/04/25.
//
import SwiftUI

struct FilterSheet: View {
    @Binding var selectedSkills: Set<String>
    @Binding var selectedExperience: Int?
    @Binding var selectedLocation: String?
    @Binding var selectedPackage: Int?

    let allSkills: [String]
    let allLocations: [String]
    let allPackages: [Int]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Skills")) {
                    ForEach(allSkills, id: \.self) { skill in
                        MultipleSelectionRow(title: skill, isSelected: selectedSkills.contains(skill)) {
                            if selectedSkills.contains(skill) {
                                selectedSkills.remove(skill)
                            } else {
                                selectedSkills.insert(skill)
                            }
                        }
                    }
                }

                Section(header: Text("Experience (min years)")) {
                    Picker("Experience", selection: $selectedExperience) {
                        Text("Any").tag(nil as Int?)
                        ForEach(1...10, id: \.self) { year in
                            Text("\(year) years").tag(Optional(year))
                        }
                    }
                }

                Section(header: Text("Location")) {
                    Picker("Location", selection: $selectedLocation) {
                        Text("Any").tag(nil as String?)
                        ForEach(allLocations, id: \.self) {
                            Text($0).tag(Optional($0))
                        }
                    }
                }

                Section(header: Text("Min Package (LPA)")) {
                    Picker("Package", selection: $selectedPackage) {
                        Text("Any").tag(nil as Int?)
                        ForEach(allPackages, id: \.self) {
                            Text("₹\($0)LPA").tag(Optional($0))
                        }
                    }
                }
            }
            .navigationTitle("Filters")
            .navigationBarItems(trailing: Button("Done") {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            })
        }
    }
}



