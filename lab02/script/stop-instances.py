#!/usr/bin/env python

import boto3
import os

client = boto3.client('ec2')

instances = []
for reservation in client.describe_instances()['Reservations']:
  for instance in reservation['Instances']:
    for tag in instance['Tags']:
      if tag['Key'] == 'test' and tag['Value'] == 'true':
        instances.append(instance['InstanceId'])

print instances
client.stop_instances(InstanceIds=instances)
