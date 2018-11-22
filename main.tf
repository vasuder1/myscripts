# Download the ghost:latest docker_image "image_id" to the system using a Terraform resource
resource "docker_image" "image_id" {
  name = "ghost:latest"
}

resource "docker_image" "image_id2" {
  name = "nginx:latest"
}

resource "docker_image" "image_id3" {
  name = "ubuntu:latest"
}

resource "docker_container" "foo" {
  image = "${docker_image.image_id2.latest}"
  name  = "foo"
}

resource "docker_container" "ubuntu"  {
  image = "${docker_image.image_id3.latest}"
  command = ["sleep", "300" ]
  name = "ubuntu"
} 

resource "docker_container" "ghost" {
  image = "ghost:latest"
  name = "ghost"
}
