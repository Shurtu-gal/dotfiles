function conservation_mode --description "Toggle Conservation mode"
    set curr (cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)

    if test "$curr" -eq 1
	echo "Switching off conservation mode"
	set new 0
    else 
	echo "Switching on conservation mode"
	set new 1
    end

    sudo bash -c "echo $new > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"
end
