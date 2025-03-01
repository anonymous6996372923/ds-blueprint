# load packages ----------------------------------------------------------------

library(tidyverse)
library(ghclass)

# github organization ----------------------------------------------------------

org <- "..." # replace the ... with the name of your github organization 

# invite members ---------------------------------------------------------------

roster <- read_csv("...") # read in roster of student names + github usernames

org_invite( 
  org = org,
  user = roster$gihub_name # assumes usernames are in the column github_name
)

### students on csv will now have been sent an invite to github org

# lab & assignment repos ------------------------------------------------------------------

assignment <- "..." # replace the ... with the github repo name you wish to distribute

org_create_assignment(
  org = org,
  repo = paste0(assignment, "-", student_name),
  user = student_name,
  source_repo = paste0(org, "/", assignment)
)

### If your class size is over 100, you may not be able to create all student repos at 
### one time. Please see the modified code to get around this issue

############## batch of 100 ###################

org_create_assignment(
  org = org,
  repo = paste0(assignment, "-", student_name[1:100]),
  user = student_name[1:100],
  source_repo = paste0(org, "/", assignment)
)

######## batch for remaining students ########

org_create_assignment(
  org = org,
  repo = paste0(assignment, "-", student_name[-(1:100)]),
  user = student_name[-(1:100)],
  source_repo = paste0(org, "/", assignment)
)


# TEAM STUFF -------------------------------------------------------------------

# 1. Create a sheet like with the following columns 

-- #team_name
-- #first_name
-- #last_name
-- #github_username

# save this csv in a new repo called teams. 
# 2. Read in that sheet as `teams`
# 3. Give students pull permission to `teams` repo so students can see group
  
repo_user_permission(
  repo = paste0(org, "/teams"),
  user = teams$github_name,
  permission = "pull"
)

# 4. Create assignment with team permissions (using the team_name column)

assignment <- "..." # replace the ... with the github repo name you wish to distribute

org_create_assignment(
  org = org,
  repo = paste0(assignment, "-", teams$team_name),
  user = teams$github_username,
  team = teams$team_name,
  source_repo = paste0(org, "/", assignment)
)

# functionality on how to add files to exsisting repos, deleting repos, etc can be
# found in the documentation for the ghclass package
  
  
