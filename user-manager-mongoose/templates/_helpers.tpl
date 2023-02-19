{{/*
Prefix for resources.
If prefixOverride is set, then prefix is entirely overridden
otherwise if prefix is set, then prefix becomes {releaseName}-{prefix}
otherwise, prefix is simply releaseName
WARNING: Will not be received from parent as name is specific to this chart
*/}}

{{- define "user-manager.prefix" -}}
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
{ingress.subdomain}.{global.ingress.host} if those are set
{global.ingress.host} if global host set but not ingress.sub
{ingress.host} otherwise
WARNING: might not play well with sub-sub-charts
TODO: figure out if scoping to this chart or not
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
NOTE: templates are shared with subcharts so it can be received from parent
https://helm.sh/docs/chart_template_guide/subcharts_and_globals/#sharing-templates-with-subcharts
*/}}
{{- define "mongodb.url" -}}
{{- if .Values.mongodb.url }}
{{- .Values.mongodb.url }}
{{- else -}}
mongodb://{{include "user-manager.prefix" .}}-mongo
{{- end }}
{{- end }}