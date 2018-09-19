locals {
  common_tags {
    responsible     = "${var.tag_responsibel}"
    tf_managed      = "1"
    tf_project      = "dca:${terraform.workspace}:${replace(var.project_name," ","")}"
    tf_project_name = "DCA_${replace(var.project_name," ","_")}_${terraform.workspace}"
    tf_environment  = "${terraform.workspace}"
    tf_created      = "${timestamp()}"
    tf_runtime      = "${var.laufzeit_tage}"
    tf_responsible  = "${var.tag_responsibel}"
    tf_configId     = "${local.projectId}"
  }

  projectId       = "${lower(random_string.projectId.result)}"
  resource_prefix = "tf-${random_string.projectId.result}-${terraform.workspace}-"
}

resource "random_string" "projectId" {
  length  = 10
  special = false
  upper   = false
  number  = false
}
