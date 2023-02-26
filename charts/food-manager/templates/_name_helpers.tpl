{{/*
Create a default fully qualified app name.
TODO: consider fullNameOverride
TODO: rename resourcePrefix
*/}}
{{- define "food-manager.fullName" -}}
  {{ $name := default .Chart.Name .Values.name }}
  {{- printf "%s-%s" .Release.Name $name -}}
{{- end }}




