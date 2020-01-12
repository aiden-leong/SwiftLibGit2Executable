//
//  AnnotatedCommit.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class AnnotatedCommit {
    
    static func free(commit: OpaquePointer!) {
        git_annotated_commit_free(commit)
    }
    
    static func from_fetchhead(repo: OpaquePointer!, branchName: UnsafeMutablePointer<Int8>!, remoteURL: UnsafePointer<Int8>!, id: UnsafePointer<git_oid>!) -> UnsafeMutablePointer<OpaquePointer?>! {
        
        let out = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        git_annotated_commit_from_fetchhead(out, repo, branchName, remoteURL, id)
        return out
    }
    
    static func from_revspec(repo: OpaquePointer!, revspec: UnsafePointer<Int8>!) -> UnsafeMutablePointer<OpaquePointer?>! {
        let out = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        git_annotated_commit_from_revspec(out, repo, revspec)
        return out
    }
    
    static func id(commit: OpaquePointer!) -> UnsafePointer<git_oid>! {
        return git_annotated_commit_id(commit)
    }
    
    static func lookup(repo: OpaquePointer!, id: UnsafePointer<git_oid>!) -> UnsafeMutablePointer<OpaquePointer?>! {
        let out = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        git_annotated_commit_lookup(out, repo, id)
        return out
    }
    
    static func ref(commit: OpaquePointer!) -> String {
        let refName = git_annotated_commit_ref(commit)
        return String(cString: refName!)
    }
    
}
