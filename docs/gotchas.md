# Gotchas
These are notes around different types of failures in the carving process.


## Grbl not responding
- run the protoneer image [here](https://wiki.protoneer.co.nz/Raspberry_Pi_CNC_User_Interface_SD_Card_Image_V5.00)
- on the desktop there is a script `setup <something>.sh` run it.
- flash hte firmware

## cncjs not starting on boot
setup pm2 as these instructions show [here](https://cnc.js.org/docs/rpi-setup-guide/)


## Axis Slippage
![axis slippage example](https://lh3.googleusercontent.com/Vf0Y8VVEjJ2XM6gfTe-zDjV55Q0uxVouj7I30cJ42lzLdh7OGVdnMimoT3kyHdOLQLK_bFZwpQ-9uzBsDDFnQawyxHjg7FAltyq_YpEZxONzpE0hcR4VNmeD5QOT6cWFXODRD8_BUH7obDM7atYq0oNkh568E-1l0KG4vwhDXjikSXXXaNR-3JTx0L15P_WX89kGyRpmtolf3IbHBNCT7BkMqBxoR95_NlBa63khJWMHH-fSJSBdm5Vrd2NoZusO7hkE37n5AbcExqvoOXIvyhH6upn_8W8cLLmsFxBdeF2dmzCbGH-sSv5knCX18n9bRZNoiJXoK2Dhk3JcwXWNa42evSBr8GN3y7uU3fq9eRynD_iHYfY9pYFiTFx5wHtW9T_g1K-J71Bzf2xENI_a-WebhN5yRgjgk2pBvUqSXoCnWpQpf5mZg7kRlRFqIzrELEfpw7lcuLZu1GIEIv4qgefaXftw3JQCacwJqEtqoOXcl26EMpzJHyIRE6uitd6PHaJg2PMdd_Dsdooe2D1qjOXh-qd0Cw80uhUgiOxNyBSG34RLnIA6GS0iraqcG1bBsDZ70utNcAxNZDd2TB_r4R2ho-77oCLuJqkWqaskP4SrkCYxTb1zmkbdyqChTBWvuZGBR25poYXyzmoIu7LBDi1v7WIZvzhcxayTII_GtpPrsDtdCqmJZ2eTfmqPz32NN4oCcdx1u4q6DnxGCY0=w690-h300-no)
This was caused by the axis max speed being configured too fast. Fixed by using grbl console, `$$` to show the settings, and reducing the max speed with $111=200 (setting max y axis speed to be slower).

## Stock Slippage
![stock slippage example](https://lh3.googleusercontent.com/6YKA4u-dw940YjIze_3f_o0F8SFl5KL5prnh7_Do42InjSy5k3oyd3c-yxGbHiALIYOR6loodVLiBiFj7hbNlPa4jSL3y-EL85IqTiSvR1EXWWCtUjLUTIdA_onvhK02feYEkwUONnL_jEOCIlU2n4CAN2-dz9Fg0Xx5SzSvl4qwn8GA-kW3N5apUGcNgZg6TCGxPGY6ZvpZuB66oWAqE2OmM6cd70gZYWmxRoDC0OoNUHtBDZ5wYMc9xdN1FRu-Hf_yygz4fZvbUjmLV85O2mNc2EH1RuTuJ8HUfEemo1jwZBHq4jNvnmD7gWEwzB2lyLHy3TG4Opul2XDXOcSC31EDQV_NdwVx7XkNrF7v-RpDr74rlPqz_yBB1KD6_5iEsnkum7dgWHRyuSMvAYY6o32d9AY0Sd3kSEA_ie2SGr2H5mqU6jQla25XWlmHB8wbgKBbYt2qZx69ZQFa50RgZOKcsWHanVFQ_ZtG44U4PDXxbhY6RbMRAG10m2N0g3KY-IPUPE5-TA1nrLMMPfBQ4o2Yl5F32hfgkfGjIGye6YaE-bN7zN2nIAeIFYPqZpuaJ52Cr35gbm83ZvTedIn73fnvZg_Q8wUlpz4FYfmN-oDCAzm2ACglQ1btWumpK5CljqW0hv_FtzFczxrRGMxCly6caJbyrSWNXuS4BC602UYa7aEdibXGtcwd0ettvQtJWgic1Rfn0gZUAwjmS6o=w690-h300-no)
This was caused by the piece of wood being milled not being fixed securly enough to the bed. Fixed by attaching it securely.

## Stock Tilting
![stock tilting example](https://lh3.googleusercontent.com/TAGg_NbH2bvvy6UUZl_5ei28SwbjK26DU1DIArqDUK3FyZzLX3r0ULFSAph8NOIbOFqiKsIxAeU5NCbYqucJ9vn9xD515G7MOkKrXSUOOhmWLBMeKNv9lEcPw5b-VvpMQmRcfECuc5EAOWTOpUeNOdcEh3FO4SmF_sxWkMm3U2aUuWku5_l2_KIZPMYn1WW3jV7dxM-1JlUYcOcJxsLtHBp7pvMhCBc3Szd-9DwSefqUjHY5YeLk5Ai_wz4w0ODAweCuJJbsX6SFEPSTrBq6hj1qv1MCTTXz9KK5-pNIW5UBbNM6nesH339KJVCXdCw9KHFqmyIvALAQIVlx27LcBK5DtKom5tTqKsbIqwFNLiY_kJ3jFiP-XtA_YLxyBQfufdUh0d0vPW0yfNBPo1ZL8xVrpm3u7am5NoiHYEKIJjE41qlZ-5GuNfPwVkaSETcoFgc8ywKAcJVnJw5ZeIKU6T_SxWPj_wWWZpvO4BCeN1msu7AMToesLa4IYpbRO9499ZU5jd3kdQRKxQw5o6fPXWFW0eMK_39fFAPvaBoZDpbmaQDOTLPZLj-17JQE8gcjujOVOzbffTsNRdM6ple661QJb47N8YalC9SrYuohtQucZvMLtHFl8tDt8Se9XPSKKNqgdMWW9L0zbHIcxIVcRvM11vBb7HAvQs3wchCoBcWNt2Uip04s4R3GYjtfRaR-4LTcxYqpsQNkjOIbXJc=w690-h300-no)
Same as `Stock Slippage`

## Model Origin (instead of stock)
![model origin example](https://lh3.googleusercontent.com/5Rb-ZSzZFDaninfDXt5FVSv54ZFPO3YPs4qB9GPZXhAcuzTi9tC0n2zDV6-qIzB_at-JtLGqfSBiFv2VKmg3dzT2kL5WLJw5bpFtXIv03030YuJ1XTXKcDOQkVxNNPNzoSaIEdkV_iw0_QlpLNtz453sxpPV01c77xiRpWPS0SfK0g1eTHync5w49NxA8rlEKdJw_KvTz4cPZf7_ePxnFTwcU8m4qEJBeVEpNlQfp5Le6vB5vqMfnBeIcVNmV0pbdkD-65LxMVt7RTTPaKKBGZ5zQJrM_TcFhgLKIhd5p1XPeDRIuXkpw4VafWayWM2IhL7rjPJC_46ELW1tNr9cZx21IMgJUjZy9jK6BK5SbKO5tUk8nmYWQ7vnQDQEWOPzYqiubeNjyErWmoiRokIZmCK4HhNdfE915587fkl2cTEG9pWxqPzebYw6zXn7O_Fm9u1omaj9ECfmpYmQoNmMw6yNGkGigWklXzD3n91msOYaweW9xWOH4CUhBVI-88i-a7fjBrO-2rVqqRr8SJLgchaMoW_USzjYhG7h2ievUGTHMBH1hUVwvQtkAPpGYyb_QOwHW0yraCK3tlq00-CMs_T3-QZaiYfGl9og3oi5vpTn9W1Rbu5Nhui2DJq8YB5R6sjibgcyxVtNKQK2exXe7_vGegr-iEKA1svmnorK6yswAtDVSruunZEs8orRdYgz0pp2NQeo-TATmd2Z3JA=w690-h300-no)
This was caused by selecting part of the model's bounding box as the origin instead of the stock's.
Fixed by picking the origin to be a recognizable edge of the bounding box, with a significant enough headroom on the stock to account for any sort of tilt.


## Why is the toolpath not generating!?
right click mesh, and then "meshg to brep"

## Studdering
Don't randomly turn the potentiometers, you're bound to make it worse. Calibrate the current limit with the instructions.
The Pololu driver docs [here](https://www.pololu.com/product/2133) show
```
To achieve high step rates, the motor supply is typically much higher than would be permissible without active current limiting. For instance, a typical stepper motor might have a maximum current rating of 1 A with a 5Ω coil resistance, which would indicate a maximum motor supply of 5 V. Using such a motor with 12 V would allow higher step rates, but the current must actively be limited to under 1 A to prevent damage to the motor.

The DRV8825 supports such active current limiting, and the trimmer potentiometer on the board can be used to set the current limit. You will typically want to set the driver’s current limit to be at or below the current rating of your stepper motor. One way to set the current limit is to put the driver into full-step mode and to measure the current running through a single motor coil without clocking the STEP input. The measured current will be 0.7 times the current limit (since both coils are always on and limited to approximately 70% of the current limit setting in full-step mode).

Another way to set the current limit is to measure the voltage on the “ref” pin and to calculate the resulting current limit (the current sense resistors are 0.100Ω). The ref pin voltage is accessible on a via that is circled on the bottom silkscreen of the circuit board. The current limit relates to the reference voltage as follows:

Current Limit = VREF × 2

So, for example, if you have a stepper motor rated for 1 A, you can set the current limit to 1 A by setting the reference voltage to 0.5 V.

Note: The coil current can be very different from the power supply current, so you should not use the current measured at the power supply to set the current limit. The appropriate place to put your current meter is in series with one of your stepper motor coils.
```

## An Axis Stopping Completely
This is because the driver overheated.
We now have heatsinks on the drivers, check that they are still attached.
The current limit may be too high (see how to calibrate in the `Studdering` section), and lower that value a bit.
The side effect of lowering hte vref is that axis provides less power.


