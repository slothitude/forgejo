# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Tracking repo for a self-hosted Forgejo Git forge. No application code — holds config, documentation, and setup notes for the Forgejo instance and its MCP server.

## Forgejo Instance

- **URL**: http://192.168.0.33:3200/
- **Host**: Lappy (192.168.0.33), Docker container `forgejo` (image: `codeberg.org/forgejo/forgejo:8`)
- **Data volume**: `D:\docker\forgejo` on Lappy (SQLite, bind mount)
- **Port mapping**: 3200→3000 (HTTP), 2222→22 (SSH)
- **Admin credentials**: aaron / Slothitude2026
- **Push to create**: enabled for users and orgs (no need to pre-create repos)

## MCP Server

- **Path**: `C:\Users\aaron\forgejo_mcp\forgejo_mcp.py`
- **Transport**: stdio via FastMCP
- **10 tools**: repos, create_repo, repo_info, issues, create_issue, pulls, create_pr, branches, commits, search
- **Env vars required**: `FORGEJO_URL` (http://192.168.0.33:3200), `FORGEJO_TOKEN`
