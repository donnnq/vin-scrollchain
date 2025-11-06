// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LingapOutreachProtocol {
    address public steward;

    struct OutreachEntry {
        string location;
        string faithGroup;
        string outreachType;
        string emotionalTag;
    }

    OutreachEntry[] public protocol;

    event LingapOutreachTagged(string location, string faithGroup, string outreachType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOutreach(
        string memory location,
        string memory faithGroup,
        string memory outreachType,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(OutreachEntry(location, faithGroup, outreachType, emotionalTag));
        emit LingapOutreachTagged(location, faithGroup, outreachType, emotionalTag);
    }
}
