# Terraform configuration for the Doze.io CoreOS Cluster

Run `terraform apply -var 'do_token=XXX'` to build the cluster. `do_token` is the API key from Digital Ocean

The same folder as these config files should contain:
- an empty file, named `discovery.txt`
- ca.crt, a file containing the CA certificate. Every line other than the first one must start with two tabs.
- node.crt, a file containing the certificate of the node. The name of the file should match the name of the node. For example, if the node is named 'santa', name the file `santa.crt`. Every line other than the first one must start with two tabs.
- node.key, a file containing the decrypted (*insecure*) key of the node. The name of the file should match the name of the node. For example, if the node is named 'santa', name the file `santa.key`. Every line other than the first one must start with two tabs.

