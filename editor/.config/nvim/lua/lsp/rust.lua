local rust_settings = {
  ["rust-analyzer"] = {
    diagnostics = {enable = true, disabled = {"unresolved-proc-macro"}, enableExperimental = true}
  }
}

return rust_settings
