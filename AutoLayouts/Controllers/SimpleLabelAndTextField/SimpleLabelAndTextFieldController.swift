//
//  SimpleLabelAndTextFieldController.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-13.
//

import UIKit

class SimpleLabelAndTextFieldController: UIViewController {
    let label = UILabel()
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareSubviews()
        styleSubviews()
    }

    // MARK: Private functions
    private func prepareSubviews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)
        view.addSubview(textField)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])

        label.setContentHuggingPriority(.defaultAboveLow, for: .horizontal)
        label.setContentHuggingPriority(.defaultAboveLow, for: .vertical)

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            label.lastBaselineAnchor.constraint(equalTo: textField.lastBaselineAnchor),
        ])
    }

    private func styleSubviews() {
        label.text = "Name"
        label.font = UIFont.preferredFont(forTextStyle: .title1)

        textField.placeholder = "Enter name"
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct SimpleLabelAndTextFieldController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                SimpleLabelAndTextFieldController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

