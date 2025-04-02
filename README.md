El Sistema de Gestión de Campers es una aplicación diseñada para administrar el proceso de formación de desarrolladores en un bootcamp. El sistema permite gestionar campers, trainers, módulos, evaluaciones y todo el proceso de aprendizaje de manera eficiente y organizada.

 Características Principales
- Gestión completa de campers (registro, seguimiento, estados)
- Administración de trainers y sus conocimientos
- Control de módulos y rutas de aprendizaje
- Sistema de evaluaciones con cálculo automático de notas
- Seguimiento de progreso y rendimiento
- Gestión de horarios y recursos
- Sistema de notificaciones

Estructura del Proyecto
```
├── data/
│   ├── dql_funciones.sql    # Funciones SQL para cálculos y validaciones
│   ├── dql_procedimientos.sql # Procedimientos almacenados para operaciones complejas
│   └── dql_triggers.sql     # Triggers para automatización de procesos
└── README.md                # Este archivo
```

Componentes Principales

 Base de Datos
- **Tablas Principales**:
  - `campers`: Información de los estudiantes
  - `trainers`: Datos de los instructores
  - `modulos`: Módulos de aprendizaje
  - `evaluaciones`: Registro de calificaciones
  - `rutas`: Rutas de aprendizaje
  - `asignaciones`: Asignación de campers a rutas
Funcionalidades Automatizadas
- Cálculo automático de notas finales
- Actualización de estados de campers
- Validación de capacidades y horarios
- Seguimiento de rendimiento
- Gestión de recursos
Instalación
1. Clonar el repositorio
2. Importar los archivos SQL en orden:
   - Estructura de la base de datos
   - Funciones
   - Procedimientos
   - Triggers

Uso
El sistema está diseñado para ser utilizado a través de procedimientos almacenados y funciones SQL, permitiendo una integración segura con cualquier aplicación cliente.

Mantenimiento
- Los triggers automatizan la mayoría de los procesos
- Las funciones proporcionan cálculos y validaciones
- Los procedimientos almacenados manejan operaciones complejas


