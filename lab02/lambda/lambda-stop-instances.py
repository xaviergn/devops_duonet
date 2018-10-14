import boto3

# Enter the region your instances are in, e.g. 'us-east-1'

region = 'eu-west-1'

def get_test_instances(client):
    instances = []

    for reservation in client.describe_instances()['Reservations']:
        for instance in reservation['Instances']:
            for tag in instance['Tags']:
                if tag['Key'] == 'test' and tag['Value'] == 'true':
                    instances.append(instance['InstanceId'])
    return instances
    
def lambda_handler(event, context):

    ec2 = boto3.client('ec2', region_name=region)
    
    instances = get_test_instances(ec2)

    ec2.stop_instances(InstanceIds=instances)

    print 'stopped your instances: ' + str(instances)
