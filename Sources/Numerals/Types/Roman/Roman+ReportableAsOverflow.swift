// Roman+ReportableAsOverflow.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: ReportableAsOverflow {
	public func addingReportingOverflow(_ rhs: Self) -> Self.Report {
		var newValue: Self.Value = self.value + rhs.value

		guard newValue <= Self.max.value else {
			newValue = newValue - Self.max.value - 1
			return (.init(newValue), true)
		}

		return (.init(newValue), false)
	}

	public func subtractingReportingOverflow(_ rhs: Self) -> Self.Report {
		let report: Self.Value.Report = self.value.subtractingReportingOverflow(rhs.value)
		var partialValue: Self = .init(clamping: report.partialValue)
		let overflow: Bool = report.overflow

		if overflow == true {
			partialValue -= partialValue - Self.max
		}

		return (partialValue, overflow)
	}

	public func multipliedReportingOverflow(by rhs: Self) -> Self.Report {
		var newValue: Self.Value = self.value * rhs.value

		guard newValue <= Self.max.value else {
			newValue = newValue - Self.max.value - 1
			return (.init(newValue), true)
		}

		return (.init(newValue), false)
	}

	public func dividedReportingOverflow(by rhs: Self) -> Self.Report {
		guard rhs.value != 0 else {
			return (self, true)
		}
		
		let report: Self.Value.Report = self.value.dividedReportingOverflow(by: rhs.value)
		let partialValue: Self = .init(value: report.partialValue)
		let overflow: Bool = report.overflow
		
		return (partialValue, overflow)
	}

	public func remainderReportingOverflow(dividingBy rhs: Self) -> Self.Report {
		guard rhs.value != 0 else {
			return (self, true)
		}
		
		let report: Self.Value.Report = self.value.remainderReportingOverflow(dividingBy: rhs.value)
		let partialValue: Self = .init(value: report.partialValue)
		let overflow: Bool = report.overflow
		
		return (partialValue, overflow)
	}
}
