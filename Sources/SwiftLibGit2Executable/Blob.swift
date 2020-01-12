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
    
    static func create_from_stream(repo: OpaquePointer, hintpathString: String) -> (Int32, git_writestream) {
        let stream = UnsafeMutablePointer<UnsafeMutablePointer<git_writestream>?>.allocate(capacity: 1)
        let hintpath = UnsafePointer<Int8>(hintpathString)
        let error_code = git_blob_create_fromstream(stream, repo, hintpath)
        return (error_code, stream.pointee!.pointee)
    }
    
    static func create_from_stream_commit(stream: UnsafeMutablePointer<git_writestream>) -> (Int32, git_oid) {
        let id = UnsafeMutablePointer<git_oid>.allocate(capacity: 1)
        let error_code = git_blob_create_fromstream_commit(id, stream)
        return (error_code, id.pointee)
    }
    
    static func create_from_workdir(repo: OpaquePointer, relativePathString: String) -> (Int32, git_oid) {
        let id = UnsafeMutablePointer<git_oid>.allocate(capacity: 1)
        let relativePath = UnsafePointer<Int8>(relativePathString)
        let error_code = git_blob_create_fromworkdir(id, repo, relativePath )
        return (error_code, id.pointee)
    }
    
    static func dup(source: OpaquePointer) -> (Int32, OpaquePointer?) {
        var out: OpaquePointer? = nil
        let error_code = git_blob_dup(&out, source)
        return (error_code, out)
    }
    
    
}
