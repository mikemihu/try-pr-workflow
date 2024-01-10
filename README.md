# Try PR Workflow

- Run github action when PR created
- Prevent merge if build failed
- Go build with private branch

## Configuration

### `Settings > General`

- Enable `Allow auto-merge`
- Enable `Automatically delete head branches`

### `Settings > Branches > Branch protection rules > edit`

- Enable `Require a pull request before merging`
- Enable `Require status checks to pass before merging`
  - Enable `Require branches to be up to date before merging`
  - Select proper github action jobs


## References
- 