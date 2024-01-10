# CI/CD setup for Golang

An CI/CD setup for Golang

- Run github action when PR created
- Prevent merge if build failed
- Go build with private branch

## TODO
- [x] Runs workflow when PR create
- [ ] Build Docker
- [ ] Simulate deploy docker to server

## Configuration

### `Settings > General`

- Enable `Allow auto-merge`
- Enable `Automatically delete head branches`

### `Settings > Branches > Branch protection rules > edit`

- Enable `Require a pull request before merging`
- Enable `Require status checks to pass before merging`
  - Enable `Require branches to be up to date before merging`
  - Select proper github action jobs
- Enable `Do not allow bypassing the above settings`

### `Settings > Secret and variables > Actions` 
- Add Secret `GIT_PRIVATE_KEY`

## References
- https://stackoverflow.com/questions/68554735/github-action-status-check-missing-from-the-list-of-checks-in-protected-branch-s/68613319
- https://aran.dev/posts/github-actions-go-private-modules/
- https://github.com/mvdan/github-actions-golang/blob/master/README.md
- https://dev.to/github/the-githubtoken-in-github-actions-how-it-works-change-permissions-customizations-3cgp