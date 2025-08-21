// SPDX-License-Identifier: Ritual-Chant-Sequence
pragma solidity ^0.8.19;

/// @title SanctumChorusChain
/// @notice Links biodiversity chants into ritual sequences across sanctums

contract SanctumChorusChain {
    address public steward;

    struct Chorus {
        string sequenceTitle;
        string[] chantTitles;
        string ritualPurpose;
        string emotionThread;
    }

    mapping(string => Chorus) public chorusChains;
    string[] public chorusKeys;

    event ChorusLinked(string sequenceTitle, string ritualPurpose, string emotionThread);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function linkChorus(
        string memory key,
        string memory sequenceTitle,
        string[] memory chantTitles,
        string memory ritualPurpose,
        string memory emotionThread
    ) external onlySteward {
        chorusChains[key] = Chorus(sequenceTitle, chantTitles, ritualPurpose, emotionThread);
        chorusKeys.push(key);
        emit ChorusLinked(sequenceTitle, ritualPurpose, emotionThread);
    }

    function getChorus(string memory key) external view returns (Chorus memory) {
        return chorusChains[key];
    }
}
