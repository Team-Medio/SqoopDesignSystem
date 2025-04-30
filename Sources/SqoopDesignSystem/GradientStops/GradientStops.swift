//
//  GradientStops.swift
//  Temp
//
//  Created by Greem on 10/29/24.
//

import SwiftUI
public enum GradientStops {
    public static let focusRing: [Gradient.Stop] = [
        .init(color: Color(hex: "#000000").opacity(0.3), location: 0),
        .init(color: Color(hex: "#07686E").opacity(0.65), location: 0.25),
        .init(color: Color(hex: "#0ED0DB").opacity(1), location: 0.5),
        .init(color: Color(hex: "#3A9AA0").opacity(0.65), location: 0.75),
        .init(color: Color(hex: "#656565").opacity(0.3), location: 1),
    ]
    
    public static let thumbnailBox: [Gradient.Stop] = [
        .init(color: Color(hex: "#000000").opacity(0.3), location: 0),
        .init(color: Color(hex: "#1B1B1B").opacity(0.7), location: 0.19),
        .init(color: Color(hex: "#183536").opacity(0.67), location: 0.27),
        .init(color: Color(hex: "#154E51").opacity(0.65), location: 0.34),
        .init(color: Color(hex: "#11686D").opacity(0.63), location: 0.42),
        .init(color: Color(hex: "#0E8188").opacity(0.6), location: 0.50),
        .init(color: Color(hex: "#1E7479").opacity(0.53), location: 0.62),
        .init(color: Color(hex: "#2D676A").opacity(0.45), location: 0.75),
        .init(color: Color(hex: "#3D595B").opacity(0.38), location: 0.87),
        .init(color: Color(hex: "#4C4C4C").opacity(0.3), location: 1)
    ]
    public static let background: [Gradient.Stop] = [
        .init(color: .init(hex: "#174F53"), location: 0),
        .init(color: .init(hex: "#000000"), location: 0.25),
        .init(color: .init(hex: "#000000"), location: 1)
    ]
    
    public static let playlistRing: [Gradient.Stop] = [
        .init(color: .init(hex: "#656565").opacity(0.1), location: 0),
        .init(color: .init(hex: "#808080").opacity(0.25), location: 0.25),
        .init(color: .init(hex: "#FFFFFF").opacity(0.3), location: 0.5),
        .init(color: .init(hex: "#B2B2B2").opacity(0.25), location: 0.75),
        .init(color: .init(hex: "#656565").opacity(0.1), location: 1)
    ]
    
    public static let playlistGradient: [Gradient.Stop] = [
        .init(color: Color(hex: "#656565").opacity(0.3), location: 0),
        .init(color: Color(hex: "#404040").opacity(0.47), location: 0.13),
        .init(color: Color(hex: "#808080").opacity(0.65), location: 0.25),
        .init(color: Color(hex: "#BFBFBF").opacity(0.82), location: 0.38),
        .init(color: Color(hex: "#FFFFFF").opacity(1), location: 0.5),
        .init(color: Color(hex: "#D9D9D9").opacity(0.82), location: 0.63),
        .init(color: Color(hex: "#B2B2B2").opacity(0.65), location: 0.75),
        .init(color: Color(hex: "#8B8B8B").opacity(0.47), location: 0.88),
        .init(color: Color(hex: "#656565").opacity(0.3), location: 1),
    ]
    
}
public extension Array where Element == Gradient.Stop {
    static var focusRing: Self { GradientStops.focusRing }
    static var thumbnailBox: Self { GradientStops.thumbnailBox }
    static var background: Self { GradientStops.background }
    static var playlistRing: Self { GradientStops.playlistRing }
}
