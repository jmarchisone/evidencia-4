class MaquinaDeDialisis:
    def __init__(self, modelo, fabricante):
        self.__modelo = modelo
        self.__fabricante = fabricante
        self.__en_tratamiento = False
        self.__tiempo_tratamiento = 0

    @property
    def modelo(self):
        return self.__modelo

    @property
    def fabricante(self):
        return self.__fabricante

    @property
    def en_tratamiento(self):
        return self.__en_tratamiento

    @en_tratamiento.setter
    def en_tratamiento(self, valor):
        self.__en_tratamiento = valor

    @property
    def tiempo_tratamiento(self):
        return self.__tiempo_tratamiento

    @tiempo_tratamiento.setter
    def tiempo_tratamiento(self, valor):
        self.__tiempo_tratamiento = valor

    def iniciar_tratamiento(self, tiempo):
        if not isinstance(tiempo, int):
            raise TypeError(
                "El tiempo debe estar expresado en valor numérico de minutos"
            )
        if not self.en_tratamiento:
            self.tiempo_tratamiento = tiempo
            self.en_tratamiento = True
            return f"Tratamiento iniciado por {tiempo} minutos."
        else:
            return "La máquina ya está en tratamiento."

    def detener_tratamiento(self):
        if self.en_tratamiento:
            self.en_tratamiento = False
            return "Tratamiento detenido."
        else:
            return "La máquina no está en tratamiento."

    def asignar_paciente(self, paciente):
        return f"Paciente {paciente} asignado a la máquina de diálisis modelo {self.modelo}."

    def __str__(self):
        return (
            f"Máquina de diálisis modelo {self.modelo} del fabricante {self.fabricante}"
        )
