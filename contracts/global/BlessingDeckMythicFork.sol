// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckMythicFork {
    struct RegionalBlessing {
        string region;
        string steward;
        uint256 aprThreshold;
        string ritualLogic;
        string broadcastMessage;
        uint256 timestamp;
    }

    RegionalBlessing[] public mythicForks;

    event ForkDeployed(string region, string steward, uint256 aprThreshold);

    function deployFork(
        string memory _region,
        string memory _steward,
        uint256 _aprThreshold,
        string memory _ritualLogic,
        string memory _broadcastMessage
    ) public {
        require(_aprThreshold >= 70, "APR threshold must be mythic-worthy");

        mythicForks.push(RegionalBlessing({
            region: _region,
            steward: _steward,
            aprThreshold: _aprThreshold,
            ritualLogic: _ritualLogic,
            broadcastMessage: _broadcastMessage,
            timestamp: block.timestamp
        }));

        emit ForkDeployed(_region, _steward, _aprThreshold);
    }

    function getForks() public view returns (RegionalBlessing[] memory) {
        return mythicForks;
    }
}
