{{- define "mosquitto.fullName" -}}
  {{ $name := default .Chart.Name .Values.mosquitto.nameOverride }}
  {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}

