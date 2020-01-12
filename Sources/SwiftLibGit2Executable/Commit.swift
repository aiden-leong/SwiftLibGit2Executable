//
//  Commit.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class Commit {
    
    static func lookup(repo: OpaquePointer, id: git_oid) -> (Int32, UnsafeMutablePointer<OpaquePointer?>?) {
        let commit = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        var id = id
        let error_code = git_commit_lookup(commit, repo, &id)
        return (error_code, commit)
    }
    
    
}
