# Security Program Lab

Building a security program for **Ironbark Aerosystems**, a fictional 50-person Brisbane defence contractor that builds ground-control software for uncrewed aircraft. I'm working through it as real security team tickets.

## Progress
| Ticket | Status |
|---|---|
| 1. Build the environment | In progress |
| 2. Essential Eight assessment | Not started |
| 3. Essential Eight uplift | Not started |
| 4. Harden the AWS account | Not started |
| 5. Secure the build pipeline | Not started |
| 6. Monitoring (Wazuh) | Not started |
| 7. Vulnerability management | Not started |
| 8. Incident response | Not started |
| 9. Penetration test | Not started |
| 10. Supplier risk assessment | Not started |
| 11. Careers site security | Not started |

## Ticket 1 so far
- AWS environment defined in Terraform (`01-environment/terraform`): VPC, private subnet, S3 bucket for design files and three staff IAM users.
- One deliberate weakness: the IT admin account has full admin rights. Found and fixed in Ticket 4.
- Terraform state is excluded from the repo with `.gitignore`.
