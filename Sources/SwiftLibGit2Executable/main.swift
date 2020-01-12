import Clibgit2
import Foundation
print("Hello, world!")

func test_git_ls_remote() {
    LibGit2.initialize()


    let urlString = "https://github.com/andy1247008998/Clibgit2.git"

    let repo = Repository.initialize(pathString: "~/testrepo", is_bare: true)
    let remote = Remote.create_anonymous(repo: repo!, urlString: urlString)
    _ = Remote.connect(remote: remote!)
    Remote.disconnect(remote: remote)
    let out = Remote.ls(remote: remote)
    let x = out?.0
    print(x)
    Remote.free(remote: remote!)
    Repository.free(repo: repo!)
    LibGit2.shutdown()
}

func test() {
    var errorCode: Int32 = 0
    let urlString = "https://github.com/andy1247008998/Clibgit2.git"
    
    git_libgit2_init()
    
    let repo = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
    
    errorCode = git_repository_init(repo, "/Users/ailion/testrepo", 0)
    print(errorCode)
    
    let repo2: OpaquePointer? = nil
    let remote = UnsafeMutablePointer<OpaquePointer?>.allocate(capacity: 1)
    let url: UnsafePointer<Int8>? = NSString(string: urlString).utf8String
    errorCode = git_remote_create_anonymous(remote, repo2, url)
    print(errorCode)
    
    git_remote_connected(remote.pointee!)
    git_remote_disconnect(remote.pointee!)
    
    let ref = UnsafeMutablePointer<UnsafeMutablePointer<UnsafePointer<git_remote_head>?>?>.allocate(capacity: 1)
    let ref_lens = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    errorCode = git_remote_ls(ref, ref_lens, remote.pointee!)
    print(errorCode)
    
    git_libgit2_shutdown()
}


test()
