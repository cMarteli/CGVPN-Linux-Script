#!/bin/bash
# glitch's Cyberghost tool

/* Declare the default country code */
default_country_code="AU"

printf "\t*******************************\n\t* glitch's cyberghostvpn tool *\n\t*******************************\n"
printf "\t[Wireguard edition]\n\n"
PS3="Please enter your choice: "
options=("Quick Connect (Wireguard)" "Connect w/ country code" "All Servers" "Torrent Servers" "Disconnect" "Check status (Open VPN)" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Quick Connect (Wireguard)")
            /* Connects to the server defined by default_country_code */
            echo "Connecting to $default_country_code server..."
            sudo cyberghostvpn --traffic --country-code $default_country_code --wireguard --connect
            break
            ;;
        "Connect w/ country code")
            /* Connects to a specific country */
            read -p "Enter country code: " ccode
            echo "Connecting to $ccode server..."
            sudo cyberghostvpn --traffic --country-code $ccode --connect            
            ;;
        "All Servers")
            /* List of all available countries */
            echo "Getting server list..."
            cyberghostvpn --traffic --country-code
            ;;
        "Torrent Servers")
            /* List of all available countries for torrent */
            echo "Getting server list..."
            cyberghostvpn --torrent --country-code
            ;;
        "Disconnect")
            /* Exits VPN connection */
            echo "disconnecting..."
            sudo cyberghostvpn --stop
            ;;
        "Check status (Open VPN)")
            cyberghostvpn --wireguard --status
            ;;
        "Quit")
            break
            ;;
        *)
            echo "invalid option $REPLY"
            ;;
    esac
done
