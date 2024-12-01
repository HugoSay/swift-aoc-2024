//
//  Day01.swift
//  AoC-Swift-Template
//  Forked from https://github.com/Dean151/AoC-Swift-Template
//
//  Created by Thomas DURAND.
//  Follow me on Twitter @deanatoire
//  Check my computing blog on https://www.thomasdurand.fr/
//

import Foundation

import AoC
import Common

@main
struct Day01: Puzzle {
    typealias Input = Locations
    typealias OutputPartOne = Int
    typealias OutputPartTwo = Int
}

struct Locations: Parsable {
    static func parse(raw: String) throws -> Locations {
        var l: [Int] = []
        var r: [Int] = []
        for line in raw.components(separatedBy: .newlines) {
            let numbers = line.components(separatedBy: .whitespaces)
            l.append(Int(numbers.first!)!)
            r.append(Int(numbers.last!)!)
        }
        return Locations(left: l, right: r)

    }
    
    let left, right: [Int]


    func solve1() -> Int {
        zip(left.sorted(), right.sorted())
            .reduce(into: 0) { r, next in
                r += abs(next.0 - next.1)
            }
    }
}

// MARK: - PART 1

extension Day01 {
    static var partOneExpectations: [any Expectation<Input, OutputPartOne>] {
        [
            assert(expectation: 11, fromRaw: raw)
        ]
    }

    static func solvePartOne(_ input: Input) async throws -> OutputPartOne {
        input.solve1()
    }
}

// MARK: - PART 2

extension Day01 {
    static var partTwoExpectations: [any Expectation<Input, OutputPartTwo>] {
        [
            assert(expectation: 31, fromRaw: raw2)
        ]
    }

    static func solvePartTwo(_ input: Input) async throws -> OutputPartTwo {
        var res = 0
        for number in input.left {
            res += number * input.right.count { $0 == number }
        }
        return res
    }
}
let raw = """
3   4
4   3
2   5
1   3
3   9
3   3
"""

let raw2 = """
3   4
4   3
2   5
1   3
3   9
3   3
"""
