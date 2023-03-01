{{/*
Expand the name of the chart.
*/}}
{{- define "camera-viewer.fullname" -}}
	{{ $name := default .Chart.Name .Values.nameOverride }}
	{{- printf "%s-%s" .Release.Name $name }}
{{- end }}

