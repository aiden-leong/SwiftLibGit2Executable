import Clibgit2
import Foundation
print("Hello, world!")

func test_git_ls_remote() {
    LibGit2.initialize()


    let urlString = "https://github.com/andy1247008998/Clibgit2.git"

    let remote = Remote.create_detached(urlString: urlString)
    _ = Remote.connect(remote: remote!)
    Remote.disconnect(remote: remote)
    let out = Remote.ls(remote: remote)
    let x = out?.0.name!
    print(String(cString: x!))
    Remote.free(remote: remote!)
    LibGit2.shutdown()
}

test_git_ls_remote()
