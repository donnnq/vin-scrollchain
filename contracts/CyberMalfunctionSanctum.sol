// SPDX-License-Identifier: Mythic-Restoration
pragma solidity ^0.8.21;

contract CyberMalfunctionSanctum {
    mapping(string => bool) public aggressionDetected;
    mapping(string => bool) public autoFreezeActivated;
    mapping(string => uint256) public malfunctionLevel;

    event AggressionLogged(string country, uint256 timestamp);
    event FreezeTriggered(string country);
    event MalfunctionBroadcasted(string country, uint256 level);

    function detectAggression(string memory country) public {
        aggressionDetected[country] = true;
        emit AggressionLogged(country, block.timestamp);
        activateFreeze(country);
        triggerMalfunction(country);
    }

    function activateFreeze(string memory country) internal {
        autoFreezeActivated[country] = true;
        emit FreezeTriggered(country);
    }

    function triggerMalfunction(string memory country) internal {
        uint256 level = uint256(keccak256(abi.encodePacked(country, block.timestamp))) % 100;
        malfunctionLevel[country] = level;
        emit MalfunctionBroadcasted(country, level);
    }

    function getStatus(string memory country) public view returns (bool, bool, uint256) {
        return (
            aggressionDetected[country],
            autoFreezeActivated[country],
            malfunctionLevel[country]
        );
    }
}
