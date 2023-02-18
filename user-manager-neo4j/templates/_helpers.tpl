{{/*
Prefix for resources
*/}}
{{- define "resources.prefix" -}}
{{- default .Release.Name .Values.prefixOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

