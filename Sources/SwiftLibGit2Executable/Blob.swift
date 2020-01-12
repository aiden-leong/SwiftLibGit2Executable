//
//  Blob.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class Blob {
    
    static func create_from_buffer(repo: OpaquePointer, buffer: UnsafeRawPointer, len: Int) -> (Int32, git_oid) {
        let id = UnsafeMutablePointer<git_oid>.allocate(capacity: 1)
        let error_code = git_blob_create_frombuffer(id, repo, buffer, len)
        return (error_code, id.pointee)
    }
    
    static func create_from_disk(repo: OpaquePointer, pathString: String) -> (Int32, git_oid) {
        let id = UnsafeMutablePointer<git_oid>.allocate(capacity: 1)
        let path = UnsafePointer<Int8>(pathString)
        let error_code = git_blob_create_fromdisk(id, repo, path)
        return (error_code, id.pointee)
    }
    
    static func create_from_stream(repo: OpaquePointer, streamString: String) -> (Int32, git_writestream) {
        var id = UnsafeMutablePointer<git_writestream>.allocate(capacity: 1)
        let stream = UnsafePointer<Int8>(streamString)
        let error_code = git_blob_create_fromstream(&id, repo, stream)
        return (error_code, id.pointee)
    }
    
    
}
