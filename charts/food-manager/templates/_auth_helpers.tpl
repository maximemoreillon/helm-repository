{{/* CURRENTLY HARD CODED */}}
{{- define "food-manager.auth.url" -}}
  {{- $authName := "auth-api" -}}
  {{- $serviceName := printf "%s-%s" .Release.Name $authName -}}
  {{- printf "http://%s" $serviceName -}}
{{- end -}}