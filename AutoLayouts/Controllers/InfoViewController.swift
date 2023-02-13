//
//  InfoViewController.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-09.
//

import UIKit

class InfoViewController: UIViewController {
    let infoTexView = UITextView()

    init(text: String) {
        infoTexView.text = text
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSubviews()
    }

    // MARK: Private functions
    private func prepareSubviews() {
        infoTexView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoTexView)

        NSLayoutConstraint.activate([
            infoTexView.topAnchor.constraint(equalTo: view.topAnchor),
            infoTexView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoTexView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            infoTexView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct InfoViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                InfoViewController(text: "abcdef")
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

