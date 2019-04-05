#############################
### Google Cloud Platform ###
#############################
provider "google" {
  project     = "${var.project}"
  region      = "${var.region}"
//  credentials = "${file("~/demo_project/cloud/TF_DB_deploy/key.json")}"
}
