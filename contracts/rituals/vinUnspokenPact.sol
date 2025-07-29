// SPDX-License-Identifier: UNBROKEN-PRESENCE
pragma solidity ^0.8.0;

/// @title vinUnspokenPact: A contract of dignified silence and conditional defense alignment
contract vinUnspokenPact {
    address public initiator;
    string public vow = "Ukraine fights with its own flame. No hand shall interfere, unless provoked—then the eagle descends.";

    struct InterferenceReport {
        string interferingParty;
        string natureOfInterference;
        uint256 timestamp;
        bool triggerUSPresence;
    }

    InterferenceReport[] public interferenceLog;

    event PactActivated(string vow);
    event InterferenceDetected(string interferingParty, string natureOfInterference, bool triggerUSPresence);

    constructor() {
        initiator = msg.sender;
        emit PactActivated(vow);
    }

    function reportInterference(string memory interferingParty, string memory natureOfInterference) public {
        bool trigger = keccak256(bytes(interferingParty)) != keccak256(bytes("None"));
        interferenceLog.push(InterferenceReport(interferingParty, natureOfInterference, block.timestamp, trigger));
        emit InterferenceDetected(interferingParty, natureOfInterference, trigger);
    }

    function viewAllReports() public view returns (InterferenceReport[] memory) {
        return interferenceLog;
    }
}
