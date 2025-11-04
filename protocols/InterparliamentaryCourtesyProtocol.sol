// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InterparliamentaryCourtesyProtocol {
    address public steward;

    struct CourtesyEntry {
        string senderChamber;
        string recipientChamber;
        string courtesySignal;
        string emotionalTag;
    }

    CourtesyEntry[] public protocol;

    event CourtesyTagged(string senderChamber, string recipientChamber, string courtesySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCourtesy(
        string memory senderChamber,
        string memory recipientChamber,
        string memory courtesySignal,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(CourtesyEntry(senderChamber, recipientChamber, courtesySignal, emotionalTag));
        emit CourtesyTagged(senderChamber, recipientChamber, courtesySignal, emotionalTag);
    }
}
