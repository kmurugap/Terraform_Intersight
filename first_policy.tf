terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
    }
  }
}

provider "intersight" {
  apikey = var.ApiKey
  secretkey= var.SecretKey
  endpoint = "https://intersight.com"

}

data "intersight_organization_organization" "organization" {
  name = "default"
}

resource "intersight_ntp_policy" "ntp1" {
  name        = "ntp_TF"
  description = "Policy creation-1"
  enabled     = true
  ntp_servers = [
    "ntp.esl.cisco.com",
    "time-a-g.nist.gov",
    "time-b-g.nist.gov"
  ]
  organization {
    moid        = data.intersight_organization_organization.organization.results[0].moid
    object_type = "organization.Organization"
  }
}
