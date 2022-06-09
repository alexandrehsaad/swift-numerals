// RomanSymbol.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of a roman symbol.
@frozen
internal enum RomanSymbol: String, RawRepresentable, CaseIterable {
	/// The symbol representing the Arabic numeral zero, or nulla.
	case N

	/// The symbol representing the Arabic numeral one.
	case I
	
	/// The symbol representing the Arabic numeral four.
	case IV

	/// The symbol representing the Arabic numeral five.
	case V
	
	/// The symbol representing the Arabic numeral nine.
	case IX

	/// The symbol representing the Arabic numeral ten.
	case X
	
	/// The symbol representing the Arabic numeral forty.
	case XL

	/// The symbol representing the Arabic numeral fifty.
	case L
	
	/// The symbol representing the Arabic numeral ninety.
	case XC

	/// The symbol representing the Arabic numeral one hundred".
	case C
	
	/// The symbol representing the Arabic numeral four hundred.
	case CD

	/// The symbol representing the Arabic numeral five hundred".
	case D
	
	/// The symbol representing the Arabic numeral nine hundred.
	case CM

	/// The symbol representing the Arabic numeral one thousand.
	case M
	
	/// The underlying value of this type.
	internal var value: Roman.Value {
		switch self {
		case .N:
			return 0
		case .I:
			return 1
		case .IV:
			let five: Roman.Value = Self.V.value
			let one: Roman.Value = Self.I.value
			return five - one
		case .V:
			return 5
		case .IX:
			let ten: Roman.Value = Self.X.value
			let one: Roman.Value = Self.I.value
			return ten - one
		case .X:
			return 10
		case .XL:
			let fifty: Roman.Value = Self.L.value
			let ten: Roman.Value = Self.X.value
			return fifty - ten
		case .L:
			return 50
		case .XC:
			let oneHundred: Roman.Value = Self.C.value
			let ten: Roman.Value = Self.X.value
			return oneHundred - ten
		case .C:
			return 100
		case .CD:
			let fiveHundred: Roman.Value = Self.D.value
			let oneHundred: Roman.Value = Self.C.value
			return fiveHundred - oneHundred
		case .D:
			return 500
		case .CM:
			let oneThousand: Roman.Value = Self.M.value
			let oneHundred: Roman.Value = Self.C.value
			return oneThousand - oneHundred
		case .M:
			return 1000
		}
	}
	
	/// A boolean value indicating whether this case is repeatable.
	///
	/// The letters I, X, C and M can be repeated thrice in succession.
	/// The letters N,  L, V and D can not be repeated.
	internal var isRepeatable: Bool {
		return self.value.isPower(of: 10)
	}
	
	/// The maxium amount of times a repeatable case can be repeated in succesion.
	internal static let maxRecursion: Int = 3
	
	/// Concatenates this case with the specified value.
	///
	/// - parameter rhs: The value on the right hand side.
	/// - throws: A roman symbol error if is unconcatenable.
	/// - returns: A concatenated value.
	internal func concatenate(with rhs: Self) throws -> Self {
		switch (self, rhs) {
		case (.I, .V):
			return .IV
		case (.I, .X):
			return .IX
		case (.X, .L):
			return .XL
		case (.X, .C):
			return .XC
		case (.C, .D):
			return .CD
		case (.C, .M):
			return .CM
		default:
			throw RomanSymbolError.isUnconcatenable
		}
	}
	
	/// Seperates this case into an arrray of cases.
	///
	/// - throws: A roman symbol error if is unseparatable.
	/// - returns: An array of seperated values.
	internal func separate() throws -> [Self] {
		switch self {
		case .IV:
			return [.I, .V]
		case .IX:
			return [.I, .X]
		case .XL:
			return [.X, .L]
		case .XC:
			return [.X, .C]
		case .CD:
			return [.C, .D]
		case .CM:
			return [.C, .M]
		default:
			throw RomanSymbolError.isUnseparable
		}
	}
	
	/// Returns a boolean value undicating whether this case is subtractable from the specified value.
	///
	/// If a lower value digit is written to the left of a higher value digit, it is subtracted.
	/// Only I, X, and C can be used as subtractive numerals.
	///
	/// - parameter rhs: The value on the right hand side.
	/// - returns: A boolean value.
	internal func isSubtractable(from rhs: Self) -> Bool {
		switch self {
		case .I:
			return rhs == .V || rhs == .X
		case .X:
			return rhs == .L || rhs == .C
		case .C:
			return rhs == .D || rhs == .M
		default:
			return false
		}
	}
}
