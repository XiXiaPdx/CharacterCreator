//
//  ChoiceContainerView.swift
//  CharacterCreator
//
//  Created by Ike Mattice on 8/1/18.
//  Copyright © 2018 Ike Mattice. All rights reserved.
//

import UIKit

class ChoiceSelectionView: UIView {
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var pageControl: UIPageControl!

	var choices = [Item]() {
		didSet {
			config()
			addChoiceViews() } }
	var presentedChoice: String? 	= nil
	var contentHeight: Int? 		= nil

	private func config() {
		scrollView.delegate 						= self
		scrollView.isPagingEnabled 					= true
		scrollView.contentSize 						= CGSize(width: self.bounds.width * CGFloat(choices.count),
																height: 250)
		scrollView.showsHorizontalScrollIndicator 	= false
		scrollView.alwaysBounceHorizontal 			= false
		scrollView.isDirectionalLockEnabled 		= true
		scrollView.bounces							= false

		pageControl.numberOfPages 					= choices.count
		pageControl.hidesForSinglePage				= true
	}

	private func addChoiceViews() {
		for (index, choice) in choices.enumerated() {
			guard let choiceView = Bundle.main.loadNibNamed("ChoiceView", owner: self, options: nil)?.first as? ChoiceView
				else { print("Could not load nib for \(choice)"); continue }

			choiceView.config(for: choice)

			scrollView.addSubview(choiceView)

			choiceView.frame.size.width 	= self.bounds.size.width
			choiceView.frame.origin.x 		= CGFloat(index) * self.bounds.size.width
		}

	}

}

extension ChoiceSelectionView: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		//prevent vertical scrolls
		if scrollView.contentOffset.y != 0 {
			scrollView.contentOffset.y = 0 }

		let pageIndex = scrollView.contentOffset.x / scrollView.frame.size.width
		pageControl.currentPage = Int(pageIndex)
	}
}


class ChoiceView: UIView {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!

	func config(for choice: Item) {
		self.layoutIfNeeded()

		titleLabel.text 			= choice.name.capitalized
		descriptionLabel.text 		= choice.description()
		imageView.image 			= choice.image()
		backgroundColor				= UIColor.lightGray

		descriptionLabel.sizeToFit()
	}
}
