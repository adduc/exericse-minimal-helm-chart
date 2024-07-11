LATEST_CHART = $(shell ls artifacts/*.tgz -t | head -n 1)
VERSION = $(shell date +0.%Y%m%d.%H%M)

create:
	sed -i 's/version: .*/version: $(VERSION)/' Chart.yaml
	helm package . -d artifacts

upsert:
	helm upgrade --install hello-world $(LATEST_CHART)


install:
	helm install hello-world $(LATEST_CHART)

upgrade:
	helm upgrade hello-world $(LATEST_CHART)
