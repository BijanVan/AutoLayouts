//
//  Recipe+Information.swift
//  AutoLayouts
//
//  Created by Bijan Nazem on 2023-02-08.
//

import UIKit

extension Recipe {
    static var recipes: [Recipe] {[
        Recipe(title: "Simple Stack View",
               description: """
This recipe displays a simple layout using a single vertical stack view. The stack view contains a label, an image view, and a button.

The stack view uses a Fill distribution and a Fill alignment.

The label is center aligned.

Because the image view has lower content-hugging and compression-resistance priorities, it shrinks and stretches to fill the available space. It also uses an Aspect Fit mode to fill the available space without altering the image's aspect ratio.
""",
               viewController: SimpleStackViewController()),
        Recipe(title: "Nested Stack Views",
               description: """
This recipe displays a complex layout using a hierarchy of nested stack views. The layout's appearance is controlled by adjusting the stack view's attributes and by setting the content-hugging and compression-resistance priority of the contents. Additional constraints are then added to fine-tune the layout's appearance. For example, the text fields are all given equal width constraints, and the image view is given a square aspect ratio.
""",
               viewController: NestedStackViewController()),
    ]}
}
