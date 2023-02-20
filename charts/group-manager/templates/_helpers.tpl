{{/*
Prefix for resources.
NOTE: To be overwritten by parent when used as a subchart
*/}}
{{- define "group-manager.prefix" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Ingress host
NOTE: To be overwritten by parent chart if necessary
*/}}
{{- define "user-manager.ingress.host" -}}
{{ .Values.ingress.host }}
{{- end }}