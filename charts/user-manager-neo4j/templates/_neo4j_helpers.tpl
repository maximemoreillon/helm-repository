{{- define "user-manager.neo4j.url" -}}
{{- $name := default .Chart.Name .Values.neo4j.nameOverride }}
{{- $fullname := printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- printf "bolt://%s:7687" $fullname }}
{{- end }}
