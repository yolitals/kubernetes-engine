provider "google" {
    credentials = "${file("~/.credentials/kubernetes-229703-f6bde26f29ca.json")}"
    project     = "kubernetes-229703"
    region      = "us-west1"
}