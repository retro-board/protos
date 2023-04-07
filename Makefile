.PHONY: setup
setup:
	mkdir -p generated

.PHONY: generate
generate: key-service permission-service billing-service

.PHONY: key-service
key-service:
	protoc -I . \
		--go_out ./generated/key --go_opt paths=source_relative \
		--go-grpc_out ./generated/key --go-grpc_opt paths=source_relative \
		v1/key.proto

.PHONY: permission-service
permission-service:
	protoc -I . \
		--go_out ./generated/permissions --go_opt paths=source_relative \
		--go-grpc_out ./generated/permissions --go-grpc_opt paths=source_relative \
		v1/permissions.proto

.PHONY: billing-service
billing-service:
	protoc -I . \
		--go_out ./generated/billing --go_opt paths=source_relative \
		--go-grpc_out ./generated/billing --go-grpc_opt paths=source_relative \
		v1/billing.proto


