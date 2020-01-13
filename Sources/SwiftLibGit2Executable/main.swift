import Clibgit2
import Foundation
print("Hello, world!")

func test_git_ls_remote() {
    LibGit2.initialize()


    let urlString = "https://github.com/andy1247008998/SwiftLibGit2Executable.git"

    let remote = Remote.create_detached(urlString: urlString)
    _ = Remote.connect(remote: remote!)
    Remote.disconnect(remote: remote)
    let out = Remote.ls(remote: remote)
    let x = out!.0.pointee?[1]?.pointee.name
    print(String(cString: x!))
    Remote.free(remote: remote!)
    LibGit2.shutdown()
}

func test_git_clone() {
    
    var errorCode: Int32 = 0
    
    LibGit2.initialize()
    let localPathString = "/Users/ailion/test/Clibgit2"
    let urlString = "https://github.com/andy1247008998/Clibgit2.git"
    
    var repo: OpaquePointer? = nil
    var options = git_clone_options()
    options.version = 2
    
    errorCode = git_clone(&repo, urlString, localPathString, nil)
    print(errorCode)
    
    Repository.free(repo: &repo)
    LibGit2.shutdown()
}

test_git_clone()

//test_git_ls_remote()
