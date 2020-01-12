//
//  RevWalk.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class RevWalk {
    
    static func new(repo: OpaquePointer) -> (Int32, OpaquePointer?) {
        let out = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        let error_code = git_revwalk_new(out, repo)
        return (error_code, out.pointee)
    }
    
    
}
