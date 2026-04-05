package terraform.authz

# Política 1: Bloquear acceso SSH publico (0.0.0.0/0)
# Criterio: Rúbrica de evaluación - Denegar SSH público

default allow = false

allow {
not ssh_public_access
}

ssh_public_access {
sg := input.resource_changes[]
sg.type == "aws_security_group"
ingress := sg.change.after.ingress[]
ingress.from_port == 22
ingress.cidr_blocks[_] == "0.0.0.0/0"
}

violation[msg] {
sg := input.resource_changes[]
sg.type == "aws_security_group"
ingress := sg.change.after.ingress[]
ingress.from_port == 22
ingress.cidr_blocks[_] == "0.0.0.0/0"
msg := sprintf("VIOLACION: Security Group '%v' expone SSH (Puerto 22) a 0.0.0.0/0. Restrinja a una IP específica.", [sg.address])
}