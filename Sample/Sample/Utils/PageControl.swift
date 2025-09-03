//
//  PageControl.swift
//  Sample
//
//  Created by Moni on 03/09/25.
//

import Foundation
import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    @Binding var currentPage: Int
    var numberOfPages: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(currentPage: $currentPage)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.pageIndicatorTintColor = UIColor(red: 150 / 255, green: 227 / 255, blue: 215 / 255, alpha: 1)
        control.currentPageIndicatorTintColor = UIColor(red: 60 / 255, green: 185 / 255, blue: 160 / 255, alpha: 1)
        control.translatesAutoresizingMaskIntoConstraints = false
        control.setContentHuggingPriority(.required, for: .horizontal)
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.pageControlDidFire(_:)),
            for: .valueChanged
        )
        return control
    }

    func updateUIView(_ control: UIPageControl, context: Context) {
        context.coordinator.currentPage = $currentPage
        control.numberOfPages = numberOfPages
        control.currentPage = currentPage
    }

    class Coordinator {
        var currentPage: Binding<Int>

        init(currentPage: Binding<Int>) {
            self.currentPage = currentPage
        }

        @objc func pageControlDidFire(_ sender: UIPageControl) {
            currentPage.wrappedValue = sender.currentPage
        }
    }
}
