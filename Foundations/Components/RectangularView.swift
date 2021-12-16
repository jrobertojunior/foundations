//
//  RectangularView.swift
//  Foundations
//
//  Created by Jose Roberto on 21/11/21.
//

import SwiftUI

struct RectangularView: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct RectangularView_Previews: PreviewProvider {
    static var previews: some View {
        RectangularView(imageName: "salada")
    }
}
