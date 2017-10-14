###################################################################################################

FROM ubuntu:zesty

###################################################################################################

MAINTAINER Katherine Albany

###################################################################################################

ARG base_user=ubuntu
ARG base_home=/home/${base_user}
ARG base_shell=/bin/bash

###################################################################################################

ARG apt_sources_dist=zesty
ARG apt_sources_host=gb.archive.ubuntu.com
ARG apt_sources_list=/etc/apt/sources.list

###################################################################################################

RUN mkdir   -pv ${base_home}                                                                      \
 && useradd -d  ${base_home} -s ${base_shell} ${base_user}                                        \
 && chown   -v  ${base_user}:${base_user} ${base_home}                                            \
 && chmod   -v  700 ${base_home}

###################################################################################################

COPY sources.list ${apt_sources_list}

###################################################################################################

RUN chmod -v 644 ${apt_sources_list}                                                              \
 && sed   -i s/apt_sources_dist/${apt_sources_dist}/g ${apt_sources_list}                         \
 && sed   -i s/apt_sources_host/${apt_sources_host}/g ${apt_sources_list}

###################################################################################################

RUN find /tmp                  -mindepth 1 -print -delete                                         \
 && find /var/tmp              -mindepth 1 -print -delete                                         \
 && find /var/log              -mindepth 1 -print -delete                                         \
 && find /var/cache            -mindepth 1 -print -delete                                         \
 && find /var/lib/apt          -mindepth 1 -print -delete                                         \
 && find ${apt_sources_list}.d -mindepth 1 -print -delete

###################################################################################################

ENV base_user  ${base_user}
ENV base_home  ${base_home}
ENV base_shell ${base_shell}

###################################################################################################
