# README
## Product questions:
1) **Are we building something like a board of projects where users can change statuses of them and add comments only or is there assigning, etc?**
- We only leave comments and change status just for now
2) **How many statuses are there for a project? and what are they?**
- There are 4 statuses; To do, In progress, In review, Done
3) **Can statuses be changed from an inital state to ANY other state or only specific states (e.g from to do to in progress only)?**
- For now assume they can be changed to anything, later on we could use a state machine (AASM gem for example), to handle transitions from/to specific statuses
3) **Can i reply to a comment?**
- You can only leave a comment on the project no replies (if i have time i will allow editing)
4) **What should the UI look like?**
- The UI for a certain project should have the project name and description, along with the status changes that happened for it and the comments beneath that.
5) **Does the user have to create an account on the platform or can he use oauth for an easier experience**
- The user can use google sign in instead of having to create an account on the platform.
6) **Who creates a project? or do we assume they already exist and act accordingly?**
- Assume projects are already created (seeded already)

## Considerations to be taken
1) Activities (project audit) can be logged in a background job after the status update happens as it can be eventually consistent (log of status changes)
2) The audit usually would have the old obejct and new one, since this is unnecessary i just have a string field carrying whatever old and new state that exist, along with a activity_type (e.g status_change)
3) Comments and activites have to be paginated aswell like projects
4) I added google openid auth for simple sign up and to leverage the first and last names
5) UI isn't the best thing ever but i used tailwind along with flowbite https://flowbite.com/ to speed things up :)


## Deployment
Deployed on heroku -> https://projectshistory-6bbeefdc1559.herokuapp.com/
