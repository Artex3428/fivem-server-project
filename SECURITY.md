# Security Policy

Security issues are taken seriously in this project.

## Supported Versions

Until stable releases are introduced, security fixes are primarily applied to
the current `main` branch.

After versioned releases are introduced, this policy may be updated to define
which releases continue receiving security fixes.

## Reporting a Vulnerability

Do not open a public GitHub issue for vulnerabilities that could be abused on
a FiveM server.

Examples include:

- Server event exploits
- Permission bypasses
- Item or money duplication
- Inventory exploits
- Authentication or authorization issues
- Remote code execution
- SQL injection
- Client trust issues that allow server-side abuse
- Administrative privilege escalation
- Exploitable resource or network event behavior

Use GitHub's private vulnerability reporting feature instead.

Open the repository's Security section and select:

`Report a vulnerability`

Please include:

- A description of the issue
- The affected resource or file
- Steps required to reproduce it
- Potential impact
- Any suggested fix, if known

Please avoid publicly disclosing exploitable details until a fix has been
prepared.

## Third-Party Resources

If the vulnerability exists entirely inside an upstream third-party resource,
it may also need to be reported to the original project maintainers.

If the vulnerability is caused by modifications made specifically by this
project, report it here.