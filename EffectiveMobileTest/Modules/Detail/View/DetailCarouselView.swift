//
//  DetailCarouselView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//

import SwiftUI


struct DetailCarouselView: View {
    
    var viewModels: [String]
    
    var body : some View {
        
        TabView() {
            ForEach(viewModels, id: \.self) { imageUrlString in
                ZStack {
                    AsyncImage(url: URL(string: imageUrlString), content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame (width: 266)
                            .cornerRadius(20)
                    }, placeholder: {
                        Color("White")
                            .cornerRadius(20)
                    })
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct DetailCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCarouselView(viewModels: [])
    }
}

