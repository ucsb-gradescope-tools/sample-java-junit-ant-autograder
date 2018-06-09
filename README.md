# sample-java-junit-ant-autograder

A simple Gradescope autograder for Java/JUnit.

This repo is designed to be used in conjunction with the 
[link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo) tool.

The [link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo)
allows you to easily link a Gradescope autograded assigment with a github repo.  You only have to create
the `Autograder.zip` file once; after that, you can make changes to the assignment simply by pushing them
to a github repo.

# Instructions

## Step 1: Clone this template

* Create a new empty private repo, e.g. with the name PRIVATE-cs8-s18-labxx-gs
* Clone the empty repo with `git clone <url>`
*  `cd` into that directory:
   > `cd PRIVATE-cs8-s18-labxx-gs`
* Add a remote for this sample repo via: 
   > `git remote add template git@github.com:ucsb-gradescope-tools/sample-java-junit-ant-autograder.git`
* Pull from this sample repo via `git pull template master`
* Push to origin with `git push origin master`

## Step 2: Edit the template for your assignment

* In `expected.sh` edit the `EXPECTED_FILES` variable to list the files you expect the student to submit.  Only these
   will be copied from the student submission into the space where the assignment is graded.
   
   If you prefer *all* files to be copied in, edit the `grade.sh` script to copy all files from `/autograder/submission` into
   the target directory.

## Step 3: Add your tests
In AssignmentTest.java, replace the tests with tests for your assignment. To make a test give a Gradescope result, add an @GradedTest decorator after the @Test() decorator. The @GradedTest decorator properties are name, number, max_score, and visibility. Some examples:
   
* `@GradedTest(name="Test 1", max_score=10)` A test worth 10 points. By default, results are visible to students.
* `@GradedTest(name="Test 2", max_score=5, visibility="hidden")` A test worth 5 points. The results of this test will be hidden from students.

## Step 4: Test your autograder locally (optional)

To test your autograder locally, try putting a correct sample solution
in the `solution-1` directory and an incorrect sample solution in
the `solution-2` directory.

To check what will happen, run:
* `./grade.sh sample-solution-1`
* `./grade.sh sample-solution-2` 
* etc.

(When converting assignments from UCSB's submit.cs, you might adapt a "perfect" solution and a "flawed" solution from among previous student submissions, by looking at the grade assigned by submit.cs.)

In each case, look at the file `results.json` to see whether it reflects what you expect the resulting grade to be.

## Step 5: Create an `Autograder.zip` using the [link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo) tool.
   
* Clone the [link-gs-zip-with-repo](https://github.com/ucsb-gradescope-tools/link-gs-zip-with-repo).
* In that repo, edit `env.sh` to point to your repo.  You don't need to commit that change.
* Run the script `./make_deploy_keys.sh` and upload your deploy key to the new repo you created for your assignment.
* Run the script `./make_autograder_zip.sh` and then upload the `Autograder.zip` to Gradescope.

You are now ready to test your autograded assignment.
  
   
   
