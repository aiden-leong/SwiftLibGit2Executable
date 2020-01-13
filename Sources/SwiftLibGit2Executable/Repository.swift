//
//  Repository.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2
import Foundation

class Repository {
    
    static func head(repo: OpaquePointer) -> OpaquePointer? {
        let out = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        let errorCode = git_repository_head(out, repo)
        switch errorCode {
        case 0:
            return out.pointee!
        default:
            print("git_repository_head Error Code: \(errorCode)")
            return nil
        }
    }
    
    static func initialize(pathString: String, is_bare: Bool) -> OpaquePointer? {
        let out = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        let repo: OpaquePointer? = nil
        let path = URL.init(string: pathString)
        var errorCode: Int32 = 0
        path!.withUnsafeFileSystemRepresentation{
            errorCode = git_repository_init(out, $0, is_bare ? 1 : 0)
        }
        switch errorCode {
        case 0:
            return out.pointee!
        default:
            print("git_repository_init Error Code: \(errorCode)")
            return nil
        }
    }
    
    static func free(repo: UnsafeMutablePointer<OpaquePointer?>) {
        git_repository_free(repo.pointee)
    }
    
    
}
