// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemixSovereigntyIndex {
    address public steward;

    struct RemixEntry {
        string originalWork;
        string remixType;
        string sovereigntyProtocol;
        string emotionalTag;
    }

    RemixEntry[] public index;

    event RemixSovereigntyTagged(string originalWork, string remixType, string sovereigntyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRemix(
        string memory originalWork,
        string memory remixType,
        string memory sovereigntyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RemixEntry(originalWork, remixType, sovereigntyProtocol, emotionalTag));
        emit RemixSovereigntyTagged(originalWork, remixType, sovereigntyProtocol, emotionalTag);
    }
}
