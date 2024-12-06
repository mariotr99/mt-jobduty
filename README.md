# **DutyStatusManager - Gestión de Servicio para QB-Core**

**DutyStatusManager** es un script diseñado para servidores QB-Core que permite gestionar el estado de servicio (entrada y salida) de los jugadores en diferentes trabajos. Este sistema incluye interacción con qb-target, qb-menu y log automático a Discord.

---

## **Características Principales**

### **Gestión del Estado de Servicio**
- Permite a los jugadores entrar o salir de servicio en trabajos específicos utilizando puntos interactivos configurados en el mapa.
- Uso de un menú para seleccionar opciones como "Entrar en servicio" o "Salir de servicio".

### **Configuración Específica por Trabajo**
- Cada trabajo tiene:
  - **Coordenadas** específicas en el mapa para el punto de interacción.
  - **Texto personalizado** para el menú y el marcador en pantalla.
  - **Webhook Discord** para enviar notificaciones de las actividades a Discord.

### **Notificaciones Automáticas a Discord**
- Registra en tiempo real las acciones de los jugadores (entrada o salida de servicio) mediante webhooks.
- Contador de horas por servicio.

### **Dependencias**

- [**qb-core**](https://github.com/qbcore-framework/qb-core)  
- [**qb-target**](https://github.com/qbcore-framework/qb-target)  
- [**qb-menu**](https://github.com/qbcore-framework/qb-menu)  


[Imgur](https://imgur.com/WdOAjXG)
