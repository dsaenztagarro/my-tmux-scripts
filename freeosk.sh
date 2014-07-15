project="freeosk"
mysql.server start
cd ~/Development/projects/freeosk

tmux new-session -d -s $project
tmux rename-window 'vim'
tmux new-window -t $project:0 -n 'vim'
tmux new-window -t $project:1 -n 'console'
tmux new-window -t $project:2 -n 'rails-server'
tmux new-window -t $project:3 -n 'redis-server'
tmux new-window -t $project:4 -n 'my-notes'

tmux send-keys -t $project:0 "vim" Enter
tmux send-keys -t $project:1 "rails c" Enter
tmux send-keys -t $project:2 "rails s" Enter
tmux send-keys -t $project:3 'redis-server' Enter
tmux send-keys -t $project:4 'vim ~/Development/my-notes/freeosk.md' Enter

# init focus
tmux attach -t $project:0
tmux select-window -t $project:0
