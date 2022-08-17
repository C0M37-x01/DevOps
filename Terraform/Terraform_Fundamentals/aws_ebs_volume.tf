provider "aws" {
	profile = "default"
}

# Creating Instance

resource "aws_instance" "Webserver"{
	ami = "ami-092b43193629811af"
	instance_type = "t2.micro"
	tags = {
		Name = "Terraform-Instance"
	}
}

# Creating EBS Volume

resource "aws_ebs_volume" "Store" {
	availability_zone = aws_instance.Webserver.availability_zone
	size = 1
}
  
# Attaching EBS Volume

resource "aws_volume_attachment" "Data2" {
	device_name = "/dev/sdh"
	volume_id = aws_ebs_volume.Store.id
	instance_id = aws_instance.Webserver.id
}

# Getting multiple values from One Block

output "Instance_Info" {
	value = [aws_instance.Webserver.id, aws_ebs_volume.Store.id]
}
