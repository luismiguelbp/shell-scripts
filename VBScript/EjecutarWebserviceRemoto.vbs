Function GetFechaParaEnviar(ByVal dia)
	ahoraYear = DatePart("yyyy", dia)
	ahoraMonth = DatePart("m", dia)
	If (ahoraMonth < 10) Then
		ahoraMonth = "0" & ahoraMonth
	End If
	ahoraDay = DatePart("d", dia)
	If (ahoraDay < 10) Then
		ahoraDay = "0" & ahoraDay
	End If
	ahora_yyyyMMdd = ahoraYear & ahoraMonth & ahoraDay ' 20190103
	ahora_yyyy_MM_dd = ahoraYear & "-" & ahoraMonth & "-" & ahoraDay ' 2019-01-03

	ahoraHour = DatePart("h", dia)
	If (ahoraHour < 10) Then
		ahoraHour = "0" & ahoraHour
	End If
	ahoraMinute = DatePart("n", dia)
	If (ahoraMinute < 10) Then
		ahoraMinute = "0" & ahoraMinute
	End If
	ahora_HHmm = ahoraHour & ahoraMinute ' 1738
	ahora_HH_mm = ahoraHour & ":" & ahoraMinute ' 17:38

	ahora_yyyyMMdd_HHmm = ahora_yyyyMMdd & ahora_HHmm ' 201901031738
	ahora_yyyy_MM_dd_HH_mm = ahora_yyyy_MM_dd & " " & ahora_HH_mm ' 2019-01-03 17:38

    GetFechaParaEnviar = ahora_yyyy_MM_dd_HH_mm
End Function

Sub EjecutarURL(ByVal fecha)
	Dim objHttp
	Set objHttp = CreateObject("MSXML2.XMLHTTP")
	objHttp.Open "GET", "http://url.com/API/Handler.ashx?Fecha=" & fecha, False
	objHttp.Send
	'objHttp.ResponseText now holds the response as a string.
End Sub

Sub EjecutarEspera()
	' 1000 milliseconds * 60 = 1 minuto
	WScript.Sleep(1000 * 60 * 1)
	'MsgBox "Hola Mundo"
End Sub

ahora = Now()

diaAnteriorUno = DateAdd("d",-1,ahora) ' 1 dia atras
fecha = GetFechaParaEnviar(diaAnteriorUno) ' yyyy-MM-dd HH:mm
EjecutarURL(fecha)

EjecutarEspera() ' Hacemos una pausa entre cada una de las ejecuciones

mesAnteriorUno = DateAdd("m",-1,ahora) ' 1 meses atras
fecha = GetFechaParaEnviar(mesAnteriorUno) ' yyyy-MM-dd HH:mm
EjecutarURL(fecha)
