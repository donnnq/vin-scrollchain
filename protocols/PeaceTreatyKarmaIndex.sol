// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeaceTreatyKarmaIndex {
    address public steward;

    struct TreatyEntry {
        string treatyName;
        string participatingNations;
        string karmaProtocol;
        string emotionalTag;
    }

    TreatyEntry[] public index;

    event PeaceTreatyTagged(string treatyName, string participatingNations, string karmaProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTreaty(
        string memory treatyName,
        string memory participatingNations,
        string memory karmaProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(TreatyEntry(treatyName, participatingNations, karmaProtocol, emotionalTag));
        emit PeaceTreatyTagged(treatyName, participatingNations, karmaProtocol, emotionalTag);
    }
}
