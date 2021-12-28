//
//  PlateCalculatorViewModel.swift
//  ATPWatch Extension
//
//  Created by Ryan Gross on 5/5/21.
//

import Combine
import SwiftUI

class PlateCalculationViewModel: ObservableObject {
    @Published var calcPlates: [Plate]? = []
	
	init() {
		calcPlates = PlateUtility.calculate(targetWgt: targetWgt, barWgt: barWgt, plates: plates)
	}
    
    private var didChange = PassthroughSubject<Void, Never>()
    private var plates = PlateUtility.generatePlates(qt: 6)

	var targetWgt = 135.0 { didSet {
        didChange.send()
        calcPlates = PlateUtility.calculate(targetWgt: targetWgt, barWgt: barWgt, plates: plates)
    }}
    
    
    var barWgt = 45.0 { didSet {
        didChange.send()
        calcPlates = PlateUtility.calculate(targetWgt: targetWgt, barWgt: barWgt, plates: plates)
    }}
}
