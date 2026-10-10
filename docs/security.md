# Security checklist

- Never commit OpenRouter API keys, GitHub tokens, SSH keys, or passwords.
- Set OpenRouter spending limits and revoke leaked keys immediately.
- The environment file stores a plaintext key; file permissions reduce casual access but do not encrypt it.
- Keep code-server bound to 127.0.0.1 and replace its placeholder password.
- Do not expose port 8080 publicly without properly configured secure remote access.
- Read scripts before running them and install tools only from official project domains.
- Review generated code and diffs before committing.
- Termux:API needs its separate Android companion app.