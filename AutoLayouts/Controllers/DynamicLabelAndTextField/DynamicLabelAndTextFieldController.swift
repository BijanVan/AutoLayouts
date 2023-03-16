//
//  DynamicLabelAndTextFieldController.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-14.
//

import UIKit

class DynamicLabelAndTextFieldController: UIViewController {
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


        let labelTopConstraint = label.topAnchor.constraint(equalTo: view.topAnchor)
        labelTopConstraint.priority = .defaultBelowLow

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelTopConstraint,
        ])

        label.setContentHuggingPriority(.defaultAboveLow, for: .horizontal)
        label.setContentHuggingPriority(.defaultAboveLow, for: .vertical)

        let textFieldTopConstraint = textField.topAnchor.constraint(equalTo: view.topAnchor)
        textFieldTopConstraint.priority = .defaultBelowLow

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: label.trailingAnchor, multiplier: 1),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.lastBaselineAnchor.constraint(equalTo: textField.lastBaselineAnchor),
            textFieldTopConstraint,
        ])
    }

    private func styleSubviews() {
        label.text = "Name"

        textField.placeholder = "Enter name"
        textField.borderStyle = .roundedRect
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct DynamicLabelAndTextFieldController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                DynamicLabelAndTextFieldController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

