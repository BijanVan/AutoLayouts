//
//  NestedStackViewController.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-07.
//

import UIKit

class NestedStackViewController: UIViewController {
    let stackView = UIStackView()
    let upperView = NestedStackUpperView()
    let textView = UITextView()
    let buttonsView = NestedStackButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareSubviews()
        styleSubviews()
    }

    // MARK: Private functions
    private func prepareSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        upperView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)
        stackView.addArrangedSubview(upperView)
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(buttonsView)

        textView.setContentCompressionResistancePriority(.defaultBelowLow, for: .vertical)
        textView.setContentHuggingPriority(.defaultBelowLow, for: .vertical)

        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: guide.topAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: guide.leadingAnchor, multiplier: 1),
            stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            guide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
        ])
    }

    private func styleSubviews() {
        stackView.spacing = defaultSpacing
        stackView.axis = .vertical
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.text = "Notes:"

        textView.backgroundColor = .systemGray2
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct NestedStackViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                NestedStackViewController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

