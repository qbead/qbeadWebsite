The majority of the [spinwearables.com](https://spinwearables.com) website is generated from this source code. You can use `make html` to create all of the necessary files in the `build` folder. You can run `make local_test_server` in order to preview these changes on your local machine.

A typical workflow would be:

```bash
git pull # ensure everything is downloaded an up to date
# edit whatever files you would like to edit and get back to this root directory
make local_test_server # and open your browser to that address to view the changes
git status # check that the changes involved only files that make sense
git diff # for more detailed list of changes
git add . # stage all the changes
git status # check there are no surprises in the staged changes
git commit -m "A_GOOD_COMMIT_MESSAGE." # commit the changes
git push # push the changes to the central repo
```

This will store the changes to the website source code, but it will not render it to the live host. To do the rendering, you need the `SpinWearables.github.io` repo, which also includes other submodules.
