###################################################################################################

FROM ubuntu:wily

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

 && find /tmp                    -delete -mindepth 1 -print                                       \
 && find /var/tmp                -delete -mindepth 1 -print                                       \
 && find /var/log                -delete -mindepth 1 -print                                       \
 && find /var/cache              -delete -mindepth 1 -print                                       \
 && find /var/lib/apt            -delete -mindepth 1 -print                                       \
 && find /etc/apt/sources.list.d -delete -mindepth 1 -print

###################################################################################################

ENV athena_user ${user}
ENV athena_home ${home}

###################################################################################################
