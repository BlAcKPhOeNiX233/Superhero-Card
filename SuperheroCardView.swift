//
//  SuperheroCardView.swift
//  Superhero Card
//
//  Created by Pasquale Vittoriosi on 08/09/22.
//

import SwiftUI
import AVKit
import AVFoundation

struct SuperheroCardView: View {
    let videoPlayer = AVPlayer(
        url: Bundle.main.url(
            forResource: "Memoji", withExtension: "mov"
        )!
    )
    
    var body: some View {
        //Select the components here or directly from the canvas and edit the properties from the inspector panel on the right
        VStack {
            Text("SUPER-SEARCH")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 30.0)
            
            VideoPlayer(player: videoPlayer)
                .cornerRadius(45)
                .frame(width: 253, height: 350)
                .padding(.horizontal, 50)
                .disabled(true)
                .onAppear {
                    videoPlayer.play()
                    NotificationCenter.default.addObserver(
                        forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main
                    ) { _ in
                        videoPlayer.seek(to: .zero)
                        videoPlayer.play()
                    }
                }
            
            Text("Bryan Sánchez Peralta")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
            
            Text("Powers:")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("Find solutions, Doesn't sleep")
                .foregroundColor(.white)
                .padding(.horizontal)
            Text("Weaknesses:")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("Always angry")
                .foregroundColor(.white)
                .padding(.horizontal)
            Text("Famous for:")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("Have too much questions on StackOverflow")
                .foregroundColor(.white)
                .padding([.horizontal, .bottom], 30.0)
        }
        .background {
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.orange)
            RoundedRectangle(cornerRadius: 40)
                .strokeBorder(.black, lineWidth: 10)
        }
        .padding()
    }
}

struct SuperheroCardView_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroCardView()
    }
}
