//
//  FilterView.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//

import SwiftUI

struct FilterView: View {
    
    var exitAction: () -> Void
    
    var body: some View {
        VStack(spacing: 44) {
            header
            parameters
        }
        .background(Color("White"), ignoresSafeAreaEdges: .bottom)
        .cornerRadius(30)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Button(action: exitAction, label: {
                Image("Exit")
                    .foregroundColor(Color("White"))
                    .padding(14)
                    .background(Color("Black"))
                    .cornerRadius(10)
            })
            Spacer(minLength: 69)
            Text("Filter options")
                .font(Font.appFont(size: 18, style: .regular))
                .foregroundColor(Color("Black"))
            Spacer()
            Text("Done")
                .font(Font.appFont(size: 18, style: .regular))
                .foregroundColor(Color("White"))
                .padding(.horizontal, 20)
                .padding(.vertical, 7)
                .background(Color("Orange"))
                .cornerRadius(10)
        }
        .padding(.leading, 44)
        .padding(.top, 24)
        .padding(.trailing, 20)
    }
    
    private var parameters: some View {
        VStack (spacing: 18) {
            VStack (alignment: .leading, spacing: 8) {
                Text("Brand")
                    .foregroundColor(Color("Black"))
                    .font(Font.appFont(size: 18, style: .regular))
                
                HStack {
                    Text("Samsung")
                        .foregroundColor(Color("Black"))
                        .font(Font.appFont(size: 18, style: .light))
                    Spacer()
                    Image("DownArrow")
                        .resizable()
                        .frame(width: 15, height: 9)
                }
                .padding(.vertical, 7)
                .padding(.leading, 14)
                .padding(.trailing, 20)
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("Gray"), lineWidth: 1)
                            .foregroundColor(Color("White")))
            }
            
            VStack (alignment: .leading, spacing: 8) {
                Text("Price")
                    .foregroundColor(Color("Black"))
                    .font(Font.appFont(size: 18, style: .regular))
                
                HStack {
                    Text("$300 - $500")
                        .foregroundColor(Color("Black"))
                        .font(Font.appFont(size: 18, style: .light))
                    Spacer()
                    Image("DownArrow")
                        .resizable()
                        .frame(width: 15, height: 9)
                        .frame(width: 16, height: 8)
                }
                .padding(.vertical, 7)
                .padding(.leading, 14)
                .padding(.trailing, 20)
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("Gray"), lineWidth: 1)
                            .foregroundColor(Color("White")))
                
            }
            
            
            VStack (alignment: .leading, spacing: 8) {
                Text("Size")
                    .foregroundColor(Color("Black"))
                    .font(Font.appFont(size: 18, style: .regular))
                
                HStack {
                    Text("4.5 to 5.5 inches")
                        .foregroundColor(Color("Black"))
                        .font(Font.appFont(size: 18, style: .light))
                    Spacer()
                    Image("DownArrow")
                        .resizable()
                        .frame(width: 15, height: 9)
                        .frame(width: 16, height: 8)
                }
                .padding(.vertical, 7)
                .padding(.leading, 14)
                .padding(.trailing, 20)
                .overlay(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color("Gray"), lineWidth: 1)
                            .foregroundColor(Color("White")))
            }
        }
        .padding(.leading, 46)
        .padding(.trailing, 31)
        .padding(.bottom, 44)
    }
}
