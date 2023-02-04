import json
import boto3
from boto3.dynamodb.conditions import Key


TABLE_NAME = "counter-db"
dynamodb_client = boto3.client('dynamodb','us-east-1')

dynamodb_table = boto3.resource('dynamodb','us-east-1')
table = dynamodb_table.Table(TABLE_NAME)


def lambda_handler(event, context):
    response = table.get_item(
        TableName = TABLE_NAME,
        Key={
            "counter_type":"visitor_counter",
        }
    )
    item = response["Item"]
        
    table.update_item(
        Key = {
            "counter_type":"visitor_counter",
        },
        UpdateExpression = 'SET VisitorCount = :val1',
        ExpressionAttributeValues = {
            ':val1':item['VisitorCount'] + 1
        }
    )
    
    return{
        'statusCode': 200,
        'headers':{
            'Content-Type':'application/json',
            'Access-Control-Allow-Origin': '*'
        },
        "body": {"Visit_Count": str(item['VisitorCount'] + 1)}
    }
