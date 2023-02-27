{{/*
resource name
TODO: overrides
*/}}
{{- define "neo4j.fullName" -}}
{{- printf "%s-%s" .Release.Name "neo4j" | trunc 63 | trimSuffix "-" }}
{{- end }}
