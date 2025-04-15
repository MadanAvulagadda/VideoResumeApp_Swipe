//
//  ContentView.swift
//  VideoResumeApp
//
//  Created by Madan Mohan Avulagadda on 13/04/25.
//

import SwiftUI
import SwiftUIPager

struct ContentView: View {
    
    @State private var currentPage: Page = .first()
    
    @State private var showFilterSheet = false

    @State private var selectedSkills: Set<String> = []
    @State private var selectedExperience: Int? = nil
    @State private var selectedLocation: String? = nil
    @State private var selectedPackage: Int? = nil

    let allSkills = ["iOS", "Android", "Angular", "React Native", "Flutter"]
    let allLocations = ["Bangalore", "Mumbai", "Remote", "Hyderabad"]
    let allPackages = [5, 10, 15, 20]

    let videos: [Video] = [
            Video(
                name: "Video by Tima Miroshnichenko from Pexels",
                url: Bundle.main.url(forResource: "demo1", withExtension: "mp4")!,
                userImage: "profile1",
                title: "iOS Engineer, Technical Lead",
                skillTags: ["iOS", "SwiftUI"],
                experience: 10,
                location: "Bangalore",
                package: 25,
                phoneNumber: "9703290949",
                email: "madan.avulagadda@gmail.com"
            ),
            Video(
                name: "Video by Ron Lach from Pexels",
                url: Bundle.main.url(forResource: "demo2", withExtension: "mp4")!,
                userImage: "profile2",
                title: "Developer",
                skillTags: ["React", "Web"],
                experience: 3,
                location: "Remote",
                package: 7,
                phoneNumber: "9703290949",
                email: "madan.avulagadda@gmail.com"
            ),
            Video(
                name: "Video by MART PRODUCTION from Pexels",
                url: Bundle.main.url(forResource: "demo3", withExtension: "mp4")!,
                userImage: "profile3",
                title: "Developer",
                skillTags: ["React", "Web", "React Native"],
                experience: 3,
                location: "Remote",
                package: 11,
                phoneNumber: "9703290949",
                email: "madan.avulagadda@gmail.com"
            ),
            Video(
                name: "Video by ANTONI SHKRABA from Pexels",
                url: Bundle.main.url(forResource: "demo4", withExtension: "mp4")!,
                userImage: "profile4",
                title: "Engineer",
                skillTags: ["Android", "Kotlin"],
                experience: 3,
                location: "Remote",
                package: 8,
                phoneNumber: "9703290949",
                email: "madan.avulagadda@gmail.com"
            )
        ]
    
    
    var filteredVideos: [Video] {
        videos.filter { video in
            (selectedSkills.isEmpty || !selectedSkills.isDisjoint(with: video.skillTags)) &&
            (selectedExperience == nil || video.experience >= selectedExperience!) &&
            (selectedLocation == nil || video.location == selectedLocation) &&
            (selectedPackage == nil || video.package >= selectedPackage!)
        }
    }

  
    var body: some View {
        ZStack(alignment: .top) {
            Pager(page: currentPage,
                  data: filteredVideos.indices,
                  id: \.self) { index in
                VideoPage(video: filteredVideos[index])
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .vertical()
            .pagingPriority(.simultaneous)
            .loopPages(false)
            .contentLoadingPolicy(.eager)
            .alignment(.center)
            .ignoresSafeArea()
        
        
                // Header
                HStack {
                    Text("")
                        .font(.title2.bold())
                        .foregroundColor(.white)

                    Spacer()

                    Button(action: {
                        showFilterSheet.toggle()
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 50) // Adjust based on notch
            }
            .background(Color.black)
            .sheet(isPresented: $showFilterSheet) {
                FilterSheet(
                    selectedSkills: $selectedSkills,
                    selectedExperience: $selectedExperience,
                    selectedLocation: $selectedLocation,
                    selectedPackage: $selectedPackage,
                    allSkills: allSkills,
                    allLocations: allLocations,
                    allPackages: allPackages
                )
            }
        }
    }



#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
