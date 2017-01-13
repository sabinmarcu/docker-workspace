FROM krlmlr/debian-ssh

run mkdir /workspace
add ./config /config

# run /config/installers/all

run /config/installers/curl

run /config/installers/zsh
run /config/installers/vim

run /config/installers/node

run /config/installers/yarn
run /config/installers/globals
run /config/installers/nuclide

run /config/installers/watchman

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

workdir /workspace

expose 22
expose 9090

volume /keys

entrypoint ["/config/init"]
