#!/bin/bash
# Default Values
LOCATION=0
QRCODE_LOCATION=$LOCATION
Y_AXIS=0
X_AXIS=0
QRCODE_dir="/tmp/"
WIDTH_FIX_MAIN=1
WIDTH_FIX_STATUS=10
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
theme="$dir/config.rasi"
PASSWORD_ENTER="if connection is stored,hit enter/esc."
wifi_ifaces=($(nmcli device | awk '$2=="wifi" {print $1}'))
wifi_ifaces_product=()
WLAN_INT=0
ethernet_ifaces=($(nmcli device | awk '$2=="ethernet" {print $1}'))
ethernet_ifaces_product=()
ASCII_OUT=false
CHANGE_BARS=false
strength0="0"
strength1="1"
strength2="12"
strength3="123"
strength4="1234"
echo $dir

devices=$(nmcli device | grep -E "wifi\s|ethernet" | awk '{print $1}')
echo $devices



source "$dir/config.conf"

function initialize() {
  for i in "${wifi_ifaces[@]}"; do
    wifi_ifaces_product+=("$(nmcli -f general.product device show "$i" | awk '{print $2}')"); 
  done
  for i in "${ethernet_ifaces[@]}"; do 
    ethernet_ifaces_product+=("$(nmcli -f general.product device show "$i" | awk '{print $2}')"); 
  done
  init_wifi_state
  init_ethernet_state
  echo $wifi_ifaces_product
  echo $ethernet_ifaces_product
}


function init_wifi_state() {
	[[ ${#wifi_ifaces[@]} -eq "0" ]] && return;

  active_ssid=$(nmcli device status | grep "^${wifi_ifaces[WLAN_INT]}." | awk '{print $4}')
  wifi_conn_state=$(nmcli device status | grep "^${wifi_ifaces[WLAN_INT]}." | awk '{print $3}')

  { [[ "$wifi_conn_state" == "unavailable" ]] && WIFI_LIST="***Wi-Fi Disabled***" && WIFI_SWITCH="~Wi-Fi On" && OPTIONS="${WIFI_LIST}\n${WIFI_SWITCH}\n~Scan\n"; } && return;

  [[ "$wifi_conn_state" =~ "connected" ]] && {
    PROMPT=${wifi_ifaces_product[WLAN_INT]}[${wifi_ifaces[WLAN_INT]}]
    WIFI_LIST=$(nmcli --fields ssid,SECURITY,BARS device wifi list  ifname "${wifi_ifaces[WLAN_INT]}")
    wifi_list
    [[ "$active_ssid" == "--" ]] && WIFI_SWITCH="~Scan\n~Manual/Hidden\n~Wi-Fi Off" || WIFI_SWITCH="~Scan\n~Disconnect\n~Manual/Hidden\n~Wi-Fi Off"
    OPTIONS="${WIFI_LIST}\n${WIFI_SWITCH}\n"
  }; 
}

function init_ethernet_state() {
	[[ ${#ethernet_ifaces[@]} -eq "0" ]] &&return;

  wired_conn_state=$(nmcli device status | grep "ethernet" | head -1 | awk '{print $3}')

  { [[ "$wired_conn_state" == "disconnected" ]] && WIRED_SWITCH="~Eth On"; } || { [[ "$wired_conn_state" == "connected" ]] && WIRED_SWITCH="~Eth Off"; } || { [[ "$wired_conn_state" == "unavailable" ]] && WIRED_SWITCH="***Wired Unavailable***"; } || { [[ "$wired_conn_state" == "connecting" ]] && WIRED_SWITCH="***Wired Initializing***"; }
  OPTIONS="${OPTIONS}${WIRED_SWITCH}\n"
}

function notification() {
	notify-send -r "5" -u "normal" $1 "$2"
}

function rofi_menu() {
	{ [[ ${#wifi_ifaces[@]} -gt "1" ]] && OPTIONS="${OPTIONS}~Change Wifi Interface\n~More Options"; } || { OPTIONS="${OPTIONS}~More Options"; }
	{ [[ "$wired_conn_state" == "connected" ]] && PROMPT="${ethernet_ifaces_product}[$ethernet_ifaces]"; } || PROMPT="${wifi_ifaces_product[WLAN_INT]}[${wifi_ifaces[WLAN_INT]}]"
	selection=$(echo -e "$OPTIONS" | rofi_cmd "$OPTIONS" $WIDTH_FIX_MAIN "-a 0")
	ssid=$(echo "$selection" | sed "s/\s\{2,\}/\|/g" | awk -F "|" '{print $1}')

	selection_action
}

function rofi_cmd() {
	{ [[ -n "${1}" ]] && WIDTH=$(echo -e "$1" | awk '{print length}' | sort -n | tail -1) && ((WIDTH += $2)) && ((WIDTH = WIDTH / 2)); } || { ((WIDTH = $2 / 2)); }
	rofi -dmenu -i -location "$LOCATION" -yoffset "$Y_AXIS" -xoffset "$X_AXIS" $3 -theme "$theme" 
}

function change_wireless_interface() {
	{ [[ ${#wifi_ifaces[@]} -eq "2" ]] && { [[ $WLAN_INT -eq "0" ]] && WLAN_INT=1 || WLAN_INT=0; }; } || {
		LIST_WLAN_INT=""
		for i in "${!wifi_ifaces[@]}"; do LIST_WLAN_INT=("${LIST_WLAN_INT[@]}${wifi_ifaces_product[$i]}[${wifi_ifaces[$i]}]\n"); done
		LIST_WLAN_INT[-1]=${LIST_WLAN_INT[-1]::-2}
		CHANGE_WLAN_INT=$(echo -e "${LIST_WLAN_INT[@]}" | rofi_cmd "${LIST_WLAN_INT[@]}" $WIDTH_FIX_STATUS)
		for i in "${!wifi_ifaces[@]}"; do [[ $CHANGE_WLAN_INT == "${wifi_ifaces_product[$i]}[${wifi_ifaces[$i]}]" ]] && WLAN_INT=$i && break; done
	}
	wireless_interface_state && ethernet_interface_state
	rofi_menu
}

function scan() {
	[[ "$wifi_conn_state" =~ "unavailable" ]] && change_wifi_state "Wi-Fi" "Enabling Wi-Fi connection" "on" && sleep 2
	notification "-t 0 Wifi" "Please Wait Scanning"
	WIFI_LIST=$(nmcli --fields ssid,SECURITY,BARS device wifi list ifname "${wifi_ifaces[WLAN_INT]}" --rescan yes)
	wifi_list
	wireless_interface_state && ethernet_interface_state
	notification "-t 1 Wifi" "Please Wait Scanning"
	rofi_menu
}

function wifi_list(){
	WIFI_LIST=$(echo -e "$WIFI_LIST" | awk -F'  +' '{ if (!seen[$1]++) print}' | awk '$1!="--" {print}' | awk '$1 !~ "^'"${active_ssid}"'"' )
	[[ $ASCII_OUT == "true" ]] && WIFI_LIST=$(echo -e "$WIFI_LIST" | sed 's/\(..*\)\*\{4,4\}/\1▂▄▆█/g' | sed 's/\(..*\)\*\{3,3\}/\1▂▄▆_/g' | sed 's/\(..*\)\*\{2,2\}/\1▂▄__/g' | sed 's/\(..*\)\*\{1,1\}/\1▂___/g')
	[[ $CHANGE_BARS == "true" ]] && WIFI_LIST=$(echo -e "$WIFI_LIST" |  sed 's/\(.*\)▂▄▆█/\1'$strength4'/' | sed 's/\(.*\)▂▄▆_/\1'$strength3'/' | sed 's/\(.*\)▂▄__/\1'$strength2'/' | sed 's/\(.*\)▂___/\1'$strength1'/' | sed 's/\(.*\)____/\1'$strength0'/')
}

function change_wifi_state() {
	notification "$1" "$2"
	nmcli radio wifi "$3"
}

function change_wired_state() {
	notification "$1" "$2"
	nmcli device "$3" "$4"
}

function net_restart() {
	notification "$1" "$2"
	nmcli networking off && sleep 3 && nmcli networking on
}

function disconnect() {
	active_ssid=$(nmcli -t -f GENERAL.CONNECTION dev show "${wifi_ifaces[WLAN_INT]}" | cut -d ':' -f2)
	notification "$1" "You're now disconnected from Wi-Fi network '$active_ssid'"
	nmcli con down id "$active_ssid"
}

function check_wifi_connected() {
	[[ "$(nmcli device status | grep "^${wifi_ifaces[WLAN_INT]}." | awk '{print $3}')" == "connected" ]] && disconnect "Connection_Terminated"
}

function connect() {
	check_wifi_connected
	notification "-t 0 Wi-Fi" "Connecting to $1"
	{ [[ $(nmcli dev wifi con "$1" password "$2" ifname "${wifi_ifaces[WLAN_INT]}" | grep -c "successfully activated") -eq "1" ]] && notification "Connection_Established" "You're now connected to Wi-Fi network '$1'"; } || notification "Connection_Error" "Connection can not be established"
}

function enter_passwword() {
	PROMPT="Enter_Password" && PASS=$(echo "$PASSWORD_ENTER" | rofi_cmd "$PASSWORD_ENTER" 4 "-password")
}

function enter_ssid() {
	PROMPT="Enter_ssid" && ssid=$(rofi_cmd "" 40)
}

function stored_connection() {
	check_wifi_connected
	notification "-t 0 Wi-Fi" "Connecting to $1"
	{ [[ $(nmcli dev wifi con "$1" ifname "${wifi_ifaces[WLAN_INT]}" | grep -c "successfully activated") -eq "1" ]] && notification "Connection_Established" "You're now connected to Wi-Fi network '$1'"; } || notification "Connection_Error" "Connection can not be established"
}

function ssid_manual() {
	enter_ssid
	[[ -n $ssid ]] && {
		enter_passwword
		{ [[ -n "$PASS" ]] && [[ "$PASS" != "$PASSWORD_ENTER" ]] && connect "$ssid" "$PASS"; } || stored_connection "$ssid"
	}
}

function ssid_hidden() {
	enter_ssid
	[[ -n $ssid ]] && {
		enter_passwword && check_wifi_connected
		[[ -n "$PASS" ]] && [[ "$PASS" != "$PASSWORD_ENTER" ]] && {
			nmcli con add type wifi con-name "$ssid" ssid "$ssid" ifname "${wifi_ifaces[WLAN_INT]}"
			nmcli con modify "$ssid" wifi-sec.key-mgmt wpa-psk
			nmcli con modify "$ssid" wifi-sec.psk "$PASS"
		} || [[ $(nmcli -g NAME con show | grep -c "$ssid") -eq "0" ]] && nmcli con add type wifi con-name "$ssid" ssid "$ssid" ifname "${wifi_ifaces[WLAN_INT]}"
		notification "-t 0 Wifi" "Connecting to $ssid"
		{ [[ $(nmcli con up id "$ssid" | grep -c "successfully activated") -eq "1" ]] && notification "Connection_Established" "You're now connected to Wi-Fi network '$ssid'"; } || notification "Connection_Error" "Connection can not be established"
	}
}

function interface_status() {
	local -n INTERFACES=$1 && local -n INTERFACES_product=$2
	for i in "${!INTERFACES[@]}"; do
		CON_STATE=$(nmcli device status | grep "^${INTERFACES[$i]}." | awk '{print $3}')
		INT_NAME=${INTERFACES_product[$i]}[${INTERFACES[$i]}]
		[[ "$CON_STATE" == "connected" ]] && STATUS="$INT_NAME:\n\t$(nmcli -t -f GENERAL.CONNECTION dev show "${INTERFACES[$i]}" | awk -F '[:]' '{print $2}') ~ $(nmcli -t -f IP4.ADDRESS dev show "${INTERFACES[$i]}" | awk -F '[:/]' '{print $2}')" || STATUS="$INT_NAME: ${CON_STATE^}"
		echo -e "${STATUS}"
	done
}

function status() {
	OPTIONS=""
	[[ ${#ethernet_ifaces[@]} -ne "0" ]] && ETH_STATUS="$(interface_status ethernet_ifaces ethernet_ifaces_product)" && OPTIONS="${OPTIONS}${ETH_STATUS}"
	[[ ${#wifi_ifaces[@]} -ne "0" ]] && WLAN_STATUS="$(interface_status wifi_ifaces wifi_ifaces_product)" && { [[ -n ${OPTIONS} ]] && OPTIONS="${OPTIONS}\n${WLAN_STATUS}" || OPTIONS="${OPTIONS}${WLAN_STATUS}"; }
	ACTIVE_VPN=$(nmcli -g NAME,TYPE con show --active | awk '/:vpn/' | sed 's/:vpn.*//g')
	[[ -n $ACTIVE_VPN ]] && OPTIONS="${OPTIONS}\n${ACTIVE_VPN}[VPN]: $(nmcli -g ip4.address con show "${ACTIVE_VPN}" | awk -F '[:/]' '{print $1}')"
	echo -e "$OPTIONS" | rofi_cmd "$OPTIONS" $WIDTH_FIX_STATUS "" "mainbox{children:[listview];}"
}

function share_pass() {
	ssid=$(nmcli dev wifi show-password | grep -oP '(?<=ssid: ).*' | head -1)
	PASSWORD=$(nmcli dev wifi show-password | grep -oP '(?<=Password: ).*' | head -1)
	OPTIONS="ssid: ${ssid}\nPassword: ${PASSWORD}"
	[[ -x "$(command -v qrencode)" ]] && OPTIONS="${OPTIONS}\n~QrCode"
	selection=$(echo -e "$OPTIONS" | rofi_cmd "$OPTIONS" $WIDTH_FIX_STATUS "-a -1" "mainbox{children:[listview];}")
	selection_action
}

function gen_qrcode() {
  dirECTIONS=("Center" "Northwest" "North" "Northeast" "East" "Southeast" "South" "Southwest" "West")
  TMP_ssid="${ssid// /_}"
	[[ -e $QRCODE_dir$TMP_ssid.png ]] || qrencode -t png -o $QRCODE_dir$TMP_ssid.png -l H -s 25 -m 2 --dpi=192 "WIFI:S:""$ssid"";T:""$(nmcli dev wifi show-password | grep -oP '(?<=Security: ).*' | head -1)"";P:""$PASSWORD"";;"
  rofi_cmd "" "0" "" "entry{enabled:false;}window{location:""${dirECTIONS[QRCODE_LOCATION]}"";border-radius:6mm;padding:1mm;width:100mm;height:100mm;
	background-image:url(\"$QRCODE_dir$TMP_ssid.png\",both);}"
}

function manual_hidden() {
	OPTIONS="~Manual\n~Hidden" && selection=$(echo -e "$OPTIONS" | rofi_cmd "$OPTIONS" $WIDTH_FIX_STATUS "" "mainbox{children:[listview];}")
	selection_action
}

# function vpn() {
# 	ACTIVE_VPN=$(nmcli -g NAME,TYPE con show --active | awk '/:vpn/' | sed 's/:vpn.*//g')
# 	[[ $ACTIVE_VPN ]] && OPTIONS="~Deactive $ACTIVE_VPN" || OPTIONS="$(nmcli -g NAME,TYPE connection | awk '/:vpn/' | sed 's/:vpn.*//g')"
# 	VPN_ACTION=$(echo -e "$OPTIONS" | rofi_cmd "$OPTIONS" "$WIDTH_FIX_STATUS" "" "mainbox {children:[listview];}")
# 	[[ -n "$VPN_ACTION" ]] && { { [[ "$VPN_ACTION" =~ "~Deactive" ]] && nmcli connection down "$ACTIVE_VPN" && notification "VPN_Deactivated" "$ACTIVE_VPN"; } || {
# 		notification "-t 0 Activating_VPN" "$VPN_ACTION" && VPN_OUTPUT=$(nmcli connection up "$VPN_ACTION" 2>/dev/null)
# 		{ [[ $(echo "$VPN_OUTPUT" | grep -c "Connection successfully activated") -eq "1" ]] && notification "VPN_Successfully_Activated" "$VPN_ACTION"; } || notification "Error_Activating_VPN" "Check your configuration for $VPN_ACTION"
# 	}; }
# }

function more_options() {
	OPTIONS=""
	[[ "$wifi_conn_state" == "connected" ]] && OPTIONS="~Share Wifi Password\n"
	OPTIONS="${OPTIONS}~Status\n~Restart Network"
	[[ $(nmcli -g NAME,TYPE connection | awk '/:vpn/' | sed 's/:vpn.*//g') ]] && OPTIONS="${OPTIONS}\n~VPN"
	[[ -x "$(command -v nm-connection-editor)" ]] && OPTIONS="${OPTIONS}\n~Open Connection Editor"
	selection=$(echo -e "$OPTIONS" | rofi_cmd "$OPTIONS" "$WIDTH_FIX_STATUS" "" "mainbox {children:[listview];}")
	selection_action
}

function selection_action() {
	case "$selection" in
	"~Disconnect") disconnect "Connection_Terminated" ;;
	"~Scan") scan ;;
	"~Status") status ;;
	"~Share Wifi Password") share_pass ;;
	"~Manual/Hidden") manual_hidden ;;
	"~Manual") ssid_manual ;;
	"~Hidden") ssid_hidden ;;
	"~Wi-Fi On") change_wifi_state "Wi-Fi" "Enabling Wi-Fi connection" "on" ;;
	"~Wi-Fi Off") change_wifi_state "Wi-Fi" "Disabling Wi-Fi connection" "off" ;;
	"~Eth Off") change_wired_state "Ethernet" "Disabling Wired connection" "disconnect" "${ethernet_ifaces}" ;;
	"~Eth On") change_wired_state "Ethernet" "Enabling Wired connection" "connect" "${ethernet_ifaces}" ;;
	"***Wi-Fi Disabled***") ;;
	"***Wired Unavailable***") ;;
	"***Wired Initializing***") ;;
	"~Change Wifi Interface") change_wireless_interface ;;
	"~Restart Network") net_restart "Network" "Restarting Network" ;;
	"~QrCode") gen_qrcode ;;
	"~More Options") more_options ;;
	"~Open Connection Editor") nm-connection-editor ;;
	"~VPN") vpn ;;
	*)
		[[ -n "$selection" ]] && [[ "$WIFI_LIST" =~ .*"$selection".* ]] && {
			[[ "$ssid" == "*" ]] && ssid=$(echo "$selection" | sed "s/\s\{2,\}/\|/g " | awk -F "|" '{print $3}')
			{ [[ "$active_ssid" == "$ssid" ]] && nmcli con up "$ssid" ifname "${wifi_ifaces[WLAN_INT]}"; } || {
				[[ "$selection" =~ "WPA2" ]] || [[ "$selection" =~ "WEP" ]] && enter_passwword
				{ [[ -n "$PASS" ]] && [[ "$PASS" != "$PASSWORD_ENTER" ]] && connect "$ssid" "$PASS"; } || stored_connection "$ssid"
			}
		}
		;;
	esac
}

# initialize
# rofi_menu
