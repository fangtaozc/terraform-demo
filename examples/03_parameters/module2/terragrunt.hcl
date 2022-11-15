include "root" {
  path = find_in_parent_folders()
}

dependency "module1" {
  config_path = "../module1"
}

inputs = {
  module_ns = dependency.module1.outputs.module-ns
}