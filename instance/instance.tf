resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

   # the VPC subnet
  subnet_id = var.subnet_id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name      = var.mykeypair_name

  # user data
  user_data = data.template_cloudinit_config.cloudinit-example.rendered

  # provisioner "file" {
  #   source      = "script.sh"
  #   destination = "/tmp/script.sh"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/script.sh",
  #     "sudo sed -i -e 's/\r$//' /tmp/script.sh", # Remove the spurious CR characters.
  #     "sudo /tmp/script.sh",
  #   ]
  # }

  # provisioner "local-exec" {
  #   command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  # }

  # connection {
  #   host        = coalesce(self.public_ip, self.private_ip)
  #   type        = "ssh"
  #   user        = var.INSTANCE_USERNAME
  #   private_key = file(var.PATH_TO_PRIVATE_KEY)
  # }
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id    = aws_ebs_volume.ebs-volume-1.id
  instance_id  = aws_instance.example.id
  skip_destroy = true         # skip destroy to avoid issues with terraform destroy
}