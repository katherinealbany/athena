###################################################################################################

FROM ubuntu:xenial

###################################################################################################

MAINTAINER Katherine Albany

###################################################################################################

ARG user=athena
ARG home=/${user}
ARG apt_sources_host=gb.archive.ubuntu.com

###################################################################################################

COPY sources.list /etc/apt/sources.list

###################################################################################################

RUN mkdir -pv ${home}                                                                             \
 && useradd -d ${home} ${user}                                                                    \
 && chown -v ${user}:${user} ${home}                                                              \
 && chmod -v 700 ${home}                                                                          \

 ##################################################################################################

 && chmod -v 644 /etc/apt/sources.list                                                            \
 && sed -i s/apt_sources_host/${apt_sources_host}/g /etc/apt/sources.list                         \

 ##################################################################################################

 && find /tmp                    -mindepth 1 -print -delete                                       \
 && find /var/tmp                -mindepth 1 -print -delete                                       \
 && find /var/log                -mindepth 1 -print -delete                                       \
 && find /var/cache              -mindepth 1 -print -delete                                       \
 && find /var/lib/apt            -mindepth 1 -print -delete                                       \
 && find /etc/apt/sources.list.d -mindepth 1 -print -delete

###################################################################################################

ENV athena_user ${user}
ENV athena_home ${home}

###################################################################################################
