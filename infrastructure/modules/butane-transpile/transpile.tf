data "ct_config" "ignition" {
  strict = true
  content = templatefile(var.file_location, var.template_vars)
}

output "ignition" {
  value = data.ct_config.ignition.rendered
}