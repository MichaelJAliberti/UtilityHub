# Generic
run(){
    readarray -d "." -t FILENM < <(printf '%s' $1)

    case ${FILENM[1]} in

        sh)
            ./$1
            ;;
        
        ts)
            ts-node $1
            ;;

        py)
            py $1
            ;;

        *)
            echo "File with type .${FILENM[1]} is not executable"
            ;;
    esac
}
alias CPBUT="cd src/frontend && ls | grep -v 'scripts' | xargs cp -r -t ../../dist/frontend/ && cd ../.."

# Github
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gpush="git push"
alias gup="git push --set-upstream origin"
alias gpull="git pull"
alias gac="git add . && git commit -m"
alias gchk="git checkout"
alias gbr="git branch"
alias gmerge="git merge"
alias gret="git fetch && git checkout"
alias gdiff="git diff"
gcp(){
    git commit -m $1
    git push
}
gnew(){
    git branch $1
    git checkout $1
    git push --set-upstream origin $1
}

# Navigation
alias sr="cd ~/Desktop/School/SeniorDesign/MiniProject/SeniorDesignShort"
alias desk="cd ~/Desktop"
alias found="cd /c/Users/abark/AppData/Local/FoundryVTT/Data/modules"

# Opeining
vs(){
	if ( $# -eq 0 )
		then
			"/c/Users/abark/AppData/Local/Programs/Microsoft VS Code/Code.exe" &  disown
	else
		"/c/Users/abark/AppData/Local/Programs/Microsoft VS Code/Code.exe" $1 &  disown
	fi
}
sub(){
	if ( $# -eq 0 )
		then
			"/c/Program Files/Sublime Text/sublime_text" &  disown
	else
		"/c/Program Files/Sublime Text/sublime_text" $1 &  disown
	fi
}
charm(){
	if ( $# -eq 0 )
		then
			"/c/Program Files/JetBrains/PyCharm Edu 2021.3/bin/pycharm64.exe" &  disown
	else
		"/c/Program Files/JetBrains/PyCharm Edu 2021.3/bin/pycharm64.exe" $1 &  disown
	fi
}

# Python
fb(){
	black $@
	flake8 $@
}

# Celery & RabbitMQ
cel(){
    celery -A $1 worker --loglevel=INFO --without-gossip --without-mingle --without-heartbeat -Ofair
}
rab-start(){
    # rabbitmqctl.bat stop
    rabbitmq-server.bat -detached
    rabbitmqctl.bat add_user user password
    rabbitmqctl.bat add_vhost vhost
    rabbitmqctl.bat set_permissions -p vhost user ".*" ".*" ".*"
}
rab-stop(){
    rabbitmqctl.bat stop
}

# Sphinx
alias sphmake="./make.bat html"
sphadd(){
    sphinx-apidoc -o source/ $1
}

# Typescript
alias ts="ts-node"
tsl(){
    npx prettier --write $@
    npx eslint $@
}
tsnew(){
    # basics
    npm init
    npm install typescript --save-dev
    npm install @types/node --save-dev
    npm install ts-node

    # linting
    npm install jest
    npm install --save-dev eslint typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin
    npm init @eslint/config
    npm install --save-dev --save-exact prettier
}
