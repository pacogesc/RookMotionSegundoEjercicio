# RookMotionSegundoEjercicio
Aplicación Demo segundo ejercicio

Este proyecto demo se muestra la implementación de una aplicación con la siguietnes secciones:

# Login - Registro
En esta sección se permite al usuario iniciar sesión o crear una cuenta nueva para este modulo se utilizó fireBase/Auth
se cuenta con validaciones básicas de campos vacíos y firebase propoercioa la validación de la cuenta

# Inicio
En esta parte de la aplicación se muestra una sección de noticias de caracter científico las cual se pueden filtrar por medio de buscador, él cual toma con referencia
el título de la noticia

#WebView
vista que se despliega para mostar a detalle la noticia seleccionada en la parte de inicio

# Menu lateral
Este menu se realizó desde cero como se indica en las instrucción el cuáll puede ser implementa en cualquier controlador, est menu permite el cierre de sesión
y muestra datos básico del usario como su nombre y correo

# Persistencia de datos
En este modulo de la aplicación se utiliza Userfaulst para la persistencia de sesión abierta, Realm para almacenar los datos del usario consultados al inicio de su sesión
también se utiliza keychain para almacenar datos sensibles del usuario como su conraseña

# Arquitectura, Dependencia de terceros e información extra

Para la implementación de esta aplicación demo se utilzó el patrón de diseño MVVM, también se hace uso de los siguientes Pods

  pod 'JGProgressHUD', '2.2' (se utiliza para mostrar un indicador de carga en las secciones requeridas)
  pod 'LBTATools', '1.0.12' (se utiliza para la creación de vistas)
  pod 'IQKeyboardManagerSwift', '6.5.6' ( se utiliza para el manejo del teclado)
  pod 'Firebase/Auth' (Permiter el registro e indetificación de usuario)
  pod 'Firebase/Firestore' (almacenamiento de información en una base de datos remota)
  pod 'SDWebImage' (Se utiliza para la carga de imágenes en la sección de inicio permite guardar las imagen en memoria cache para un carga más rápida)
  pod 'RealmSwift' (Permite la persistencia de datos con una base de datos en el móvil)
  pod 'KeychainSwift', '19.0 (almacena datos sensibles del usuario)
