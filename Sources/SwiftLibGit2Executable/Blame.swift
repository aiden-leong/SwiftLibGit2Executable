//
//  Blame.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class Blame {
    
    static func buffer(reference: OpaquePointer, bufferString: String, buffer_len: Int) -> OpaquePointer? {
        var out: OpaquePointer? = nil
        let buffer = UnsafePointer<Int8>(bufferString)
        let errorCode = git_blame_buffer(&out, reference, buffer, buffer_len)
        switch errorCode {
        case 0:
            return out
        default:
            print("git_repository_head Error Code: \(errorCode)")
            return nil
        }
    }
    
    
}
