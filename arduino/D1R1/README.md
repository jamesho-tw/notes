# Arduino D1 (Revision 1)

## Pinout

| WEMOS D1 R1 | Function                     | ESP8266 |
| ----------- | ---------------------------- | ------- |
| D0          | RX                           | GPIO3   |
| D1          | TX                           | GPIO1   |
| D2          | IO                           | GPIO16  |
| D3 (D15)    | IO                           | SCL     |
| D4 (D14)    | IO                           | SDA     |
| D5 (D13)    | IO, SCK                      | GPIO14  |
| D6 (D12)    | IO, MISO                     | GPIO12  |
| D7 (D11)    | IO, MOSI                     | GPIO13  |
| D8          | IO, 10k Pull-up              | GPIO0   |
| D9          | IO, 10k Pull-up, BUILTIN_LED | GPIO2   |
| D10         | IO, 10k Pull-down, SS        | GPIO15  |
| A0          | Analog Input                 | A0      |

## Installing with Boards Manager
Starting with 1.6.4, Arduino allows installation of third-party platform packages using Boards Manager. The packages available for Windows, Mac OS, and Linux (32 and 64 bit).

* Install the current upstream Arduino IDE at the 1.8.5 level or later. The current version is at the [Arduino website](http://www.arduino.cc/en/main/software).
* Start Arduino and open `Preferences` window.
* Enter `http://arduino.esp8266.com/stable/package_esp8266com_index.json` into **Additional Board Manager URLs** field. You can add multiple URLs, separating them with commas `(,)`.
* Open `Boards Manager` from `Tools` > Board menu and install **esp8266** platform.