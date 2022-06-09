// RomanSymbol+CustomStringConvertible.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension RomanSymbol: CustomStringConvertible {
	internal var description: String {
		switch self {
		case .N:
			return ""
		default:
			return self.rawValue
		}
	}
}
