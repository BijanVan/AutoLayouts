//
//  SimpleStackViewController.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-07.
//

import UIKit

class SimpleStackViewController: UIViewController {
    let stackView = UIStackView()
    let label = UILabel()
    let imageView = UIImageView()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareSubviews()
        styleSubviews()
    }

    // MARK: Private functions
    private func prepareSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(button)

        imageView.setContentHuggingPriority(UILayoutPriority.defaultBelowLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(UILayoutPriority.defaultBelowHigh, for: .vertical)

        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: guide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            guide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    private func styleSubviews() {
        stackView.axis = .vertical
        stackView.spacing = defaultSpacing

        label.text = "Flowers"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)

        imageView.image = UIImage(named: "flowers")
        imageView.contentMode = .scaleAspectFit

        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct SimpleStackViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                SimpleStackViewController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif
