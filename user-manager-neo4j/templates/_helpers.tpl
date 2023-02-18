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
{{- end }}
{{- end }}
{{- end }}

