module "libvirt_cloudinit_nat" {
  source = "github.com/sawa2d2/terraform-modules//libvirt-cloudinit-nat/"

  # Localhost: "qemu:///system"
  # Remote   : "qemu+ssh://<user>@<host>/system"
  libvirt_uri = "qemu:///system"

  ### Base image URI for VM ###
  # Download the image by:
  #   sudo curl -L -o /var/lib/libvirt/images/Rocky-9-GenericCloud.latest.x86_64.qcow2 https://download.rockylinux.org/pub/rocky/9.2/images/x86_64/Rocky-9-GenericCloud.latest.x86_64.qcow2 
  vm_base_image_uri = "/var/lib/libvirt/images/Rocky-9-GenericCloud.latest.x86_64.qcow2"

  # Networking
  network_name = "default"

  pool = "default"
  vms = [
    {
      name           = "psql1"
      vcpu           = 4
      memory         = 16000                    # in MiB
      disk           = 100 * 1024 * 1024 * 1024 # 100 GB
      ip             = "192.168.122.21"
      cloudinit_file = "cloud_init.cfg"
      volumes = [
        {
          name = "vdb"
          disk = 256 * 1024 * 1024 * 1024 # 1 TB
        },
        {
          name = "vdc"
          disk = 256 * 1024 * 1024 * 1024 # 1 TB
        },
      ]
    },
    {
      name           = "psql2"
      vcpu           = 4
      memory         = 16000                    # in MiB
      disk           = 100 * 1024 * 1024 * 1024 # 100 GB
      ip             = "192.168.122.22"
      cloudinit_file = "cloud_init.cfg"
      volumes = [
        {
          name = "vdb"
          disk = 256 * 1024 * 1024 * 1024 # 1 TB
        },
        {
          name = "vdc"
          disk = 256 * 1024 * 1024 * 1024 # 1 TB
        },
      ]
    },
    {
      name           = "psql3"
      vcpu           = 4
      memory         = 16000                    # in MiB
      disk           = 100 * 1024 * 1024 * 1024 # 100 GB
      ip             = "192.168.122.23"
      cloudinit_file = "cloud_init.cfg"
      volumes = [
        {
          name = "vdb"
          disk = 256 * 1024 * 1024 * 1024 # 1 TB
        },
        {
          name = "vdc"
          disk = 256 * 1024 * 1024 * 1024 # 1 TB
        },
      ]
    },
  ]
}
