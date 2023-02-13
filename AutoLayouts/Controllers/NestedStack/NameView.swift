//
//  NameView.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-10.
//

import UIKit

class NameView: UIView {
    let stackView = UIStackView()
    let label = UILabel()
    let textField = UITextField()

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
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)

        label.setContentCompressionResistancePriority(.defaultAboveHigh, for: .horizontal)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func styleSubviews() {
        stackView.spacing = defaultSpacing
        stackView.alignment = .firstBaseline
        label.font = UIFont.preferredFont(forTextStyle: .body)
        textField.borderStyle = .roundedRect
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct NameView_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewPreview {
                let view = NameView()
                view.label.text = "First"
                view.textField.placeholder = "Enter First Name"
                return view
            }.previewLayout(.sizeThatFits)
                .padding(50)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif

