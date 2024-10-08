function dbranch -a 'branch_name' -d "Delete a git branch locally and remotely"
    set current_branch (git branch --show-current)

    if test -z $branch_name
        set_color red; echo "Specify a branch to delete!"; set_color normal
        return 1
    end
    
    if test $branch_name = $current_branch
        set_color yellow;
        echo "We're currently in branch '$branch_name'!"
        echo "Checking out default branch before proceeding..."
        set_color normal
        git checkout main || git checkout master || return 1
        git pull
    end

    git branch -D $branch_name            # Local
    git push --delete origin $branch_name # Remote

end
