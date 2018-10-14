#!/usr/bin/env python

import boto3
import sys
import datetime

# syntax:
# change-resource-record-set.py dommainname action type name target 
print len(sys.argv)
if len(sys.argv) != 6:
  print "Syntax error:"
  print "change-resource-record-set.py domainname action type name target"
  print "Where:"
  print "action is 'CREATE'|'DELETE'|'UPSERT'"
  print "type is 'SOA'|'A'|'TXT'|'NS'|'CNAME'|'MX'|'NAPTR'|'PTR'|'SRV'|'SPF'|'AAAA'"
  print 
  exit(1)

def get_hosted_zone_id(client,domain):
  id = None
  for hosted_zone in client.list_hosted_zones()['HostedZones']:
    if hosted_zone['Name'] == domain+".":
      id = hosted_zone['Id']
  return id

domain=sys.argv[1]
action=sys.argv[2]
record_type=sys.argv[3]
name=sys.argv[4]
target=sys.argv[5]
ttl=60

client = boto3.client('route53')

hosted_id=get_hosted_zone_id(client,domain)
print "Esto es lo que quieres? hosted_id: {}, domain: {}, action: {}, type: {}, name: {}, target: {}".format(hosted_id,domain,action,record_type,name,target)





response = client.change_resource_record_sets(
    HostedZoneId=hosted_id,
    ChangeBatch={
        'Comment': 'Record created on {}'.format(datetime.datetime.now()),
        'Changes': [
            {
                'Action': str(action.upper()),
                'ResourceRecordSet': {
                    'Name': str(name+"."+domain),
                    'Type': str(record_type.upper()),
                    'TTL': ttl,
                    'ResourceRecords': [
                        {
                            'Value': str(target)
                        }
                    ]
                }
            }
        ]
    }
)

print response