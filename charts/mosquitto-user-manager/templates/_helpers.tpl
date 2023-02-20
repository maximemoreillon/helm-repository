{{/*
Prefix for resources.
*/}}
{{- define "mosquitto-user-manager.prefix" -}}
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
{{- define "mosquitto-user-manager.ingress.host" -}}
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