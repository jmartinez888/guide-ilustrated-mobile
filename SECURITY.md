# Seguridad del repositorio

## Archivos que no se versionan

No subas archivos `.env`, `key.properties`, keystores (`.jks` o `.keystore`), certificados (`.p12`) ni perfiles de aprovisionamiento Apple.

Para firmar Android, copia `android/key.properties.example` a `android/key.properties` y completa los valores solo en tu equipo. El keystore debe permanecer fuera del repositorio.

## Firebase

Los archivos de configuración de Firebase identifican la aplicación y se mantienen versionados para que el proyecto pueda compilar. No contienen una clave privada. Antes de hacer público el repositorio, restringe las claves de API de Firebase/Google Cloud al identificador de paquete Android y al bundle ID de iOS.

## Si un secreto llegó a Git

Eliminar un archivo del directorio no elimina versiones anteriores. Revoca o rota el secreto y reescribe el historial antes de publicar el repositorio.
