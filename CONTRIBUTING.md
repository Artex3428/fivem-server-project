# Contributing

Contributions are welcome.

This project aims to provide a high-quality, open-source FiveM Enhanced Qbox
roleplay server focused on performance, security, realism, immersion,
maintainability, and good development practices.

## Before Contributing

Please keep changes focused and avoid unrelated modifications in the same pull
request.

Changes should:

- Follow existing project structure and conventions
- Prefer Qbox-native and ox-based implementations where appropriate
- Avoid unnecessary dependencies
- Avoid duplicate systems
- Avoid introducing exploitable client-trusted logic
- Consider server performance and network usage
- Preserve compatibility with FiveM Enhanced
- Keep configuration values configurable when appropriate
- Avoid hardcoded secrets, license keys, database credentials, or private data

## Git Submodules

Most resources are maintained as Git submodules.

When modifying a submodule:

1. Enter the resource directory.
2. Make the required changes.
3. Commit and push the changes to the appropriate resource repository.
4. Return to the main server repository.
5. Commit the updated submodule pointer.

Example:

```bash
cd server-data/resources/example_resource

git add .
git commit -m "Describe the resource change"
git push