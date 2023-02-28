{{/*
Prefix for resources.
*/}}
{{- define "group-manager.prefix" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "group-manager.neo4j.url" -}}
{{ $releaseNeo4jUrl := printf "bolt://%s-neo4j" .Release.Name }}
{{- default $releaseNeo4jUrl (.Values.neo4j).url }}
{{- end }}


{{- define "group-manager.auth.url" -}}
{{ $releaseAuthName := "auth" (.Values.auth).name }}
{{ $releaseAuthUrl := printf "bolt://%s-%s" .Release.Name .$releaseAuthName }}
{{- default $releaseAuthUrl (.Values.auth).url }}
{{- end }}
