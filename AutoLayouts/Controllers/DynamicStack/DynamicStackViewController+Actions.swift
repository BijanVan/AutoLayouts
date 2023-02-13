//
//  DynamicStackViewController+Actions.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-12.
//

import UIKit

extension DynamicStackViewController {
    @objc func addEntry(sender: AnyObject) {
        let index = stackView.arrangedSubviews.count - 1
        let offset = CGPoint(x: scrollView.contentOffset.x,
                             y: scrollView.contentOffset.y + addButton.bounds.height)
        let entryView = createEntryView()
        entryView.isHidden = true
        stackView.insertArrangedSubview(entryView, at: index)
        UIView.animate(withDuration: 0.25) {
            entryView.isHidden = false
            self.scrollView.contentOffset = offset
        }
    }

    @objc func deleteEntry(sender: UIButton) {
        guard let entryView = sender.superview else { return }

        UIView.animate(withDuration: 0.25, animations: {
            entryView.isHidden = true
        }, completion: { _ in
            self.stackView.removeArrangedSubview(entryView)
        })
    }

    // MARK: Private functions
    private func createEntryView() -> UIView {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        let number = UUID().uuidString

        let stackView = UIStackView()
        stackView.spacing = defaultSpacing
        stackView.alignment = .center

        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFont(forTextStyle: .body)

        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        numberLabel.setContentHuggingPriority(.defaultBelowLow, for: .horizontal)
        numberLabel.setContentCompressionResistancePriority(.defaultBelowHigh, for: .horizontal)

        let deleteButton = UIButton()
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.tintColor, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteEntry(sender:)), for: .touchUpInside)

        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(deleteButton)

        return stackView
    }
}
