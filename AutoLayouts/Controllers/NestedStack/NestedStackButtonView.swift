//
//  NestedStackButtonView.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-11.
//

import UIKit

class NestedStackButtonView: UIView {
    let stackView = UIStackView()
    let saveButton = UIButton()
    let cancelButton = UIButton()
    let clearButton = UIButton()

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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        stackView.addArrangedSubview(saveButton)
        stackView.addArrangedSubview(cancelButton)
        stackView.addArrangedSubview(clearButton)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func styleSubviews() {
        stackView.spacing = defaultSpacing
        stackView.distribution = .fillEqually

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.tintColor, for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.tintColor, for: .normal)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(.tintColor, for: .normal)
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct NestedStackButtonView_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewPreview {
                return NestedStackButtonView()
            }.previewLayout(.sizeThatFits)
                .padding(50)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

