//
//  ViewController.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-07.
//

import UIKit

class MainViewController: UIViewController {
    let stackView = UIStackView()
    let titleLabel =  UILabel()
    let containerView = UIView()
    let buttonStackView = UIStackView()
    let previousButton = UIButton()
    let infoButton = UIButton(type: .infoDark)
    let nextButton = UIButton()

    lazy var recipes: [Recipe] = Recipe.recipes

    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareSubviews()
        styleSubviews()

        addChild(UIViewController())
        showNextRecipe(sender: self)
    }

    // MARK: Private functions
    private func prepareSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(containerView)
        stackView.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(previousButton)
        buttonStackView.addArrangedSubview(infoButton)
        buttonStackView.addArrangedSubview(nextButton)
        view.addSubview(stackView)

        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: guide.leadingAnchor, multiplier: 1),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1),
            guide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
        ])
    }

    private func styleSubviews() {
        stackView.spacing = defaultSpacing
        stackView.axis = .vertical
        stackView.distribution = .fill

        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.text = "Loading Recipes"
        titleLabel.textAlignment = .center

        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.systemBlue.cgColor

        buttonStackView.spacing = defaultSize
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually

        previousButton.setTitle("Previous", for: .normal)
        previousButton.setTitleColor(.tintColor, for: .normal)
        previousButton.addTarget(self, action: #selector(showPreviousRecipe(sender:)), for: .touchUpInside)

        infoButton.addTarget(self, action: #selector(showInfo(sender:)), for: .touchUpInside)
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.tintColor, for: .normal)
        nextButton.addTarget(self, action: #selector(showNextRecipe(sender:)), for: .touchUpInside)
    }
}

// MARK: Previews
#if DEBUG

import SwiftUI

@available(iOS 13.0, *)
struct MainViewController_Preview: PreviewProvider {
    static let deviceNames: [String] = [
        "iPhone 14 Pro",
        "iPhone 13 mini",
    ]

    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                MainViewController()
            }.previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

#endif
