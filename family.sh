project="family"
cd ~/Development/projects/family

activate_env() {
  tmux send-keys -t $project:$1 "source /var/www/family/env/bin/activate" Enter
}

tmux new-session -d -s $project
tmux rename-window 'vim'
tmux new-window -t $project:1 -n 'shell'
tmux new-window -t $project:2 -n 'dbshell'
tmux new-window -t $project:3 -n 'server'
tmux new-window -t $project:4 -n 'grunt'

tmux send-keys -t $project:0 "vim" Enter
activate_env 1; tmux send-keys -t $project:1 "./manage.py shell" Enter
activate_env 2; tmux send-keys -t $project:2 "./manage.py dbshell" Enter
activate_env 3; tmux send-keys -t $project:3 "./manage.py runserver 0.0.0.0:8000" Enter
tmux send-keys -t $project:4 'grunt watch' Enter

# init focus
# tmux attach -t $project
tmux select-window -t $project:0
