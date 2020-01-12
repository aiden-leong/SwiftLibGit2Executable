//
//  Remote.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class Remote {
    
    static func connect(remote: OpaquePointer) -> Int32 {
        let errorCode = git_remote_connect(remote, GIT_DIRECTION_FETCH, nil, nil, nil)
        if errorCode != 0 {
            print("git_remote_connected Error Code: \(errorCode)")
        }
        return errorCode
    }
    
    static func connect(remote: OpaquePointer, direction: git_direction) -> Int32 {
        let errorCode = git_remote_connect(remote, direction, nil, nil, nil)
        if errorCode != 0 {
            print("git_remote_connected Error Code: \(errorCode)")
        }
        return errorCode
    }
    
    static func create_anonymous(repo: OpaquePointer, urlString: String) -> OpaquePointer? {
        let out = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        let url = UnsafePointer<Int8>(urlString)
        let errorCode = git_remote_create_anonymous(out, repo, url)
        switch errorCode {
        case 0:
            return out.pointee!
        default:
            print("git_remote_create_anonymous Error Code: \(errorCode)")
            return nil
        }
    }
    
    static func create_detached(urlString: String) -> OpaquePointer? {
        let out = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
        let url = UnsafePointer<Int8>(urlString)
        let errorCode = git_remote_create_detached(out, url)
        switch errorCode {
        case 0:
            return out.pointee!
        default:
            print("git_remote_create_detached Error Code: \(errorCode)")
            return nil
        }
    }
    
    static func disconnect(remote: OpaquePointer!) {
         git_remote_disconnect(remote)
    }
    
    static func free(remote: OpaquePointer) {
        git_remote_free(remote)
    }
    
    static func ls(remote: OpaquePointer!) -> (UnsafeMutablePointer<UnsafeMutablePointer<UnsafePointer<git_remote_head>?>?>, Int)? {
        let out = UnsafeMutablePointer<UnsafeMutablePointer<UnsafePointer<git_remote_head>?>?>.allocate(capacity: 1)
        var size:Int = 0
        let errorCode = git_remote_ls(out, &size, remote)
        switch errorCode {
        case 0:
            return (out, size)
        default:
            print("git_remote_ls Error Code: \(errorCode)")
            return nil
        }
    }
    
}
