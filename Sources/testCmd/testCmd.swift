// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import SwiftMurmurLib

@main
struct testCplusSwift: ParsableCommand {
    mutating func run() throws {
        print("Hello, world!  Let's call some C++ code from Swift!  🤪")
		testSwiftMurmur(string: "frogface")
		
//		let hashBits = 128
//		let hashBytes = hashBits / 8
//		var output : ContiguousArray<UInt8> = .init(repeating: 0, count: hashBytes)
//		
//		var key : ContiguousArray<UInt8> = .init(repeating: 0, count: hashBytes)
//		for i in UInt8(0)...UInt8(hashBytes-1) {
//			key[Int(i)] = i
//		}
//		print("starting output buffer:  ", output)
//		withUnsafePointer(to: key)
//		{
//			key in
//			output.withUnsafeMutableBufferPointer {
//				buffer in
//				MurmurHash3_x64_128( key,
//									 Int32(hashBytes),
//									 0,
//									 buffer.baseAddress)
//			}
//		}
//		print("Hash output: ", output)
    }
}
