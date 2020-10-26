FROM phusion/baseimage:bionic-1.0.0
MAINTAINER Daniel B. Garcia (dandan02.0403@gmail.com)

ARG GRAFANA_TAR_LINK

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# build instructions
RUN apt-get update
RUN curl -# -o /tmp/grafana.tar.gz $GRAFANA_TAR_LINK
RUN tar -xzvf /tmp/grafana.tar.gz -C /usr/local/bin
RUN mkdir /etc/service/grafana
COPY grafana.sh /etc/service/grafana/run
RUN chmod +x /etc/service/grafana/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# grafana default port
EXPOSE 3000