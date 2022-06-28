.PHONY: setup
setup:
	mkdir -p generated

.PHONY: generate
generate: key-service

.PHONY: key-service
key-service:
	protoc -I . \
		--go_out ./generated --go_opt paths=source_relative \
		--go-grpc_out ./generated --go-grpc_opt paths=source_relative \
		v1/key.proto

.PHONY: permission-service
permission-service:
	protoc -I . \
		--go_out ./generated --go_opt paths=source_relative \
		--go-grpc_out ./generated --go-grpc_opt paths=source_relative \
		v1/permission.proto


