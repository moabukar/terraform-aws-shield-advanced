package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformWithAWSShield(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{

		TerraformDir: "./examples",

		// pass vars to the Terraform code using -var options
		Vars: map[string]interface{}{
			"members":     []string{"arn:aws:...", "arn:aws:..."},
			"name":        "shield-protection-group",
			"aggregation": "SUM",
		},

		// pass vars to our Terraform code using VAR=value environment variables
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-1",
		},

		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)

	initAndApply := terraform.InitAndApply(t, terraformOptions)

	assert.True(t, initAndApply)

	// Run `terraform output` to get the value of an output variable
	createdProtectionGroup := terraform.Output(t, terraformOptions, "created_protection_group")

	// Validate that the AWS Shield Protection Group was created successfully.
	assert.True(t, strings.Contains(createdProtectionGroup, "my-protection-group"))
}
