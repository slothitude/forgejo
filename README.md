# Forgejo

Self-hosted Git forge running on Lappy.

## Instance
- **URL**: http://192.168.0.33:3200/
- **Container**: `forgejo` (image: `codeberg.org/forgejo/forgejo:8`)
- **Data**: `D:\docker\forgejo` on Lappy (SQLite, bind mount)
- **Ports**: 3200→3000 (HTTP), 2222→22 (SSH)
- **Admin**: aaron / Slothitude2026

## MCP Server
- **Path**: `C:\Users\aaron\forgejo_mcp\forgejo_mcp.py`
- **Transport**: stdio (FastMCP)
- **10 tools**: repos, create_repo, repo_info, issues, create_issue, pulls, create_pr, branches, commits, search
- **Env vars**: `FORGEJO_URL`, `FORGEJO_TOKEN`
