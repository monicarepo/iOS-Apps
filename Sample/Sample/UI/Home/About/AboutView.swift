//
//  AboutView.swift
//  Sample
//
//  Created by Moni on 03/09/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("bible")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(ImageOverLay(), alignment: .bottomLeading)
                    .cornerRadius(10)

                HStack {
                    Image("quote-left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding(.leading, 20)
                        .padding(.top, 5)

                    Spacer()
                }

                Text("about_title")
                    .padding()
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.customColor.primaryOrangeColor)

                Text("about_section1")
                    .padding()

                HStack {
                    Spacer()

                    Image("daisy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)

                    Text("about_story")
                        .padding(.horizontal, 16)
                        .fontWeight(.bold)

                    Image("daisy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)

                    Spacer()
                }

                Text("about_section2")
                    .padding()

                HStack {
                    Spacer()

                    Image("daisy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)

                    Text("about_conclusion")
                        .padding(.horizontal, 16)
                        .fontWeight(.bold)

                    Image("daisy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)

                    Spacer()
                }

                Text("about_section3")
                    .padding()
            }
        }
    }
}

struct ImageOverLay: View {
    var body: some View {
        ZStack {
            Text("about_bible")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .background(.clear)
        .padding(.bottom, 40)
        .padding(.leading, 20)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
