# terraform-hetzner-server

Terraform module for Hetzner Cloud servers using the [hetznercloud/hcloud](https://registry.terraform.io/providers/hetznercloud/hcloud) provider.

Provisions a single server with delete and rebuild protection enabled by default.

## Usage

```hcl
module "server" {
  source = "github.com/dark-vex/terraform-hetzner-server?ref=v1.0.0"

  name        = "my-server"
  server_type = "cx22"
  image       = "debian-12"
  location    = "nbg1"

  ssh_key_ids = [hcloud_ssh_key.my_key.id]
}
```

See [`examples/basic/`](examples/basic/) for a full working example.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.60.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_server.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_backups"></a> [backups](#input\_backups) | Enable automatic backups | `bool` | `true` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable delete protection | `bool` | `true` | no |
| <a name="input_image"></a> [image](#input\_image) | OS image to use | `string` | `"debian-10"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to attach to the server | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Hetzner Cloud datacenter location | `string` | `"nbg1"` | no |
| <a name="input_name"></a> [name](#input\_name) | Server hostname | `string` | n/a | yes |
| <a name="input_rebuild_protection"></a> [rebuild\_protection](#input\_rebuild\_protection) | Enable rebuild protection | `bool` | `true` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Hetzner Cloud server type | `string` | `"cx23"` | no |
| <a name="input_ssh_key_ids"></a> [ssh\_key\_ids](#input\_ssh\_key\_ids) | IDs of existing hcloud\_ssh\_key resources | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | ID of the Hetzner Cloud server |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | Public IPv4 address of the server |
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | Public IPv6 address of the server |
| <a name="output_name"></a> [name](#output\_name) | Name of the Hetzner Cloud server |
| <a name="output_status"></a> [status](#output\_status) | Status of the server (e.g. running) |
<!-- END_TF_DOCS -->

## License

[MIT](LICENSE)
