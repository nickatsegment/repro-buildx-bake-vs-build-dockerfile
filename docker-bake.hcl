target "v1" {
  tags = ["docker-buildx-bake-repro-v1"]
}

target "v2" {
  tags = ["docker-buildx-bake-repro-v2"]
}

group "default" {
  targets = ["v1", "v2"]
}
