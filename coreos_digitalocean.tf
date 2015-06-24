provider "digitalocean" {
    token = "${var.do_token}"
}

resource "template_file" "node" {
    depends_on = ["template_file.etcd_discovery"]
 
    filename = "cloud-config.yml"
    vars {
        name = "${lookup(var.name, count.index)}"
        discovery = "${file(var.discovery)}"
    }
}

resource "template_file" "etcd_discovery" {
    filename = "/dev/null"
    provisioner "local-exec" {
        command = "curl https://discovery.etcd.io/new?size=${var.count} > ${var.discovery}"
    }
    vars {
        "size" = "${var.count}"
    }
}

resource "digitalocean_droplet" "node" {
    count = "${var.count}"
    image = "coreos-stable"
    name = "${lookup(var.name, count.index)}-${var.count}"
    region = "${lookup(var.region, count.index)}"
    size = "512mb"
    ipv6 = true
    ssh_keys = ["639062"]
    user_data = "${element(template_file.node.rendered, count.index)}"
}
