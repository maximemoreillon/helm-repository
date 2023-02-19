{{/*
Prefix for resources.
NOTE: To be overwritten by parent when used as a subchart
*/}}
{{- define "group-manager.prefix" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
