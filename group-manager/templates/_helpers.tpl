{{/*
Expand the name of the chart.
*/}}
{{- define "group-manager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

