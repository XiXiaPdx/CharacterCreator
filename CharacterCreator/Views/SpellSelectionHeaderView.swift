//
//  SpellSelectionHeaderView.swift
//  CharacterCreator
//
//  Created by Ike Mattice on 7/13/18.
//  Copyright © 2018 Ike Mattice. All rights reserved.
//

import UIKit

@IBDesignable
class SpellSelectionHeaderView: UIView {
	var view: UIView!

	@IBOutlet var levelViews: [UIView]!
	@IBOutlet weak var sliderView: UIView!

	@IBOutlet weak var sliderLeftConstraint: NSLayoutConstraint!
	@IBOutlet weak var sliderHeightConstraint: NSLayoutConstraint!
	@IBOutlet weak var sliderWidthConstraint: NSLayoutConstraint!

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		xibSetup()

		setInitialSliderConstraints()
	}



	func shiftSlider(_ direction: ShiftDirection) {
		switch direction {
		case .right:
			self.sliderLeftConstraint.constant += self.sliderWidthConstraint.constant
		case .left:
			self.sliderLeftConstraint.constant -= self.sliderWidthConstraint.constant
		}

		UIView.animate(withDuration: 0.25) {
			self.layoutIfNeeded()
		}
	}

	private func setInitialSliderConstraints() {
		let firstLevelView = levelViews[0]
		let width = firstLevelView.bounds.width
		let height = firstLevelView.bounds.height

		sliderHeightConstraint.constant = height
		sliderWidthConstraint.constant	= width
		sliderLeftConstraint.constant	= 0
	}

	enum ShiftDirection {
		case left, right
	}
}