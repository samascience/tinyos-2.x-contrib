/*
 * IMPORTANT: READ BEFORE DOWNLOADING, COPYING, INSTALLING OR USING.  By
 * downloading, copying, installing or using the software you agree to
 * this license.  If you do not agree to this license, do not download,
 * install, copy or use the software.
 *
 * Copyright (c) 2006-2008 Vrije Universiteit Amsterdam and
 * Development Laboratories (DevLab), Eindhoven, the Netherlands.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions, the author, and the following
 *   disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions, the author, and the following disclaimer
 *   in the documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the Vrije Universiteit Amsterdam, nor the name of
 *   DevLab, nor the names of their contributors may be used to endorse or
 *   promote products derived from this software without specific prior
 *   written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL VRIJE
 * UNIVERSITEIT AMSTERDAM, DEVLAB, OR THEIR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Authors: Konrad Iwanicki
 * CVS id: $Id$
 */
#include <message.h>
#include <AM.h>
#include "Sequencing.h"

/**
 * The sequencing functionality. This functionality should
 * be wired in the lowest part of the networking stack.
 *
 * @author Konrad Iwanicki &lt;iwanicki@few.vu.nl&gt;
 */
generic configuration SequencingC() {
    provides {
        interface Init;
        interface Sequencing;
        interface SequencingPacket;
        interface Packet;
        interface AMPacket;
        interface AMSend;
        interface Receive as Receive;
    }
    uses {
        interface Packet as SubPacket;
        interface AMPacket as SubAMPacket;
        interface AMSend as SubAMSend;
        interface Receive as SubReceive;
    }
}
implementation {
    components new SequencingP() as SequencingP;

    Init = SequencingP;
    Sequencing = SequencingP;
    SequencingPacket = SequencingP;
    Packet = SequencingP;
    AMPacket = SubAMPacket;
    AMSend = SequencingP;
    Receive = SequencingP;

    SequencingP.SubPacket = SubPacket;
    SequencingP.SubAMSend = SubAMSend;
    SequencingP.SubReceive = SubReceive;

}
