//
//  SimpleSingleView.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-13.
//

import UIKit

class TwoEqualWidthViewController: UIViewController {
    let yellowView = UIView()
    let greenView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareSubviews()
        styleSubviews()
    }

    // MARK: Private functions
    private func prepareSubviews() {
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(yellowView)
        view.addSubview(greenView)

        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.topAnchor),
            greenView.leadingAnchor.constraint(equalToSystemSpacingAfter: yellowView.trailingAnchor, multiplier: 1),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor),
        ])
    }

    private func styleSubviews() {
        yellowView.backgroundColor = .systemYellow
        greenView.backgroundColor = .systemGreen
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct TwoEqualWidthViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                TwoEqualWidthViewController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif
