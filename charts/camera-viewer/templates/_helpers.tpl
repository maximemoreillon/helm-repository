{{/*
Expand the name of the chart.
*/}}
{{- define "camera-viewer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

