# 🛡️ SecureSentinel: Zero-Trust DevSecOps Pipeline

![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-OIDC_Identity-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Security](https://img.shields.io/badge/Security-Shift_Left-FF0000?style=for-the-badge&logo=security&logoColor=white)

## 📌 Executive Summary
**SecureSentinel** is a production-grade DevSecOps pipeline designed to enforce Zero-Trust principles and automate cloud governance. Moving beyond reactive incident response, this architecture implements a "Shift Left" strategy, treating security as a mandatory gate rather than an afterthought. 

By integrating automated vulnerability scanning, secret detection, and infrastructure compliance checks directly into the CI/CD workflow, this project effectively neutralizes supply chain vulnerabilities and prevents insecure code or misconfigured infrastructure from reaching the AWS cloud environment.

## 🏗️ Pipeline Architecture

The pipeline is entirely event-driven, triggering on every push and pull request to the `main` branch. If any security gate fails, the build is automatically terminated, and context-rich alerts are routed to a centralized Security Operations channel.

```text
Developer Push ──> GitHub Actions (Ephemeral Runner)
                        │
                        ├──> 1. Identity Gate: AWS OIDC Handshake (Zero Static Keys)
                        ├──> 2. Secret Guard: Gitleaks (Pre-flight Credential Scan)
                        ├──> 3. Dependency Shield: Trivy (SCA / CVE Detection)
                        ├──> 4. IaC Gatekeeper: Checkov (Terraform Compliance Scan)
                        │
 [PASS] ──> Proceed to AWS Deployment
 [FAIL] ──> Break Build ──> Trigger Webhook ──> Dispatch Alert to SOC (Discord)