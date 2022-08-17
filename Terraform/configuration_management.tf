## If you need to run provisioners that aren't directly associated with a specific resource, you can associate them with a null_resource.

resource "null_resource" "null1" {
  
 # 1. Inside of connection block we've to define how we want to connect to instance.
	connection {
	type = "ssh"
	user = "ec2-user"
	private_key = file("<Path_of_key>")              ## > Here, you can access via password also.
	host = aws_instance.webserver.public_ip
	}
  
# 2. To execute commands after establishing connection with instance.
# 3. Provisioners are used for configuration management into infrastructure. It is recommended to use diffrent tools eg. Puppet, Ansible, etc.

	provisioner "remote-exec" {   ## Here, "remote-exec" means you want to execute mentioned commands remotely.
		inline = [
		"sudo yum install httpd -y",
		"sudo yum install php -y",
		"sudo yum install git -y",
		"sudo systemctl start httpd",
		"sudo systemctl enable httpd",
		"sudo mkfs.ext4 /dev/sdc",
		"sudo mount /dev/sdc /var/www/html",
		"sudo git clone https://github.com/yvpatel/webserver-php.git /var/www/html"
		]
	}
}
