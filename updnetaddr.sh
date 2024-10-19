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

#!/bin/bash

# Filename variables to overwrite
# netaddr/eui
FNOUI="oui.txt"
FNIAB="iab.txt"
# netaddr/ip
FNIPv4="ipv4-address-space.xml"
FNIPv6="ipv6-address-space.xml"
FNMCAST="multicast-addresses.xml"
FNv6UCAST="ipv6-unicast-address-assignments.xml"

# sources of the file locations are taken from netaddr Makefile
# https://github.com/netaddr/netaddr/blob/master/Makefile
# download: section

# get oui and iab files from ieee.org site
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/eui/$FNOUI http://standards-oui.ieee.org/oui/$FNOUI
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/eui/$FNIAB http://standards-oui.ieee.org/oui/$FNIAB
# generate indices
python3 /usr/local/lib/python3.9/site-packages/netaddr/eui/ieee.py
# get iana ip files in xml format
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/ip/$FNIPv4 https://www.iana.org/assignments/ipv4-address-space/ipv4-address-space.xml
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/ip/$FNIPv6 https://www.iana.org/assignments/ipv6-address-space/ipv6-address-space.xml
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/ip/$FNMCAST https://www.iana.org/assignments/multicast-addresses/multicast-addresses.xml
wget -qO /usr/local/lib/python3.9/site-packages/netaddr/ip/$FNv6UCAST https://www.iana.org/assignments/ipv6-unicast-address-assignments/ipv6-unicast-address-assignments.xml
