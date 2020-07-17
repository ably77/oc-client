FROM image-registry.openshift-image-registry.svc:5000/openshift/cli

MAINTAINER ably77
CMD tail -f /dev/null
RUN yum install -y git
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install jq
RUN VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
RUN chmod +x /usr/local/bin/argocd
