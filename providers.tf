terraform {
  cloud {
    organization = "tforg100"

    workspaces {
      name = "remote-ws-100-git-100"
    }
  }
}