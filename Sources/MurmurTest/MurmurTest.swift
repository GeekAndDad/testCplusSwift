//
//  MurmurTest.swift
//  testCmd
//
//

import Murmur

public func testMurmurTest(string: String) -> String {
	print("testMurmurTest…")
	
	let hashBits = 128
	let hashBytes = hashBits / 8
	var output : ContiguousArray<UInt8> = .init(repeating: 0, count: hashBytes)

	var key : ContiguousArray<UInt8> = .init(repeating: 0, count: hashBytes)
	for i in UInt8(0)...UInt8(hashBytes-1) {
		key[Int(i)] = i
	}
	print("starting output buffer:  ", output)
	withUnsafePointer(to: key)
	{
		key in
		output.withUnsafeMutableBufferPointer {
			buffer in
			MurmurHash3_x64_128( key,
								 Int32(hashBytes),
								 0,
								 buffer.baseAddress)
		}
	}
	print("Hash output: ", output)

	return "testMurmurTest says \(string)"
}
