
## Pull Requests

1. Follow conventional commits [format](https://www.conventionalcommits.org/en/v1.0.0/)
2. Refactoring should be in their own commits and not combined with features/fixes
3. Add a description of `Closes #123` into the PR comment, which will automatically close the issue when the PR merges
4. Don't repeat the issue number or title in the git commit message, the commit message should stand alone
5. Use merge policy to include a commit that links the PR back to multiple commits. 
 


## Javascript/Typescript

1. Use typescript over javascript
    a) If you need to update a javascript file, first migrate it typescript in a single commit, and then layer on changes
2. Add storybooks for new components
3. Avoid deeply nested folder structures and `index.tsx` files as they make code navigation/search harder
4. Run eslint and tests before creating a PR




## React

1. Avoid mixing styling and advanced data manipulation in the same component
2. Avoid duplicating styles, create a component instead
3. All http requests should use axios and should be in the `src/api` directory only
