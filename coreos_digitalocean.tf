provider "digitalocean" {
    token = "${var.do_token}"
}

resource "template_file" "node" {
    count = "${var.count}"
    depends_on = ["template_file.etcd_discovery"] 

    filename = "cloud-config.yml"
    vars {
        name = "${lookup(var.name, count.index)}"
        region = "${lookup(var.region, count.index)}"
        discovery = "${file(var.discovery)}"
        ca = "${file(var.ca)}"
        crt = "${file(lookup(var.crt, count.index))}"
        key = "${file(lookup(var.key, count.index))}"
        client-secret = "${file(var.client-secret)}"
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
    name = "${lookup(var.name, count.index)}"
    region = "${lookup(var.region, count.index)}"
    size = "512mb"
    ipv6 = true
    ssh_keys = ["639062"]
    user_data = "${element(template_file.node.*.rendered, count.index)}"
}
