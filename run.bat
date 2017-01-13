docker build -t test . && docker run -it --rm -p 22:22 -p 9090:9090 -v "c:/Users/Sabin Marcu/Desktop/SSH":/keys -v "c:/Users/Sabin Marcu/Desktop/docker-workspace/workspace":/workspace test zsh
