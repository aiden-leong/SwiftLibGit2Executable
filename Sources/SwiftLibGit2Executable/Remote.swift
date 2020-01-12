//
//  Remote.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class Remote {
    
    static func ls(size: UnsafeMutablePointer<Int>?, remote: OpaquePointer!) -> UnsafeMutablePointer<UnsafeMutablePointer<UnsafePointer<git_remote_head>?>?> {
        let out = UnsafeMutablePointer<UnsafeMutablePointer<UnsafePointer<git_remote_head>?>?>.allocate(capacity: 1)
        git_remote_ls(out, size, remote)
        return out
    }
    
}
