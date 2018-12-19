### Rails apps from comp type work:
###### Discourse: https://github.com/discourse/discourse
###### code.org: https://github.com/code-dot-org/code-dot-org
###### Huginn: https://github.com/huginn/huginn
###### Journey: https://github.com/nbudin/journey


### Rails apps from VMCAI paper:
###### Boxroom: https://github.com/mischa78/boxroom
###### (the rest are not Rails apps)



### Rails apps from Hummingbird paper:
###### Talks: https://github.com/jeffrey-s-foster/talks
###### Boxroom: https://github.com/mischa78/boxroom
###### Pubs: https://github.com/jeffrey-s-foster/pubs



### Other potential Rails apps:

###### Illinois Data Bank: https://github.com/medusa-project/databank
###### "The Illinois Data Bank is a public access repository for research
###### data from the University of Illinois at Urbana-Champaign."
###### https://databank.illinois.edu

###### lobste.rs: https://github.com/lobsters/lobsters
###### "Computing-focused community centered around link aggregation and discussion"

###### sugar: https://github.com/elektronaut/sugar
###### "Totally sweet Ruby on Rails-based forum software."

###### diaspora: https://github.com/diaspora/diaspora
###### "A privacy-aware, distributed, open source social network. https://diasporafoundation.org/"

###### publify: https://github.com/publify/publify
###### "A self hosted Web publishing platform on Rails. http://publify.github.io/"




##### Potential specs to verify:
##### Will probably require "forall" quantifier. For now, assume free variables are bound by "forall".

# XSS attack prevention:
assert(if DB.include?(record) then record.sanitized? end)

### sanitized? predicate means all strings in record have been properly cleansed
### through one of a few means: Rails :sanitize method, :html_escape,
### :validates_format_of, etc.



# Properly authorizing users for actions.
# This is largely app-dependent. Some examples from Talks here:

assert(!rendered_talk({action: "edit"}) unless current_user.authorized?(:to_edit))

## !rendered_talk(x) means render(x) is never called from the Talk controller.
## :authorized? asserts that a user's authorization has been checked.
## Can be in a number of ways, e.g.:
## (current_user == @talk.owner) || authorize!(:edit, @talk)
## where authorize! method is from CanCan gem



assert(!destroyed(user) unless current_user.perm_site_admin)

### no user can be destroyed unless the current user is the site admin.

assert(!rendered_user({action: "edit"}) unless current_user.authorized?(:to_edit))
