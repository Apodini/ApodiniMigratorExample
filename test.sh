#
# This source file is part of the Apodini open source project
#
# SPDX-FileCopyrightText: 2019-2021 Paul Schmiedmayer and the Apodini project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
#
# SPDX-License-Identifier: MIT
#

curl -k --fail https://localhost:8080
curl -k --fail https://localhost:8080/categories
curl -k --fail https://localhost:8080/events
curl -k --fail https://localhost:8080/users

curl -k --fail https://localhost:8080/__apodini/grpc/schema/json/full
curl -k --fail https://localhost:8080/__apodini/grpc/schema/files
curl -k --fail https://localhost:8080/__apodini/grpc/schema/json/file/QONECTIQ2.proto
curl -k --fail https://localhost:8080/__apodini/grpc/schema/proto/file/QONECTIQ2.proto
curl -k --fail https://localhost:8080/migration-guide