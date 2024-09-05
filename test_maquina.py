from maquina_dialisis import MaquinaDeDialisis
import pytest


def test_creacion():
    mi_maquina = MaquinaDeDialisis("DBB-05", "NIKKISUS")
    #    assert mi_maquina == "Máquina de diálisis modelo DBB-05 del fabricante NIKKISUS"
    assert mi_maquina.modelo == "DBB-05"
    assert mi_maquina.fabricante == "NIKKISUS"
    assert mi_maquina.en_tratamiento == False
    assert mi_maquina.tiempo_tratamiento == 0


def test_iniciar():
    mi_maquina_2 = MaquinaDeDialisis("4008S", "FRESENIUS")
    assert (
        mi_maquina_2.iniciar_tratamiento(30) == "Tratamiento iniciado por 30 minutos."
    )


def test_detener():
    mi_maquina_3 = MaquinaDeDialisis("AK98", "GAMBRO")
    mi_maquina_3.iniciar_tratamiento(10)
    assert mi_maquina_3.detener_tratamiento() == "Tratamiento detenido."
    assert mi_maquina_3.detener_tratamiento() == "La máquina no está en tratamiento."


def test_asignar():
    mi_maquina_4 = MaquinaDeDialisis("Innova", "HOSPAL")
    assert (
        mi_maquina_4.asignar_paciente("Gustavo Adrián")
        == "Paciente Gustavo Adrián asignado a la máquina de diálisis modelo Innova."
    )
