variable "filename" {
  default = "./my-peeet.txt"
}

variable "content" {
  default = "We love pets!"
}

variable "prefix" {
  default = ["Mr", "Mrs", "Sir"]
  type    = list(string)
}

variable "separator" {
  default = "."
}

variable "length" {
  default = 2
}

variable "file-content" {
  type = map(string)
  default = {
    "statement1" = "We love pets"
    "statement2" = "We love animals"
  }
}