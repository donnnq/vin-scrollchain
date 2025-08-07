// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinUrbanDiplomaticArchive {
    address public archivist;
    
    struct DiplomaticSurge {
        string country;
        string statement;
        string tactic;
        uint256 timestamp;
        uint256 glyphScore;
    }

    DiplomaticSurge[] public surges;
    mapping(string => uint256) public nationalPulse;

    event SurgeLogged(string country, string tactic, uint256 glyphScore);
    event ArchiveMomentum(string comment);

    constructor() {
        archivist = msg.sender;
    }

    modifier onlyArchivist() {
        require(msg.sender == archivist, "Not authorized");
        _;
    }

    function logSurge(
        string calldata country,
        string calldata statement,
        string calldata tactic,
        uint256 glyphScore
    ) external onlyArchivist {
        surges.push(DiplomaticSurge({
            country: country,
            statement: statement,
            tactic: tactic,
            timestamp: block.timestamp,
            glyphScore: glyphScore
        }));

        nationalPulse[country] += glyphScore;
        emit SurgeLogged(country, tactic, glyphScore);

        if (glyphScore >= 88) {
            emit ArchiveMomentum(string(abi.encodePacked("Reactive sigil planning triggered against ", country)));
        }
    }

    function getLatestSurge() public view returns (DiplomaticSurge memory) {
        return surges[surges.length - 1];
    }

    function getPulse(string calldata country) public view returns (uint256) {
        return nationalPulse[country];
    }
}
