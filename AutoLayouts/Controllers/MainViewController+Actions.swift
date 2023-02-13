//
//  MainViewController+Actions.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-08.
//

import UIKit

extension MainViewController {
    @objc func showPreviousRecipe(sender: AnyObject) {
        let count = recipes.count
        currentIndex = (currentIndex + count - 1) % count
        showRecipe()
    }

    @objc func showNextRecipe(sender: AnyObject) {
        let count = recipes.count
        currentIndex = (currentIndex + 1) % count
        showRecipe()
    }

    @objc func showInfo(sender: AnyObject) {
        let text = recipes[currentIndex].description
        let infoViewController = InfoViewController(text: text)
        let navigationController = UINavigationController(rootViewController: infoViewController)
        navigationController.title = "Information"
        infoViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissModal))
        present(navigationController, animated: true)
    }

    @objc func dismissModal() {
        dismiss(animated: true)
    }

    private func showRecipe() {
        let child = recipes[currentIndex].viewController
        guard let childView = child.view else {
            titleLabel.text = "Error"
            return
        }

        enableButtons(false)
        childView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(childView)
        addChild(child)
        child.didMove(toParent: self)
        let previousChild = children[0]

        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalToSystemSpacingAfter: containerView.leadingAnchor, multiplier: 1),
            childView.topAnchor.constraint(equalToSystemSpacingBelow: containerView.topAnchor, multiplier: 1),
            containerView.trailingAnchor.constraint(equalToSystemSpacingAfter: childView.trailingAnchor, multiplier: 1),
            containerView.bottomAnchor.constraint(equalToSystemSpacingBelow: childView.bottomAnchor, multiplier: 1),
        ])

        childView.alpha = 0.0
        UIView.animate(withDuration: 0.25, delay: 0, options: .transitionCrossDissolve, animations: {
            childView.alpha = 1.0
            previousChild.view.alpha = 0.0
        }, completion: { [weak self] _ in
            guard let self else { return }
            previousChild.willMove(toParent: nil)
            previousChild.removeFromParent()
            previousChild.view.removeFromSuperview()
            self.enableButtons()
            self.titleLabel.text = self.recipes[self.currentIndex].title
        })
    }

    private func enableButtons(_ enabled: Bool = true) {
        previousButton.isEnabled = enabled
        infoButton.isEnabled = enabled
        nextButton.isEnabled = enabled
    }
}
