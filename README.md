###### Programación Multimedia y Dispositivos Móviles. 2º DAM

# Examen 1ª evaluación

### Nombre y apellidos: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

![Alt text](/assets/images/parla.png?raw=true "Capturas de pantalla")

git clone https://github.com/aetxabao/pmdm20f2 parla

Partiendo del código fuente del repositorio facilitado se tiene que implementar el código necesario para la aplicación cuyas pantallas se muestran. En la primera pantalla se mostrará un “slider” con las siglas de los partidos. Tras seleccionar uno, en la siguiente pantalla se mostrará una lista con las localidades donde ha ganado. Cuando se seleccione un municipio se mostrará en otra pantalla una gráfica con los votos de cada partido. En la pantalla inicial también habrá un botón que permitirá acceder a ver los totales de los votos de cada partido en otro gráfico.

1. screens/partidos_screen.dart

   Crear una pantalla con un Scaffold que tenga centrado un RaisedButton y un Slider definido en el fichero widgets/slider_widget.dart

   - (1) Crear el widget en su fichero y utilizarlo en la pantalla con la información proporcionada por:

   municipiosProvider.listaPartidos()

   - (1) El alto de las tarjetas debe ser del 50% de la pantalla del dispositivo, cada tarjeta debe ocupar un 70% del
     ancho, el borde circular debe ser de radio 30.0 y el estilo del texto con tamaño de 75.

   - (0.5) Crear el RaisedButton con la misma forma circular y color blanco.

   - (0.5) Al presionar el RaisedButton acceder a la pantalla: ChartTotalesScreen

2. screens/partidos_screen.dart

   Al pulsar la tarjeta de un partido se tiene que:

   - (0.5) guardar en el almacenamiento de la aplicación (Storage) el partido seleccionado con la clave “partido”.

   - (1) acceder a la siguiente pantalla: MunicipiosScreen

3. screens/municipios_screen.dart

   Crear una pantalla con un Scaffold que tenga un ListView en el que:

   - (0.5) leer del almacenamiento de la aplicación (Storage) el “partido” seleccionado que se va a utilizar para
     obtener los municipios en los que ha ganado ese partido.

   - (1.5) los municipios se obtendrán utilizando el método del proveedor:

   cargarNombresMunicipiosGanador(partido)

   - (0.5) mientras se carguen los municipios filtrados se mostrará un: CircularProgressIndicator

   - (0.5) al pulsar uno de los ListTiles del ListView se accederá a la pantalla: ChartMunicipioScreen
     pasando como argumentos un mapa en cuya clave 'municipio' tendrá asociado el valor correspondiente.

4. screens/chart_municipio_screen.dart

   - (0.5) crear el código para recoger en la variable municipio el 'municipio'pasado .

   - (1) agregar una acción al AppBar con un IconButton que como icono utilice Icons.account_balance
     que al presionarlo regrese a la pantalla PartidosScreen, limpiando la pila de pantallas.

5. providers/municipios_provider.dart

   - (1) crear el código del método cargarListaTotales() del proveedor. Para ello considerar que el último elemento de la lista con los municipios es la que tiene los totales y sobre este municipio se puede utilizar el método que devuelve la lista de los objetos con los votos de cada partido de forma análoga a como se hace en cargarListaVotosPartido.

Puntuación: entre paréntesis aparece el valor con que se puntúa cada apartado
