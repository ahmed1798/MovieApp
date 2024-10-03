//
//  Text+Ex.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import Foundation
import SwiftUI

//MARK: - Extension OF TEXT
extension Text {
    
    // MARK: FUNCTIONS
    
    /// textModifier(fontSize:fontWeight:lineLimit:foregroundColor:)
    ///
    /// The textModifier(fontSize:fontWeight:lineLimit:foregroundColor:) function is a SwiftUI view modifier that customizes the appearance of a text view. It allows you to set the font size, font weight, line limit, and foreground color of the text.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///           Text("Hello!")
    ///              .textModifier(fontSize: 16, fontWeight: .heavy, lineLimit: 2, foregroundColor: .black)
    ///         }
    ///      }
    /// ```
    ///
    /// - Parameters
    /// 1- fontSize: A CGFloat value that specifies the size of the font.
    /// 2- fontWeight: A Font.Weight value that specifies the weight of the font, such as .regular, .bold, .heavy, etc.
    /// 3- lineLimit: An optional Int value that specifies the maximum number of lines the text can. occupy. The default value is nil, which means the text has no limit on the number of lines.
    /// 4- foregroundColor: A Color value that sets the color of the text.
    ///
    /// - Returns: This function returns a view that has the specified text modifiers applied.
    func textModifier(fontSize: CGFloat, fontWeight: Font.Weight, lineLimit: Int? = nil, foregroundColor: Color) -> some View {
        self
            .font(.system(size: fontSize, weight: fontWeight))
            .fontWeight(fontWeight)
            .foregroundColor(foregroundColor)
            .lineLimit(lineLimit)
    }
}
