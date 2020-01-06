

# Hide a commit on Git and GitHub - _

function branches() { git branch --list }                                # Show list of branches
function branch() { git branch --show-current }                          # Show current branch
function log($n = -1) { git log --pretty=oneline --abbrev-commit -n $n } # Show prettified log
function rollback($n) { git reset --hard HEAD~$n }                       # Rollback n commits
function force_push($branch) { git push origin +$branch }                # Force Push

# Info
Clear-Host; "

Git Logs"; log; "

List of Git Branches"; branches; "
Current Branch"; branch; "
"
# Check Branch
$branch = branch;
if ($branch -eq $(Read-Host "Type $branch if this is the branch you wish to edit (locally and remotely)")) {
	# Commits to destroy
	$commits_to_destroy = Read-Host "How many commits do you wish to destroy?";
	log $commits_to_destroy;
	# Destroy Locally
	if ("destroy locally" -eq $(Read-Host "Type `"destroy locally`" to destroy changes locally")) {
		rollback $commits_to_destroy; "The commits have been destroyed locally";
		# Destroy Remotely
		if ("destroy remotely" -eq $(Read-Host "Type `"destroy remotely`" to destroy changes remotely")) {
			force_push $branch
		}
		else { "No changes have been made remotely"; }
	}
	else { "No changes have been made locally"; }
}
else { "Switch to the correct branch first" }