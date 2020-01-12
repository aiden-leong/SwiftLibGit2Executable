//
//  Apply.swift
//  
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class Apply {
    
    static func diff(repo: OpaquePointer!, diff: OpaquePointer!, location: git_apply_location_t, options: UnsafePointer<git_apply_options>) {
        git_apply(repo, diff, location, options)
    }
    
    static func diff_to_tree(repo: OpaquePointer!, preimage: OpaquePointer!, diff: OpaquePointer!, options: UnsafePointer<git_apply_options>) -> UnsafeMutablePointer<OpaquePointer?>! {
        let out = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        git_apply_to_tree(out, repo, preimage, diff, options)
        return out
    }
    
    
}
