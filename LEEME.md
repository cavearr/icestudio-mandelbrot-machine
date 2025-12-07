# Mandelbrot Machine @ Alhambra II

Este proyecto es una adaptación y evolución de la **Mandelbrot Machine** original de *Jesús Arias* (diseñada para su tarjeta SIMRETRO).

El objetivo del proyecto era poder crear una versión del diseño que sin modificar el core original pudiera ejecutarse en la tarjeta **Alhambra II** (Lattice iCE40HX4K), con menos recursos que la tarjeta SIMRETRO.

Este ejercicio ha servido como primer test de una metodología consistente en pequeños módulos "emuladores" de periféricos hardware que son los que "engañan" al core original para permitir correr el diseño aunque los recursos no sean los mismos y adaptar las capacidades nativas a los requisitos del diseño original.

En este sentido el proyecto ha sido un éxito, la experiencia visual aunque distinta del original es muy satisfactoria al igual que la interfaz de usuario a través de un joystick genérico y económico.


## 🚀 Características Destacadas

  * **Arquitectura Híbrida de Visualización:**
      * **Fondo:** Renderizado comprimido (4:1) espacialmente para caber en la BRAM.
      * **Ventana "Lupa" (192x100):** Área de alta resolución sin comprimir que se superpone al fondo, permitiendo ver el detalle matemático real del fractal.
  * **Emulación memoria SRAM con BRAMS** Como el core original espera poder utilizar una memoria SRAM, se ha creado una memoria BRAM con comportamiendo de SRAM orientada a vídeo.
  * **Math Core Intacto:** Utiliza el núcleo original de J. Arias con multiplicadores de punto fijo Q4.11 y Q5.18.
  * **Control Analógico Avanzado:** Navegación mediante Joystick con filtrado digital IIR, histéresis y autocalibración.
  * **Salida de Video Adaptada:** Conversión de color RGB444 a RGB222 (6-bit) compatible con DACs R-2R sencillos.
  * **Pipeline de Video:** Suavizado espacial (filtro de convolución 3x3) y mapeo de memoria dinámico.

## 🎮 Interfaz de Control

El sistema se controla mediante un Joystick analógico estándar (tipo Arduino KY-023) conectado vía ADC I2C.

| Control | Acción | Descripción |
| :--- | :--- | :--- |
| **Joystick (Ejes X/Y)** | Mover Lupa | Desplaza la ventana de detalle sobre el fractal. |
| **Botón SW1 (A)** | Modo Lupa Vertical | Permite mover la lupa libremente sin desplazar el fractal de fondo. |
| **Botón SW2 (B)** | **Modo Zoom** | Manteniendo pulsado + Joystick Arriba/Abajo realiza Zoom In/Out. |

## 🔌 Conexiones de Hardware

### 1\. Salida de Video (VGA 6-bit)

Se requiere un adaptador VGA con DAC R-2R (como el [AP-VGA](https://github.com/Alhambra-bits/AP-VGA) o uno casero).

  * **Nivel de salida:** \~0.41V (Brillo al 60% debido a resistencias internas de la FPGA).

| Señal VGA | Pin FPGA | Descripción |
| :--- | :--- | :--- |
| **RED** (MSB/LSB) | D7 / D6 | Resistencias 470Ω / 1kΩ |
| **GREEN** (MSB/LSB) | D5 / D4 | Resistencias 470Ω / 1kΩ |
| **BLUE** (MSB/LSB) | D3 / D2 | Resistencias 470Ω / 1kΩ |
| **HSYNC** | D1 | Resistencia 100Ω |
| **VSYNC** | D0 | Resistencia 100Ω |
| **GND** | GND | Común |

### 2\. Entrada de Control (Joystick)

Se utiliza un ADC **ADS7924** (12-bit I2C) para leer los potenciómetros.
El ADC ya está integrado en la tarjeta Alhambra-II

| Joystick KY-023 | Conexión | Notas |
| :--- | :--- | :--- |
| **VRx** | ADC Canal 0 | Eje X | Pin de la Alhambra A0
| **VRy** | ADC Canal 1 | Eje Y | Pin de la Alhambra A1
| **SW1** (Botón A) | GPIO FPGA | Activa el zoom al dejarlo pulsado |
| **SW2** (Botón B) | GPIO FPGA | Movimiento libre de la lupa al dejar pulsado |

## 📂 Estructura del Proyecto

  * **`mandelbrot_top.ice`**: Proyecto principal en Icestudio (Diagrama de bloques).
  * **`ficheros verilog (.v)`**: Código fuente de los diferentes módulos.
  * **`docs/`**: Contiene el manual técnico detallado **`mandelbrotmachine-alh.pdf`**.
  * **`bistreams/`**: Bistreams para flashear sin sintetizar.
  * **`generated_code/`**: Código generado por Icestudio por si el lector quiere sintetizarlo directamente con Yosys.

## ⚙️ Configuración y Síntesis

El proyecto está diseñado para ser sintetizado con la toolchain open-source (Yosys, Nextpnr, Icestudio).

El diseño ocupa prácticamente toda la FPGA (más del 95% de ocupación), el tiempo de sintetizado suele rondar el minuto.


## Referencias
* Jesús Arias, Mandelbrot Machine [Documentación](https://www.ele.uva.es/~jesus/SIMRETRO/mandelmachine.pdf) y [Código](https://www.ele.uva.es/~jesus/BAC.tgz)
* AP VGA : (https://github.com/Alhambra-bits/AP-VGA)
* Alhambra-II Board: (https://github.com/FPGAwars/Alhambra-II-FPGA)
* Icestudio: [Web del proyeto](https://icestudio.io)

## © Créditos y Licencia

  * **Adaptación a Alhambra II, Video Pipeline, Control y multiplicador en punto fijo de Booth:** Carlos Venegas (@cavearr).
  * **Diseño Original y Núcleo Matemático:** Jesús Arias (Universidad de Valladolid) [Página web](https://www.ele.uva.es/~jesus/)
  * **Adaptación ADC I2C y Encoder:** @Demócrito [Página de github](https://github.com/democrito) 

### Licencia

  * Los módulos de nueva creación (*Carlos Venegas*) se liberan al **Dominio Público (CC0 1.0)** [Enlace a la licencia](https://creativecommons.org/publicdomain/zero/1.0/), también la puedes encontrar en el fichero **LICENSE.txt**
  * El núcleo original (*Jesús Arias*) se utiliza con permiso bajo fines educativos/open-source (ver cabeceras de archivos), manteniendo su licencia original.

-----

*Dedicado a la comunidad FPGAwars*
