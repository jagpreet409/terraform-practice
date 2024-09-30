provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_iam_user" "myuser" {
  name = "JP"
}


resource "aws_iam_policy" "customPolicy" {
  name = "GlacierEFSEC2"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:AuthorizeSecurityGroupIngress",
				"ec2:ReplaceRouteTableAssociation",
				"ec2:ModifyManagedPrefixList",
				"ec2:CreateIpamPool",
				"ec2:ResetInstanceAttribute",
	     		"ec2:EnableVpcClassicLinkDnsSupport",
				"ec2:AcceptTransitGatewayMulticastDomainAssociations",
				"ec2:DeleteSubnetCidrReservation",
				"ec2:CreateDhcpOptions",
				"ec2:ModifyVolumeAttribute",
				"ec2:DeleteClientVpnEndpoint",
				"ec2:DeleteLocalGatewayRouteTableVpcAssociation",
				"ec2:UpdateSecurityGroupRuleDescriptionsIngress",
				"ec2:DeleteRouteTable",
				"ec2:AllocateIpamPoolCidr",
				"ec2:RevokeSecurityGroupEgress",
				"ec2:RestoreSnapshotTier",
				"ec2:DeleteInternetGateway",
				"ec2:ModifyIpamResourceDiscovery",
				"ec2:DeleteVerifiedAccessGroup",
				"ec2:DeprovisionIpamByoasn",
				"ec2:BundleInstance",
				"ec2:DisableFastSnapshotRestores",
				"ec2:CreateTags",
				"glacier:DeleteVault",
				"ec2:CreateLocalGatewayRouteTableVpcAssociation",
				"ec2:ModifySecurityGroupRules",
				"ec2:DisassociateRouteTable",
				"ec2:RevokeSecurityGroupIngress",
				"ec2:CreateDefaultVpc",
				"glacier:ListMultipartUploads",
				"ec2:CreateSnapshots",
				"ec2:CreateVpnConnectionRoute",
				"ec2:ModifyVpnTunnelOptions",
				"ec2:DeleteClientVpnRoute",
				"ec2:AssociateVerifiedAccessInstanceWebAcl",
				"ec2:EnableVgwRoutePropagation",
				"glacier:ListTagsForVault",
				"ec2:DeleteNetworkInterface",
				"ec2:DeletePublicIpv4Pool",
				"ec2:CreateFleet",
				"ec2:ModifyHosts",
				"ec2:ProvisionIpamPoolCidr",
				"ec2:DeleteLocalGatewayRoute",
				"ec2:AssociateAddress",
				"ec2:DeleteTransitGateway",
				"ec2:CancelBundleTask",
				"ec2:CreateTrafficMirrorFilter",
				"ec2:DeregisterImage",
				"ec2:ModifyPrivateDnsNameOptions",
				"ec2:RequestSpotInstances",
				"ec2:PurchaseReservedInstancesOffering",
				"ec2:DeleteTrafficMirrorTarget",
				"ec2:ReplaceTransitGatewayRoute",
				"ec2:DeleteFpgaImage",
				"ec2:RegisterTransitGatewayMulticastGroupSources",
				"ec2:TerminateClientVpnConnections",
				"glacier:InitiateMultipartUpload",
				"ec2:DeleteTransitGatewayConnectPeer",
				"elasticfilesystem:DescribeMountTargets",
				"ec2:DeleteEgressOnlyInternetGateway",
				"ec2:DisassociateIpamResourceDiscovery",
				"ec2:CreateIpamExternalResourceVerificationToken",
				"ec2:CopyFpgaImage",
				"ec2:DisableImage",
				"ec2:DeleteVpnConnectionRoute",
				"elasticfilesystem:DescribeTags",
				"ec2:ModifyVerifiedAccessTrustProvider",
				"ec2:ModifyCapacityReservation",
				"ec2:ModifyLaunchTemplate",
				"ec2:CancelReservedInstancesListing",
				"ec2:CreateNetworkAclEntry",
				"ec2:AssociateIamInstanceProfile",
				"ec2:CreateVerifiedAccessTrustProvider",
				"ec2:CreateKeyPair",
				"ec2:CreateTransitGatewayConnect",
				"ec2:ModifyClientVpnEndpoint",
				"ec2:AcceptTransitGatewayVpcAttachment",
				"glacier:ListParts",
				"ec2:CreateNetworkInsightsPath",
				"ec2:DisableImageDeregistrationProtection",
				"ec2:ModifySpotFleetRequest",
				"ec2:StartInstances",
				"ec2:CreateInternetGateway",
				"ec2:RejectTransitGatewayVpcAttachment",
				"ec2:CreateReservedInstancesListing",
				"ec2:DisassociateTransitGatewayRouteTable",
				"ec2:ModifyAddressAttribute",
				"ec2:ModifyVerifiedAccessGroup",
				"ec2:DeregisterTransitGatewayMulticastGroupMembers",
				"ec2:ModifyNetworkInterfaceAttribute",
				"glacier:DeleteArchive",
				"ec2:RunInstances",
				"ec2:AcceptTransitGatewayPeeringAttachment",
				"ec2:CreateNatGateway",
				"glacier:CreateVault",
				"ec2:ModifyTrafficMirrorFilterNetworkServices",
				"ec2:StartNetworkInsightsAnalysis",
				"ec2:ModifyImageAttribute",
				"ec2:DisableIpamOrganizationAdminAccount",
				"ec2:ResetFpgaImageAttribute"
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name = "attachment"
  users = [aws_iam_user.myuser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}