//
//  NestedStackUpperView.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-10.
//

import UIKit

class NestedStackUpperView: UIView {
    let mainStackView = UIStackView()
    let imageView = UIImageView()
    let nameStackView = UIStackView()
    let firstNameView = NameView()
    let middleNameView = NameView()
    let lastNameView = NameView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubviews()
        styleSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private functions
    private func prepareSubviews() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        firstNameView.translatesAutoresizingMaskIntoConstraints = false
        middleNameView.translatesAutoresizingMaskIntoConstraints = false
        lastNameView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(mainStackView)
        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(nameStackView)
        nameStackView.addArrangedSubview(firstNameView)
        nameStackView.addArrangedSubview(middleNameView)
        nameStackView.addArrangedSubview(lastNameView)

        imageView.setContentCompressionResistancePriority(.defaultBelowHigh, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.defaultBelowHigh, for: .vertical)
        imageView.setContentHuggingPriority(.defaultBelowLow, for: .vertical)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
        ])

        NSLayoutConstraint.activate([
            firstNameView.textField.widthAnchor.constraint(equalTo: middleNameView.textField.widthAnchor),
            firstNameView.textField.widthAnchor.constraint(equalTo: lastNameView.textField.widthAnchor),
        ])
    }

    private func styleSubviews() {
        mainStackView.spacing = defaultSpacing
        mainStackView.alignment = .center
        imageView.image = UIImage(named: "square_flowers")
        imageView.contentMode = .scaleAspectFit

        nameStackView.spacing = defaultSpacing
        nameStackView.axis = .vertical

        firstNameView.label.text = "First"
        firstNameView.textField.placeholder = "Enter First Name"

        middleNameView.label.text = "Middle"
        middleNameView.textField.placeholder = "Enter Middle Name"

        lastNameView.label.text = "Last"
        lastNameView.textField.placeholder = "Enter Last Name"
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct NestedStackUpperView_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewPreview {
                return NestedStackUpperView()
            }.previewLayout(.sizeThatFits)
                .padding(50)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif
