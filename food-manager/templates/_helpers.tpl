{{/*
Prefix for resources.
If prefixOverride is set, then prefix is entirely overridden
otherwise if prefix is set, then prefix becomes {releaseName}-{prefix}
otherwise, prefix is simply releaseName
WARNING: Gets passed to subcharts because included in mongodb-url
*/}}

{{- define "food-manager.prefix" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Ingress host
{ingress.subdomain}.{global.ingress.host} if those are set
{global.ingress.host} if global host set but not ingress.sub
{ingress.host} otherwise
WARNING: might not play well with sub-charts
NOTE: Using both global and this define (included in subcharts) is redundant
*/}}
{{- define "ingress.host.full" -}}
{{- if and .Values.ingress.subdomain .Values.global.ingress.host }}
{{- printf "%s.%s" .Values.ingress.subdomain .Values.global.ingress.host }}
{{- else }}
{{- .Values.global.ingress.host }}
{{- end }}
{{- end }}

{{/*
The MongoDB url, whether internal or external
NOTE: gets passed to subcharts if they include it
*/}}
{{- define "mongodb.url" -}}
{{- if .Values.mongodb.url }}
{{- .Values.mongodb.url }}
{{- else -}}
mongodb://{{ include "food-manager.prefix" . }}-db
{{- end }}
{{- end }}