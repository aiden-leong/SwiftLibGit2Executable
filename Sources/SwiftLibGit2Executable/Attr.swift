//
//  Attr.swift
//
//
//  Created by ailion on 2020/1/12.
//

import Clibgit2

class Attr {
    
    static func add_macro(repo: OpaquePointer!, name: UnsafePointer<Int8>!, values: UnsafePointer<Int8>!) {
        git_attr_add_macro(repo, name, values)
    }
    
    static func cache_flush(repo: OpaquePointer!) {
        git_attr_cache_flush(repo)
    }
    
    static func foreach(repo: OpaquePointer!, flags: UInt32, path: UnsafePointer<Int8>!, callback: git_attr_foreach_cb!, payload: UnsafeMutableRawPointer!) {
        git_attr_foreach(repo, flags, path, callback, payload)
    }
    
    static func get(repo: OpaquePointer!, flags: UInt32, path: UnsafePointer<Int8>!, name: UnsafePointer<Int8>!) -> UnsafeMutablePointer<UnsafePointer<Int8>?>! {
        let value_out = UnsafeMutablePointer<UnsafePointer<Int8>?>.allocate(capacity: 1)
        git_attr_get(value_out, repo, flags, path, name)
        return value_out
    }
    
    static func get_many(repo: OpaquePointer!, flags: UInt32, path: UnsafePointer<Int8>!, num_attr: Int, names: UnsafeMutablePointer<UnsafePointer<Int8>?>?) -> UnsafeMutablePointer<UnsafePointer<Int8>?>! {
        let values_out = UnsafeMutablePointer<UnsafePointer<Int8>?>.allocate(capacity: 1)
        git_attr_get_many(values_out, repo, flags, path, num_attr, names)
        return values_out
    }
    
    static func value(attr: UnsafePointer<Int8>!) -> git_attr_t {
        git_attr_value(attr)
    }
    
}
