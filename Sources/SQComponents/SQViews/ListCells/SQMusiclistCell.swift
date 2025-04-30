//
//  SQMusiclistCell.swift
//  Sqoop
//
//  Created by Greem on 10/11/24.
//

import SwiftUI
import SqoopDesignSystem

/// 음악 리스트를 표시하는 셀입니다.

public struct SQMusiclistCell<T: Identifiable>: View {
#if os(iOS)
    @Environment(\.editMode) var editMode
#endif
    private var isPlaying: Bool
    let item: T
    var action: (()->())? = nil
    let playAction: (T?)->Void
    var imageURLString: String?
    var title: String
    var artist: String
    
    // duration viewModel에서 받기
    @State var playingDuration: Double = 0
    // endDuration = 60 viewmodel에 계산해서 가져다줌
    
    
    @State var playTask: Task<(), any Error>?
    @State private var isBtnPressed = false
    private let endDuration: Double = 20
    
    public init(item: T,
                playingItemID: T.ID?,
                title: String,
                artist: String,
                imageURLString: String? = nil,
                action: (() -> Void)? = nil,
                playAction: @escaping (T?)->Void) {
        self.item = item
        self.isPlaying = item.id == playingItemID
        self.action = action
        self.imageURLString = imageURLString
        self.title = title
        self.artist = artist
        self.playAction = playAction
    }
    public var body: some View {
        HStack(spacing: 6) {
            ListCellAlbumArtView(imageURLString: imageURLString)
                .blur(radius: isPlaying ? 1 : 0)
                .overlay { if isPlaying { PlayingProgressOverlay(process: Double(playingDuration) / Double(endDuration)) } }
                .onTapGesture { withAnimation {
                    playAction(isPlaying ? nil : item)
                } }
                .onChange(of: isPlaying) { oldValue, newValue in
                    if newValue {
                        self.playTask = Task { @MainActor in
                            while playingDuration < endDuration {
                                try await Task.sleep(for: .seconds(0.01), tolerance: nil, clock: .continuous)
                                withAnimation { playingDuration += 0.01 }
                            }
                            playingDuration = 0
                            withAnimation { playAction(nil) }
                        }
                    } else {
                        self.playTask?.cancel()
                    }
                }
            Button {
                action?()
            } label: {
                HStack {
                    ListCellInformationLabel(isPlaying: isPlaying, title: title, artist: artist)
                    Spacer()
                }.contentShape(Rectangle())
            }.allowsHitTesting(action != nil)
        }
        .padding(.vertical, 10)
        .frame(height: 70)
        .listRowBackground(action == nil ? Color.clear : nil)
        .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

struct ListCellInformationLabel: View {
    let isPlaying: Bool
    let title: String
    let artist: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                if isPlaying {
                    Image(systemName: "waveform")
                        .font(.system(size: 14,weight: .regular))
                        .foregroundStyle(Color.textBrand)
                        .symbolEffect(.bounce, value: 100)
                }
                Text(title)
                    .fontWithLineHeight(.body01(weight: .medium))
                    .foregroundStyle(isPlaying ? Color.textBrand: Color.textPrimary)
            }
            Text(artist)
                .fontWithLineHeight(.body02(weight: .regular))
                .foregroundStyle(Color.textSecondary)
        }
        .multilineTextAlignment(.leading)
    }
}

// 셀에서 사용하는 앨범아트 뷰
struct ListCellAlbumArtView: View {
    let imageURLString: String?
    var body: some View {
        Group {
            if let imageURL = URL(string: imageURLString ?? "") {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image("EmptyMusic")
                            .resizable()
                            .scaledToFit()
                    @unknown default:
                        Image("EmptyMusic")
                            .resizable()
                            .scaledToFit()
                    }
                }
            } else {
                Image("EmptyMusic")
                    .resizable()
                    .scaledToFill()
            }
        }.frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 2))
    }
}
// MARK: -- 재생 오버레이 뷰
struct PlayingProgressOverlay: View {
    let process: Double
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(.clear)
                .background(Material.ultraThickMaterial.opacity(0.66))
            
            Circle().trim(from: 0.0, to: process)
                .stroke(Color.textBrand,style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .padding(.all, 6.7).rotationEffect(.degrees(-90), anchor: .center)
            
            Image(systemName: "pause.fill")
                .font(.system(size: 20,weight: .light))
                .foregroundStyle(Color.textBrand)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(.all)
        //        ListContentView()
    }.loadSqoopFontSystem()
}





//public struct SQMusiclistCell<T: Identifiable>: View {

//    @Environment(\.editMode) var editMode

//    private var isPlaying: Bool
//    let item: T
//    var action: (()->())? = nil
//    let playAction: (T) async throws -> Void
//    var imageURLString: String? = nil
//    var title: String
//    var artist: String
//    
//    @State var playingDuration: Double = 0
//    @State var playTask: Task<(), any Error>?
//    @State private var isBtnPressed = false
//    private let endDuration: Double = 20
//    
//    public init(item: T,
//                playingItemID: T.ID?,
//                title: String,
//                artist: String,
//                imageURLString: String? = nil,
//                action: (() -> Void)? = nil,
//                playAction: @escaping (T) async throws -> Void) {
//        self.item = item
//        self.isPlaying = item.id == playingItemID
//        self.action = action
//        self.imageURLString = imageURLString
//        self.title = title
//        self.artist = artist
//        self.playAction = playAction
//    }

