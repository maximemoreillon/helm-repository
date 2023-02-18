{{/*
Prefix for resources.
If prefixOverride is set, then prefix is entirely overridden
otherwise if prefix is set, then prefix becomes releaseName-prefix
otherwise, prefix is simply releaseName
*/}}

{{- define "resources.prefix" -}}
{{- if .Values.prefixOverride }}
{{- .Values.prefixOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- if .Values.prefix }}
{{- printf "%s-%s" .Release.Name .Values.prefix | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Ingress host
host if ingress.host ist set
{ingress.subdomain}.{global.ingress.host} if those are set
*/}}
{{- define "ingress.host.full" -}}
{{- if .Values.ingress.host }}
{{- .Values.ingress.host }}
{{- else if and .Values.ingress.subdomain .Values.global.ingress.host }}
{{- printf "%s.%s" .Values.ingress.subdomain .Values.global.ingress.host }}
{{- end }}
{{- end }}