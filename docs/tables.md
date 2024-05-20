
# Tables
## Questions
- Does movements table have recent/original pr data or just name/desc.  Basically, does this need to be a table at all? Or do we have all our data in athlete and movement models and can do calculations off that?

## users
has_many athletes

- name
- email
- password

## Athletes
belongs_to user
has_many movements
has_many pr_goals

- name 
- gender 
- height:int 
- weight:int 
- birthday: date
- user:references


## movement_goals
movement:references
goals:references

## Movements
belongs_to athlete
has_many movement_goals
have_one goal through movement_goals
has_one progress

- movement_name 
- description:text 
- ***add image
- *** add video
  - fk athlete

## goals
belongs_to athlete
has_many movement_goals
have_one movement through :movement_goals

- movement_name
- weight
- reps
  - fk athlete

## progress_movements
progress:references
movements:references

- weight (metric)
- reps

## progress
belongs_to athlete
has_many progress_movements 
has_many movements through progress_movements

- date
  - foreign key: athlete

## notes
progress = where athlete is in relation to the movement_goal