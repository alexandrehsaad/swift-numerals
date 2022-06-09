// Roman+LosslessStringConvertible.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: LosslessStringConvertible {
	public init?(_ description: String) {
		guard description.isEmpty == false else {
			return nil
		}
		
		if let value: Self.Value = .init(description) {
			guard value <= Self.max else {
				return nil
			}
			
			self.init(value: value)
		} else if description.isRomanNumeral == true {
			let symbols: Array<RomanSymbol> = RomanSymbol.allCases.reversed()
			
			var string: String = description
			var value: Self.Value = 0
			
			while string.isEmpty == false {
				for (index, symbol) in symbols.enumerated() {
					if string.hasPrefix(symbol.description) {
						string.removeFirst(symbol.description.count)
						value += symbol.value
						break
					} else if index == symbols.endIndex - 1 {
						return nil
					}
				}
			}
			
			guard value <= Self.max else {
				return nil
			}
			
			self.init(value: value)
		} else {
			return nil
		}
	}
}
