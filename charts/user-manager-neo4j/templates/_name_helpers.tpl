{{- define "user-manager.prefix" -}}
	{{ $name := default .Chart.Name .Values.nameOverride }}
	{{- printf "%s-%s" .Release.Name $name -}}
{{- end }}