terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}
resource "local_file" "cat" {
  filename = var.filename
  ## content  = "My favorite pet is ${random_pet.my-pet.id}"
  content  = "My favorite pet is ${random_pet.my-pet.id}"
  depends_on = [
    random_pet.my-pet
  ]
}

resource "random_pet" "my-pet" {
  prefix    = var.prefix[0]
  separator = var.separator
  length    = var.length

}

output "pet-name" {
  value       = random_pet.my-pet.id
  description = "Record the value of pet ID generated"
}

