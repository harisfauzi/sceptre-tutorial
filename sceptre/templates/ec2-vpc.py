from troposphere import Template
from troposphere.ec2 import VPC

def ec2_vpc(sceptre_user_data):
    template = Template()
    template.set_description("EC2 VPC Demo")
    template.set_version("2010-09-09")
    template.add_resource(
        VPC(
            "MyVPC",
            CidrBlock=sceptre_user_data["cidr_block"],
            EnableDnsSupport=True,
            EnableDnsHostnames=True,
            Tags=[{"Key": "Name", "Value": sceptre_user_data["vpc_name"]}]
        )
    )
    return template.to_yaml()
            
def sceptre_handler(sceptre_user_data):
    return ec2_vpc(sceptre_user_data)
