// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommandReinstatementDAO {
    address public steward;

    struct ReinstatementEntry {
        string officialName;
        string previousPosition;
        string requestedCorridor;
        string emotionalTag;
    }

    ReinstatementEntry[] public registry;

    event ReinstatementTagged(string officialName, string previousPosition, string requestedCorridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagReinstatement(
        string memory officialName,
        string memory previousPosition,
        string memory requestedCorridor,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ReinstatementEntry(officialName, previousPosition, requestedCorridor, emotionalTag));
        emit ReinstatementTagged(officialName, previousPosition, requestedCorridor, emotionalTag);
    }
}
