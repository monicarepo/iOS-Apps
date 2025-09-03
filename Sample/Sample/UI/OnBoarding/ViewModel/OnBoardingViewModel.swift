//
//  OnBoardingViewModel.swift
//  Sample
//
//  Created by Moni on 02/09/25.
//

import Foundation

class OnBoardingViewModel: ObservableObject {
    @Published var onBoardingData = [OnBoardingModel]()
    private let localJsonLoader: LocalJsonLoader

    init() {
        localJsonLoader = LocalJsonLoader()
        fetchOnBoardingData()
    }

    func fetchOnBoardingData() {
        guard let responseData: [OnBoardingModel] = localJsonLoader.loadJson("OnBoarding") else {
            return
        }
        onBoardingData = responseData
    }
}
