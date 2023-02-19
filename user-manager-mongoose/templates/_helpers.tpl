{{/*
Prefix for resources.
NOTE: To be overwritten by parent when used as a subchart
*/}}

{{- define "user-manager.prefix" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Ingress host
NOTE: To be overwritten by parent chart if necessary
*/}}
{{- define "user-manager.ingress.host" -}}
{{ .Values.ingress.host }}
{{- end }}


{{/*
The MongoDB url, whether internal or external
NOTE: To be overwritten by parent chart if necessary
*/}}
{{- define "user-manager.mongodb.url" -}}
{{- if .Values.mongodb.url }}
{{- .Values.mongodb.url }}
{{- else -}}
mongodb://{{include "user-manager.prefix" .}}-mongo
{{- end }}
{{- end }}