build-bins: clean
	mkdir -p bin && \
	cd backend && \
	GOOS=linux GOARCH=amd64 go build -o ../bin/backend-randomer ./... && \
	cd ../frontend && \
	GOOS=linux GOARCH=amd64 go build -o ../bin/frontend-randomer ./...

provision: build-bins
	cp bin/* ../../provision/files/randomer/

.PHONY: clean
clean:
	rm -f bin/*
