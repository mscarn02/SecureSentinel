# src/app.py
import boto3

# SECURITY VIOLATION: Hardcoded AWS Credentials
# We are doing this intentionally to test our Gitleaks pipeline!
AWS_ACCESS_KEY_ID = "AKIAIOSFODNN7EXAMPLE"
AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

def connect_to_aws():
    print("Connecting to AWS with hardcoded keys...")
    
if __name__ == "__main__":
    connect_to_aws()