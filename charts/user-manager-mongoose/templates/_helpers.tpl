{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "user-manager.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
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
mongodb://{{include "user-manager.fullname" .}}-mongo
{{- end }}
{{- end }}
