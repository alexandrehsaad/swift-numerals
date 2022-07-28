// Roman+CustomStringConvertible.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: CustomStringConvertible {
	public var description: String {
		let symbols: Array<RomanSymbol> = RomanSymbol.allCases.reversed()
		
		var number: Self.Value = self.value
		var result: String = ""

		while number > 0 {
			for symbol in symbols {
				let report: Self.Value.Report = number.subtractingReportingOverflow(symbol.value)
				
				if report.overflow == false && report.partialValue >= 0 {
					number -= symbol.value
					result += symbol.description
					break
				}
			}
		}

		return result
	}
}
