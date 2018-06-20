//
//  RaceSelectionViewController.swift
//  CharacterCreator
//
//  Created by Ike Mattice on 6/19/18.
//  Copyright © 2018 Ike Mattice. All rights reserved.
//

import UIKit

class StatDistributionViewController: UIViewController {
	@IBOutlet weak var strStatView: StatStepperView!
	@IBOutlet weak var conStatView: StatStepperView!
	@IBOutlet weak var dexStatView: StatStepperView!
	@IBOutlet weak var chaStatView: StatStepperView!
	@IBOutlet weak var wisStatView: StatStepperView!
	@IBOutlet weak var intStatView: StatStepperView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		labelViews()
	}

	private func labelViews() {
		strStatView.statTitleLabel.text = "Strength"
		conStatView.statTitleLabel.text = "Constitution"
		dexStatView.statTitleLabel.text = "Dexterity"
		chaStatView.statTitleLabel.text = "Charisma"
		wisStatView.statTitleLabel.text = "Wisdom"
		intStatView.statTitleLabel.text = "Intelligence"
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		setCharacterStats()
	}

	private func setCharacterStats() {
		guard let str = Int(strStatView.statValueLabel.text!),
				let con = Int(conStatView.statValueLabel.text!),
				let dex = Int(dexStatView.statValueLabel.text!),
				let cha = Int(chaStatView.statValueLabel.text!),
				let wis = Int(wisStatView.statValueLabel.text!),
				let int = Int(intStatView.statValueLabel.text!) else { return }

		Character.current.stats.str = str
		Character.current.stats.con = con
		Character.current.stats.dex = dex
		Character.current.stats.cha = cha
		Character.current.stats.wis = wis
		Character.current.stats.int = int
	}
}
