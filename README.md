# **DutyStatusManager - Gestión de Servicio para QB-Core**

**DutyStatusManager** es un script diseñado para servidores QB-Core que permite gestionar el estado de servicio (entrada y salida) de los jugadores en diferentes trabajos. Este sistema incluye interacción con qb-target, qb-menu y log automático a Discord.

---

## **Características Principales**

### **Gestión del Estado de Servicio**
- Permite a los jugadores entrar o salir de servicio en trabajos específicos utilizando puntos interactivos configurados en el mapa.
- Uso de un menú para seleccionar opciones como "Entrar en servicio" o "Salir de servicio".

### **Configuración**
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

### **Preview**

-  [Imagen 1](https://imgur.com/WdOAjXG)
-  [Imagen 2](https://imgur.com/FL3fAjs)

### **Instalación**

1. **Descarga el archivo:**
   - Descarga el script y descomprime la carpeta.

2. **Añádelo a tu servidor:**
   - Coloca la carpeta en el directorio `resources` de tu servidor.

3. **Instala la base de datos:**
   - Importa el archivo `.sql` proporcionado en tu base de datos utilizando un administrador como HeidiSQL, phpMyAdmin o cualquier otro.

4. **Configura el script:**
   - Edita el archivo `config.lua` para personalizar las ubicaciones, webhooks y ajustes de los trabajos según las necesidades de tu servidor.

5. **Activa el recurso:**
   - Añade la siguiente línea en tu archivo `server.cfg`:
     ```plaintext
     ensure DutyStatusManager
     ```
