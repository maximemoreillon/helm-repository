{{/*
Prefix for resources.
To be overwritten by parent when used as a subchart
For example, if used as a sub chart, generally becomes {parent}-{sub}
*/}}
{{- define "user-manager.prefix" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Ingress host
To be overwritten by parent chart if necessary
For example, if used as a sub chart, generally becomes {sub}.{parent}
*/}}
{{- define "user-manager.ingress.host" -}}
{{ .Values.ingress.host }}
{{- end }}


{{/*
The MongoDB url, whether internal or external.
To be overwritten by parent chart if necessary.
Not simply a global because is an expression
Global not necessary because standalone chart.
switching to global from parent by overwriting this define
*/}}
{{- define "user-manager.mongodb.url" -}}
{{- if .Values.mongodb.url }}
{{- .Values.mongodb.url }}
{{- else -}}
mongodb://{{include "user-manager.prefix" .}}-mongo
{{- end }}
{{- end }}
