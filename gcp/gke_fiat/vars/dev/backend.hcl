terraform {
 backend "gcs" {
   bucket  = "tf-state-test001"
   prefix  = "terraform/state"
 }
}