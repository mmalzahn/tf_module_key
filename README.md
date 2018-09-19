# Terraform Modul für die Erzeugung von TLS Keys

## Einbinden in ein Projekt

---

```HCL
module "<modulname>" {
  source = "github.com/mmalzahn/tf_module_key.git"
  key_name = "<keyname>"
  key_path = "<path for keyfiles>"
}
```

### Inputs

---

|Inputname|Type|Beschreibung|
|---|---|---|
|**key_register:** |[true/false]| neuen Schlüssel in AWS registrieren|
|**aws_region:** |[string]|AWS Region|
|**key_dockerkeys:** |[true/false]| sollen Schlüüsel zusätzlich für Docker abgelegt werden|
|**key_algorithm:** |[RSA/ECDSA]| Schlüsselalgorythmus (aktuell nur RSA)|
|**key_size:** |[2048/4096]| Schlüssellänge|
|**key_name:** |[string]| Schlüsselname|
|**key_path:** |[string]| Pfad für die Ablage der Schlüsselfiles|

---
---

### Outputs

---

|Inputname|Type|Beschreibung|
|---|---|---|
|**key_algorithm:** |[string]| Schlüsselalgorythmus|
|**key_size:** |[int]| Schlüssellänge|
|**key_path:** |[string]| Pfad für die Ablage der Schlüsselfiles|
|**key_awskeyname:** |[string]| AWS Schlüsselname|
|**privat_key_pem:** |[string]| private Key im PEM Format|
|**public_key_pem:** |[string]| public Key im PEM Format|
|**public_key_openssh:** |[string]| public Key im OpenSSH Format|

## To Do

---

- [ ] Key bei Azure / Google registrieren
- [ ] Keyalgo ECDSA implementieren

## Known Problems

---
