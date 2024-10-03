//
//  Image+Extension.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import SwiftUI

//MARK: - Extension OF Image
extension Image {
    
    // MARK: FUNCTIONS
    
    /// imageModifier(opacity:cornerRadius:)
    ///
    /// The imageModifier(opacity:cornerRadius:) function is a SwiftUI view modifier that applies effects to an image, including setting its rendering mode, resizing it, scaling it to fit within its container, applying a foreground color, adding a shadow, and rounding its corners.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///          Image("Image")
    ///              .imageModifier(opacity: 0.5, cornerRadius: 8)
    ///         }
    ///      }
    /// ```
    ///
    /// - Parameters
    /// 1- opacity: A Double value that determines the opacity of the shadow color. This value must be between 0.0 (completely transparent) and 1.0 (completely opaque).
    /// 2- cornerRadius: A CGFloat value that determines the radius of the corners of the image. This value must be non-negative.
    ///
    /// - Returns: Returns  a view that has the specified modifiers applied.
    func imageModifier(opacity: Double, cornerRadius: CGFloat) -> some View {
        self
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .foregroundColor(.gray)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: opacity), radius: 3, x: 2, y: 2)
            .cornerRadius(cornerRadius)
    }
    
    /// iconModifier(maxWidth:color:opacity:)
    ///
    /// The imageModifier(maxWidth:color:opacity:) function is a SwiftUI view modifier that applies effects to an image, including setting its rendering mode, resizing it, scaling it to fit within its container, applying a foreground color, adding a shadow,, max width and rounding its corners.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///          Image("Image")
    ///              .imageModifier(maxWidth: .infinity, color: .gray, opacity: 0.5)
    ///         }
    ///      }
    /// ```
    ///
    /// - Parameters
    /// 1- maxWidth: A CGFloat value that determines the width of the image. This value must be non-negative.
    /// 2- color: A Color value that determines the foreground of the image. This value must be a color.
    /// 3- opacity: A Double value that determines the opacity of the shadow color. This value must be between 0.0 (completely transparent) and 1.0 (completely opaque).
    ///
    /// - Returns: Returns  a view that has the specified modifiers applied.
    func iconModifier(maxWidth: CGFloat, color: Color, opacity: Double) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: maxWidth)
            .foregroundColor(color)
            .opacity(opacity)
    }
}
