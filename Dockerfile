FROM centos:centos7

LABEL maintainer="bat@raman.cat"

RUN yum install epel-release -y && \ 
    yum update -y && \
    yum install wget curl -y && \
    wget https://dl.grafana.com/oss/release/grafana-6.7.3-1.x86_64.rpm && \
    yum install grafana-6.7.3-1.x86_64.rpm && \
    yum clean all && \
    rm -rf /var/yum/cache/* && \
    rm -rf /var/tmp/yum*


ENV PATH="/usr/share/grafana/bin:$PATH" \
    #GF_AUTH_DISABLE_LOGIN_FORM "true"
    #GF_AUTH_ANONYMOuS_ENABLED "true"
    #GF_AUTH_ANONYMOUS_ORG_ROLE "Admin"
    GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \ 
    ##GF_PATHS_DATA="/usr/lib/grafana" 
    GF_PATHS_HOME="/usr/share/grafana" 
##    GF_PATHS_LOGS="/var/log/grafana" \
##    GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
##    GF_PATHS_PROVISIONING="/etc/grafana/provisioning"
##
WORKDIR $GF_PATHS_HOME

EXPOSE 3000/tcp
CMD ["grafana-server", "start"]
