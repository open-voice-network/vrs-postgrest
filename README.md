# vrs-postgrest

[vrsdoc]: https://github.com/open-voice-network/docs/blob/main/components/voice_registry_system.md

A [PostgREST](https://postgrest.org/en/stable/) implementation of the [Voice Registry System (VRS)][vrsdoc].

## Running the proof of concept

```sh
docker pull postgrest/postgrest
docker-compose up
```

The [REST API](https://restfulapi.net/) should be visible on <http://localhost:3000>

The [Swagger](https://swagger.io/) interface browser should be visible on
<http://localhost:8080/>.

The postgres database should be available via connection string
<postgresql://psql:hunter2@localhost:5432/vrs>. To connect via the `psql` command line tool, try:

```sh
PGPASSWORD=hunter2 psql -h localhost -p 5432 vrs psql
```

To load a simple schema and a starter data set, try:

```sh
PGPASSWORD=hunter2 psql -h localhost -p 5432 vrs psql -f schema.sql
```

## Developer Certificate of Origin

Commits to this repository require a Developer Certificate of Origin (DCO). See
<https://wiki.linuxfoundation.org/dco> for more details.
