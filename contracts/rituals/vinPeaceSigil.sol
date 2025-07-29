// SPDX-License-Identifier: PEACE-SIGIL
pragma solidity ^0.8.0;

/// @title vinPeaceSigil: Scroll of cessation, remembrance, and renewed sovereignty
contract vinPeaceSigil {
    address public initiator;
    string public invocation = "In the name of memory, sacrifice, and shared sky, let peace take root.";

    struct Ceasefire {
        string partyOne;
        string partyTwo;
        uint256 timestamp;
        string terms;
        string symbolicGesture;
    }

    Ceasefire[] public peaceLog;

    event SigilActivated(string invocation);
    event CeasefireLogged(string partyOne, string partyTwo, string terms, string symbolicGesture);

    constructor() {
        initiator = msg.sender;
        emit SigilActivated(invocation);
    }

    function logCeasefire(
        string memory partyOne,
        string memory partyTwo,
        string memory terms,
        string memory symbolicGesture
    ) public {
        peaceLog.push(Ceasefire(partyOne, partyTwo, block.timestamp, terms, symbolicGesture));
        emit CeasefireLogged(partyOne, partyTwo, terms, symbolicGesture);
    }

    function getPeaceArchive() public view returns (Ceasefire[] memory) {
        return peaceLog;
    }
}
