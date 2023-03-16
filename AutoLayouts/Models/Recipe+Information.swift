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

        Recipe(title: "Dynamic Stack View",
               description: """
This recipe demonstrates how to dynamically add and remove items from a stack view while animating the change. The DynamicStackViewController class also programmatically creates and populates stack views at runtime.
""",
               viewController: DynamicStackViewController()),

        Recipe(title: "Two Equal Width Views",
               description: """
This recipe demonstrates two equal-width views that fill the scene with a small margin.

In the example, the yellow view is pinned to the leading, top, and bottom edges, and the green view is pinned to the trailing, top, and bottom edges. Notice that there is a standard space between the two views, and they have equal widths.
""",
               viewController: TwoEqualWidthViewController()),

        Recipe(title: "Two Different Width Views",
               description: """
This recipe shows two views that fill the scene with a small margin. The orange view is twice as wide as the purple view.

The purple view is pinned to the leading, top, and bottom. The orange view is pinned to the trailing, top, and bottom. There is a standard space between the two views, and the orange view's width is constrained to the purple view's width x 2.
""",
               viewController: TwoDifferentWidthViewController()),

        Recipe(title: "Two Complex Width Views",
               description: """
This recipe shows two views that fill the scene with a small margin. The blue view has a minimum width of 150 points. If there is enough space, the red view is twice as wide as the blue view. Otherwise, the red view fills the remaining space.

In the example, the blue view is pinned to the leading, top, and bottom edges, and the red view is pinned to the trailing, top, and bottom edges. There is a standard space between the two views. The blue view's width is equal to or greater than 150 points, and an optional constraint pins the red view's width equal to the blue view's width times 2, with a high priority.
""",
               viewController: TwoComplexWidthViewController()),

        Recipe(title: "Simple Label And Text Field",
               description: """
This recipe demonstrates how to lay out a simple label-and-text-field pair. The example simplifies the constraint logic by assuming that the text field is always taller than the label. You define the vertical layout by simply pinning the text field to the top layout guide and then baseline aligning the two views.

Horizontally, the label's leading edge is pinned to the superview's leading margin. The text view's trailing edge is pinned to the superview's trailing margin, and there is a standard space between the label and text field.

Unlike the colored block examples, both the text field and the label have an intrinsic content size. As a result, you need only one constraint per axis per view to define the layout. Additionally, the label's content-hugging priority is higher than the text field's, so the text field is stretched to fill any remaining space.

For a recipe that dynamically calculates the vertical layout based on the tallest view, see Label and Text Field with Dynamic Height.
""",
               viewController: SimpleLabelAndTextFieldController()),

        Recipe(title: "Dynamic Label And Text Field",
               description: """
This recipe demonstrates how to lay out a simple label-and-text-field pair. In this example, the label's font size changes. Half the time, it is shorter than the text field. The rest of the time, it is taller than the text field. This means that the constraints must dynamically adjust the views' heights, positioning the tallest view 20 points below the top layout guide.

Vertically, each view has two constraints to the top layout guide. A required greater-than-or-equal-to constraint sets a minimum 20-point space between each view and the top layout guide. A second, optional, constraint pins each view to the top layout guide.  This constraint must have a priority lower than the view's content-hugging priority. The views are baseline aligned.

Horizontally, the label's leading edge is pinned to the superview's leading margin. The text view's trailing edge is pinned to the superview's trailing margin, and there is a standard space between the label and text field. Because the label's content-hugging priority is higher than the text field's, the text field is stretched to fill any remaining space.
""",
               viewController: DynamicLabelAndTextFieldController()),


    ]}
}
