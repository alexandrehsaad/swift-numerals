// Roman+RepresentableByZero.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: RepresentableByZero {
	public static let zero: Self = .init(value: 0)
}
