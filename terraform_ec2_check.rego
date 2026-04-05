package terraform.ec2

# Política 2: Solo permitir instancias EC2 de tipo t2.micro
# Criterio: Rúbrica de evaluación - Restringir t2.micro

default allow_instance_type = false

allow_instance_type {
not invalid_instance_type
}

invalid_instance_type {
ec2 := input.resource_changes[_]
ec2.type == "aws_instance"
ec2.change.after.instance_type != "t2.micro"
}

violation[msg] {
ec2 := input.resource_changes[_]
ec2.type == "aws_instance"
ec2.change.after.instance_type != "t2.micro"
msg := sprintf("VIOLACION: Instancia EC2 '%v' usa tipo '%v'. Solo se permite 't2.micro'.", [ec2.address, ec2.change.after.instance_type])
}