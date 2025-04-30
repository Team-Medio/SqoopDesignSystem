//
//  SQAnimation.swift
//  SqoopDesignSystem
//
//  Created by 김민준 on 11/4/24.
//

import SwiftUI
import AVKit
import SqoopDesignSystem

enum SQAnimationError: Error {
    case failToMakeAnimationAmbient
}

public struct SQAnimation: View {
    
    let animation: SqoopAnimationResource
    
    public init(_ animation: SqoopAnimationResource) {
        self.animation = animation
        try? setAudioSessionAmbient()
    }
    
    public var body: some View {
        LoopVideoView(animation: animation)
            .disabled(true)
    }
    
    private func setAudioSessionAmbient() throws {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(
                .ambient,
                mode: .default,
                options: [.mixWithOthers]
            )
            try audioSession.setActive(true)
        } catch {
            throw SQAnimationError.failToMakeAnimationAmbient
        }
    }
}

// MARK: - LoopVideoView

private struct LoopVideoView: View {
    
    private let queuePlayer: AVQueuePlayer?
    private let playerLooper: AVPlayerLooper?
    
    init(animation: SqoopAnimationResource) {
        guard let url = animation.url else {
            self.queuePlayer = nil
            self.playerLooper = nil
            return
        }
        
        let playerItem = AVPlayerItem(url: url)
        let player = AVQueuePlayer(items: [playerItem])
        player.isMuted = true
        self.queuePlayer = player
        self.playerLooper = AVPlayerLooper(
            player: player,
            templateItem: playerItem
        )
    }
    
    var body: some View {
        VideoPlayer(player: queuePlayer)
            .onAppear {
                queuePlayer?.play()
            }
            .onDisappear {
                queuePlayer?.pause()
            }
    }
}

// MARK: - Preview

#Preview {
    SQAnimation(.inSqoop)
}
