Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

[1.0.0] - 2026-04-05

Agregado

Configuración base del repositorio y estructura Terraform.
Infraestructura VPC (10.1.0.0/16) y subred pública (10.1.1.0/24).
Instancia EC2 Ubuntu 24.04 con restricción SSH.
Script de provisionamiento install.sh para dependencias (Checkov, OPA, Terraform, TFLint).
Políticas de validación OPA (no_ssh_public.rego y only_t2_micro.rego).
Pipeline DevSecOps en GitHub Actions (devsecops.yml).
