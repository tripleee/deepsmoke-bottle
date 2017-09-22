FROM ubuntu

RUN DEBIAN_FRONTEND=noninteractive && \
    apt -y update && \
    apt install -y build-essential \
        python3 python3-dev python3-pip python3-venv git ca-certificates && \
    adduser --disabled-password --gecos deepsmoke deepsmoke && \
    su - deepsmoke sh -c '\
        git clone https://github.com/tripleee/deepsmoke-bottle.git && \
	cd deepsmoke-bottle && \
        python3 -m venv venv && \
        . ./venv/bin/activate && \
	git submodule init && \
	git submodule update && \
        pip3 install -r requirements.txt --upgrade' && \
    apt autoremove -y --purge build-essential python3-dev && \
    apt clean && \
    rm -rf /root/* /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY save_ensemble3_1.h5 /home/deepsmoke/deepsmoke-bottle

EXPOSE 8080

######## TODO: properly run using uwsgi or something
CMD ["/home/deepsmoke/deepsmoke-bottle/run.sh"]
