{{/*
Prefix for resources.
*/}}
{{- define "food-manager.prefix" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Overwriting user-manager prefix
TODO: default value
FIXME: Will not work for sub-sub-charts
*/}}
{{- define "user-manager.prefix" -}}
{{- printf "%s-%s" .Release.Name .Values.prefix | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Ingress host
Using global because setting of subchart needs it
To be overwritten by parent chart if necessary
*/}}
{{- define "food-manager.ingress.host" -}}
{{- .Values.global.ingress.host }}
{{- end }}

{{/*
Overwriting the user-manager ingress host
NOTE: if global not used, then .Values of user-manager are used
TODO: will not work for sub-sub-charts
*/}}
{{- define "user-manager.ingress.host" -}}
{{ .Values.ingress.subdomain }}.{{ .Values.global.ingress.host }}
{{- end }}



{{/*
The MongoDB URL, whether internal or external
NOTE: using global because setting URL of subchart using define override
TODO: make it possible to use that of direct parent instead of top
*/}}
{{- define "food-manager.mongodb.url" -}}
{{- if .Values.global.mongodb.url }}
{{- .Values.global.mongodb.url }}
{{- else -}}
mongodb://{{ include "food-manager.prefix" . }}-db
{{- end }}
{{- end }}

{{/*
Overwriting the user-manager mongodb URL
Set to be the same as parent
*/}}
{{- define "user-manager.mongodb.url" -}}
{{ include "food-manager.mongodb.url" . }}
{{- end }}