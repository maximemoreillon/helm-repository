
{{/*
Enabled flag
TODO: Consider automatically enabling ingress if host is set
*/}}
{{- define "face-recognition.ingress.enabled" -}}
  {{- default ((.Values.global).ingress).enabled (.Values.ingress).enabled -}}
{{- end -}}

{{/*
Host
TODO: what if host not set?
TODO: make it an array for multiple hots?
*/}}
{{- define "face-recognition.ingress.host" -}}
  {{- $host := default ((.Values.global).ingress).host (.Values.ingress).host -}}
  {{- $subdomain := (.Values.ingress).subdomain -}}
  {{- if $subdomain -}}
    {{- printf "%s.%s" $subdomain $host -}}
  {{- else -}}
    {{ $host }}
  {{- end -}}
{{- end -}}


{{/*
Annotations
Useful for override from parent or using globals
*/}}
{{- define "face-recognition.ingress.annotations" -}}
  {{ $annotations := default ((.Values.global).ingress).annotations (.Values.ingress).annotations }}
  {{- with $annotations }}
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end -}}
