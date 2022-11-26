variable "gcp_project_id" {
  default = "alation-assignment"
}
variable "region" {
  default = "asia-south1"
}
variable "zone" {
  default = "asia-south1-a"
}
variable "vm_name" {
  default = "alation-miniqube-k8s-cluster"
}
variable "vm_type" {
  default = "e2-standard-4"
}
variable "vm_image" {
  default = "ubuntu-os-cloud/ubuntu-2004-focal-v20221121"
}
variable "vm_image_type" {
  default = "pd-standard"
}
variable "service_account_email" {
  default = "519881645595-compute@developer.gserviceaccount.com"
}
variable "gce_ssh_user" {
  default = "rsa-key-20221123"
}
variable "gce_ssh_pub_key_file" {
  default = "gce_ssh_pub_key_file.txt"
}
variable "metadata_script" {
  default = "initscript_miniqube_installtion.sh"
}
variable "creds_file" {
  default = "alation-assignment-870c7a659703.json"
}