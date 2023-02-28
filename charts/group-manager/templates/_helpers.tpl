{{/*
Prefix for resources.
*/}}
{{- define "group-manager.prefix" -}}
	{{ $name := default .Chart.Name .Values.nameOverride }}
	{{- printf "%s-%s" .Release.Name $name -}}
{{- end }}

{{- define "group-manager.neo4j.url" -}}
{{- $releaseNeo4jUrl := printf "bolt://%s-neo4j" .Release.Name -}}
{{- default $releaseNeo4jUrl (.Values.neo4j).url }}
{{- end -}}


{{- define "group-manager.auth.url" -}}
{{- $releaseAuthName := default "auth" (.Values.auth).name }}
{{- $releaseAuthUrl := printf "bolt://%s-%s" .Release.Name $releaseAuthName }}
{{- default $releaseAuthUrl (.Values.auth).url }}
{{- end }}
