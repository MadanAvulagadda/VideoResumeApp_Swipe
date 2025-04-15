//
//  VideoPage.swift
//  VideoResumeApp
//
//  Created by Madan Mohan Avulagadda on 14/04/25.
//
import SwiftUI
import AVKit

struct VideoPage: View {
    let video: Video
    @State private var player: AVPlayer

    init(video: Video) {
        self.video = video
        _player = State(initialValue: AVPlayer(url: video.url))
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            VideoPlayer(player: player)
                .onAppear {
                    player.play()
                    player.isMuted = true
                }

            // Overlay with user and details
            VStack(alignment: .leading, spacing: 8) {
                Spacer()

                HStack(alignment: .center, spacing: 12) {
                    Image(video.userImage)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    VStack(alignment: .leading) {
                        Text(video.name)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(video.title)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                        Text(video.skillTags.joined(separator: ", "))
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                }

                Text("Exp: \(video.experience) yrs • \(video.location) • ₹\(video.package)LPA")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.9))


                // Contact Buttons
                HStack {
                    Button(action: {
                        if let url = URL(string: "tel://\(video.phoneNumber)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Label("Call", systemImage: "phone.fill")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(12)
                    }

                    Button(action: {
                        if let url = URL(string: "mailto:\(video.email)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Label("Email", systemImage: "envelope.fill")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                }
                .padding(.top, 12)

                Spacer().frame(height: 30)
            }
            .padding()
        }
        .background(Color.black)
    }
}
