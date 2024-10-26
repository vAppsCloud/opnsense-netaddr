#!/usr/local/bin/bash

# Copyright 2023-2024 Parag Mehta (06/15/2023)
#
# GNU General Public License version 3 or later.
# See https://www.gnu.org/licenses/gpl-3.0.txt"
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ver=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[0:2])))')

# Filename variables to overwrite
# netaddr/eui
FNOUI="oui.txt"
FNIAB="iab.txt"
# netaddr/ip
FNIPv4="ipv4-address-space.xml"
FNIPv6="ipv6-address-space.xml"
FNMCAST="multicast-addresses.xml"
FNv6UCAST="ipv6-unicast-address-assignments.xml"

# Backup function with date-timestamp if file exists
backup_if_exists() {
    local filepath=$1
    if [ -f "$filepath" ]; then
        local timestamp=$(date +%Y%m%d_%H%M%S)
        mv "$filepath" "${filepath}_backup_$timestamp"
        echo "Backup created for $filepath as ${filepath}_backup_$timestamp"
    fi
}

# Sources of the file locations are taken from netaddr Makefile
# https://github.com/netaddr/netaddr/blob/master/Makefile

# Download and backup files
base_path="/usr/local/lib/python$ver/site-packages/netaddr"

# Get oui and iab files from ieee.org site
backup_if_exists "$base_path/eui/$FNOUI"
curl -s -o "$base_path/eui/$FNOUI" https://standards-oui.ieee.org/oui/$FNOUI

backup_if_exists "$base_path/eui/$FNIAB"
curl -s -o "$base_path/eui/$FNIAB" https://standards-oui.ieee.org/iab/$FNIAB

# Generate indices
python3 /usr/local/lib/python$ver/site-packages/netaddr/eui/ieee.py

# Get iana ip files in xml format
backup_if_exists "$base_path/ip/$FNIPv4"
curl -s -o "$base_path/ip/$FNIPv4" https://www.iana.org/assignments/ipv4-address-space/ipv4-address-space.xml

backup_if_exists "$base_path/ip/$FNIPv6"
curl -s -o "$base_path/ip/$FNIPv6" https://www.iana.org/assignments/ipv6-address-space/ipv6-address-space.xml

backup_if_exists "$base_path/ip/$FNMCAST"
curl -s -o "$base_path/ip/$FNMCAST" https://www.iana.org/assignments/multicast-addresses/multicast-addresses.xml

backup_if_exists "$base_path/ip/$FNv6UCAST"
curl -s -o "$base_path/ip/$FNv6UCAST" https://www.iana.org/assignments/ipv6-unicast-address-assignments/ipv6-unicast-address-assignments.xml
