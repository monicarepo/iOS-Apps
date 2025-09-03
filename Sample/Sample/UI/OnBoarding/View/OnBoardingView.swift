//
//  OnBoardingView.swift
//  Sample
//
//  Created by Moni on 02/09/25.
//

import Foundation
import SwiftUI

struct OnBoardingView: View {
    @ObservedObject var viewModel = OnBoardingViewModel()
    @State private var currentIndex: Int = 0
    @State private var showPopup = false

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentIndex) {
                ForEach(0 ..< viewModel.onBoardingData.count, id: \.self) { index in
                    OnBoardingInteriorView(onBoardingModel: viewModel.onBoardingData[index])
                }
            }
            .tabViewStyle(PageTabViewStyle())
            VStack {
                Spacer()
                controlBar
                Spacer().frame(height: 60)
                if currentIndex < viewModel.onBoardingData.count - 1 {
                    HStack {
                        Button {
                            currentIndex = viewModel.onBoardingData.count - 1
                        } label: {
                            Text(L10n.skip)
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        Button {
                            currentIndex += 1
                        } label: {
                            Text(L10n.next)
                                .foregroundColor(Color.orange)
                        }
                    }.padding(40)
                } else {
                    HStack {
                        Button {
                            showPopup = true
                        } label: {
                            Text(L10n.getStarted)
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .cornerRadius(4)
                        }.background(Color.orange)
                    }.padding(40)
                }
            }

            if showPopup {
                ZStack {
                    Color.black.opacity(0.5)
                    VStack {
                        Spacer()
                        GetStartedPopOverView(showPopup: $showPopup)
                        Spacer()
                    }.padding(.horizontal, 20)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }

    @ViewBuilder
    private var controlBar: some View {
        HStack {
            Spacer()
            PageControl(currentPage: $currentIndex, numberOfPages: viewModel.onBoardingData.count)
            Spacer()
        }
    }
}
