{{/*
Expand the name of the chart.
*/}}
{{- define "mqtt-logger.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}
