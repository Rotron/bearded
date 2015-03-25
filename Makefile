.PHONY: all test lint vet fmt travis


all: test vet fmt


travis: all


test:
	@echo "+ $@"
	@go test -cover ./...


lint:
	@echo "+ $@"
	@test -z "$$(golint ./... | grep -v Godeps/_workspace/src/ | tee /dev/stderr)"


vet:
	@echo "+ $@"
	@go vet ./...


fmt:
	@echo "+ $@"
	@./checkfmt.sh .