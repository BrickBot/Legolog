#/bin/sh
# @(#) keybdexog.sh - Script for accepting exogenous input from keyboard
#
############################################################################
#
# FILE: Delivery/keybdexog.sh
#
# Create a named pipe, if necessary, that will accept exogenous input
#
# WRITTEN BY: Maurice Pagnucco and Hector J. Levesque
# REVISED: June 15, 2000
#
############################################################################
#
#                             June 15, 2000
#
# This software was developed by the Cognitive Robotics Group under the
# direction of Hector Levesque and Ray Reiter.
#
#        Do not distribute without permission.
#        Include this notice in any copy made.
#
#
#         Copyright (c) 2000 by The University of Toronto,
#                        Toronto, Ontario, Canada.
#
#                          All Rights Reserved
#
# Permission to use, copy, and modify, this software and its
# documentation for non-commercial research purpose is hereby granted
# without fee, provided that the above copyright notice appears in all
# copies and that both the copyright notice and this permission notice
# appear in supporting documentation, and that the name of The University
# of Toronto not be used in advertising or publicity pertaining to
# distribution of the software without specific, written prior
# permission.  The University of Toronto makes no representations about
# the suitability of this software for any purpose.  It is provided "as
# is" without express or implied warranty.
# 
# THE UNIVERSITY OF TORONTO DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
# SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS, IN NO EVENT SHALL THE UNIVERSITY OF TORONTO BE LIABLE FOR ANY
# SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
# RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF
# CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# 
############################################################################

if [ "$#" -gt 1 ]
then
    echo "$0: wrong argument count" >&2
    echo "usage: $0 filename" >&2
    exit 1
fi

if [ ! -p $1 ]       # Create named pipe if it doesn't exist
then
    mknod $1 p
fi

trap "rm $1" 0       # Remove named pipe on exit

cat > $1             # Keyboard input will be sent to pipe

############################################################################
# EOF: Delivery/keybdexog.sh
############################################################################
