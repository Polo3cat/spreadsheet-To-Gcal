def incrementarDia
	if ($month == 4 or $month == 6 or  $month == 9 or $month == 11) and $day == 30
		$day = 1
		$month = $month + 1
	elsif ($month == 1 or $month == 3 or $month == 5 or $month == 7 or $month == 8 or $month == 10) and $day == 31
		$day = 1
		$month = $month + 1
	elsif $month == 12 and $day == 31
		$day = 1
		$month = 1
		$year = $year + 1
	elsif $month == 2 and $year%4 == 0 and $day == 29
		$day = 1
		$month = $month + 1
	elsif $month == 2 and $day == 28
		$day = 1;
		$month = $month + 1
	else
		$day = $day + 1
	end														
end

calendario = ["Subject","Start date", "Start time", "End time", "Location"]
eventCounter = 0

#Change these values
dayInitial = 10
monthInitial = 4
yearInitial = 2017
hora = 12
location = "Big Al's Barcelona"
########################
require 'csv'

#Change the name of the output file
csv = CSV.open("./gcal.csv", "wb")
#################################
csv << calendario
#Change the name of the input file
CSV.foreach('./horario.csv') do |fila|
##################################
	$day = dayInitial
	$month = monthInitial
	$year = yearInitial

	for i in 0..fila.length-1
		if fila[i] != nil
			eventCounter = eventCounter + 1
			sujeto = fila[i]
			fechaIni = $day.to_s + "/" + $month.to_s + "/" + $year.to_s
			horaIni = hora.to_s + ":00"
			horaFin = (hora + 1).to_s + ":00"
			evento = %W[#{sujeto} #{fechaIni} #{horaIni} #{horaFin} #{location}]
			csv << evento
		end
		incrementarDia		
	end
	hora = hora + 1
end
if eventCounter > 0
	puts "CONVERSION DONE!"
	puts "There are #{eventCounter} events"
else
	puts "IT LOOKS LIKE THERE WERE NO EVENTS!"
end

