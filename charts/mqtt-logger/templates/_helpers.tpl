{{/*
Expand the name of the chart.
*/}}
{{- define "mqtt-logger.fullName" -}}
  {{ $name := default .Chart.Name .Values.nameOverride }}
  {{- printf "%s-%s" .Release.Name $name -}}
{{- end }}

{{/*
MQTT Broker URL
Currently hard-coded
*/}}
{{- define "mqtt-logger.mqtt.url" -}}
  {{ $internalBrokerUrl := printf "mqtt://%s-mosquitto:1883" .Release.Name }}
  {{- default $internalBrokerUrl .Values.mqtt.url -}}
{{- end }}


{{/* 
MongoDB
CURRENTLY HARD CODED
*/}}
{{- define "mqtt-logger.mongodb.url" -}}
  {{ $externalUrl := default ((.Values.global).mongodb).url (.Values.mongodb).url -}}
  {{- if $externalUrl -}}
    {{- $externalUrl }}
  {{- else -}}
    {{ $mongodbName := "mongodb" }}
    {{- printf "mongodb://%s-%s" .Release.Name $mongodbName }}
  {{- end -}}
{{- end -}}

{{/* 
InfluxDB
CURRENTLY HARD CODED
*/}}
{{- define "mqtt-logger.influxdb.url" -}}
  {{ $externalUrl := default ((.Values.global).influxdb).url (.Values.influxdb).url -}}
  {{- if $externalUrl -}}
    {{- $externalUrl }}
  {{- else -}}
    {{ $resourceName := "influxdb" }}
    {{- printf "http://%s-%s:8086" .Release.Name $resourceName }}
  {{- end -}}
{{- end -}}