locals {
  cis_v140_1_common_tags = merge(local.cis_v140_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v140_1" {
  title         = "1 Identity and Access Management"
  documentation = file("./cis_v140/docs/cis_v140_1.md")
  children = [
    control.cis_v140_1_1,
    control.cis_v140_1_2,
    control.cis_v140_1_3,
    control.cis_v140_1_4,
    control.cis_v140_1_5,
    control.cis_v140_1_6,
    control.cis_v140_1_7,
    control.cis_v140_1_8,
    control.cis_v140_1_9,
    control.cis_v140_1_10,
    control.cis_v140_1_11,
    control.cis_v140_1_12,
    control.cis_v140_1_13,
    control.cis_v140_1_14,
    control.cis_v140_1_15,
    control.cis_v140_1_16,
    control.cis_v140_1_17,
    control.cis_v140_1_18,
    control.cis_v140_1_19,
    control.cis_v140_1_20,
    control.cis_v140_1_21
  ]
  tags = local.cis_v140_1_common_tags
}

control "cis_v140_1_1" {
  title         = "1.1 Maintain current contact details"
  description   = "Ensure contact email and telephone details for AWS accounts are current and map to more than one individual in your organization."
  sql           = query.manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_1_1.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.1"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v140_1_2" {
  title         = "1.2 Ensure security contact information is registered"
  description   = "AWS provides customers with the option of specifying the contact information for account's security team. It is recommended that this information be provided."
  sql           = query.manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_1_2.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.2"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v140_1_3" {
  title         = "1.3 Ensure security questions are registered in the AWS account"
  description   = "The AWS support portal allows account owners to establish security questions that can be used to authenticate individuals calling AWS customer service for support. It is recommended that security questions be established."
  sql           = query.manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_1_3.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.3"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v140_1_4" {
  title         = "1.4 Ensure no 'root' user account access key exists"
  description   = "The 'root' user account is the most privileged user in an AWS account. AWS Access Keys provide programmatic access to a given AWS account. It is recommended that all access keys associated with the 'root' user account be removed."
  sql           = query.iam_root_user_no_access_keys.sql
  documentation = file("./cis_v140/docs/cis_v140_1_4.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.4"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_5" {
  title         = "1.5 Ensure MFA is enabled for the 'root' user account"
  description   = "The 'root' user account is the most privileged user in an AWS account. Multi-factor Authentication (MFA) adds an extra layer of protection on top of a username and password. With MFA enabled, when a user signs in to an AWS website, they will be prompted for their username and password as well as for an authentication code from their AWS MFA device."
  sql           = query.iam_root_user_mfa_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_1_5.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.5"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_6" {
  title         = "1.6 Ensure hardware MFA is enabled for the 'root' user account"
  description   = "The 'root' user account is the most privileged user in an AWS account. MFA adds an extra layer of protection on top of a user name and password. With MFA enabled, when a user signs in to an AWS website, they will be prompted for their user name and password as well as for an authentication code from their AWS MFA device. For Level 2, it is recommended that the root user account be protected with a hardware MFA."
  sql           = query.iam_root_user_hardware_mfa_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_1_6.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.6"
    cis_level   = "2"
    cis_type    = "automated"
  })
}

control "cis_v140_1_7" {
  title         = "1.7 Eliminate use of the 'root' user for administrative and daily tasks"
  description   = "With the creation of an AWS account, a 'root user' is created that cannot be disabled or deleted. That user has unrestricted access to and control over all resources in the AWS account. It is highly recommended that the use of this account be avoided for everyday tasks."
  sql           = query.iam_root_last_used.sql
  documentation = file("./cis_v140/docs/cis_v140_1_7.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.7"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_8" {
  title         = "1.8 Ensure IAM password policy requires minimum length of 14 or greater"
  description   = "Password policies are, in part, used to enforce password complexity requirements. IAM password policies can be used to ensure password are at least a given length. It is recommended that the password policy require a minimum password length 14."
  sql           = query.iam_account_password_policy_min_length_14.sql
  documentation = file("./cis_v140/docs/cis_v140_1_8.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.8"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_9" {
  title         = "1.9 Ensure IAM password policy prevents password reuse"
  description   = "IAM password policies can prevent the reuse of a given password by the same user. It is recommended that the password policy prevent the reuse of passwords."
  sql           = query.iam_account_password_policy_reuse_24.sql
  documentation = file("./cis_v140/docs/cis_v140_1_9.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.9"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_10" {
  title         = "1.10 Ensure multi-factor authentication (MFA) is enabled for all IAM users that have a console password"
  description   = "Multi-Factor Authentication (MFA) adds an extra layer of authentication assurance beyond traditional credentials. With MFA enabled, when a user signs in to the AWS Console, they will be prompted for their user name and password as well as for an authentication code from their physical or virtual MFA token. It is recommended that MFA be enabled for all accounts that have a console password."
  sql           = query.iam_user_console_access_mfa_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_1_10.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.10"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_11" {
  title         = "1.11 Do not setup access keys during initial user setup for all IAM users that have a console password"
  description   = "AWS console defaults to no check boxes selected when creating a new IAM user. When creating the IAM User credentials you have to determine what type of access they require."
  sql           = query.iam_user_access_keys_and_password_at_setup.sql
  documentation = file("./cis_v140/docs/cis_v140_1_11.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.11"
    cis_level   = "1"
    cis_type    = "manual"
  })
}

control "cis_v140_1_12" {
  title         = "1.12 Ensure credentials unused for 45 days or greater are disabled"
  description   = "AWS IAM users can access AWS resources using different types of credentials, such as passwords or access keys. It is recommended that all credentials that have been unused in 45 or greater days be deactivated or removed."
  sql           = query.iam_user_unused_credentials_45.sql
  documentation = file("./cis_v140/docs/cis_v140_1_12.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.12"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_13" {
  title         = "1.13 Ensure there is only one active access key available for any single IAM user"
  description   = "Access keys are long-term credentials for an IAM user or the AWS account root user. You can use access keys to sign programmatic requests to the AWS CLI or AWS API (directly or using the AWS SDK)."
  sql           = query.iam_user_one_active_key.sql
  documentation = file("./cis_v140/docs/cis_v140_1_13.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.13"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_14" {
  title         = "1.14 Ensure access keys are rotated every 90 days or less"
  description   = "Access keys consist of an access key ID and secret access key, which are used to sign programmatic requests that you make to AWS. AWS users need their own access keys to make programmatic calls to AWS from the AWS Command Line Interface (AWS CLI), Tools for Windows PowerShell, the AWS SDKs, or direct HTTP calls using the APIs for individual AWS services. It is recommended that all access keys be regularly rotated."
  sql           = query.iam_user_access_key_age_90.sql
  documentation = file("./cis_v140/docs/cis_v140_1_14.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.14"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_15" {
  title         = "1.15 Ensure IAM Users Receive Permissions Only Through Groups"
  description   = "IAM users are granted access to services, functions, and data through IAM policies. There are three ways to define policies for a user: 1) Edit the user policy directly, aka an inline, or user, policy; 2) attach a policy directly to a user; 3) add the user to an IAM group that has an attached policy. Only the third implementation is recommended."
  sql           = query.iam_user_no_inline_attached_policies.sql
  documentation = file("./cis_v140/docs/cis_v140_1_15.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.15"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_16" {
  title         = "1.16 Ensure IAM policies that allow full \"*:*\" administrative privileges are not attached"
  description   = "IAM policies are the means by which privileges are granted to users, groups, or roles. It is recommended and considered a standard security advice to grant least privilege -that is, granting only the permissions required to perform a task. Determine what users need to do and then craft policies for them that let the users perform only those tasks, instead of allowing full administrative privileges."
  sql           = query.iam_policy_no_star_star.sql
  documentation = file("./cis_v140/docs/cis_v140_1_16.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.16"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_17" {
  title         = "1.17 Ensure a support role has been created to manage incidents with AWS Support"
  description   = "AWS provides a support center that can be used for incident notification and response, as well as technical support and customer services. Create an IAM Role to allow authorized users to manage incidents with AWS Support."
  sql           = query.iam_support_role.sql
  documentation = file("./cis_v140/docs/cis_v140_1_17.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.17"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_18" {
  title         = "1.18 Ensure IAM instance roles are used for AWS resource access from instances"
  description   = "AWS access from within AWS instances can be done by either encoding AWS keys into AWS API calls or by assigning the instance to a role which has an appropriate permissions policy for the required access. \"AWS Access\" means accessing the APIs of AWS in order to access AWS resources or manage AWS account resources."
  sql           = query.manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_1_18.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.18"
    cis_level   = "2"
    cis_type    = "manual"
  })
}

control "cis_v140_1_19" {
  title         = "1.19 Ensure that all the expired SSL/TLS certificates stored in AWS IAM are removed"
  description   = "To enable HTTPS connections to your website or application in AWS, you need an SSL/TLS server certificate. You can use ACM or IAM to store and deploy server certificates. Use IAM as a certificate manager only when you must support HTTPS connections in a region that is not supported by ACM. IAM securely encrypts your private keys and stores the encrypted version in IAM SSL certificate storage. IAM supports deploying server certificates in all regions, but you must obtain your certificate from an external provider for use with AWS. You cannot upload an ACM certificate to IAM. Additionally, you cannot manage your certificates from the IAM Console."
  sql           = query.iam_server_certificate_not_expired.sql
  documentation = file("./cis_v140/docs/cis_v140_1_19.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.19"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_20" {
  title         = "1.20 Ensure that IAM Access analyzer is enabled for all regions"
  description   = "Enable IAM Access analyzer for IAM policies about all resources in each region. IAM Access Analyzer is a technology introduced at AWS reinvent 2019. After the Analyzer is enabled in IAM, scan results are displayed on the console showing the accessible resources. Scans show resources that other accounts and federated users can access, such as KMS keys and IAM roles. So the results allow you to determine if an unintended user is allowed, making it easier for administrators to monitor least privileges access. Access Analyzer analyzes only policies that are applied to resources in the same AWS Region."
  sql           = query.iam_access_analyzer_enabled.sql
  documentation = file("./cis_v140/docs/cis_v140_1_20.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.20"
    cis_level   = "1"
    cis_type    = "automated"
  })
}

control "cis_v140_1_21" {
  title         = "1.21 Ensure IAM users are managed centrally via identity federation or AWS Organizations for multi-account environments"
  description   = "In multi-account environments, IAM user centralization facilitates greater user control. User access beyond the initial account is then provide via role assumption. Centralization of users can be accomplished through federation with an external identity provider or through the use of AWS Organizations."
  sql           = query.manual_control.sql
  documentation = file("./cis_v140/docs/cis_v140_1_21.md")

  tags = merge(local.cis_v140_1_common_tags, {
    cis_item_id = "1.21"
    cis_level   = "2"
    cis_type    = "manual"
  })
}